<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 *  @property CI_Session $session
 * @property Barang_model $Barang_model
 * @property Peminjaman_model $Peminjaman_model
 * @property Notifikasi_model $Notifikasi_model
 */
class Peminjaman extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Barang_model');
        $this->load->model('Peminjaman_model');
        $this->load->model('Notifikasi_model');
        $this->load->library('session');
    }

    // Halaman katalog alat
    public function alat()
    {
        $user_name = $this->session->userdata('nama_user') ?? $this->session->userdata('username');
        $user_initial = strtoupper(substr($user_name, 0, 1));

        $data['barang'] = $this->Barang_model->get_by_jenis('Alat');
        $data['title'] = "Katalog Alat";
        $data['user_name'] = $user_name;
        $data['user_initial'] = $user_initial;

        $this->load->view('layouts/header', $data);
        $this->load->view('layouts/sidebar', $data);
        $this->load->view('user/peminjaman/katalog_alat', $data);
        $this->load->view('layouts/footer');
    }

    // Halaman katalog bahan
    public function bahan()
    {

        $user_name = $this->session->userdata('nama_user') ?? $this->session->userdata('username');
        $user_initial = strtoupper(substr($user_name, 0, 1));

        $data['barang'] = $this->Barang_model->get_by_jenis('Bahan');
        $data['title'] = "Katalog Bahan";
        $data['user_name'] = $user_name;
        $data['user_initial'] = $user_initial;

        $this->load->view('layouts/header', $data);
        $this->load->view('layouts/sidebar', $data);
        $this->load->view('user/peminjaman/katalog_bahan', $data);
        $this->load->view('layouts/footer');
    }

    // Halaman detail peminjaman
    public function detail($id_peminjaman)
    {
        $id_user = $this->session->userdata('id_user');
        if (!$id_user) redirect('auth/login');

        $user_name = $this->session->userdata('nama_user') ?? $this->session->userdata('username');
        $user_initial = strtoupper(substr($user_name, 0, 1));

        // Ambil data peminjaman utama
        $data['peminjaman'] = $this->Peminjaman_model->get_detail($id_peminjaman, $id_user);

        // Ambil daftar item barang/bahan yang dipinjam
        $data['items'] = $this->Peminjaman_model->get_items($id_peminjaman);

        if (!$data['peminjaman']) {
            show_404();
        }

        $data['title'] = "Detail Peminjaman";
        $data['user_name'] = $user_name;
        $data['user_initial'] = $user_initial;

        $this->load->view('layouts/header', $data);
        $this->load->view('layouts/sidebar', $data);
        $this->load->view('user/peminjaman/detail', $data);
        $this->load->view('layouts/footer');
    }

    // Riwayat Peminjaman
    public function riwayat()
    {
        $id_user = $this->session->userdata('id_user');
        if (!$id_user) redirect('auth/login');

        $user_name = $this->session->userdata('nama_user') ?? $this->session->userdata('username');
        $user_initial = strtoupper(substr($user_name, 0, 1));

        $data['peminjaman'] = $this->Peminjaman_model->get_by_user($id_user);
        $data['title']   = "Riwayat Peminjaman";
        $data['user_name'] = $user_name;
        $data['user_initial'] = $user_initial;

        $this->load->view('layouts/header', $data);
        $this->load->view('layouts/sidebar', $data);
        $this->load->view('user/peminjaman/riwayat', $data);
        $this->load->view('layouts/footer');
    }

    // Tandai notifikasi sudah dibaca
    public function baca_notifikasi($id_notifikasi)
    {
        $id_user = $this->session->userdata('id_user');
        if (!$id_user) redirect('auth/login');

        $this->Notifikasi_model->markAsRead($id_notifikasi);
        redirect('peminjaman/notifikasi');
    }

    // Saat user mengajukan peminjaman
    public function ajukan()
    {
        $id_user = $this->session->userdata('id_user');
        if (!$id_user) redirect('auth/login');

        $kode_peminjaman = 'PMJ' . time();

        $data = [
            'id_user' => $id_user,
            'kode_peminjaman' => $kode_peminjaman,
            'tanggal_pinjam' => date('Y-m-d'),
            'status' => 'pending'
        ];

        $insert_id = $this->Peminjaman_model->insert($data);

        if ($insert_id) {
            $this->session->set_flashdata('success', 'Peminjaman berhasil diajukan, menunggu persetujuan admin.');
        } else {
            $this->session->set_flashdata('error', 'Gagal mengajukan peminjaman.');
        }

        redirect('peminjaman/riwayat');
    }
}
