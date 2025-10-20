<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 *  @property CI_Session $session
 *  @property CI_input $input
 * @property Notifikasi_model $Notifikasi_model
 */

class Notifikasi extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Notifikasi_model');
        $this->load->library('session');
    }

    public function index()
    {
        $id_user = $this->session->userdata('id_user');
        if (!$id_user) {
            redirect('auth/login');
        }
        $user_name = $this->session->userdata('nama_user') ?? $this->session->userdata('username');
        $user_initial = strtoupper(substr($user_name, 0, 1));

        $data['notifikasi'] = $this->Notifikasi_model->getByUser($id_user);
        $data['title'] = 'Notifikasi';
        $data['user_name'] = $user_name;
        $data['user_initial'] = $user_initial;
        
        $this->load->view('layouts/header', $data);
        $this->load->view('layouts/sidebar', $data);
        $this->load->view('user/dashboard/notifikasi', $data);
        $this->load->view('layouts/footer');
    }

    public function mark_as_read($id_notifikasi)
    {
        $this->Notifikasi_model->markAsRead($id_notifikasi);
        redirect('notifikasi');
    }

    // Untuk ikon lonceng di navbar
    public function get_unread_count()
    {
        $id_user = $this->session->userdata('id_user');
        $count = $this->Notifikasi_model->countUnread($id_user);
        echo json_encode(['count' => $count]);
    }

    public function mark_selected_as_read()
    {
        $selected = $this->input->post('selected'); // array id_notifikasi[]
        if (!empty($selected)) {
            $this->Notifikasi_model->markSelectedAsRead($selected);
        }
        redirect('notifikasi');
    }

    public function delete_selected()
    {
        $selected = $this->input->post('selected');
        if (!empty($selected)) {
            $this->Notifikasi_model->deleteSelected($selected);
        }
        redirect('notifikasi');
    }

    public function delete_all()
    {
        $id_user = $this->session->userdata('id_user');
        if ($id_user) {
            $this->Notifikasi_model->deleteAllByUser($id_user);
        }
        redirect('notifikasi');
    }
}
