<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Landing extends CI_Controller
{
    public function index()
    {
        $data['title'] = 'E-SLAB - Platform Peminjaman Alat & Bahan Laboratorium';
        $this->load->view('layouts/header', $data);
        $this->load->view('layouts/navbar-landing', $data);
        $this->load->view('landing/home', $data);
        $this->load->view('layouts/footer-landing', $data);
    }
}