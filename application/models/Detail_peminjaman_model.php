<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Detail_peminjaman_model extends CI_Model {
    protected $table = 'detail_peminjaman';

    public function insert_batch($data) {
        return $this->db->insert_batch($this->table, $data);
    }

    public function get_by_peminjaman($id_peminjaman) {
        // Gunakan DISTINCT untuk menghindari duplikat baris dari JOIN
        $this->db->distinct();
        $this->db->select('d.*, b.nama_barang, b.satuan, b.stok as stok_saat_ini');
        $this->db->from($this->table . ' d');
        $this->db->join('barang b', 'b.id_barang = d.id_barang', 'left');
        $this->db->where('d.id_peminjaman', $id_peminjaman);
        return $this->db->get()->result();
    }

    public function get_all() {
        return $this->db->get($this->table)->result();
    }

    public function get_by_id($id) {
        return $this->db->where('id_detail', $id)->get($this->table)->row();
    }

    public function insert($data) {
        return $this->db->insert($this->table, $data);
    }

    public function update($id, $data) {
        return $this->db->where('id_detail', $id)->update($this->table, $data);
    }

    public function delete($id) {
        return $this->db->where('id_detail', $id)->delete($this->table);
    }

    public function hapus($id_peminjaman) {
        return $this->db->where('id_peminjaman', $id_peminjaman)->delete($this->table);
    }
}
