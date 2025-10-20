<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Notifikasi_model extends CI_Model
{
    protected $table = 'notifikasi';

    public function add($id_user, $pesan, $status = 'belum_dibaca')
    {
        return $this->db->insert($this->table, [
            'id_user'    => $id_user,
            'pesan'      => $pesan,
            'status'     => $status,
            'created_at' => date('Y-m-d H:i:s')
        ]);
    }

    public function getByUser($id_user, $limit = null)
    {
        $this->db->where('id_user', $id_user);
        $this->db->order_by('created_at', 'DESC');
        if (!empty($limit)) $this->db->limit($limit);
        return $this->db->get($this->table)->result();
    }

    public function markAsRead($id_notifikasi)
    {
        return $this->db->where('id_notifikasi', $id_notifikasi)
            ->update($this->table, ['status' => 'dibaca']);
    }

    public function getUnread($id_user, $limit = 5)
    {
        $this->db->where([
            'id_user' => $id_user,
            'status'  => 'belum_dibaca'
        ]);
        $this->db->order_by('created_at', 'DESC');
        $this->db->limit($limit);
        return $this->db->get($this->table)->result();
    }

    public function countUnread($id_user)
    {
        return $this->db->where([
            'id_user' => $id_user,
            'status' => 'belum_dibaca'
        ])->count_all_results($this->table);
    }

    // Notifikasi Khusus Peminjaman
    public function notifyPending($id_user, $kode_peminjaman)
    {
        $pesan = "Peminjaman dengan kode <b>{$kode_peminjaman}</b> sedang <span class='text-yellow-600 font-semibold'>menunggu persetujuan admin</span>.";
        return $this->add($id_user, $pesan);
    }

    public function notifyDisetujui($id_user, $kode_peminjaman)
    {
        $pesan = "Peminjaman dengan kode <b>{$kode_peminjaman}</b> telah <span class='text-green-600 font-semibold'>disetujui</span>.";
        return $this->add($id_user, $pesan);
    }

    public function notifyDitolak($id_user, $kode_peminjaman)
    {
        $pesan = "Peminjaman dengan kode <b>{$kode_peminjaman}</b> telah <span class='text-red-600 font-semibold'>ditolak</span>.";
        return $this->add($id_user, $pesan);
    }

    public function notifyJatuhTempo($id_user, $kode_peminjaman)
    {
        $pesan = "Peminjaman dengan kode <b>{$kode_peminjaman}</b> sudah <span class='text-orange-600 font-semibold'>jatuh tempo</span>. Segera lakukan pengembalian.";
        return $this->add($id_user, $pesan);
    }

    public function notifyDikembalikan($id_user, $kode)
    {
        $pesan = "Barang dari peminjaman kode {$kode} telah dikembalikan.";
        $this->db->insert('notifikasi', [
            'id_user' => $id_user,
            'pesan' => $pesan,
            'status' => 'belum_dibaca',
            'created_at' => date('Y-m-d H:i:s')
        ]);
    }

    public function markSelectedAsRead($ids)
    {
        $this->db->where_in('id_notifikasi', $ids);
        return $this->db->update($this->table, ['status' => 'dibaca']);
    }

    public function deleteSelected($ids)
    {
        $this->db->where_in('id_notifikasi', $ids);
        return $this->db->delete($this->table);
    }

    public function deleteAllByUser($id_user)
    {
        return $this->db->where('id_user', $id_user)->delete($this->table);
    }
}
