<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Global_function extends MX_Controller
{

    function __construct() 
    {
        parent::__construct();
    }

    function get_debug($value = "")
    {   
        $debug = Modules::run('site_settings/get_system_debug');
        if($debug == TRUE)
        {
            if($value == "")
            {
                $data['debug'] = "Session:".nl2br(print_r($this->session->userdata(),true));

                $data['debug'] .= "Post:".nl2br(print_r($_POST,true));
                
                $data['debug'] .= "GET:".nl2br(print_r($_GET,true));
            }
            else
            {
                $data['debug'] = "Value:".$value;
            }
            $this->load->view('debug', $data);
        }
    }
    
    function timer($start_time = "")
    {
        $p_time = 0;
        $now = date("H:i:s");
        if($start_time == ""){$start_time = date('H:i:s');}
        if($now != $start_time)
        {
            $start_st = substr($start_time, 0, 2) * 60 * 60;
            $start_min = substr($start_time, 3, 2) * 60;
            $start_sek = substr($start_time, 6, 2);

            $now_st = substr($now, 0, 2) * 60 * 60;
            $now_min = substr($now, 3, 2) * 60;
            $now_sek = substr($now, 6, 2);

            $start_t = $start_sek + $start_min + $start_st;
            $now_t = $now_sek + $now_min + $now_st;

            $p_time = $now_t - $start_t;
        }
        $data['start_time'] = $start_time;
        $data['p_time'] = $p_time;
        
        $this->load->view('timer', $data);
    }
    
    function end_message ($msg,$count,$link)
    {
        //echo "end Message";
        //$die = "no";
        //if($count == "die") {$count = 3; $die = "ok";}
        
                //echo "<META HTTP-EQUIV=Refresh CONTENT='".$count."; URL=".$_SERVER["PHP_SELF"]."?".$link."'>";
        $data['link'] = $link;
        $data['msg'] = $msg;
        $data['count'] = $count;
        $this->load->view('message', $data);
        
        //if($die == "ok")
        //{
        //        die;
        //}
    }
    
    function get_date($date,$format, $get_format ='Y-m-d')
    {
        if($get_format == 'Y-m-d')
        {
            if(is_numeric(substr($date, 0, 4)))
            {
                    if($date == "0000-00-00")
                    {
                            $new_date = "No Date";
                    }
                    else
                    {
                            $year = substr($date, 0, 4);
                            $month = substr($date, 5, 2);
                            $day = substr($date, 8, 2);

                            $timestamp = mktime(0,0,0,$month,$day,$year);
                            $new_date = date($format,$timestamp);
                    }
            }
            else
            {
                    $new_date = $date;
            }
        }
        if($get_format == 'd-m-Y')
        {
            if(is_numeric(substr($date, 0, 2)))
            {
                    if($date == "00-00-0000")
                    {
                            $new_date = "No Date";
                    }
                    else
                    {
                            $year = substr($date, 6, 4);
                            $month = substr($date, 3, 2);
                            $day = substr($date, 0, 2);

                            $timestamp = mktime(0,0,0,$month,$day,$year);
                            $new_date = date($format,$timestamp);
                    }
            }
            else
            {
                    $new_date = $date;
            }
        }

            return $new_date;
    }
    
}