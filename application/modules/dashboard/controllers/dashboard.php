<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Dashboard extends MX_Controller
{

    function __construct() 
    {
        parent::__construct();
        //$this->load->module('site_security');
        //$this->site_security->check_access('1','on','project');
    }

    function index()
    {
        $flash = $this->session->flashdata('auth');
        if($flash !="")
        {
            $data['flash'] = $flash;
        }

        $data['session_id'] = session_id();
        
        $data['headline'] = "Dashboard";
        $template = "main";
        $data['view_file'] = "home";
        $this->load->module('template');
        $this->template->$template($data);
    }
    
}