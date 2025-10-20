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

        $detail = $this->Detail_peminjaman_model->get_by_peminjaman($id_peminjaman);

        // Kurangi stok
        foreach ($detail as $d) {
            $this->Barang_model->update_stok($d->id_barang, -(int)$d->qty);
        }

        // Update status jadi disetujui
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

        // Setelah disetujui, otomatis hilang dari verifikasi & muncul di pengembalian
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

        $detail = $this->Detail_peminjaman_model->get_by_peminjaman($id_peminjaman);

        // Update status
        $this->Peminjaman_model->update($id_peminjaman, [
            'status' => 'dikembalikan',
            'tanggal_dikembalikan' => date('Y-m-d H:i:s')
        ]);

        // Tambah stok kembali
        foreach ($detail as $d) {
            $this->Barang_model->update_stok($d->id_barang, +(int)$d->qty);
        }

        // Log
        $this->Verifikasi_log_model->insert([
            'id_peminjaman' => $id_peminjaman,
            'id_admin' => $admin_id,
            'aksi' => 'kembalikan',
            'catatan' => $this->input->post('catatan') ?: null
        ]);

        // Notifikasi user
        $this->Notifikasi_model->notifyDikembalikan($peminjaman->id_user, $peminjaman->kode_peminjaman);

        $this->session->set_flashdata('success', 'Barang telah dikembalikan dan stok diperbarui.');
        redirect('admin/pengembalian');
    }
}
