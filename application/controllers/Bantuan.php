<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
 *  @property CI_Session $session
 */
class Bantuan extends CI_Controller {

    public function index() {

        // Simulasi data user
        $user_name = $this->session->userdata('nama_user') ?? $this->session->userdata('username');
        $user_initial = strtoupper(substr($user_name, 0, 1));

        $data['title'] = 'Bantuan';
        $data['user_name'] = $user_name;
        $data['user_initial'] = $user_initial;
        
        $this->load->view('layouts/header', $data);
        $this->load->view('layouts/sidebar', $data);
        $this->load->view('user/bantuan/bantuan', $data);
        $this->load->view('layouts/footer');
    }
}
