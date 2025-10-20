<?php
defined('BASEPATH') or exit('No direct script access allowed');

class User_model extends CI_Model
{
    protected $table = 'users';

        public function get_all()
    {
        return $this->db->get($this->table)->result();
    }

    public function get_by_id($id_user)
    {
        return $this->db->get_where($this->table, ['id_user' => $id_user])->row();
    }

    public function get_by_username($username)
    {
        return $this->db->get_where($this->table, ['username' => $username])->row();
    }

    public function insert($data)
    {
        $this->db->insert($this->table, $data);
        return $this->db->insert_id();
    }

    public function update($id, $data)
    {
        $this->db->where('id_user', $id);
        return $this->db->update($this->table, $data);
    }

    public function delete($id)
    {
        $this->db->where('id_user', $id);
        return $this->db->delete($this->table);
    }
}
