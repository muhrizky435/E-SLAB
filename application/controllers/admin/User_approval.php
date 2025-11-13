<?php

/**
 * @property CI_Session $session
 * @property CI_Input $input
 * @property CI_DB_query_builder $db
 * @property User_model $User_model
 */

class User_approval extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        // Check if user is logged in and is admin
        if (!$this->session->userdata('id_user') || 
            !in_array($this->session->userdata('role'), ['admin', 'superadmin'])) {
            redirect('auth/login');
        }
        $this->load->model('User_model');
    }

    public function index()
    {
        $data['title'] = 'Persetujuan Admin';
        $user_name = $this->session->userdata('nama_user') ?? $this->session->userdata('username');
        $data['user_name'] = $user_name;
        $data['user_initial'] = strtoupper(substr($user_name, 0, 1));
        
        $data['pending_users'] = $this->User_model->get_pending_admin_requests();
        
        $this->load->view('layouts/header', $data);
        $this->load->view('layouts/sidebar', $data);
        $this->load->view('admin/user_approval/index', $data);
        $this->load->view('layouts/footer');
    }

    public function approve($id)
    {
        $user = $this->User_model->get_by_id($id);
        if ($user && $user->status_approval === 'pending') {
            $this->User_model->update($id, [
                'status_approval' => 'approved',
                'role' => $user->requested_role,
                'requested_role' => null
            ]);
            $this->session->set_flashdata('success', 'Permintaan admin telah disetujui');
        }
        redirect('admin/user_approval');
    }

    public function reject($id)
    {
        $user = $this->User_model->get_by_id($id);
        if ($user && $user->status_approval === 'pending') {
            $this->User_model->update($id, [
                'status_approval' => 'rejected',
                'requested_role' => null
            ]);
            $this->session->set_flashdata('success', 'Permintaan admin telah ditolak');
        }
        redirect('admin/user_approval');
    }
}