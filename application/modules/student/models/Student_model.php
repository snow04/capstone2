<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');

class Student_model extends CI_Model
{
    var $table = 'student_class';
    var $view = 'vw_student_class';

    public function __construct()
    {
      parent::__construct();
      $this->load->database();
    }

    public function student_list()
    {
        $this->db->select('*');
        $this->db->from('vw_student_class');
        $this->db->where('class_id', $this->session->class_id);
        $query = $this->db->get();
        return $query->result();
    }
    public function classInfo()
    {
      $this->db->select('*');
      $this->db->from('class');
      $this->db->where('id', $this->session->class_id);
      $query = $this->db->get();
      return $query->result();
    }


    public function getStudentScore($subject, $type, $student_id)
    {
        $this->db->select('sum(score) as `sum_score`');
        $this->db->from($type.'_score');
        $this->db->where('student_id', $student_id);
        $this->db->where($type.'_score.topic_id IN ( SELECT id FROM '.$type.'_topic WHERE class_id = "'.$this->session->class_id.'" AND `subject` = "'.$subject.'" ) ');
        $query = $this->db->get();
        return $query->result();
    }

    public function getTotal($subject, $type)
    {
        $this->db->select('sum(max) as `sum_max`');
        $this->db->from('vw_'.$type.'_topic');
        $this->db->where('class_id', $this->session->class_id);
        $this->db->where('subject', $subject);
        $query = $this->db->get();
        return $query->result();
    }

    
}