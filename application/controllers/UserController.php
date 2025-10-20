<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 * @property CI_Session $session
 * @property CI_Input $input
 * @property User_model $User_model
 */
class UserController extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('User_model');
        $this->load->library('session');
        $this->load->helper(['url', 'form']);
    }

    public function profile()
    {
        $id_user = $this->session->userdata('id_user');
        if (!$id_user) redirect('auth/login');

        $data['title'] = 'Profile';
        $data['user'] = $this->User_model->get_by_id($id_user);
        $data['user_name'] = $this->session->userdata('nama_user');
        $data['user_initial'] = strtoupper(substr($data['user_name'], 0, 1));

        $this->load->view('layouts/header', $data);
        $this->load->view('layouts/sidebar', $data);
        $this->load->view('user/profile/profile_setting', $data);
        $this->load->view('layouts/footer');
    }

    public function update_password()
    {
        $id_user = $this->session->userdata('id_user');
        if (!$id_user) redirect('auth/login');

        $current = $this->input->post('current_password');
        $new     = $this->input->post('new_password');
        $confirm = $this->input->post('confirm_password');

        $user = $this->User_model->get_by_id($id_user);

        if (!password_verify($current, $user->password)) {
            $this->session->set_flashdata('error', 'Password lama salah.');
        } elseif ($new !== $confirm) {
            $this->session->set_flashdata('error', 'Konfirmasi password tidak cocok.');
        } else {
            $this->User_model->update($id_user, [
                'password' => password_hash($new, PASSWORD_BCRYPT)
            ]);
            $this->session->set_flashdata('success', 'Password berhasil diperbarui.');
        }

        redirect('profile_setting');
    }

    public function manage()
    {
        $data['title'] = 'Manage User';
        $data['users'] = $this->User_model->get_all();

        $this->load->view('layouts/header', $data);
        $this->load->view('layouts/sidebar', $data);
        $this->load->view('user/manage_user', $data);
        $this->load->view('layouts/footer');
    }

    public function delete($id)
    {
        $this->User_model->delete($id);
        $this->session->set_flashdata('success', 'User berhasil dihapus.');
        redirect('user/manage');
    }
}
