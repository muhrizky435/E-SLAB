<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Keranjang_model extends CI_Model
{
    protected $table = 'keranjang';

    public function get_by_user($id_user)
    {
        $this->db->select('k.*, b.nama_barang, b.stok, b.satuan');
        $this->db->from('keranjang k');
        $this->db->join('barang b', 'b.id_barang = k.id_barang', 'left');
        $this->db->where('k.id_user', $id_user);
        return $this->db->get()->result();
    }

    public function get_selected($id_user, $selected_ids)
    {
        if (empty($selected_ids)) return [];
        $this->db->select('k.*, b.nama_barang, b.stok, b.satuan');
        $this->db->from('keranjang k');
        $this->db->join('barang b', 'b.id_barang = k.id_barang', 'left');
        $this->db->where('k.id_user', $id_user);
        $this->db->where_in('k.id_keranjang', $selected_ids);
        return $this->db->get()->result();
    }

    public function add_or_update($data)
    {
        // $data: ['id_user','id_barang','qty','catatan']
        $exist = $this->db->get_where($this->table, [
            'id_user' => $data['id_user'],
            'id_barang' => $data['id_barang']
        ])->row();

        if ($exist) {
            // update qty (tambah)
            $this->db->set('qty', 'qty + ' . (int)$data['qty'], FALSE);
            if (isset($data['catatan'])) $this->db->set('catatan', $data['catatan']);
            $this->db->where('id_keranjang', $exist->id_keranjang);
            $this->db->update($this->table);
            return $exist->id_keranjang;
        } else {
            $this->db->insert($this->table, $data);
            return $this->db->insert_id();
        }
    }

    public function remove($id_keranjang)
    {
        $this->db->where('id_keranjang', $id_keranjang);
        $this->db->delete('keranjang');
    }

    public function clear_user_cart($id_user)
    {
        return $this->db->delete($this->table, ['id_user' => $id_user]);
    }
}
