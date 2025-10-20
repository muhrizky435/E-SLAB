<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 * @property CI_Session $session
 * @property CI_Input $input
 * @property Peminjaman_model $Peminjaman_model
 * @property Detail_peminjaman_model $Detail_peminjaman_model
 * @property Barang_model $Barang_model
 * @property Verifikasi_log_model $Verifikasi_log_model
 * @property Notifikasi_model $Notifikasi_model
 */

class Pengembalian extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Peminjaman_model');
        $this->load->library('session');
    }

    public function index()
    {
        //  tampilkan peminjaman yang disetujui atau sudah dikembalikan
        $data['peminjaman'] = $this->Peminjaman_model->get_disetujui_dan_dikembalikan();

        $user_name = $this->session->userdata('nama_user') ?? $this->session->userdata('username');
        $user_initial = strtoupper(substr($user_name, 0, 1));

        $data['title'] = "Pengembalian";
        $data['user_name'] = $user_name;
        $data['user_initial'] = $user_initial;

        $this->load->view('layouts/header', $data);
        $this->load->view('layouts/sidebar', $data);
        $this->load->view('admin/pengembalian/index', $data);
        $this->load->view('layouts/footer');
    }

    public function kembalikan($id)
    {
        if ($this->Peminjaman_model->tandai_kembalikan($id)) {
            $this->session->set_flashdata('success', 'Peminjaman berhasil ditandai sebagai dikembalikan.');
        } else {
            $this->session->set_flashdata('error', 'Gagal menandai pengembalian.');
        }
        redirect('admin/pengembalian');
    }

    public function hapus($id)
    {
        $this->Peminjaman_model->hapus($id);
        $this->session->set_flashdata('success', 'Data peminjaman berhasil dihapus.');
        redirect('admin/pengembalian');
    }

    public function detail($id)
    {
        $data['peminjaman'] = $this->Peminjaman_model->get_by_id($id);
        $data['items'] = $this->Peminjaman_model->get_items($id);

        $user_name = $this->session->userdata('nama_user') ?? $this->session->userdata('username');
        $user_initial = strtoupper(substr($user_name, 0, 1));

        $data['title'] = "Detail Pengembalian";
        $data['user_name'] = $user_name;
        $data['user_initial'] = $user_initial;

        $this->load->view('layouts/header', $data);
        $this->load->view('layouts/sidebar', $data);
        $this->load->view('admin/pengembalian/detail', $data);
        $this->load->view('layouts/footer');
    }
}
