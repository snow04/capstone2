<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');

class Subject_teach_model extends CI_Model
{
    var $table = 'subject_teacher';
    var $view = 'vw_subject_teacher';

    public function __construct()
    {
      parent::__construct();
      $this->load->database();
    }

    public function subject_teach_list()
    {
          $this->db->select('*');
          $this->db->from($this->view);
          $this->db->where('teacher_id', $this->session->id);
          $query = $this->db->get();
          return $query->result();
    }
}