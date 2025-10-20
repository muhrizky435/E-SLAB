<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 *  @property CI_Session $session
 * @property Barang_model $Barang_model
 * @property Notifikasi_model $Notifikasi_model
 * @property Peminjaman_model $Peminjaman_model
 */

class Dashboard extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Peminjaman_model');
        $this->load->model('Notifikasi_model');
        $this->load->model('Barang_model');
        $this->load->library('session');
    }

    public function index()
    {
        $id_user = $this->session->userdata('id_user');
        if (!$id_user) redirect('auth/login');

        $user_name = $this->session->userdata('nama_user') ?? $this->session->userdata('username');
        $user_initial = strtoupper(substr($user_name, 0, 1));

        // Ambil statistik dari model
        $stats = $this->Peminjaman_model->get_stats($id_user);
        $data['sedang_dipinjam'] = $stats['sedang_dipinjam'] ?? 0;
        $data['jatuh_tempo']     = $stats['jatuh_tempo'] ?? 0;
        $data['tersedia']        = $stats['tersedia'] ?? 0;

        // Peminjaman & notifikasi terbaru
        $data['recent_borrowings'] = $this->Peminjaman_model->get_recent($id_user, 5);
        $data['notifications'] = $this->Notifikasi_model->getByUser($id_user, 5);

        // Tambahkan info user & judul tanpa menimpa data sebelumnya
        $data['title'] = 'Dashboard';
        $data['user_name'] = $user_name;
        $data['user_initial'] = $user_initial;

        // Tampilkan view
        $this->load->view('layouts/header', $data);
        $this->load->view('layouts/sidebar', $data);
        $this->load->view('user/dashboard/index', $data);
        $this->load->view('layouts/footer');
    }

    // Halaman notifikasi penuh
    public function notifikasi()
    {
        redirect('notifikasi');
    }
}
