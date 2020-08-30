<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');

class Profile_model extends CI_Model
{
    var $table = 'admin';
    var $view = '';

    public function __construct()
    {
      parent::__construct();
      $this->load->database();
    }
}