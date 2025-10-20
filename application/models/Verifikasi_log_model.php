<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Verifikasi_log_model extends CI_Model {
    protected $table = 'peminjaman_verifikasi_log';

    public function insert($data) {
        // $data: id_peminjaman, id_admin, aksi ('setujui','tolak','kembalikan'), catatan
        return $this->db->insert($this->table, $data);
    }

    public function get_by_peminjaman($id_peminjaman) {
        return $this->db->get_where($this->table, ['id_peminjaman' => $id_peminjaman])->result();
    }
}
