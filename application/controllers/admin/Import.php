<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 * @property CI_Session $session
 * @property CI_Input $input
 * @property CI_DB_query_builder $db
 * @property CI_Pagination $pagination
 * @property Barang_model $Barang_model
 */
class Import extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Barang_model');
        $this->load->library('pagination');
        $this->load->library('upload');
    }

    public function index()
    {
        $keyword = $this->input->get('q');
        $page    = $this->input->get('per_page');
        $limit   = 10;
        $offset  = $page ? $page : 0;

        $total_rows = $this->Barang_model->count_all($keyword);

        $config['base_url'] = site_url('import/index?q=' . urlencode($keyword));
        $config['total_rows'] = $total_rows;
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

        $barang = $this->Barang_model->get_paginated($limit, $offset, $keyword);

        $data = [
            'barang'     => $barang,
            'pagination' => $this->pagination->create_links(),
            'keyword'    => $keyword
        ];

        $user_name = $this->session->userdata('nama_user') ?? $this->session->userdata('username');
        $user_initial = strtoupper(substr($user_name, 0, 1));

        $data['title'] = "Import Tambah Alat/Bahan";

        $data['user_name'] = $user_name;
        $data['user_initial'] = $user_initial;

        $this->load->view('layouts/header', $data);
        $this->load->view('layouts/sidebar', $data);
        $this->load->view('admin/import/import_form', $data);
        $this->load->view('layouts/footer');
    }

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
        $existingCodes = array_column($existingData, 'kode_barang');

        do {
            $kode = $prefix . str_pad(mt_rand(0, 999), 3, '0', STR_PAD_LEFT);
            $existsInDb = $this->Barang_model->kode_exists($kode);
            $existsInBatch = in_array($kode, $existingCodes);
        } while ($existsInDb || $existsInBatch);

        return $kode;
    }


    public function upload_csv()
    {
        $file = $_FILES['file_csv']['tmp_name'];
        $kategori = $this->input->post('kategori');

        $map = [
            'alat_keperawatan' => ['id' => 1, 'prefix' => 'ALT-KP-'],
            'bahan_keperawatan' => ['id' => 3, 'prefix' => 'BHN-KP-'],
            'alat_kebidanan' => ['id' => 2, 'prefix' => 'ALT-KB-'],
            'bahan_kebidanan' => ['id' => 4, 'prefix' => 'BHN-KB-'],
        ];

        if (!isset($map[$kategori])) {
            $this->session->set_flashdata('error', 'Kategori tidak valid.');
            redirect('admin/import');
        }

        $id_sub_kategori = $map[$kategori]['id'];
        $prefix = $map[$kategori]['prefix'];
        $data = [];

        if ($file) {
            $ext = pathinfo($_FILES['file_csv']['name'], PATHINFO_EXTENSION);

            // Pastikan hanya file CSV
            if (strtolower($ext) !== 'csv') {
                $this->session->set_flashdata('error', 'Hanya file CSV yang diperbolehkan.');
                redirect('admin/import');
            }

            $handle = fopen($file, "r");
            $row = 0;

            while (($column = fgetcsv($handle, 1000, ",")) !== FALSE) {
                // Lewati 4 baris pertama (header)
                if ($row < 4) {
                    $row++;
                    continue;
                }

                if (!isset($column[1]) || !isset($column[2])) continue;

                $nama = trim($column[1]);
                $stok = (int) $column[2];

                if ($nama === '' || $stok <= 0) continue;

                $data[] = [
                    'id_sub_kategori' => $id_sub_kategori,
                    'kode_barang'     => $this->generate_unique_kode($prefix, $data),
                    'nama_barang'     => $nama,
                    'stok'            => $stok,
                    'satuan'          => 'pcs',
                    'is_active'       => 1,
                    'created_at'      => date('Y-m-d H:i:s'),
                    'updated_at'      => date('Y-m-d H:i:s')
                ];
            }

            fclose($handle);

        // PROSES SIMPAN DATA
            if (!empty($data)) {
                // Dapatkan nama tabel dari model
                $table = $this->Barang_model->get_table_name();

                // Reset AUTO_INCREMENT jika tabel kosong
                $barang_count = (int) $this->db->count_all($table);
                if ($barang_count === 0) {
                    $this->db->query("ALTER TABLE `{$table}` AUTO_INCREMENT = 1");
                }

                // Insert batch data
                $this->Barang_model->insert_batch_barang($data);

                // Pesan sukses + simpan kategori
                $this->session->set_flashdata('success', 'Import berhasil! ' . count($data) . ' data alat/bahan berhasil disimpan.');
                $this->session->set_flashdata('kategori', $kategori);
            } else {
                $this->session->set_flashdata('error', 'Format file salah atau data kosong.');
            }
        } else {
            $this->session->set_flashdata('error', 'File tidak ditemukan.');
        }

        redirect('admin/import');
    }

    // Fungsi pencarian barang
    public function search_barang()
    {
        $q = $this->input->get('q');
        $barang = $this->Barang_model->search($q);
        $no = 1;

        foreach ($barang as $b) {
            echo "<tr class='hover:bg-gray-50 transition'>
                <td class='px-4 py-2'>{$no}</td>
                <td class='px-4 py-2 font-semibold text-gray-800'>{$b->kode_barang}</td>
                <td class='px-4 py-2 text-gray-700'>{$b->nama_barang}</td>
                <td class='px-4 py-2 text-center'>{$b->stok}</td>
                <td class='px-4 py-2 text-center'>{$b->id_kategori}</td>
                <td class='px-4 py-2 text-center'>{$b->nama_sub}</td>
              </tr>";
            $no++;
        }

        if (empty($barang)) {
            echo "<tr><td colspan='5' class='p-4 text-center text-gray-500'>Tidak ada data ditemukan.</td></tr>";
        }
    }
}
