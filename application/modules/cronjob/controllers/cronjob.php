<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Cronjob extends MX_Controller
{

    function __construct() 
    {
        parent::__construct();
    }
    
    function index()
    {
        $this->load->view('index');
    }
    
    function check_lock()
    {  
        $data['info']= "";
        $lock_timeout = Modules::run('site_settings/get_lock_time');
        $timeout = time() + $lock_timeout;
        
        $query = Modules::run('account/get_last_action');
        
        foreach ($query->result() as $row)
        {
            if($row->last_action < $timeout)
            {
                if(Modules::run('customer_lock/check_user_lock', $row->id) != FALSE)
                {
                    Modules::run('customer_lock/user_unset_lock', $row->id);
                    $data['info'].= "User ".$row->first_name." ".$row->last_name." has been unlock from customer<br>";
                }
            }
        }

        $this->load->view('check_lock', $data);
    }
    
    function check_resubmission()
    {
        $data['msg'] = "";
        $query = Modules::run('customer_resubmission/get', 'ID');
        foreach ($query->result() as $row)
        {
            if($row->expired == 0)
            {
                $sql_date_time = $row->date." - ".$row->time;

                $timestamp = time();
                $date_time = date("Y-m-d - H:i:s", $timestamp);
                if($date_time > $sql_date_time)
                {
                    $info_data['user_id'] = 0;
                    $info_data['info'] = 'Resubmission time expired';
                    $info_data['create_date'] = $date_time;
                    $info_data['info_typ'] = 'system';
                    $info_data['customer_id'] = $row->customer_id;
                    Modules::run('customer_info/save_info', $info_data);
                    $data['msg'].= $info_data['info'].' by Customer '.$row->customer_id.' on '.$sql_date_time.'</br>';
                    
                    $id = $row->id;
                    $update['expired'] = 1;
                    Modules::run('customer_resubmission/_update', $id, $update);
                }   
            }
        }
        $this->load->view('check_resubmission', $data);
    }
}