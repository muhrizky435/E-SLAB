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
        $limit   = 15;
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

        // Mapping kategori ke id_sub_kategori dan prefix kode
        $map = [
            'alat' => ['id' => 1, 'prefix' => 'ALT-'],
            'bahan_keperawatan' => ['id' => 3, 'prefix' => 'BHN-KP-'],
            'bahan_kebidanan' => ['id' => 4, 'prefix' => 'BHN-KB-'],
        ];

        if (!isset($map[$kategori])) {
            $this->session->set_flashdata('error', 'Kategori tidak valid.');
            redirect('admin/import');
            return;
        }

        $id_sub_kategori = $map[$kategori]['id'];
        $prefix = $map[$kategori]['prefix'];
        $data = [];

        if ($file) {
            $ext = pathinfo($_FILES['file_csv']['name'], PATHINFO_EXTENSION);

            if (strtolower($ext) !== 'csv') {
                $this->session->set_flashdata('error', 'Hanya file CSV yang diperbolehkan.');
                redirect('admin/import');
                return;
            }

            // Baca file CSV
            $handle = fopen($file, "r");
            $row = 0;
            $errors = [];

            while (($column = fgetcsv($handle, 1000, ",")) !== FALSE) {
                // Adjust skip rows based on kategori
                $skip_rows = 0;
                if ($kategori == 'bahan_kebidanan') {
                    $skip_rows = 6;
                } else if ($kategori == 'bahan_keperawatan') {
                    $skip_rows = 3;
                } else if ($kategori == 'alat') {
                    $skip_rows = 4; // Skip 4 rows for alat format
                }

                if ($row < $skip_rows) {
                    $row++;
                    continue;
                }

                // Get column indexes based on kategori
                if ($kategori == 'bahan_kebidanan') {
                    // Format Kebidanan: NO, NAMA BAHAN HABIS PAKAI, Satuan, Jumlah
                    $nama_idx = 1;
                    $stok_idx = 3;
                    $satuan_idx = 2;
                } else if ($kategori == 'alat') {
                    // Format Alat: No, Nama Barang, Jumlah
                    $nama_idx = 1;
                    $stok_idx = 2;
                    $satuan_idx = "pcs"; // Alat doesn't have satuan column
                } else {
                    // Format Keperawatan: NO, NAMA BAHAN, JUMLAH, SATUAN
                    $nama_idx = 1;
                    $stok_idx = 2;
                    $satuan_idx = 3;
                }

                // Validasi kolom
                if (!isset($column[$nama_idx])) {
                    $errors[] = "Baris " . ($row + 1) . ": Nama barang tidak ditemukan";
                    $row++;
                    continue;
                }

                $nama = trim($column[$nama_idx]);
                
                // Extract numeric value from Jumlah column
                $stok_str = isset($column[$stok_idx]) ? trim($column[$stok_idx]) : "0";
                $stok_str = preg_replace('/[^0-9]/', '', $stok_str);
                $stok = empty($stok_str) ? 0 : (int)$stok_str;

                // Get satuan - default 'unit' for alat
                $satuan = 'unit';
                if ($satuan_idx !== null && isset($column[$satuan_idx])) {
                    $satuan = strtolower(trim($column[$satuan_idx]));
                }

                // Skip empty rows
                if (empty($nama)) {
                    $row++;
                    continue;
                }

                // Clean up nama_barang
                $nama = preg_replace('/\s+/', ' ', $nama);
                $nama = trim($nama);
                
                // Tambahkan data valid
                $data[] = [
                    'id_sub_kategori' => $id_sub_kategori,
                    'kode_barang'     => $this->generate_unique_kode($prefix, $data),
                    'nama_barang'     => $nama,
                    'stok'            => $stok,
                    'satuan'          => $satuan,
                    'is_active'       => 1,
                    'created_at'      => date('Y-m-d H:i:s'),
                    'updated_at'      => date('Y-m-d H:i:s')
                ];

                $row++;
            }

            fclose($handle);

            // Proses simpan data jika ada
            if (!empty($data)) {
                try {
                    // Reset AUTO_INCREMENT jika tabel kosong
                    $table = $this->Barang_model->get_table_name();
                    $barang_count = (int) $this->db->count_all($table);
                    if ($barang_count === 0) {
                        $this->db->query("ALTER TABLE `{$table}` AUTO_INCREMENT = 1");
                    }

                    // Insert batch data
                    $this->db->trans_start();
                    $this->Barang_model->insert_batch_barang($data);
                    $this->db->trans_complete();

                    if ($this->db->trans_status() === FALSE) {
                        throw new Exception('Gagal menyimpan data ke database.');
                    }

                    $this->session->set_flashdata('success', 'Import berhasil! ' . count($data) . ' data berhasil disimpan.');
                    $this->session->set_flashdata('kategori', $kategori);
                } catch (Exception $e) {
                    $this->session->set_flashdata('error', 'Gagal import: ' . $e->getMessage());
                }
            } else {
                $error_msg = 'Tidak ada data valid untuk diimport.';
                if (!empty($errors)) {
                    $error_msg .= ' Errors: ' . implode(', ', $errors);
                }
                $this->session->set_flashdata('error', $error_msg);
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
