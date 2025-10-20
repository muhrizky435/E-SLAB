<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 * @property CI_DB_query_builder $db
 * @property CI_session $session
 * @property CI_input $input
 * @property User_model $User_model
 */
class Admin extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Peminjaman_model');
        $this->load->model('Notifikasi_model');
        $this->load->database();
        $this->load->helper('url');
    }

    public function index()
    {
        return $this->dashboard();
    }

    public function dashboard()
    {
        $today = date('Y-m-d');

        // Jumlah sedang dipinjam
        $this->db->where('status', 'disetujui');
        $sedang_dipinjam = $this->db->count_all_results('peminjaman');

        // Jumlah jatuh tempo
        $this->db->where('status', 'disetujui');
        $this->db->where('tanggal_kembali <', $today);
        $this->db->where('tanggal_dikembalikan IS NULL', null, false);
        $jatuh_tempo = $this->db->count_all_results('peminjaman');

        // Jumlah stok tersedia
        $stok = $this->db->select_sum('stok')->get('barang')->row();
        $tersedia = $stok ? $stok->stok : 0;

        $data['sedang_dipinjam'] = $sedang_dipinjam;
        $data['jatuh_tempo'] = $jatuh_tempo;
        $data['tersedia'] = $tersedia;

        // GRAFIK 4 BULAN TERAKHIR
        $query = $this->db->query("
            SELECT 
                DATE_FORMAT(tanggal_pinjam, '%b') AS bulan,
                COUNT(id_peminjaman) AS total_peminjaman,
                COUNT(DISTINCT id_user) AS total_orang
            FROM peminjaman
            WHERE tanggal_pinjam >= DATE_SUB(CURDATE(), INTERVAL 4 MONTH)
            GROUP BY MONTH(tanggal_pinjam)
            ORDER BY MONTH(tanggal_pinjam)
        ");

        $bulan = [];
        $jumlah_peminjaman = [];
        $jumlah_orang = [];

        foreach ($query->result() as $row) {
            $bulan[] = $row->bulan;
            $jumlah_peminjaman[] = (int) $row->total_peminjaman;
            $jumlah_orang[] = (int) $row->total_orang;
        }

        $data['bulan'] = $bulan;
        $data['jumlah_peminjaman'] = $jumlah_peminjaman;
        $data['jumlah_orang'] = $jumlah_orang;

        // Peminjaman yang perlu diverifikasi (status pending)
        $this->db->select('p.*, u.nama as peminjam_nama');
        $this->db->from('peminjaman p');
        $this->db->join('users u', 'u.id_user = p.id_user', 'left');
        $this->db->where('p.status', 'pending');
        $this->db->order_by('p.tanggal_pinjam', 'DESC');
        $this->db->limit(5);
        $data['peminjaman'] = $this->db->get()->result();

        // Notifikasi terbaru
        $this->db->order_by('created_at', 'DESC');
        $this->db->limit(5);
        $data['notifications'] = $this->db->get('notifikasi')->result();

        $user_name = $this->session->userdata('nama_user') ?? $this->session->userdata('username');
        $user_initial = strtoupper(substr($user_name, 0, 1));

        $data['title'] = "Dashboard Admin";
        $data['user_name'] = $user_name;
        $data['user_initial'] = $user_initial;

        // kirim data title ke layout header
        $this->load->view('layouts/header', $data);
        $this->load->view('layouts/sidebar', $data);
        $this->load->view('admin/dashboard/dashboard_admin', $data);
        $this->load->view('layouts/footer', $data);
    }

    public function user()
    {
        $this->load->model('User_model');
        $data['title'] = 'Manajemen User';
        $data['users'] = $this->User_model->get_all();

        // load layout
        $this->load->view('layouts/header', $data);
        $this->load->view('layouts/sidebar', $data);
        $this->load->view('admin/manage_user/index', $data);
        $this->load->view('layouts/footer');
    }

    // di dalam class Admin extends CI_Controller
    public function user_detail($id = null)
    {
        if (!$id) show_404();

        $this->load->model('User_model');
        $data['user'] = $this->User_model->get_by_id($id);
        if (!$data['user']) show_404();

        $data['title'] = 'Detail User';
        $user_name = $this->session->userdata('nama_user') ?? $this->session->userdata('username');
        $data['user_name'] = $user_name;
        $data['user_initial'] = strtoupper(substr($user_name, 0, 1));

        $this->load->view('layouts/header', $data);
        $this->load->view('layouts/sidebar', $data);
        // buat view: application/views/admin/manage_user/detail.php
        $this->load->view('admin/manage_user/detail', $data);
        $this->load->view('layouts/footer');
    }

    public function user_edit($id = null)
    {
        $this->load->model('User_model');
        if (!$id) show_404();

        // Jika form dikirim (POST)
        if ($this->input->method() === 'post') {
            $payload = [
                'nama' => $this->input->post('nama'),
                'username'  => $this->input->post('username'),
                'email'     => $this->input->post('email'),
                'role'      => $this->input->post('role'),
                'is_active' => $this->input->post('is_active')
            ];

            // Update password jika diisi
            $new_password = $this->input->post('password');
            if (!empty($new_password)) {
                $payload['password'] = password_hash($new_password, PASSWORD_BCRYPT);
            }

            // Jalankan update
            $updated = $this->User_model->update($id, $payload);

            if ($updated) {
                $this->session->set_flashdata('success', 'Data pengguna berhasil diperbarui.');
            } else {
                $this->session->set_flashdata('error', 'Gagal memperbarui data pengguna.');
            }

            redirect('admin/user_edit/' . $id);
            return;
        }

        // Jika GET → tampilkan form
        $data['user'] = $this->User_model->get_by_id($id);
        if (!$data['user']) show_404();

        $data['title'] = 'Edit User';
        $user_name = $this->session->userdata('nama') ?? $this->session->userdata('username');
        $data['user_name'] = $user_name;
        $data['user_initial'] = strtoupper(substr($user_name, 0, 1));

        $this->load->view('layouts/header', $data);
        $this->load->view('layouts/sidebar', $data);
        $this->load->view('admin/manage_user/edit', $data);
        $this->load->view('layouts/footer');
    }

    public function user_delete($id = null)
    {
        if (!$id) show_404();
        $this->load->model('User_model');

        // prevent deleting yourself (optional)
        $current_id = $this->session->userdata('id_user');
        if ($current_id && (int)$current_id === (int)$id) {
            $this->session->set_flashdata('error', 'Anda tidak dapat menghapus akun yang sedang aktif.');
            redirect('admin/user');
        }

        $this->User_model->delete($id);
        $this->session->set_flashdata('success', 'User berhasil dihapus.');
        redirect('admin/user');
    }
}
