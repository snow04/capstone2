<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Profile extends MY_Controller 
{
    function __construct() 
    {
        $this->validate();
        parent::__construct();
        $mdl=array(
            'profile_model'=>'profile_mdl'
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
        $this->validate();
        $data['main_content']='profile/index';
        $data['page_name']="Profile";
        $data['template_type']="admin";
        $this->load->view('includes/templates',$data);
    }
}