<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 * @property CI_Session $session
 * @property CI_Input $input
 * @property Keranjang_model $Keranjang_model
 * @property Peminjaman_model $Peminjaman_model
 * @property Detail_peminjaman_model $Detail_peminjaman_model
 * @property Notifikasi_model $Notifikasi_model
 */
class Checkout extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Keranjang_model');
        $this->load->model('Peminjaman_model');
        $this->load->model('Detail_peminjaman_model');
        $this->load->model('Notifikasi_model');
        $this->load->library('session');
        $this->load->helper('url');
    }

    // tampilkan form checkout (user mengisi tujuan, tanggal_kembali, catatan)
    public function form()
    {
        $id_user = $this->session->userdata('id_user');
        if (!$id_user) redirect('auth/login');

        $selected = $this->session->userdata('keranjang_terpilih') ?? [];

        // Jika user buka form langsung tanpa memilih
        if (empty($selected)) {
            $this->session->set_flashdata('error', 'Silakan pilih item terlebih dahulu.');
            redirect('keranjang');
            return;
        }

        // Ambil hanya item yang dipilih
        $data['keranjang'] = $this->Keranjang_model->get_selected($id_user, $selected);
        if (empty($data['keranjang'])) {
            $this->session->set_flashdata('error', 'Item yang dipilih tidak ditemukan.');
            redirect('keranjang');
            return;
        }

        $user_name = $this->session->userdata('nama_user') ?? $this->session->userdata('username');
        $user_initial = strtoupper(substr($user_name, 0, 1));
        $data['title'] = "Form Checkout";
        $data['user_name'] = $user_name;
        $data['user_initial'] = $user_initial;
        

        $this->load->view('layouts/header', $data);
        $this->load->view('layouts/sidebar', $data);
        $this->load->view('user/peminjaman/formCheckout', $data);
        $this->load->view('layouts/footer');
    }

    // ADMIN setujui
    public function verifikasi($id_peminjaman)
    {
        $peminjaman = $this->Peminjaman_model->getById($id_peminjaman);

        if ($peminjaman) {
            // Setujui peminjaman
            $this->Peminjaman_model->updateStatus($id_peminjaman, 'disetujui');
        }

        redirect('admin/peminjaman');
    }

    // ADMIN tolak
    public function tolak($id_peminjaman)
    {
        $peminjaman = $this->Peminjaman_model->getById($id_peminjaman);

        if ($peminjaman) {
            $this->Peminjaman_model->updateStatus($id_peminjaman, 'ditolak');
        }

        redirect('admin/peminjaman');
    }

    // proses submit form -> buat peminjaman + detail -> kosongkan keranjang
    public function proses()
    {
        $id_user = $this->session->userdata('id_user');
        if (!$id_user) redirect('auth/login');

        $selected = $this->session->userdata('keranjang_terpilih') ?? [];

        if (empty($selected)) {
            $this->session->set_flashdata('error', 'Tidak ada item yang dipilih.');
            redirect('keranjang');
            return;
        }

        $keranjang = $this->Keranjang_model->get_selected($id_user, $selected);
        if (empty($keranjang)) {
            $this->session->set_flashdata('error', 'Item yang dipilih tidak ditemukan.');
            redirect('keranjang');
            return;
        }

        // Ambil semua input dari form
        $tanggal_pinjam  = $this->input->post('tanggal_pinjam');
        $tanggal_kembali = $this->input->post('tanggal_kembali');
        $tujuan          = $this->input->post('tujuan');
        $nama_peminjam   = $this->input->post('nama_peminjam');
        $no_hp           = $this->input->post('no_hp');
        $jurusan         = $this->input->post('jurusan');
        $kelas           = $this->input->post('kelas');
        $keterangan      = $this->input->post('keterangan');

        $kode = $this->Peminjaman_model->generate_kode();

        // Detail dari item yang dipilih
        $nama_barang_list = array_map(function ($item) {
            return $item->nama_barang;
        }, $keranjang);
        $nama_barang_ringkas = implode(', ', $nama_barang_list);

        // Simpan juga semua field baru ke database
        $peminjaman_data = [
            'kode_peminjaman' => $kode,
            'id_user'         => $id_user,
            'nama_peminjam'   => $nama_peminjam,
            'no_hp'           => $no_hp,
            'jurusan'         => $jurusan,
            'kelas'           => $kelas,
            'tanggal_pinjam'  => $tanggal_pinjam,
            'tanggal_kembali' => $tanggal_kembali,
            'tujuan'          => $tujuan,
            'keterangan'      => $keterangan,
            'nama_barang'     => $nama_barang_ringkas,
            'status'          => 'pending'
        ];

        $id_peminjaman = $this->Peminjaman_model->insert($peminjaman_data);

        // Detail dari item yang dipilih
        $detail_batch = [];
        foreach ($keranjang as $item) {
            $detail_batch[] = [
                'id_peminjaman' => $id_peminjaman,
                'id_barang'     => $item->id_barang,
                'nama_barang'   => $item->nama_barang,
                'qty'           => $item->qty,
                'catatan'       => $item->catatan
            ];
        }

        $this->Detail_peminjaman_model->insert_batch($detail_batch);

        // Hapus hanya item yang dipinjam
        foreach ($selected as $id_keranjang) {
            $this->Keranjang_model->remove($id_keranjang);
        }

        $this->session->unset_userdata('keranjang_terpilih');

        $this->session->set_flashdata('success', 'Peminjaman berhasil diajukan untuk item yang dipilih.');
        redirect('/peminjaman/riwayat');
    }
}
