<?php
defined('BASEPATH') or exit('No direct script access allowed');


/**
 * @property CI_Session $session
 * @property CI_Input $input
 * @property CI_Pagination $pagination
 * @property CI_DB_query_builder $db
 * @property User_model $User_model
 * @property Barang_model $Barang_model
 */

class Katalog_alat extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Barang_model');
        $this->load->library('pagination');
        $this->load->helper('url');
    }

    public function index()
    {
        $keyword = $this->input->get('keyword');
        $kategori = $this->input->get('kategori');
        $page = $this->input->get('per_page') ?? 0;
        $limit = 15;

        // Jika kategori kosong (Semua Kategori) → filter hanya alat
        if (empty($kategori)) {
            $this->db->like('sk.nama_sub', 'Alat');
        }

        // Hitung total data
        $total = $this->Barang_model->count_all_with_kategori($keyword, $kategori);

        // Konfigurasi pagination
        $config['base_url'] = site_url('admin/katalog_alat');
        $config['total_rows'] = $total;
        $config['per_page'] = $limit;
        $config['reuse_query_string'] = true;

        // Tampilan pagination
        $config['full_tag_open'] = '<nav class="flex justify-center mt-4"><ul class="inline-flex items-center -space-x-px">';
        $config['full_tag_close'] = '</ul></nav>';
        $config['cur_tag_open'] = '<li><a class="px-3 py-2 text-white bg-blue-600 rounded-lg">';
        $config['cur_tag_close'] = '</a></li>';
        $config['num_tag_open'] = '<li>';
        $config['num_tag_close'] = '</li>';
        $config['attributes'] = ['class' => 'px-3 py-2 text-gray-700 bg-white border border-gray-300 hover:bg-gray-100 rounded-lg transition'];

        // Ambil data alat
        if (empty($kategori)) {
            $this->db->like('sk.nama_sub', 'Alat');
        }

        $this->pagination->initialize($config);

        // Ambil data alat dengan pagination
        $data['barang'] = $this->Barang_model->get_paginated_with_kategori($limit, $page, $keyword, $kategori);
        $data['pagination'] = $this->pagination->create_links();
        $data['keyword'] = $keyword;
        $data['kategori'] = $kategori;

        $user_name = $this->session->userdata('nama_user') ?? $this->session->userdata('username');
        $user_initial = strtoupper(substr($user_name, 0, 1));

        $data['title'] = "Manajemen Data Alat";

        $data['user_name'] = $user_name;
        $data['user_initial'] = $user_initial;

        $this->load->view('layouts/header', $data);
        $this->load->view('layouts/sidebar', $data);
        $this->load->view('admin/katalog_alat/index', $data);
        $this->load->view('layouts/footer');
    }

    public function edit($id)
    {
        $data['barang'] = $this->Barang_model->get_by_id($id);

        $user_name = $this->session->userdata('nama_user') ?? $this->session->userdata('username');
        $user_initial = strtoupper(substr($user_name, 0, 1));

        $data['title'] = "Edit Alat";
        $data['user_name'] = $user_name;
        $data['user_initial'] = $user_initial;

        $this->load->view('layouts/header', $data);
        $this->load->view('layouts/sidebar', $data);
        $this->load->view('admin/katalog_alat/edit', $data);
        $this->load->view('layouts/footer');
    }

    public function update()
    {
        $id_barang = $this->input->post('id_barang');
        $data = [
            'nama_barang' => $this->input->post('nama_barang'),
            'kode_barang' => $this->input->post('kode_barang'),
            'stok' => $this->input->post('stok'),
        ];

        if ($this->db->where('id_barang', $id_barang)->update('barang', $data)) {
            $this->session->set_flashdata('modal_type', 'success');
            $this->session->set_flashdata('modal_message', 'Data alat berhasil diperbarui.');
        } else {
            $this->session->set_flashdata('modal_type', 'error');
            $this->session->set_flashdata('modal_message', 'Terjadi kesalahan saat memperbarui data.');
        }
        redirect('admin/katalog_alat');
    }

    public function delete($id)
    {
        if ($this->db->where('id_barang', $id)->delete('barang')) {
            $this->session->set_flashdata('modal_type', 'success');
            $this->session->set_flashdata('modal_message', 'Data alat berhasil dihapus.');
        } else {
            $this->session->set_flashdata('modal_type', 'error');
            $this->session->set_flashdata('modal_message', 'Gagal menghapus data alat.');
        }
        redirect('admin/katalog_alat');
    }

    // Halaman tambah alat
    public function tambah()
    {
        $user_name = $this->session->userdata('nama_user') ?? $this->session->userdata('username');
        $user_initial = strtoupper(substr($user_name, 0, 1));

        $data['title'] = "Tambah Alat";

        $data['user_name'] = $user_name;
        $data['user_initial'] = $user_initial;

        $this->load->view('layouts/header', $data);
        $this->load->view('layouts/sidebar', $data);
        $this->load->view('admin/katalog_alat/tambah', $data);
        $this->load->view('layouts/footer');
    }

    // Simpan alat baru
    public function simpan()
    {
        // ambil input
        $id_sub_kategori = (int)$this->input->post('id_sub_kategori');
        $nama_barang = $this->input->post('nama_barang');
        $deskripsi = $this->input->post('deskripsi');
        $satuan = $this->input->post('satuan') ?? 'pcs';
        $stok = (int)$this->input->post('stok');
        $stok_minimum = (int)($this->input->post('stok_minimum') ?? 0);

        // tentukan prefix berdasarkan id_sub_kategori (pakai switch agar kompatibel)
        switch ($id_sub_kategori) {
            case 1:
                $prefix = 'ALT-KP-';
                break;
            case 2:
                $prefix = 'ALT-KB-';
                break;
            default:
                $prefix = 'ALT-';
                break;
        }

        // generate kode unik (single insert)
        $kode_barang = $this->generate_kode($prefix);

        // siapkan data
        $data = [
            'id_sub_kategori' => $id_sub_kategori,
            'kode_barang'     => $kode_barang,
            'nama_barang'     => $nama_barang,
            'deskripsi'       => $deskripsi,
            'satuan'          => $satuan,
            'stok'            => $stok,
            'stok_minimum'    => $stok_minimum,
            'is_active'       => 1,
            'created_at'      => date('Y-m-d H:i:s'),
            'updated_at'      => date('Y-m-d H:i:s')
        ];

        if ($this->db->insert('barang', $data)) {
            $this->session->set_flashdata('modal_type', 'success');
            $this->session->set_flashdata('modal_message', 'Alat baru berhasil ditambahkan.');
        } else {
            $this->session->set_flashdata('modal_type', 'error');
            $this->session->set_flashdata('modal_message', 'Terjadi kesalahan saat menyimpan data alat.');
        }

        redirect('admin/katalog_alat');
    }

    // helper kode generator
    private function generate_kode($prefix)
    {
        do {
            $kode = $prefix . str_pad(mt_rand(0, 999), 3, '0', STR_PAD_LEFT);
            $exists = $this->Barang_model->kode_exists($kode);
        } while ($exists);

        return $kode;
    }

    private function generate_unique_kode($prefix, $existingData)
    {
        // existingData diharapkan array of arrays/objects yang punya key/properti 'kode_barang'
        $existingCodes = [];
        if (!empty($existingData) && is_array($existingData)) {
            // dukung baik array of assoc maupun array of objects
            foreach ($existingData as $row) {
                if (is_array($row) && isset($row['kode_barang'])) {
                    $existingCodes[] = $row['kode_barang'];
                } elseif (is_object($row) && isset($row->kode_barang)) {
                    $existingCodes[] = $row->kode_barang;
                }
            }
        }

        do {
            $kode = $prefix . str_pad(mt_rand(0, 999), 3, '0', STR_PAD_LEFT);
            $existsInDb = $this->Barang_model->kode_exists($kode);
            $existsInBatch = in_array($kode, $existingCodes);
        } while ($existsInDb || $existsInBatch);

        return $kode;
    }


    // Fungsi live search dengan AJAX
    public function live_search()
    {
        $keyword = $this->input->get('keyword');
        $kategori = $this->input->get('kategori');
        $page = (int) ($this->input->get('page') ?? 0);
        $limit = 15;
        $offset = $page * $limit;

        // Jika kategori kosong (Semua Kategori) → filter hanya Alat
        if (empty($kategori)) {
            $this->db->like('sk.nama_sub', 'Alat');
        }

        // build pagination for AJAX (use page_query_string with custom base)
        $this->load->library('pagination');

        $config['base_url'] = site_url('admin/katalog_alat');
        $config['total_rows'] = $this->Barang_model->count_all_with_kategori($keyword, $kategori);
        $config['per_page'] = $limit;
        $config['page_query_string'] = TRUE;
        $config['query_string_segment'] = 'per_page';
        $config['full_tag_open'] = '<nav class="flex justify-center mt-4"><ul class="inline-flex items-center -space-x-px">';
        $config['full_tag_close'] = '</ul></nav>';
        $config['cur_tag_open'] = '<li><a class="px-3 py-2 text-white bg-blue-600 rounded-lg">';
        $config['cur_tag_close'] = '</a></li>';
        $config['num_tag_open'] = '<li>';
        $config['num_tag_close'] = '</li>';
        $config['attributes'] = ['class' => 'px-3 py-2 text-gray-700 bg-white border border-gray-300 hover:bg-gray-100 rounded-lg transition'];

        $this->pagination->initialize($config);

        $barang = $this->Barang_model->get_paginated_with_kategori($limit, $offset, $keyword, $kategori);
        $rows_html = $this->load->view('admin/katalog_alat/_rows', ['barang' => $barang, 'offset' => $offset], TRUE);
        $pagination_html = $this->pagination->create_links();

        // return JSON
        header('Content-Type: application/json');
        echo json_encode([
            'rows' => $rows_html,
            'pagination' => $pagination_html
        ]);
    }
}
