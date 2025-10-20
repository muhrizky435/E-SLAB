<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 * @property CI_Session $session
 * @property CI_Input $input
 * @property CI_DB_query_builder $db
 * @property User_model $User_model
 */
class Auth extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->library('session');
        $this->load->helper(['url', 'form']);
        $this->load->model('User_model');
    }

    public function login()
    {
        // Jika sudah login dan bukan setelah proses login (tidak ada flash success),
        // langsung redirect ke dashboard yang sesuai per role.
        if ($this->session->userdata('id_user') && !$this->session->flashdata('success')) {
            $role = $this->session->userdata('role');
            if ($role === 'admin' || $role === 'superadmin') {
                redirect('admin/dashboard_admin');
            } else {
                redirect('dashboard');
            }
        }

        $data = [];

        if ($this->input->post()) {
            $username = $this->input->post('username');
            $password = $this->input->post('password');

            $user = $this->User_model->get_by_username($username);

            if ($user && password_verify($password, $user->password)) {
                // set session user
                $this->session->set_userdata([
                    'id_user'   => $user->id_user,
                    'username'  => $user->username,
                    'nama_user' => $user->nama,
                    'role'      => $user->role
                ]);

                // set flash success untuk ditampilkan di view login
                $this->session->set_flashdata('success', 'Login berhasil! Selamat datang kembali.');

                // Tentukan tujuan redirect berdasarkan role dan taruh di flashdata
                $redirect_to = (in_array($user->role, ['admin', 'superadmin'])) ? site_url('admin/dashboard_admin') : site_url('dashboard');
                $this->session->set_flashdata('redirect_to', $redirect_to);

                // lalu JS di view akan redirect ke $redirect_to setelah delay.
                redirect('auth/login');
            } else {
                $data['error'] = 'Username atau password salah!';
            }
        }

        $data['title'] = 'Login E-SLAB';
        $this->load->view('layouts/header', $data);
        $this->load->view('auth/login', $data);
        $this->load->view('layouts/footer');
    }

    public function register()
    {
        $data = [];

        if ($this->input->post()) {
            $nama      = trim($this->input->post('nama'));
            $username  = trim($this->input->post('username'));
            $email     = trim($this->input->post('email'));
            $password  = $this->input->post('password');
            $confirm   = $this->input->post('confirm_password');
            $role_post = $this->input->post('role');

            // Basic validation
            if ($password !== $confirm) {
                $data['error'] = 'Konfirmasi password tidak cocok.';
            } elseif (empty($nama) || empty($username) || empty($email) || empty($password)) {
                $data['error'] = 'Semua field harus diisi.';
            } else {
                // Cek username dan email
                $existing_user  = $this->User_model->get_by_username($username);
                $existing_email = $this->db->where('email', $email)->get('users')->row();

                if ($existing_user) {
                    $data['error'] = 'Username sudah digunakan!';
                } elseif ($existing_email) {
                    $data['error'] = 'Email sudah terdaftar!';
                } else {
                    // Role default user (kecuali admin/superadmin yang daftar)
                    $role_allowed  = 'user';
                    $session_role  = $this->session->userdata('role') ?? null;

                    if ($session_role === 'admin' || $session_role === 'superadmin') {
                        $role_allowed = in_array($role_post, ['user', 'admin', 'superadmin'])
                            ? $role_post
                            : 'user';
                    }

                    // Simpan data ke database
                    $insert_id = $this->User_model->insert([
                        'nama'     => $nama,
                        'username' => $username,
                        'email'    => $email,
                        'password' => password_hash($password, PASSWORD_BCRYPT),
                        'role'     => $role_allowed
                    ]);

                    if ($insert_id) {
                        $this->session->set_flashdata('success', 'Registrasi berhasil! Silakan login.');
                    } else {
                        $data['error'] = 'Gagal menyimpan data. Silakan coba lagi.';
                    }
                }
            }
        }

        $data['title'] = 'Daftar E-SLAB';
        $this->load->view('layouts/header', $data);
        $this->load->view('auth/register', $data);
        $this->load->view('layouts/footer');
    }

    public function logout()
    {
        $this->session->sess_destroy();
        redirect('auth/login');
    }
}
