<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');

class Topic_model extends CI_Model
{
    var $table = 'admin';
    var $view = '';

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    public function topicInfo($id)
    {
        $this->db->select('*');
        $this->db->from('ww_topic');
        $this->db->where('id', $id);
        $query = $this->db->get();
        return $query->result();
    }

    public function getStudent($id)
    {
        $this->db->select('*');
        $this->db->from('student');
        $this->db->where('id', $id);
        $query = $this->db->get();
        return $query->result();
    }

    public function getScore($id)
    {
        $this->db->select('*');
        $this->db->from('ww_score');
        $this->db->where('id', $id);
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

    public function  student_scoring_list()
    {
        $this->db->select('id,
        class_id,
        student_id,
        firstname,
        lastname,
        sex,
        classroom,
        section,
        year_level,
        (select score from ww_score where topic_id = '.$this->session->topic_id.' and ww_score.student_id = vw_student_class.student_id) as `score`,
        (select id from ww_score where topic_id = '.$this->session->topic_id.' and ww_score.student_id = vw_student_class.student_id) as `score_id`');
        $this->db->from('vw_student_class');
        $this->db->where('class_id', $this->session->class_id);
        $query = $this->db->get();
        return $query->result();

    }

    public function updateScore($where,$data)
    {
        $this->db->update('ww_score', $data, $where);
        return $this->db->affected_rows();
    }

    public function deleteScore($where,$data)
    {
        $this->db->update('ww_score', $data, $where);
        return $this->db->affected_rows();
    }

    public function addScore($data)
    {
      $this->db->insert('ww_score', $data);
      return $this->db->insert_id();
    }

}