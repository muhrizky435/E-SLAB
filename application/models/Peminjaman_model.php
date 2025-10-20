<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Peminjaman_model extends CI_Model
{
    protected $table = 'peminjaman';

    // Insert data peminjaman baru
    public function insert($data)
    {
        $this->db->insert('peminjaman', $data);
        $insert_id = $this->db->insert_id();

        if ($insert_id) {
            $this->load->model('Notifikasi_model');
            $this->Notifikasi_model->notifyPending($data['id_user'], $data['kode_peminjaman']);
        }

        return $insert_id;
    }


    // Update data peminjaman by ID
    public function update($id_peminjaman, $data)
    {
        return $this->db->where('id_peminjaman', $id_peminjaman)
            ->update($this->table, $data);
    }

    // Ambil data peminjaman by ID (snake_case)
    public function get_by_id($id_peminjaman)
    {
        return $this->db->get_where($this->table, ['id_peminjaman' => $id_peminjaman])
            ->row();
    }

    // alias
    public function getById($id_peminjaman)
    {
        return $this->get_by_id($id_peminjaman);
    }

    // Ambil semua peminjaman + nama peminjam
    public function get_all($limit = 0, $offset = 0)
    {
        $this->db->select('p.*, u.nama as peminjam_nama');
        $this->db->from($this->table . ' p');
        $this->db->join('users u', 'u.id_user = p.id_user', 'left');
        if ($limit) $this->db->limit($limit, $offset);
        return $this->db->get()->result();
    }

    // Ambil semua peminjaman milik user tertentu
    public function get_by_user($id_user)
    {
        return $this->db->where('id_user', $id_user)
            ->order_by('tanggal_pinjam', 'DESC')
            ->get($this->table)
            ->result();
    }

    // Ambil peminjaman dengan kondisi tertentu
    public function get_where($where = [])
    {
        $this->db->select('p.*, u.nama as peminjam_nama');
        $this->db->from($this->table . ' p');
        $this->db->join('users u', 'u.id_user = p.id_user', 'left');

        if (!empty($where)) {
            $this->db->where($where);
        }

        $query = $this->db->get();
        return $query->result();
    }

    // detail peminjaman
    public function get_detail($id_peminjaman, $id_user)
    {
        return $this->db->get_where($this->table, [
            'id_peminjaman' => $id_peminjaman,
            'id_user'       => $id_user
        ])->row();
    }

    // Ambil item yang dipinjam dalam satu peminjaman
    public function get_items($id_peminjaman)
    {
        $this->db->select('barang.nama_barang, sk.nama_sub AS jenis, detail_peminjaman.qty AS jumlah');
        $this->db->from('detail_peminjaman');
        $this->db->join('barang', 'barang.id_barang = detail_peminjaman.id_barang');
        $this->db->join('sub_kategori sk', 'sk.id_sub_kategori = barang.id_sub_kategori', 'left');
        $this->db->where('detail_peminjaman.id_peminjaman', $id_peminjaman);
        return $this->db->get()->result();
    }

    // Ambil semua peminjaman yang sudah disetujui atau sudah dikembalikan (untuk halaman pengembalian)
    public function get_disetujui_dan_dikembalikan()
    {
        $this->db->select('p.*, u.nama as nama_user');
        $this->db->from('peminjaman p');
        $this->db->join('users u', 'u.id_user = p.id_user', 'left');
        $this->db->where_in('p.status', ['disetujui', 'dikembalikan']);
        $this->db->order_by('p.tanggal_pinjam', 'DESC');
        return $this->db->get()->result();
    }

    // Generate kode peminjaman unik
    public function generate_kode()
    {
        $prefix = 'PJM-' . date('Ymd') . '-';
        $this->db->like('kode_peminjaman', $prefix, 'after');
        $this->db->order_by('id_peminjaman', 'DESC');
        $this->db->limit(1);
        $row = $this->db->get($this->table)->row();

        if ($row && preg_match('/-(\d+)$/', $row->kode_peminjaman, $m)) {
            $last = (int)$m[1];
            $next = $last + 1;
        } else {
            $next = 1;
        }

        return $prefix . str_pad($next, 4, '0', STR_PAD_LEFT);
    }

    // Hitung statistik peminjaman user
    public function get_stats($id_user)
    {
        // sedang dipinjam = disetujui tapi belum dikembalikan
        $this->db->where('id_user', $id_user);
        $this->db->where('status', 'disetujui');
        $sedang_dipinjam = $this->db->count_all_results($this->table);

        // jatuh tempo = disetujui tapi sudah melewati tanggal_kembali dan belum dikembalikan
        $this->db->where('id_user', $id_user);
        $this->db->where('status', 'disetujui');
        $this->db->where('tanggal_kembali <', date('Y-m-d'));
        $this->db->where('tanggal_dikembalikan IS NULL', null, false);
        $jatuh_tempo = $this->db->count_all_results($this->table);


        // stok tersedia
        $this->db->select_sum('stok');
        $stok = $this->db->get('barang')->row()->stok;

        return [
            'sedang_dipinjam' => $sedang_dipinjam,
            'jatuh_tempo'     => $jatuh_tempo,
            'tersedia'        => $stok,
        ];
    }


    // Ambil peminjaman terbaru user
    public function get_recent($id_user, $limit = 5)
    {
        $this->db->select('peminjaman.*, barang.nama_barang as item_name, users.nama as student_name');
        $this->db->from('peminjaman');
        $this->db->join('detail_peminjaman', 'detail_peminjaman.id_peminjaman = peminjaman.id_peminjaman');
        $this->db->join('barang', 'barang.id_barang = detail_peminjaman.id_barang');
        $this->db->join('users', 'users.id_user = peminjaman.id_user');
        $this->db->where('peminjaman.id_user', $id_user);
        $this->db->order_by('peminjaman.tanggal_pinjam', 'DESC');
        $this->db->limit($limit);
        return $this->db->get()->result();
    }

    /**
     * Update status + kirim notifikasi
     *
     * @param int    $id_peminjaman
     * @param string $status
     * @return bool
     */
    public function updateStatus($id_peminjaman, $status)
    {
        $update = $this->update($id_peminjaman, ['status' => $status]);

        if ($update) {
            $peminjaman = $this->get_by_id($id_peminjaman);
            if ($peminjaman) {
                // pastikan model notifikasi dimuat
                $this->load->model('Notifikasi_model');

                if ($status === 'pending') {
                    $this->Notifikasi_model->notifyPending($peminjaman->id_user, $peminjaman->kode_peminjaman);
                } elseif ($status === 'disetujui') {
                    $this->Notifikasi_model->notifyDisetujui($peminjaman->id_user, $peminjaman->kode_peminjaman);
                } elseif ($status === 'ditolak') {
                    $this->Notifikasi_model->notifyDitolak($peminjaman->id_user, $peminjaman->kode_peminjaman);
                }
            }
        }

        return $update;
    }

    // Riwayat peminjaman detail
    public function get_detail_riwayat($id_peminjaman)
    {
        return $this->db->get_where('peminjaman', ['id_peminjaman' => $id_peminjaman])->row();
    }

    // Ambil detail item dalam peminjaman tertentu
    public function get_detail_items($id_peminjaman)
    {
        $this->db->select('d.*, b.nama_barang, b.satuan');
        $this->db->from('detail_peminjaman d');
        $this->db->join('barang b', 'b.id_barang = d.id_barang', 'left');
        $this->db->where('d.id_peminjaman', $id_peminjaman);
        return $this->db->get()->result();
    }

    // Hapus peminjaman + detail peminjaman
    public function hapus($id_peminjaman)
    {
        $this->db->where('id_peminjaman', $id_peminjaman);
        $this->db->delete('peminjaman');

        // hapus juga detail peminjaman
        $this->db->where('id_peminjaman', $id_peminjaman);
        $this->db->delete('detail_peminjaman');
    }

    // Ambil semua peminjaman yang sudah disetujui (untuk halaman pengembalian)
    public function get_disetujui()
    {
        $this->db->select('p.*, u.nama as nama_user');
        $this->db->from('peminjaman p');
        $this->db->join('users u', 'u.id_user = p.id_user', 'left');
        $this->db->where('p.status', 'disetujui');
        $this->db->order_by('p.tanggal_pinjam', 'DESC');
        return $this->db->get()->result();
    }

    // Update status peminjaman menjadi dikembalikan
    public function tandai_kembalikan($id_peminjaman)
    {
        $data = [
            'status' => 'dikembalikan',
            'tanggal_dikembalikan' => date('Y-m-d')
        ];
        return $this->db->where('id_peminjaman', $id_peminjaman)
            ->update('peminjaman', $data);
    }
}
