<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Site_settings extends MX_Controller
{

    function __construct() 
    {
        parent::__construct();
    }

    function get_site_name() 
    {
        $site_name = "CFC Outbound";
        return $site_name;
    }

    function get_owner_name()
    {
        $name = "Christian";
        return $name;
    }
    
    function get_file_path()
    {
        $path = 'resources/files/';
        return $path;
    } 
    
    function get_img_path()
    {
        $path = 'resources/images/';
        return $path;
    } 
    
    function get_css_path()
    {
        $path = 'resources/css/';
        return $path;
    } 
    
    function get_js_path()
    {
        $path = 'resources/js/';
        return $path;
    }  
    
    function get_system_debug() 
    {
        $debug = TRUE;
        return $debug;
    }
    
    function get_session_timeout()
    {
        //Zeit bis die User Session abgemeldet wird wenn der User inative ist
        //Timeout in seconds 3600 = 60 Minuts , 1800 = 30 Minuts
        $timeout = 1800;
        return $timeout;
    }
    
    function get_lock_time()
    {
        //Zeit bis die gelockten Customer wieder frei gegeben werden wenn der User Inaktive ist

        //Timeout in seconds 3600 = 60 Minuts , 1800 = 30 Minuts
        $timeout = 1800;
        return $timeout;
    }
}