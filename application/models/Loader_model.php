<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');

class Loader_model extends CI_Model{

    public function css_loader($uri_string)
    {
        // echo '<link href="'.s_url.'mycss/datatable.css" rel="stylesheet" type="text/css" />';
        $dt_tables=array('advisory','student','student','written_work','performance_task', 'quarterly_assessment','subject_teach','remedial');

        if (in_array($uri_string, $dt_tables)) 
        {
            // echo '<link href="' . s_url . 'plugins/overlayScrollbars/css/OverlayScrollbars.min.css" rel="stylesheet" type="text/css" />';
            echo '<link href="'.s_url.'datatables/datatables.min.css" rel="stylesheet" type="text/css" />';
            echo '<link href="'.s_url.'datatables/datatables/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />';
        }

        $dt_filter_pane = array('advisory','student','student','written_work','performance_task', 'quarterly_assessment','subject_teach','remedial');

        if (in_array($uri_string, $dt_filter_pane)) 
        {
            echo '<link href="'.s_url.'datatables/searchpanes/css/searchPanes.bootstrap4.min.css" rel="stylesheet" type="text/css" />';
            echo '<link href="'.s_url.'datatables/select/css/select.bootstrap4.min.css" rel="stylesheet" type="text/css" />';
        }

        $dt_col_reorder = array('advisory','student','student','written_work','performance_task','quarterly_assessment','subject_teach','remedial');

        if (in_array($uri_string, $dt_col_reorder)) 
        {
            echo '<link href="'.s_url.'datatables/colreorder/css/colReorder.bootstrap4.min.css" rel="stylesheet" type="text/css" />';
        }

        if(uri_string() == '')
        {
            echo '<link href="'.s_url.'mycss/main.css" rel="stylesheet" type="text/css" />';
        }
        
        if(uri_string()== 'profile')
        {
            echo '<link href="'.s_url.'mycss/profile.css" rel="stylesheet" type="text/css" />';
        }

    } 

    public function js_pluginLoader($uri_string)
    {
        
        $dt_tables=array('advisory','student','student','written_work','performance_task','quarterly_assessment','subject_teach','remedial');
        
        if (in_array($uri_string,$dt_tables)) 
        {
            echo '<script src="' . s_url . 'datatables/datatables.min.js" type="text/javascript" defer></script>';
        }

        $dt_filter_pane = array('advisory','student','student','written_work','performance_task','quarterly_assessment','subject_teach','remedial');

        if (in_array($uri_string,$dt_filter_pane)) 
        {
            echo '<script src="' . s_url . 'datatables/searchpanes/js/searchPanes.bootstrap4.min.js" type="text/javascript" defer></script>';
            echo '<script src="' . s_url . 'datatables/select/js/select.bootstrap4.min.js" type="text/javascript" defer></script>';
        }

        $dt_buttons = array('advisory','student','written_work','performance_task','quarterly_assessment','subject_teach','remedial');

        if (in_array($uri_string,$dt_buttons)) 
        {
            echo '<script src="' . s_url . 'datatables/buttons/js/buttons.colVis.min.js" type="text/javascript" defer></script>';
            echo '<script src="' . s_url . 'datatables/buttons/js/buttons.bootstrap4.min.js" type="text/javascript" defer></script>';
            echo '<script src="' . s_url . 'datatables/buttons/js/buttons.print.min.js" type="text/javascript" defer></script>';
            echo '<script src="' . s_url . 'datatables/buttons/js/buttons.html5.min.js" type="text/javascript" defer></script>';
            echo '<script src="' . s_url . 'datatables/pdfmake/pdfmake.min.js" type="text/javascript" defer></script>';
            echo '<script src="' . s_url . 'datatables/pdfmake/vfs_fonts.js" type="text/javascript" defer></script>';
            echo '<script src="' . s_url . 'datatables/jszip/jszip.min.js" type="text/javascript" defer></script>';
        }

        $dt_col_reorder = array('advisory','student','student','written_work','performance_task','quarterly_assessment','subject_teach','remedial');

        if (in_array($uri_string,$dt_col_reorder)) 
        {
            echo '<script src="' . s_url . 'datatables/colreorder/js/colReorder.bootstrap4.min.js" type="text/javascript" defer></script>';
        }

        $chart_js = array('advisory','student');

        if (in_array($uri_string,$chart_js)) 
        {
            echo '<script src="' . s_url . 'chart/chart.min.js" type="text/javascript" defer></script>';
        }
    }

    public function js_loader($uri_string)
    {

        if(uri_string()=='')
        {
            echo '<script src="'.s_url.'myjs/modules/main/main.js" type="module" defer></script>';
        }

        if(uri_string()=='advisory')
        {
            echo '<script src="'.s_url.'myjs/modules/advisory/advisory.js" type="module" defer></script>';
        }

        $val10 = $this->uri->segment(3);
        if(uri_string()=='remedial/index/'.$val10)
        {
            echo '<script src="'.s_url.'myjs/modules/remedial/remedial.js" type="module" defer></script>';
        }

        if(uri_string()=='subject_teach')
        {
            echo '<script src="'.s_url.'myjs/modules/subject_teach/subject_teach.js" type="module" defer></script>';
        }

        $val2 = $this->uri->segment(3);
        if(uri_string()=='written_work/index/'.$val2 || uri_string()=='written_work/s_index/'.$val2)
        {
            echo '<script src="'.s_url.'myjs/modules/written_work/written_work.js" type="module" defer></script>';
        }

        $val4 = $this->uri->segment(3);
        if(uri_string()=='performance_task/index/'.$val4 || uri_string()=='performance_task/s_index/'.$val4)
        {
            echo '<script src="'.s_url.'myjs/modules/performance_task/performance_task.js" type="module" defer></script>';
        }

        $val6 = $this->uri->segment(3);
        if(uri_string()=='quarterly_assessment/index/'.$val6 || uri_string()=='quarterly_assessment/s_index/'.$val6)
        {
            echo '<script src="'.s_url.'myjs/modules/quarterly_assessment/quarterly_assessment.js" type="module" defer></script>';
        }

        
        $val = $this->uri->segment(3);
        if(uri_string()=='student/index/'.$val)
        {
            echo '<script src="'.s_url.'myjs/modules/student/student.js" type="module" defer></script>';
        }

        $val = $this->uri->segment(4);
        if(uri_string()=='student/student_subject/index/'.$val)
        {
            echo '<script src="'.s_url.'myjs/modules/student/student_subject.js" type="module" defer></script>';
        }

        $val3 = $this->uri->segment(4);
        if(uri_string()=='written_work/topic/index/'.$val3)
        {
            echo '<script src="'.s_url.'myjs/modules/written_work/score.js" type="module" defer></script>';
        }

        $val5 = $this->uri->segment(4);
        if(uri_string()=='performance_task/topic/index/'.$val5)
        {
            echo '<script src="'.s_url.'myjs/modules/performance_task/score.js" type="module" defer></script>';
        }

        $val7 = $this->uri->segment(4);
        if(uri_string()=='quarterly_assessment/topic/index/'.$val7)
        {
            echo '<script src="'.s_url.'myjs/modules/quarterly_assessment/score.js" type="module" defer></script>';
        }

        $val8 = $this->uri->segment(4);
        if(uri_string()=='student/student_info/index/'.$val8)
        {
            echo '<script src="'.s_url.'myjs/modules/student/info.js" type="module" defer></script>';
        }

        $val8 = $this->uri->segment(4);
        if(uri_string()=='student/subject_student_info/index/'.$val8)
        {
            echo '<script src="'.s_url.'myjs/modules/student/subject_info.js" type="module" defer></script>';
        }
        
    }

    public function loadMdl($models) 
    {
        foreach($models as $mdlk=>$mdlv)
        {
            $this->load->model($mdlk,$mdlv);
        }
    }

    
}
