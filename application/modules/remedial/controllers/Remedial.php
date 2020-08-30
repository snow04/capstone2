<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Remedial extends MY_Controller 
{
    function __construct() 
    {
        $this->validate();
        parent::__construct();
        $mdl=array(
            'remedial_model'=>'remedial_mdl'
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
    function index($id)
    {
        $data2 = array(
            'class_id' => $id
          );
        $this->session->set_userdata($data2);

        $this->validate();
        $data['main_content']='remedial/index';
        $data['page_name']="Remedial";
        $data['template_type']="admin";
        $this->load->view('includes/templates',$data);
    }
    function save()
    {
        $data = array(
            'student_id' => $this->session->student_id,
            'subject' => $this->input->post('subject'),
            'status' => 'ongoing'
        );
        $insert = 0;
        $insert = $this->remedial_mdl->save($data);
        echo json_encode(array("status" => TRUE, "id"=> $insert));
    }
    function validateRemedial($subject)
    {
        $res = $this->remedial_mdl->validateRemedial($subject);
        if($res)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    function update()
    {
        $data = array(
            'status' => 'finished'
        );
        $insert = 0;
        $insert = $insert = $this->remedial_mdl->update(array("id" => $this->input->post('id')), $data);
        echo json_encode(array("status" => TRUE, "id"=> $insert));
    }

    function remedial_list()
    {
        $list = $this->remedial_mdl->remedial_list();
        

        $data = array();

        foreach ($list as $t) 
        {
            $row = array();

            $name = array();
            $name[] = $t->firstname;
            $name[] = $t->lastname;

            $row['name'] = $name;

            // $row['username'] = $t->username;
            $row['subject'] = $t->subject;
            $row['status'] = $t->status;
            if($t->status == 'ongoing')
            {
                $row['action'] = "<button id='".$t->id."' class='btn btn-primary btn-sm btnFinish'><i class='fa fa-user'></i> Finish Remedial</button>";
            }
            else
            {
                $row['action'] = "";

            }
            $data[] = $row;
        }
 
        $output = array(
            "data" => $data,
        );

        echo json_encode($output);
    }
}