<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 * @property CI_Session $session
 * @property CI_Input $input
 * @property CI_DB_query_builder $db
 * @property Peminjaman_model $Peminjaman_model
 * @property Detail_peminjaman_model $Detail_peminjaman_model
 * @property Barang_model $Barang_model
 * @property Verifikasi_log_model $Verifikasi_log_model
 * @property Notifikasi_model $Notifikasi_model
 */
class AdminPeminjaman extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Peminjaman_model');
        $this->load->model('Detail_peminjaman_model');
        $this->load->model('Barang_model');
        $this->load->model('Verifikasi_log_model');
        $this->load->model('Notifikasi_model');
        $this->load->library('session');
        $this->load->helper('url');

        // Optional: cek role admin
        $role = $this->session->userdata('role');
        if (!$this->session->userdata('id_user') || !in_array($role, ['admin', 'superadmin'])) {
            redirect('auth/login');
        }
    }

    // Halaman verifikasi (menampilkan yang masih menunggu/pending)
    public function index()
    {
        // Hanya tampilkan peminjaman yang belum diverifikasi
        $data['peminjaman'] = $this->Peminjaman_model->get_where(['status' => 'pending']);

        $user_name = $this->session->userdata('nama_user') ?? $this->session->userdata('username');
        $user_initial = strtoupper(substr($user_name, 0, 1));

        $data['title'] = "Verifikasi Peminjaman";
        $data['user_name'] = $user_name;
        $data['user_initial'] = $user_initial;

        $this->load->view('layouts/header', $data);
        $this->load->view('layouts/sidebar', $data);
        $this->load->view('admin/peminjaman/verifikasi_peminjaman', $data);
        $this->load->view('layouts/footer');
    }

    // Detail peminjaman
    public function detail($id_peminjaman)
    {
        $data['peminjaman'] = $this->Peminjaman_model->get_by_id($id_peminjaman);
        if (!$data['peminjaman']) show_404();

        $data['detail'] = $this->Detail_peminjaman_model->get_by_peminjaman($id_peminjaman);
        $data['log'] = $this->Verifikasi_log_model->get_by_peminjaman($id_peminjaman);

        $user_name = $this->session->userdata('nama_user') ?? $this->session->userdata('username');
        $user_initial = strtoupper(substr($user_name, 0, 1));

        $data['title'] = "Detail Peminjaman";
        $data['user_name'] = $user_name;
        $data['user_initial'] = $user_initial;

        $this->load->view('layouts/header', $data);
        $this->load->view('layouts/sidebar', $data);
        $this->load->view('admin/peminjaman/detail', $data);
        $this->load->view('layouts/footer');
    }

    // Hapus peminjaman
    public function hapus($id_peminjaman)
    {
        $peminjaman = $this->Peminjaman_model->get_by_id($id_peminjaman);
        if (!$peminjaman) show_404();

        $this->Peminjaman_model->hapus($id_peminjaman);
        $this->session->set_flashdata('success', 'Data peminjaman berhasil dihapus.');
        redirect('admin/adminpeminjaman');
    }

    // Setujui peminjaman → otomatis pindah ke halaman pengembalian + tombol kembalikan
    public function setujui($id_peminjaman)
    {
        $admin_id = $this->session->userdata('id_user');
        if (!$admin_id) redirect('auth/login');

        $peminjaman = $this->Peminjaman_model->get_by_id($id_peminjaman);
        if (!$peminjaman) show_404();

        // Cek status — jika bukan 'pending', jangan proses
        if (strtolower($peminjaman->status) !== 'pending') {
            $this->session->set_flashdata('info', 'Peminjaman bukan status pending, tidak dapat disetujui.');
            redirect('admin/adminpeminjaman');
            return;
        }

        $detail = $this->Detail_peminjaman_model->get_by_peminjaman($id_peminjaman);
        if (empty($detail)) {
            $this->session->set_flashdata('error', 'Detail peminjaman tidak ditemukan.');
            redirect('admin/adminpeminjaman');
            return;
        }

        // Transaksi: ubah status (trigger akan otomatis kurangi stok)
        $this->db->trans_start();

        // Update status menjadi disetujui
        $this->Peminjaman_model->update($id_peminjaman, [
            'status' => 'disetujui',
            'tanggal_disetujui' => date('Y-m-d H:i:s'),
            'tanggal_kembali' => date('Y-m-d', strtotime('+10 days'))
        ]);

        // Catat log
        $this->Verifikasi_log_model->insert([
            'id_peminjaman' => $id_peminjaman,
            'id_admin' => $admin_id,
            'aksi' => 'setujui'
        ]);

        // Notifikasi
        $this->Notifikasi_model->notifyDisetujui($peminjaman->id_user, $peminjaman->kode_peminjaman);

        $this->db->trans_complete();

        if ($this->db->trans_status() === FALSE) {
            $this->session->set_flashdata('error', 'Gagal memproses persetujuan. Silakan coba lagi.');
            redirect('admin/adminpeminjaman');
            return;
        }

        $this->session->set_flashdata('success', 'Peminjaman disetujui dan dipindahkan ke daftar pengembalian.');
        redirect('admin/pengembalian');
    }

    // Tolak peminjaman → otomatis hilang dari halaman verifikasi
    public function tolak($id_peminjaman)
    {
        $admin_id = $this->session->userdata('id_user');
        if (!$admin_id) redirect('auth/login');

        $peminjaman = $this->Peminjaman_model->get_by_id($id_peminjaman);
        if (!$peminjaman) show_404();

        // Ubah status jadi ditolak
        $this->Peminjaman_model->update($id_peminjaman, ['status' => 'ditolak']);

        // Catat log
        $this->Verifikasi_log_model->insert([
            'id_peminjaman' => $id_peminjaman,
            'id_admin' => $admin_id,
            'aksi' => 'tolak'
        ]);

        // Notifikasi user
        $this->Notifikasi_model->notifyDitolak($peminjaman->id_user, $peminjaman->kode_peminjaman);

        // Otomatis hilang dari halaman verifikasi
        $this->session->set_flashdata('error', 'Peminjaman telah ditolak dan dihapus dari daftar verifikasi.');
        redirect('admin/adminpeminjaman');
    }

    // Kembalikan peminjaman (dari halaman pengembalian)
    public function kembalikan($id_peminjaman)
    {
        $admin_id = $this->session->userdata('id_user');
        if (!$admin_id) redirect('auth/login');

        $peminjaman = $this->Peminjaman_model->get_by_id($id_peminjaman);
        if (!$peminjaman) show_404();

        // Cek status — hanya proses jika 'disetujui'
        if (strtolower($peminjaman->status) !== 'disetujui') {
            $this->session->set_flashdata('info', 'Peminjaman tidak dalam status disetujui.');
            redirect('admin/pengembalian');
            return;
        }

        $detail = $this->Detail_peminjaman_model->get_by_peminjaman($id_peminjaman);
        if (empty($detail)) {
            $this->session->set_flashdata('error', 'Detail peminjaman tidak ditemukan.');
            redirect('admin/pengembalian');
            return;
        }

        // Transaksi: ubah status (trigger akan otomatis tambah stok kembali)
        $this->db->trans_start();

        // Update status menjadi dikembalikan
        $this->Peminjaman_model->update($id_peminjaman, [
            'status' => 'dikembalikan',
            'tanggal_dikembalikan' => date('Y-m-d H:i:s')
        ]);

        // Catat log
        $this->Verifikasi_log_model->insert([
            'id_peminjaman' => $id_peminjaman,
            'id_admin' => $admin_id,
            'aksi' => 'kembalikan',
            'catatan' => $this->input->post('catatan') ?: null
        ]);

        // Notifikasi
        $this->Notifikasi_model->notifyDikembalikan($peminjaman->id_user, $peminjaman->kode_peminjaman);

        $this->db->trans_complete();

        if ($this->db->trans_status() === FALSE) {
            $this->session->set_flashdata('error', 'Gagal memproses pengembalian. Silakan coba lagi.');
            redirect('admin/pengembalian');
            return;
        }

        $this->session->set_flashdata('success', 'Barang berhasil dikembalikan dan stok diperbarui.');
        redirect('admin/pengembalian');
    }

    /**
     * Daftar Riwayat Peminjaman (filter bulan/tahun) untuk admin
     */
    public function daftarRiwayat()
    {
        // default ke bulan & tahun sekarang
        $month = $this->input->get('month') ?: date('m');
        $year  = $this->input->get('year')  ?: date('Y');

        // ambil peminjaman pada bulan & tahun terpilih, gunakan nama_peminjam dari tabel peminjaman
        $sql = "
            SELECT p.*, 
                   GROUP_CONCAT(CONCAT(b.nama_barang,'|',d.qty,'|',b.satuan,'|',b.id_barang) SEPARATOR ';;') AS items
            FROM peminjaman p
            LEFT JOIN detail_peminjaman d ON d.id_peminjaman = p.id_peminjaman
            LEFT JOIN barang b ON b.id_barang = d.id_barang
            WHERE MONTH(p.tanggal_pinjam) = ? AND YEAR(p.tanggal_pinjam) = ?
            GROUP BY p.id_peminjaman
            ORDER BY p.tanggal_pinjam DESC
        ";
        $riwayat = $this->db->query($sql, [$month, $year])->result();

        // ambil stok terkini semua barang sebagai map id -> stok
        $barangs = $this->Barang_model->get_all();
        $stock_map = [];
        foreach ($barangs as $br) {
            $stock_map[$br->id_barang] = $br->stok;
        }

        $user_name = $this->session->userdata('nama_user') ?? $this->session->userdata('username');
        $user_initial = strtoupper(substr($user_name, 0, 1));

        $data = [
            'title' => "Daftar Riwayat Peminjaman",
            'peminjaman_list' => $riwayat,
            'stock_map' => $stock_map,
            'filter_month' => (int)$month,
            'filter_year' => (int)$year,
            'user_name' => $user_name,
            'user_initial' => $user_initial,
        ];

        $this->load->view('layouts/header', $data);
        $this->load->view('layouts/sidebar', $data);
        $this->load->view('admin/peminjaman/daftar_riwayat', $data);
        $this->load->view('layouts/footer');
    }

    /**
     * Export Excel (.xls) - gunakan nama_peminjam dari tabel peminjaman
     */
    public function export_csv()
    {
        $month = $this->input->get('month') ?: date('m');
        $year  = $this->input->get('year')  ?: date('Y');

        $sql = "
        SELECT p.*, 
               GROUP_CONCAT(CONCAT(b.nama_barang,'|',d.qty,'|',b.satuan,'|',b.id_barang) SEPARATOR ';;') AS items
        FROM peminjaman p
        LEFT JOIN detail_peminjaman d ON d.id_peminjaman = p.id_peminjaman
        LEFT JOIN barang b ON b.id_barang = d.id_barang
        WHERE MONTH(p.tanggal_pinjam) = ? AND YEAR(p.tanggal_pinjam) = ?
        GROUP BY p.id_peminjaman
        ORDER BY p.tanggal_pinjam DESC
    ";

        $rows = $this->db->query($sql, [$month, $year])->result();

        // Ambil stok terkini semua barang
        $barangs = $this->Barang_model->get_all();
        $stock_map = [];
        foreach ($barangs as $br) {
            $stock_map[$br->id_barang] = $br->stok;
        }

        // Header file Excel
        $filename = "riwayat_peminjaman_{$year}_{$month}.xls";
        header("Content-Type: application/vnd.ms-excel; charset=UTF-8");
        header("Content-Disposition: attachment; filename={$filename}");
        echo "<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />";

        // Tabel utama
        echo "<table border='1' cellpadding='5' cellspacing='0' style='border-collapse:collapse;'>
            <tr style='background:#f3f4f6;font-weight:700;text-align:left;'>
                <th>Tanggal Pinjam</th>
                <th>Kode Peminjaman</th>
                <th>Nama Peminjam</th>
                <th>Items (qty)</th>
                <th>Sisa Stok</th>
                <th>Status</th>
                <th>Tanggal Kembali</th>
            </tr>";

        foreach ($rows as $r) {

            // ====== Generate tabel kecil untuk Items & Stok ======
            $items_html = "<table style='border-collapse:collapse;width:100%;'>";
            $stocks_html = "<table style='border-collapse:collapse;width:100%;'>";

            if (!empty($r->items)) {
                $parts = explode(';;', $r->items);

                foreach ($parts as $p) {
                    list($name, $qty, $satuan, $id) = explode('|', $p);

                    // Format item text
                    $item_text = htmlspecialchars("$name ($qty $satuan)");

                    // Ambil stok
                    $stok = isset($stock_map[$id]) ? (int)$stock_map[$id] : '-';

                    // Tambahkan baris di tabel kecil
                    $items_html .= "
                    <tr>
                        <td style='text-align:left;border:none;padding:2px 0;'>$item_text</td>
                    </tr>";

                    $stocks_html .= "
                    <tr>
                        <td style='text-align:left;border:none;padding:2px 0;'>$stok</td>
                    </tr>";
                }
            }

            $items_html .= "</table>";
            $stocks_html .= "</table>";

            $tanggal_kembali = $r->tanggal_kembali ?? '';

            // ====== Baris Tabel Utama ======
            echo "<tr>
                <td style='text-align:left;'>" . htmlspecialchars($r->tanggal_pinjam) . "</td>
                <td style='text-align:left;'>" . htmlspecialchars($r->kode_peminjaman) . "</td>
                <td style='text-align:left;'>" . htmlspecialchars($r->nama_peminjam) . "</td>
                <td>$items_html</td>
                <td>$stocks_html</td>
                <td style='text-align:left;'>" . htmlspecialchars($r->status) . "</td>
                <td style='text-align:left;'>" . htmlspecialchars($tanggal_kembali) . "</td>
              </tr>";
        }

        echo "</table>";
        exit;
    }
}
