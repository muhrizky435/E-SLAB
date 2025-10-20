<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 *  @property CI_Session $session
 * @property Peminjaman_model $Peminjaman_model
 */
class Riwayat extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('Peminjaman_model');
        $this->load->library('session');
    }

    public function index() {
        // Ambil id user dari session
        $id_user = $this->session->userdata('id_user');

        // Simulasi data user
        $user_name = $this->session->userdata('nama_user') ?? $this->session->userdata('username');
        $user_initial = strtoupper(substr($user_name, 0, 1));

        // Ambil riwayat peminjaman user
        $data['peminjaman'] = $this->Peminjaman_model->get_by_user($id_user);

        // Data tambahan untuk layout
        $data['title'] = 'Riwayat';
        $data['user_name'] = $user_name;
        $data['user_initial'] = $user_initial;

        // Load views
        $this->load->view('layouts/header', $data);
        $this->load->view('layouts/sidebar', $data);
        $this->load->view('user/peminjaman/riwayat', $data);
        $this->load->view('layouts/footer');
    }

    // detail riwayat
    public function detail($id_peminjaman) {
        $data['peminjaman'] = $this->Peminjaman_model->get_detail_riwayat($id_peminjaman);
        $data['detail'] = $this->Peminjaman_model->get_detail_items($id_peminjaman);

        $user_name = $this->session->userdata('nama_user') ?? $this->session->userdata('username');
        $user_initial = strtoupper(substr($user_name, 0, 1));


        $data['title'] = 'Detail Peminjaman';
        $data['user_name'] = $user_name;
        $data['user_initial'] = $user_initial;

        $this->load->view('layouts/header', $data);
        $this->load->view('layouts/sidebar', $data);
        $this->load->view('user/peminjaman/detail_riwayat', $data);
        $this->load->view('layouts/footer');
    }

    // hapus riwayat
    public function hapus($id_peminjaman) {
        $this->Peminjaman_model->hapus($id_peminjaman);
        $this->session->set_flashdata('success', 'Riwayat peminjaman berhasil dihapus.');
        redirect('riwayat');
    }
}
