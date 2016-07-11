<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Template extends MX_Controller
{
    function main($data)
    {
        Modules::run('site_security/check_session_timeout');

        if(Modules::run('site_security/check_account') == TRUE)
        {
            $change = "0";
            if(isset($_GET['c_list'])){$c_list = $_GET['c_list'];$change = "1";}
            if(isset($_GET['ra_list'])){$ra_list = $_GET['ra_list'];$change = "1";}
            if(isset($_GET['rs_list'])){$rs_list = $_GET['rs_list'];$change = "1";}
            if(isset($_GET['cci'])){$cci = $_GET['cci'];$change = "1";}

            if($change == "1")
            {
                if(isset($c_list))
                {
                    $this->session->set_userdata('d_customer', $c_list);
                }
                if(isset($ra_list))
                {
                    $this->session->set_userdata('d_all_resub', $ra_list);
                }
                if(isset($rs_list))
                {
                    $this->session->set_userdata('d_self_resub', $rs_list);
                }
                if(isset($cci))
                {
                    $this->session->set_userdata('d_customer_contact_info', $cci);
                }
            }



            $this->load->view('main', $data);
        }
        else
        {
            //add flashdata
            $value = "<p style='color:red;'>You have no access, please log in.</p>";
            $this->session->set_flashdata('auth', $value);
            redirect('account/login');
        }
    }
}
