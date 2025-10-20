<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Barang_model extends CI_Model
{

    protected $table = 'barang';

    // Ambil data dengan pagination + search
    public function get_paginated($limit, $offset, $keyword = null)
    {
        if (!empty($keyword)) {
            $this->db->like('nama_barang', $keyword);
            $this->db->or_like('kode_barang', $keyword);
        }
        return $this->db->get($this->table, $limit, $offset)->result();
    }

    // Hitung total data untuk pagination
    public function count_all($keyword = null)
    {
        if (!empty($keyword)) {
            $this->db->like('nama_barang', $keyword);
            $this->db->or_like('kode_barang', $keyword);
        }
        return $this->db->count_all_results($this->table);
    }

    // Paginated with kategori filter
    public function get_paginated_with_kategori($limit, $offset, $keyword = null, $kategori = null)
    {
        $this->db->from('barang b');
        $this->db->join('sub_kategori sk', 'sk.id_sub_kategori = b.id_sub_kategori', 'left');

        if (!empty($kategori)) {
            $this->db->where('b.id_sub_kategori', $kategori);
        }

        if (!empty($keyword)) {
            $this->db->group_start();
            $this->db->like('b.nama_barang', $keyword);
            $this->db->or_like('b.kode_barang', $keyword);
            $this->db->group_end();
        }

        $this->db->limit($limit, $offset);
        return $this->db->get()->result();
    }

    // Count all with kategori filter
    public function count_all_with_kategori($keyword = null, $kategori = null)
    {
        $this->db->from('barang b');
        $this->db->join('sub_kategori sk', 'sk.id_sub_kategori = b.id_sub_kategori', 'left');

        if (!empty($kategori)) {
            $this->db->where('b.id_sub_kategori', $kategori);
        }

        if (!empty($keyword)) {
            $this->db->group_start();
            $this->db->like('b.nama_barang', $keyword);
            $this->db->or_like('b.kode_barang', $keyword);
            $this->db->group_end();
        }

        return $this->db->count_all_results();
    }

    // Insert batch barang
    public function insert_batch_barang($data)
    {
        return $this->db->insert_batch($this->table, $data);
    }

    public function reset_auto_increment()
    {
        $this->db->query("ALTER TABLE {$this->table} AUTO_INCREMENT = 1");
    }

    public function get_table_name()
    {
        return $this->table;
    }

    // Get all barang
    public function get_all()
    {
        return $this->db->get($this->table)->result();
    }

    // Get barang by jenis (Alat or Bahan)
    public function get_by_jenis($jenis)
    {
        // JENIS (ALAT/BAHAN)
        $this->db->select('b.*');
        $this->db->from('barang b');
        $this->db->join('sub_kategori sk', 'sk.id_sub_kategori = b.id_sub_kategori');
        $this->db->where('sk.nama_sub', ucfirst(strtolower($jenis)));
        return $this->db->get()->result();
    }

    // Get barang by ID
    public function get_by_id($id_barang)
    {
        return $this->db->get_where($this->table, ['id_barang' => $id_barang])->row();
    }

    // Update stok barang
    public function update_stok($id_barang, $delta)
    {
        // delta bisa positif (tambah) atau negatif (kurangi)
        $this->db->set('stok', 'stok + (' . intval($delta) . ')', FALSE);
        $this->db->where('id_barang', $id_barang);
        return $this->db->update($this->table);
    }

    // Check if enough stock is available
    public function has_enough_stock($id_barang, $needed_qty)
    {
        $row = $this->get_by_id($id_barang);
        if (!$row) return false;
        return ((int)$row->stok >= (int)$needed_qty);
    }

    // Check if kode_barang exists
    public function kode_exists($kode_barang)
    {
        return $this->db->where('kode_barang', $kode_barang)
            ->count_all_results($this->table) > 0;
    }

    // Search barang by keyword
    public function search_barang($keyword)
    {
        $this->db->select('*');
        $this->db->from('barang');

        if (!empty($keyword)) {
            $this->db->group_start();
            $this->db->like('nama_barang', $keyword);
            $this->db->or_like('kode_barang', $keyword);
            $this->db->group_end();
        }

        $this->db->order_by('nama_barang', 'ASC');
        $query = $this->db->get();

        return $query->result();
    }


    // Count all by subkategori with optional search
    public function count_all_by_subkategori($id_sub_kategori, $keyword = null)
    {
        $this->db->where('id_sub_kategori', $id_sub_kategori);
        if (!empty($keyword)) {
            $this->db->group_start();
            $this->db->like('nama_barang', $keyword);
            $this->db->or_like('kode_barang', $keyword);
            $this->db->group_end();
        }
        return $this->db->count_all_results($this->table);
    }

    // Paginated by subkategori
    public function get_paginated_by_subkategori($id_sub_kategori, $limit, $offset, $keyword = null)
    {
        $this->db->where('id_sub_kategori', $id_sub_kategori);
        if (!empty($keyword)) {
            $this->db->group_start();
            $this->db->like('nama_barang', $keyword);
            $this->db->or_like('kode_barang', $keyword);
            $this->db->group_end();
        }
        $this->db->limit($limit, $offset);
        return $this->db->get($this->table)->result();
    }

    // Search function for Import controller
    public function search($keyword)
    {
        if (empty($keyword)) return $this->db->get('barang')->result();
        return $this->db
            ->like('nama_barang', $keyword)
            ->or_like('kode_barang', $keyword)
            ->get('barang')
            ->result();
    }
}
