<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Subject_student_info extends MY_Controller 
{
    function __construct() 
    {
        $this->validate();
        parent::__construct();
        $mdl=array(
            'subject_student_model'=>'subject_student_mdl',
            'remedial/remedial_model'=>'remedial_mdl'
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
        $data = array(
            'student_id' => $id,
          );
        $this->session->set_userdata($data);

        $this->validate();
        $data['main_content']='student/subject_info';
        $data['page_name']="Student Info";
        $data['student_info'] = $this->subject_student_mdl->getStudent();
        
        $data['template_type']="admin";
        $data['subjects'] = array($this->session->subject);

        $this->load->view('includes/templates',$data);
    }

    function totalGrade()
    {
        $written_work_ws =0;
        $performance_task_ws =0;
        $quarterly_assessment_ws =0;

        if($this->session->subject == 'Filipino' ||
         $this->session->subject == 'English' ||
         $this->session->subject == 'AP' ||
         $this->session->subject == 'ESP')
        {
            $written_work_ws =0.3;
            $performance_task_ws =0.5;
            $quarterly_assessment_ws =0.2;
        }
        else if($this->session->subject == 'Science' || $this->session->subject == 'Mathematics')
        {
            $written_work_ws =0.4;
            $performance_task_ws =0.4;
            $quarterly_assessment_ws =0.2;
        }
        else if($this->session->subject == 'MAPEH' || $this->session->subject == 'EPP')
        {
            $written_work_ws =0.2;
            $performance_task_ws =0.6;
            $quarterly_assessment_ws =0.2;
        }
        

        $max_score = $this->subject_student_mdl->getTotal('ww');
        $score = $this->subject_student_mdl->getStudentScore('ww');

        if($score[0]->sum_score == '')
        {
            $ww_res = 0;
        }
        else
        {
            $ww_res = $score[0]->sum_score / $max_score[0]->sum_max;
        }
        
        
        $max_score = $this->subject_student_mdl->getTotal('pt');
        $score = $this->subject_student_mdl->getStudentScore('pt');
        if($score[0]->sum_score == 0)
        {
            $pt_res = 0;
        }
        else
        {
            $pt_res = $score[0]->sum_score / $max_score[0]->sum_max;
        }

        $max_score = $this->subject_student_mdl->getTotal('qa');
        $score = $this->subject_student_mdl->getStudentScore('qa');

        if($score[0]->sum_score == 0)
        {
            $qa_res = 0;
        }
        else
        {
            $qa_res = $score[0]->sum_score / $max_score[0]->sum_max;
        }

        $written_work = ($ww_res * 100) * $written_work_ws;
        $performance_task = ($pt_res * 100) * $performance_task_ws;
        $quarterly_assessment = ($qa_res * 100) * $quarterly_assessment_ws;

        $missed = 100 - ($written_work + $performance_task + $quarterly_assessment);

        echo json_encode(array(
        'subject'=> $this->session->subject,
        'written_work' => $written_work,
        'performance_task' => $performance_task,
        'quarterly_assessment' =>$quarterly_assessment,
        'missed' => $missed));
    }

    public function transmute_grade($grade)
    {
        $transmuted_grade = 0;

        if($grade >= 0 && $grade <=3.99)
        {
            $transmuted_grade = 60;
        }
        else if($grade >= 4.00 && $grade <= 7.99)
        {
            $transmuted_grade = 61;
        }
        else if($grade >= 8.00 && $grade <= 11.99)
        {
            $transmuted_grade = 62;
        }
        else if($grade >= 12.00 && $grade <= 15.99)
        {
            $transmuted_grade = 63;
        }
        else if($grade >= 16.00 && $grade <= 19.99)
        {
            $transmuted_grade = 64;
        }
        else if($grade >= 20.00 && $grade <= 23.99)
        {
            $transmuted_grade = 65;
        }
        else if($grade >= 24.00 && $grade <= 27.99)
        {
            $transmuted_grade = 66;
        }
        else if($grade >= 28.00 && $grade <= 31.99)
        {
            $transmuted_grade = 67;
        }
        else if($grade >= 32.00 && $grade <= 35.99)
        {
            $transmuted_grade = 68;
        }
        else if($grade >= 36.00 && $grade <= 39.99)
        {
            $transmuted_grade = 69;
        }
        else if($grade >= 40.00 && $grade <= 43.99)
        {
            $transmuted_grade = 70;
        }
        else if($grade >= 44.00 && $grade <= 47.99)
        {
            $transmuted_grade = 71;
        }
        else if($grade >= 48.00 && $grade <= 51.99)
        {
            $transmuted_grade = 72;
        }
        else if($grade >= 52.00 && $grade <= 55.99)
        {
            $transmuted_grade = 73;
        }
        else if($grade >= 56.00 && $grade <= 59.99)
        {
            $transmuted_grade = 74;
        }
        else if($grade >= 60.00 && $grade <= 61.99)
        {
            $transmuted_grade = 75;
        }
        else if($grade >= 61.60 && $grade <= 63.19)
        {
            $transmuted_grade = 76;
        }
        else if($grade >= 63.20 && $grade <= 64.79)
        {
            $transmuted_grade = 77;
        }
        else if($grade >= 64.80 && $grade <= 66.39)
        {
            $transmuted_grade = 78;
        }
        else if($grade >= 66.40 && $grade <= 67.99)
        {
            $transmuted_grade = 79;
        }
        else if($grade >= 68.00 && $grade <= 69.59)
        {
            $transmuted_grade = 80;
        }
        else if($grade >= 69.69 && $grade <= 71.19)
        {
            $transmuted_grade = 81;
        }
        else if($grade >= 71.20 && $grade <= 72.79)
        {
            $transmuted_grade = 82;
        }
        else if($grade >= 72.80 && $grade <= 74.39)
        {
            $transmuted_grade = 83;
        }
        else if($grade >= 74.40 && $grade <= 75.99)
        {
            $transmuted_grade = 84;
        }
        else if($grade >= 76.00 && $grade <= 77.59)
        {
            $transmuted_grade = 85;
        }
        else if($grade >= 77.60 && $grade <= 79.19)
        {
            $transmuted_grade = 86;
        }
        else if($grade >= 79.20 && $grade <= 80.79)
        {
            $transmuted_grade = 87;
        }
        else if($grade >= 80.80 && $grade <= 82.39)
        {
            $transmuted_grade = 88;
        }
        else if($grade >= 82.40 && $grade <= 83.99)
        {
            $transmuted_grade = 89;
        }
        else if($grade >= 84.00 && $grade <= 85.59)
        {
            $transmuted_grade = 90;
        }
        else if($grade >= 85.60 && $grade <= 87.19)
        {
            $transmuted_grade = 91;
        }
        else if($grade >= 87.20 && $grade <= 88.79)
        {
            $transmuted_grade = 92;
        }
        else if($grade >= 88.80 && $grade <= 90.39)
        {
            $transmuted_grade = 93;
        }
        else if($grade >= 90.40 && $grade <= 91.99)
        {
            $transmuted_grade = 94;
        }
        else if($grade >= 92.00 && $grade <= 93.59)
        {
            $transmuted_grade = 95;
        }
        else if($grade >= 93.60 && $grade <= 95.19)
        {
            $transmuted_grade = 96;
        }
        else if($grade >= 95.20 && $grade <= 96.79)
        {
            $transmuted_grade = 97;
        }
        else if($grade >= 96.80 && $grade <= 98.39)
        {
            $transmuted_grade = 98;
        }
        else if($grade >= 98.40 && $grade <= 99.99)
        {
            $transmuted_grade = 99;
        }
        else{
            $transmuted_grade = 100;
        }

        echo json_encode(array('transmuted' => $transmuted_grade));
    }
}