<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');

class Remedial_model extends CI_Model
{
    var $table = 'admin';
    var $view = '';

    public function __construct()
    {
      parent::__construct();
      $this->load->database();
    }

    public function save($data)
    {
      $this->db->insert('remedial', $data);
      return $this->db->insert_id();
    }

    public function validateRemedial($subject)
    {
        $this->db->select('*');
        $this->db->from('remedial');
        $this->db->where('subject', $subject);
        $this->db->where('student_id', $this->session->student_id);
        // $this->db->where('status', 'ongoing');
        $query = $this->db->get();
        return $query->result();
    }
    public function remedial_list()
    {
        $this->db->select('*');
        $this->db->from('vw_remedial');
        $this->db->where('class_id', $this->session->class_id);
        $query = $this->db->get();
        return $query->result();
    }

    public function update($where,$data)
    {
        $this->db->update('remedial', $data, $where);
        return $this->db->affected_rows();
    }
}