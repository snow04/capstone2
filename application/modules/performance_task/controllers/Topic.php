<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Topic extends MY_Controller 
{
    function __construct() 
    {
        $this->validate();
        parent::__construct();
        $mdl=array(
            'performance_task/topic_model'=>'topic_mdl',
            'performance_task_model'=>'performance_task_mdl',
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
    function index($topic_id)
    {
        $data = array(
            'topic_id' => $topic_id,
        );

        $this->session->set_userdata($data);

        $this->validate();
        $data['topic_info'] = $this->topic_mdl->topicInfo($topic_id);
        $data['class_info'] = $this->performance_task_mdl->classInfo($this->session->class_id);
        $data['main_content']='performance_task/topic';
        $data['page_name']="Topic";
        $data['template_type']="admin";
        $this->load->view('includes/templates',$data);
    }
    function getStudent($id)
    {
        $list = $this->topic_mdl->getStudent($id);
        echo json_encode($list);
    }
    function getScore($id)
    {
        $list = $this->topic_mdl->getScore($id);
        echo json_encode($list);
    }
    function save()
    {
        $res = $this->topic_mdl->getNowQuarter();

        $data = array(
            'topic_id' => $this->session->topic_id,
            'student_id' => $this->input->post('student_id'),
            'score' => $this->input->post('score'),
        );
        $insert = 0;
        if($this->input->post('id') !=='')
        {
            $insert = $this->topic_mdl->updateScore(array("id" => $this->input->post('id')), $data);
        }
        else
        {
            $insert = $this->topic_mdl->addScore($data);
        }
        echo json_encode(array("status" => TRUE, "id"=> $insert));
    }

    function student_scoring_list()
    {
        $list = $this->topic_mdl->student_scoring_list();

       
        $data = array();

        foreach ($list as $t) 
        {
            $row = array();

            $name = array();
            $name[] = $t->firstname;
            $name[] = $t->lastname;

            $row['name'] = $name;

            $score = '';

            if($t->score == '')
            {
                $row['score'] = '<button id="'.$t->student_id.'" class="btn btn-outline-success btn-sm float-right btnScore"><i class="fa fa-plus"></i></button>';

            }
            else
            {
                $row['score'] = $t->score.' <button id="'.$t->score_id.'" class="btn btn-outline-danger btn-sm float-right btnScoreEdit"><i class="fa fa-edit"></i></button>';
            }
 
            $data[] = $row;
        }
 
        $output = array(
            "data" => $data,
        );
        
        echo json_encode($output);
    }
}