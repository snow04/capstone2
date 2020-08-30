<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');

class Performance_task_model extends CI_Model
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

    public function performance_task_topic_list()
    {
        $this->db->select('*');
        $this->db->from('pt_topic');
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
        $this->db->update('pt_topic', $data, $where);
        return $this->db->affected_rows();
    }

    public function deleteTopic($where,$data)
    {
        $this->db->update('pt_topic', $data, $where);
        return $this->db->affected_rows();
    }

    public function addTopic($data)
    {
      $this->db->insert('pt_topic', $data);
      return $this->db->insert_id();
    }
}