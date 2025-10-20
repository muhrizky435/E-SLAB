<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 * @property CI_Session $session
 * @property CI_Input $input
 * @property Keranjang_model $Keranjang_model
 * @property Barang_model $Barang_model
 */
class Keranjang extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Keranjang_model');
        $this->load->model('Barang_model');
        $this->load->library('session');
        $this->load->helper('url');
    }

    public function index()
    {
        $id_user = $this->session->userdata('id_user');
        if (!$id_user) redirect('auth/login');

        $user_name = $this->session->userdata('nama_user') ?? $this->session->userdata('username');
        $user_initial = strtoupper(substr($user_name, 0, 1));

        $data['keranjang'] = $this->Keranjang_model->get_by_user($id_user);
        $data['title'] = 'Keranjang';
        $data['user_name'] = $user_name;
        $data['user_initial'] = $user_initial;

        // kirim data title ke layout header
        $this->load->view('layouts/header', $data);
        $this->load->view('layouts/sidebar', $data);
        $this->load->view('user/keranjang/keranjang', $data);
        $this->load->view('layouts/footer');
    }

    public function tambah()
    {
        $id_user = $this->session->userdata('id_user');
        if (!$id_user) redirect('auth/login');

        $id_barang = $this->input->post('id_barang');
        $qty = (int)$this->input->post('qty');
        $catatan = $this->input->post('catatan');

        if ($qty <= 0) {
            $this->session->set_flashdata('error', 'Jumlah tidak valid.');
            redirect($_SERVER['HTTP_REFERER']);
        }

        $barang = $this->Barang_model->get_by_id($id_barang);
        if (!$barang) {
            $this->session->set_flashdata('error', 'Barang tidak ditemukan.');
            redirect($_SERVER['HTTP_REFERER']);
        }

        // optional: cek stok minimal di sini (boleh ditolak jika qty > stok)
        if ($qty > $barang->stok) {
            $this->session->set_flashdata('error', 'Qty melebihi stok tersedia.');
            redirect($_SERVER['HTTP_REFERER']);
        }

        $this->Keranjang_model->add_or_update([
            'id_user' => $id_user,
            'id_barang' => $id_barang,
            'qty' => $qty,
            'catatan' => $catatan
        ]);

        $this->session->set_flashdata('success', 'Barang ditambahkan ke keranjang.');
        redirect('keranjang');
    }

    public function remove($id_keranjang)
    {
        $id_user = $this->session->userdata('id_user');
        if (!$id_user) redirect('auth/login');

        $this->Keranjang_model->remove($id_keranjang);
        $this->session->set_flashdata('success', 'Item dihapus dari keranjang.');
        redirect('keranjang');
    }

    public function hapus_terpilih()
    {
        $id_user = $this->session->userdata('id_user');
        if (!$id_user) redirect('auth/login');

        $selected = $this->input->post('selected');
        if (!empty($selected)) {
            foreach ($selected as $id_keranjang) {
                $this->Keranjang_model->remove($id_keranjang);
            }
            $this->session->set_flashdata('success', 'Item terpilih berhasil dihapus.');
        } else {
            $this->session->set_flashdata('error', 'Tidak ada item yang dipilih.');
        }

        redirect('keranjang');
    }

    public function aksi_massal()
    {
        $id_user = $this->session->userdata('id_user');
        if (!$id_user) redirect('auth/login');

        $selected = $this->input->post('selected');
        if (empty($selected)) {
            $this->session->set_flashdata('error', 'Tidak ada item yang dipilih.');
            redirect('keranjang');
            return;
        }

        // Simpan ke session atau proses langsung ke halaman checkout
        $this->session->set_userdata('keranjang_terpilih', $selected);
        redirect('checkout/form');
    }

    // tambahkan di class Keranjang
    public function pinjam_semua()
    {
        $id_user = $this->session->userdata('id_user');
        if (!$id_user) redirect('auth/login');

        // Ambil semua item keranjang user (gunakan model)
        $keranjang = $this->Keranjang_model->get_by_user($id_user);

        if (empty($keranjang)) {
            $this->session->set_flashdata('error', 'Keranjang Anda masih kosong.');
            redirect('keranjang');
            return;
        }

        // Ambil semua id_keranjang
        $selected_ids = array();
        foreach ($keranjang as $item) {
            $selected_ids[] = $item->id_keranjang;
        }

        // Simpan array ID ke session (yang dibaca Checkout::form)
        $this->session->set_userdata('keranjang_terpilih', $selected_ids);

        // Redirect ke form checkout
        redirect('checkout/form');
    }
}
