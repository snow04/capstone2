<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Advisory extends MY_Controller 
{
    function __construct() 
    {
        $this->validate();
        parent::__construct();
        $mdl=array(
            'advisory_model'=>'advisory_mdl'
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
        $this->session->unset_userdata('subject_teach');

        $this->validate();
        $data['main_content']='advisory/index';
        $data['page_name']="Advisory";
        $data['template_type']="admin";
        $this->load->view('includes/templates',$data);
    }

    function advisory_list()
    {
        $list = $this->advisory_mdl->advisory_list();
        

        $data = array();

        foreach ($list as $t) 
        {
            $row = array();

            $row['section'] = $t->section;
            $row['year_level'] = $t->year_level;
            $row['student_no'] = '10';
            $row['action'] = '<a href="'.base_url('student/index/'.$t->class_id).'" class="btn btn-primary btn-sm float-right" style="margin-bottom: 5px; margin-left: 5px;"><i class="fa fa-eye"></i> Students List</a> 
            <a href="'.base_url('remedial/index/'.$t->class_id).'" class="btn btn-success btn-sm float-right" style="margin-bottom: 5px;"><i class="fa fa-pencil"></i> Remedial</a>
            <div class="dropdown">
                <button type="button" class="btn btn-danger btn-sm dropdown-toggle float-right" data-toggle="dropdown">
                    <i class="fa fa-edit"></i> Class Mode
                </button>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="'.base_url('written_work/index/'.$t->class_id).'">Written Work</a>
                    <a class="dropdown-item" href="'.base_url('performance_task/index/'.$t->class_id).'">Performance Task</a>
                    <a class="dropdown-item" href="'.base_url('quarterly_assessment/index/'.$t->class_id).'">Quarterly Assessment</a>
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