<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Subject_teach extends MY_Controller 
{
    function __construct() 
    {
        $this->validate();
        parent::__construct();
        $mdl=array(
            'subject_teach_model'=>'subject_teach_mdl'
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
    function index()
    {
        $this->session->unset_userdata('class_id');

        $data = array(
            'subject_teach' => true,
          );
        $this->session->set_userdata($data);

        $this->validate();
        $data['main_content']='subject_teach/index';
        $data['page_name']="Subject Teach";
        $data['template_type']="admin";
        $this->load->view('includes/templates',$data);
    }

    function subject_teach_list()
    {
        $list = $this->subject_teach_mdl->subject_teach_list();
        

        $data = array();

        foreach ($list as $t) 
        {
            $row = array();

            $row['section'] = $t->section;
            $row['year_level'] = $t->year_level;
            $row['student_no'] = '10';
            $row['action'] = '
            <div class="dropdown">
                <a href="'.base_url('student/student_subject/index/'.$t->class_id).'" class="btn btn-primary btn-sm" style="margin-right: 5px;">Student Info</a>
                <button type="button" class="btn btn-danger btn-sm dropdown-toggle float-right" data-toggle="dropdown">
                    <i class="fa fa-edit"></i> Class Mode
                </button>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="'.base_url('written_work/s_index/'.$t->class_id).'">Written Work</a>
                    <a class="dropdown-item" href="'.base_url('performance_task/s_index/'.$t->class_id).'">Performance Task</a>
                    <a class="dropdown-item" href="'.base_url('quarterly_assessment/s_index/'.$t->class_id).'">Quarterly Assessment</a>
                </div>
            </div>';
 
            $data[] = $row;
        }
 
        $output = array(
            "data" => $data,
        );
        
        echo json_encode($output);
    }
}