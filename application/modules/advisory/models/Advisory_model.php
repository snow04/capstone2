<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');

class Advisory_model extends CI_Model
{
    var $table = 'advisory';
    var $view = 'vw_advisory';

    public function __construct()
    {
      parent::__construct();
      $this->load->database();
    }

    public function advisory_list()
    {
          $this->db->select('*');
          $this->db->from($this->view);
          $this->db->where('teacher_id', $this->session->id);
          $query = $this->db->get();
          return $query->result();
    }
}