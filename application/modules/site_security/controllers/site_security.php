<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Site_security extends MX_Controller
{

    function __construct() 
    {
        parent::__construct();
    }

    function check_session_timeout()
    {
        $timeout = Modules::run('site_settings/get_session_timeout');
        
        if (!isset($_SESSION['last_action']) OR $_SESSION['last_action'] < time()) 
        {
            session_destroy();
            $_SESSION = array();
        }
        else
        {
            $_SESSION['last_action'] = time() + $timeout;
            //set last action in Database
            Modules::run('account/set_last_action', $_SESSION['last_action']);
        }
    }
    
    function check_account()
    {
        //markes sure the user has logged in
        $logged_in = $this->session->userdata('logged_in');

        if (!isset($logged_in)) { return false;} 
        else {return true;}
    }
    
    function check_access($right_id, $view='on', $path='dashboard')
    {
       $logged_in = $this->session->userdata('logged_in');
       if($logged_in['right'] <= $right_id)
       {
           return TRUE;
       }
       else
       {
            if($view == 'on')
            {
            $data['count'] = 3;
            $data['path']= $path;
            $this->load->view('access_faild', $data);
            }
            else
            {
                return FALSE;
            }
       }
    }
 
}