<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Account extends MX_Controller
{

    function __construct()
    {
        parent::__construct();
        
    }

    function get_last_action()
    {
        $query = $this->get('id');
        return $query;
    }

    function set_last_action($time)
    {
       $user_data = $this->session->userdata('logged_in');
       $user_id = $user_data['id'];
       $data['last_action'] = $time;
       $this->_update($user_id, $data);
    }

    function logout()
    {
        //$this->session->sess_destroy();

        $user_data = $this->session->userdata('logged_in');
        $user_id = $user_data['id'];

        //Unset Session Data (bei destroy funktionier flashdata hier nicht)
        $this->session->unset_userdata('logged_in');
        $this->session->unset_userdata('last_action');


        //add flashdata
        $value = "<p style='color:red;'>You are logged out, log in again.</p>";
        $this->session->set_flashdata('auth', $value);

        redirect('account/login');
    }


    function login()
    {
        //$loader = new Twig_Loader_Filesystem('resources/views');
        //$twig = new Twig_Environment($loader);
        
        
        
        /*$site_name = new Twig_SimpleFunction('site_name', function()
        {
            return module_run('Site_settings/get_site_name');
        });
       
        $twig->addFunction($site_name);*/

        //check if user is allready logd in redireckt to dashboard
        if(Modules::run('site_security/check_account') == TRUE)
        {
            redirect('dashboard');
        }

        $data=array('name' => 'Christian', 'age' => '34');
        $this->load->library('form_validation');
        $this->load->helper('security');

//echo nl2br(print_r($_POST,true));
        $sign_in = $this->input->post('sign_in', TRUE);
        $username = $this->input->post('username', TRUE);
        $password = $this->input->post('password', TRUE);

        if(isset($sign_in))
        {
            $this->form_validation->set_rules('username', 'username', 'trim');
            //In der Form Validation wird die Function password_check aufgerufen und bei erfolg auch gleich die daten in die Session geschrieben.
            $this->form_validation->set_rules('password', 'Password', 'trim|callback_password_check['.$username.']');

            if ($this->form_validation->run($this) == TRUE)
            {
                //echo nl2br(print_r($_SESSION,true));
                //add flashdata
                $value = "<p style='color:green;'>You are logged in successfully.</p>";
                $this->session->set_flashdata('auth', $value);
                redirect('dashboard');
            }

        }
        //Check Flash Data
        $flash = $this->session->flashdata('auth');
        if($flash !="")
        {
            $data['flash'] = $flash;
        }

        $data['error'] = validation_errors('<p style="color: red;">Error', '</p>');
        //$this->load->view('login', $data);

        //echo image_path('flag');
        
        //$twig = new Twig();
        //$twig->add_function(image_path());
        $this->twig->add_function(image_path());
        echo $this->twig->render('login.html.twig', $data);
    }

    function module_run($module, $param = array())
    {
        echo modules::run($module, $param);
    }

    function password_check($password, $username)
    {
        //Set the password Hash empty
        $password_hash = "";
        //Get Data from DB
        $query = $this->get_where_custom('username', $username);
        foreach($query->result() as $row)
        {
            //Past the password hash into Hash variable
            $password_hash = $row->password;
        }
        //Check if the hash and the password past together
        if (password_verify($password, $password_hash))
        {
            $sess_array = array();
            foreach($query->result() as $row)
            {
                //Set the Session Array with user Data
                $sess_array = array(
                    'id' => $row->id,
                    'username' => $row->username,
                    'first_name' => $row->first_name,
                    'last_name' => $row->last_name,
                    'right' => $row->right
                );
                $this->session->set_userdata('logged_in', $sess_array);
                $this->session->set_userdata('d_self_resub', 1);
                $this->session->set_userdata('d_all_resub', 1);
                $this->session->set_userdata('d_customer', 1);
                 $this->session->set_userdata('d_customer_contact_info', 0);

                $_SESSION['last_action'] = time() + 20;

                $data = array('last_login' => date('Y-m-d H:i:s'));
                $this->_update($row->id, $data);
            }
            return TRUE;
        }
        else
        {
            //If False ruturn Error
            $this->form_validation->set_message('password_check', ' Invalid username or password!');
            return FALSE;
        }
    }


//create the hash to the Password
 /*       $password = password_hash($password, PASSWORD_DEFAULT);
        //Check the data in the Database
        $sql = "select * from admin where username = '".$username."' and password = '".$password."' limit 1;";
        $query = $this->_custom_query($sql);
        //If Data in DB TRUE
        if($query->num_rows() == 1)
        {
            $sess_array = array();
            foreach($query->result() as $row)
            {
                //Set the Session Array with user Data
                $sess_array = array(
                'id' => $row->id,
                'username' => $row->username
              );
              $this->session->set_userdata('logged_in', $sess_array);
            }
            return TRUE;
        }
        else
        {
            $this->form_validation->set_message('password_check', ' Invalid username or password!');
            return FALSE;
        }
    }*/

    function _display_account_list()
    {
        $data['query'] = $this->get('last_name');
        $this->load->view('account_list', $data);
    }

    function account_list()
    {
        $data['query']  = $this->get('last_name');

        $data['headline'] = "Administration";
        $data['headline_2'] = "Account List";
        $data['main_top']= TRUE;
        $template = "main";
        $data['view_file'] = "account_list";
        $this->load->module('template');
        $this->template->$template($data);
    }


    function settings()
    {
        $account = $this->session->userdata('logged_in');
        $id = $account['id'];

        if($this->input->post('submit') == TRUE)
        {
            $this->load->library('form_validation');
            $this->form_validation->set_rules('first_name', 'First Name', 'required|trim');
            $this->form_validation->set_rules('last_name', 'Last Namen', 'required|trim');

            if($this->input->post('password') != "")
            {
                $this->form_validation->set_rules('password', 'Password', 'required|trim|min_length[6]');
                $this->form_validation->set_rules('passconf', 'Password Confirmation', 'required|trim|min_length[6]|matches[password]');
            }

            if ($this->form_validation->run() != FALSE)
            {
                $data = $this->get_data_from_post();
                if($data['password'] != "")
                {
                    $data['password'] = password_hash($data['password'], PASSWORD_DEFAULT);
                }
                else
                {
                    unset($data['password']);
                }
                unset($data['passconf']);
                unset($data['username']);
                unset($data['right']);
                $data['change_date'] = date('Y-m-d H:i:s');
                $this->_update($id, $data);
                $value = "<p style='color:green;'>The Account was successfully updated.</p>";

                //add flashdata to session
                $this->session->set_flashdata('account', $value);
            }
        }

        $flash = $this->session->flashdata('account');
        if($flash !="")
        {
            $data['flash'] = $flash;
        }
        $data = $this->get_data_from_db($id);

        $data['option_sel'] = $data['right'];
        $data['options_rights'] = array
        (
            '2'         => 'Agent',
            '1'         => 'Supervisor',
            '0'         => 'Admin'
        );

        $data['form_location'] = current_url();
        //$data['form_location'] = str_replace('/create', '/submit', $current_url);

        $data['headline'] = "Account Settings";
        $data['main_top']= FALSE;
        $template = "main";
        $data['view_file'] = "settings";
        $this->load->module('template');
        $this->template->$template($data);
    }


    function admin()
    {
        //Check Flash Data
        $flash = $this->session->flashdata('account');
        if($flash !="")
        {
            $data['flash'] = $flash;
        }

        $data['headline'] = "Administration";
        $data['main_top']= TRUE;
        $template = "main";
        $data['view_file'] = "admin";
        $this->load->module('template');
        $this->template->$template($data);
    }

    function submit()
    {
        $update_id = $this->uri->segment(3);
        //deal with the submitted form
        $this->load->library('form_validation');

        $username_check = TRUE;
        if($update_id >0)
        {
            $data = $this->get_data_from_db($update_id);
            if($data['username'] == $this->input->post('username'))
            {
                $username_check = FALSE;
            }
        }
        if($username_check == TRUE)
        {
            $this->form_validation->set_rules('username', 'Username', 'required|min_length[5]|is_unique[account.username]');
            $this->form_validation->set_message('is_unique', 'This User Name already exist');
        }
        $this->form_validation->set_rules('first_name', 'First Name', 'required|trim');
        $this->form_validation->set_rules('last_name', 'Last Namen', 'required|trim');

        if((($this->input->post('password') != "") and ($update_id >0)) or ($update_id == ""))
        {
            $this->form_validation->set_rules('password', 'Password', 'required|trim|min_length[6]');
            $this->form_validation->set_rules('passconf', 'Password Confirmation', 'required|trim|min_length[6]|matches[password]');
        }


        //$update_id = $this->input->post('update_id', TRUE);

        if ($this->form_validation->run() == FALSE)
        {
            $this->create();
        }
        else
        {

            if($update_id>0)
            {
                //This is an EDIT (update) NOT a new Item
                $data = $this->get_data_from_post();
                if($data['password'] != "")
                {
                   $data['password'] = password_hash($data['password'], PASSWORD_DEFAULT);
                }
                else
                {
                    unset($data['password']);
                }
                unset($data['passconf']);
                $this->_update($update_id, $data);
                $value = "<p style='color:green;'>The User was successfully updated.</p>";
            }
            else
            {
                //This is a new record
                $data = $this->get_data_from_post();
                $data['password'] = password_hash($data['password'], PASSWORD_DEFAULT);
                unset($data['passconf']);
                $this->_insert($data);
                $value = "<p style='color:green;'>The User was successfully creates.</p>";
                $update_id = $this->get_max();
            }

            //add flashdata to session
            $this->session->set_flashdata('account', $value);

            redirect('account/admin');
        }

    }

    function create()
    {
        $user_id = $this->uri->segment(3);
        $data = $this->get_data_from_post();
        $submit = $this->input->post('submit', TRUE);

        if($user_id>0)
        {
            if($submit !="Submit")
            {
                //form hat NOT been posted yet, so read from database
                $data = $this->get_data_from_db($user_id);
            }
            $data['headline'] = "Edit User";
            $data['option_sel'] = $data['right'];
        }
        else
        {
            $data['headline'] = "Create a New User";
            $data['option_sel'] = 2;
        }

        $data['options_rights'] = array
        (
            '2'         => 'Agent',
            '1'         => 'Supervisor',
            '0'         => 'Admin'
        );

        $current_url = current_url();
        $data['form_location'] = str_replace('/create', '/submit', $current_url);

        $template = "main";
        $data['view_file'] = "create";
        $this->load->module('template');
        $this->template->$template($data);
    }

    function get_data_from_post()
    {
        $data['username'] = $this->input->post('username', TRUE);
        $data['first_name'] = $this->input->post('first_name', TRUE);
        $data['last_name'] = $this->input->post('last_name', TRUE);
        $data['password'] = $this->input->post('password', TRUE);
        $data['passconf'] = $this->input->post('passconf', TRUE);
        $data['right'] = $this->input->post('right', TRUE);
        return $data;
    }

    function get_data_from_db($update_id)
    {
        $query = $this->get_where($update_id);
        foreach ($query->result() as $row)
        {
            $data['username'] = $row->username;
            $data['first_name'] = $row->first_name;
            $data['last_name'] = $row->last_name;
            $data['password'] = "";
            $data['passconf'] = "";
            $data['right'] = $row->right;
        }

        if(!isset($data))
        {
            $data = "";
        }
        return $data;
    }

    function get($order_by)
    {
        $this->load->model('mdl_account');
        $query = $this->mdl_account->get($order_by);
        return $query;
    }

    function get_with_limit($limit, $offset, $order_by)
    {
        $this->load->model('mdl_account');
        $query = $this->mdl_account->get_with_limit($limit, $offset, $order_by);
        return $query;
    }

    function get_where($id)
    {
        $this->load->model('mdl_account');
        $query = $this->mdl_account->get_where($id);
        return $query;
    }

    function get_where_custom($col, $value)
    {
        $this->load->model('mdl_account');
        $query = $this->mdl_account->get_where_custom($col, $value);
        return $query;
    }

    function _insert($data)
    {
        $this->load->model('mdl_account');
        $this->mdl_account->_insert($data);
    }

    function _update($id, $data)
    {
        $this->load->model('mdl_account');
        $this->mdl_account->_update($id, $data);
    }

    function _delete($id)
    {
        $this->load->model('mdl_account');
        $this->mdl_account->_delete($id);
    }

    function count_where($column, $value)
    {
        $this->load->model('mdl_account');
        $count = $this->mdl_account->count_where($column, $value);
        return $count;
    }

    function get_max()
    {
        $this->load->model('mdl_account');
        $max_id = $this->mdl_account->get_max();
        return $max_id;
    }

    function _custom_query($mysql_query)
    {
        $this->load->model('mdl_account');
        $query = $this->mdl_account->_custom_query($mysql_query);
        return $query;
    }

}
