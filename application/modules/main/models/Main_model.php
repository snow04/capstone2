<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');

class Main_model extends CI_Model
{
    var $table = 'teacher';
    var $view = '';

    var $username = '';
    var $password = '';
    var $hash = '';

    public function __construct()
    {
      parent::__construct();
      $this->load->database();
    }

    function get($user, $pass){
        $this->username = $user;
        $this->password= $pass;
    }

    function register($data)
    {
        $this->db->insert($this->table, $data);
        return $this->db->insert_id();
    }

    function getHash($hash){
        $this->hash = $hash;
    }
    
    function validate_username()
    {
        $this->db->select('*');
        $this->db->from($this->table);
        $this->db->where('username', $this->username);
        $query = $this->db->get();
        return $query->result();
    }

    function getTeacher($id)
    {
        $this->db->select('*');
        $this->db->from($this->table);
        $this->db->where('id', $id);
        $query = $this->db->get();
        return $query->result();
    }

    function validate_password()
    {
        if(password_verify($this->password, $this->hash))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}