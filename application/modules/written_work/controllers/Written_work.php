<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Written_work extends MY_Controller 
{
    function __construct() 
    {
        $this->validate();
        parent::__construct();
        $mdl=array(
            'written_work_model'=>'written_work_mdl',
        );
        $this->loader_model->loadMdl($mdl);
    }
    function validate()
    {
        if(!$this->session->has_userdata('logged_in'))
        {
            redirect(base_url());
        }
    }
    function index($class_id)
    {
        $this->session->unset_userdata('topic_id');

        $data = array(
            'class_id' => $class_id,
          );
        $this->session->set_userdata($data);

        $this->validate();
        $data['class_info'] = $this->written_work_mdl->classInfo($class_id);
        $data['main_content']='written_work/index';
        $data['page_name']="Written Work";
        $data['template_type']="admin";
        $this->load->view('includes/templates',$data);
    }

    function s_index($class_id)
    {
        $this->session->unset_userdata('topic_id');

        $data = array(
            'class_id' => $class_id,
          );
        $this->session->set_userdata($data);

        $this->validate();
        $data['class_info'] = $this->written_work_mdl->classInfo($class_id);
        $data['main_content']='written_work/s_index';
        $data['page_name']="Written Work";
        $data['template_type']="admin";
        $this->load->view('includes/templates',$data);
    }

    function written_work_topic_list()
    {
        $list = $this->written_work_mdl->written_work_topic_list();

        $data = array();

        foreach ($list as $t) 
        {
            $row = array();

            $row['id'] = $t->id;
            $row['topic'] = $t->topic;
            $row['max'] = $t->max;
            $row['quarter'] =  $t->quarter;
            $row['action'] = '<a href="'.base_url('written_work/topic/index/'.$t->id).'" class="btn btn-success btn-sm float-right"><i class="fa fa-check"></i> Score</a>';
 
            $data[] = $row;
        }
 
        $output = array(
            "data" => $data,
        );
        
        echo json_encode($output);
    }

    function save()
    {
        $res = $this->written_work_mdl->getNowQuarter();

        $data = array(
            'subject' => $this->session->subject,
            'quarter' => $res[0]->quarter,
            'topic' => $this->input->post('topic'),
            'class_id' => $this->session->class_id,
            'max' => $this->input->post('max')
        );
        $insert = 0;
        if($this->input->post('id') !=='')
        {
            $insert = $this->written_work_mdl->updateTopic(array("id" => $this->input->post('id')), $data);
        }
        else
        {
            $insert = $this->written_work_mdl->addTopic($data);
        }
        echo json_encode(array("status" => TRUE, "id"=> $insert));
    }
}