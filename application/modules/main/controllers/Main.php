<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Main extends MY_Controller 
{
    var $username = '';
    var $password = '';
    var $err = '';

    var $id = '';
    var $firstname = '';
    var $lastname = '';

    function __construct() 
    {
        parent::__construct();
        $mdl=array(
            'main_model'=>'main_mdl'
        );
        $this->loader_model->loadMdl($mdl);
    }

    public function index()
    {
        $data['main_content']='main/index';
        $data['page_name']="Main";
        $data['template_type']="default";
        $this->load->view('includes/templates',$data);
    }

    public function get()
    {
        $this->username = $this->input->post('username');
        $this->password = $this->input->post('password');

        $res = $this->login();

        $data = array();

        $data['status'] = $res;

        if($res)
        {
            $data['id'] = $this->id;
            $data['username'] = $this->username;
            $data['firstname'] = $this->password;
            $data['lastname'] = $this->lastname;

        }
        else
        {
            $data['err'] = $this->err;
        }
        echo json_encode($data);
    }

    public function login()
    {
        $this->main_mdl->get($this->username, $this->password);

        $res = $this->main_mdl->validate_username();
        if($res)
        {
            $this->main_mdl->getHash($res[0]->password);
            $this->id = $res[0]->id;
            $this->lastname = $res[0]->lastname;
            $this->firstname = $res[0]->firstname;

            if($this->main_mdl->validate_password())
            {
                return true;
            }
            else
            {
                $this->err.='Password not found!<br>';
                return false;
            }
        }
        else
        {
            $this->err.='Username not found!<br>';
            return false;
        }
    }

    public function logout()
    {
        session_destroy();
        redirect('');
    }

    public function register()
    {
        $data = array(
            'username' => 'admin',
            'password' => password_hash('admin', PASSWORD_DEFAULT),
            'firstname'  => 'Gabriel',
            'lastname'  => 'Nieve',
            'status'  => 1,
        );

        $insert = $this->main_mdl->register($data);
        echo json_encode(array("status" => TRUE, "id" => $insert));
    }
    
    public function ask_credentials()
    {
        $res = $this->main_mdl->getTeacher($this->input->post('id'));
        $newsession = array(
            'id'        => $this->input->post('id'),
            'username'  => $this->input->post('username'),
            'lastname'  => $this->input->post('lastname'),
            'firstname' => $this->input->post('firstname'),
            'subject' => $res[0]->subject,
            'logged_in' => true
        );
        
        $this->session->set_userdata($newsession);
        echo json_encode(array('status'=>true));
    }
}
