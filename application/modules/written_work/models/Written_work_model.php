<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');

class Written_work_model extends CI_Model
{
    var $table = 'admin';
    var $view = '';

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    public function classInfo($id)
    {
        $this->db->select('*');
        $this->db->from('class');
        $this->db->where('id', $id);
        $query = $this->db->get();
        return $query->result();
    }

    public function written_work_topic_list()
    {
        $this->db->select('*');
        $this->db->from('ww_topic');
        $this->db->where('class_id', $this->session->class_id);
        $this->db->where('subject', $this->session->subject);
        $this->db->order_by('id', 'DESC');

        $query = $this->db->get();
        return $query->result();
    }

    public function getNowQuarter()
    {
        $this->db->select('*');
        $this->db->from('quarter_setting');
        $query = $this->db->get();
        return $query->result();
    }
    public function updateTopic($where,$data)
    {
        $this->db->update('ww_topic', $data, $where);
        return $this->db->affected_rows();
    }

    public function deleteTopic($where,$data)
    {
        $this->db->update('ww_topic', $data, $where);
        return $this->db->affected_rows();
    }

    public function addTopic($data)
    {
      $this->db->insert('ww_topic', $data);
      return $this->db->insert_id();
    }
}