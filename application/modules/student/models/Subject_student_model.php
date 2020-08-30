<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');

class Subject_student_model extends CI_Model
{
    var $table = 'admin';
    var $view = '';

    public function __construct()
    {
      parent::__construct();
      $this->load->database();
    }

    public function getStudent()
    {
        $this->db->select('*');
        $this->db->from('student');
        $this->db->where('id', $this->session->student_id);
        $query = $this->db->get();
        return $query->result();
    }

    public function getWwTopics()
    {
        $this->db->select('*');
        $this->db->from('vw_ww_topic');
        $this->db->where('class_id', $this->session->class_id);
        $query = $this->db->get();
        return $query->result();
    }

    public function getStudentScore($type)
    {
        $this->db->select('sum(score) as `sum_score`');
        $this->db->from($type.'_score');
        $this->db->where('student_id', $this->session->student_id);
        $this->db->where($type.'_score.topic_id IN ( SELECT id FROM '.$type.'_topic WHERE class_id = "'.$this->session->class_id.'" AND `subject` = "'.$this->session->subject.'" ) ');
        $query = $this->db->get();
        return $query->result();
    }

    public function getTotal($type)
    {
        $this->db->select('sum(max) as `sum_max`');
        $this->db->from('vw_'.$type.'_topic');
        $this->db->where('class_id', $this->session->class_id);
        $this->db->where('subject', $this->session->subject);
        $query = $this->db->get();
        return $query->result();
    }
}