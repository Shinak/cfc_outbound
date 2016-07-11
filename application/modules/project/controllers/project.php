<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Project extends MX_Controller
{

    function __construct() 
    {
        parent::__construct();
    }
    
    function index()
    {
        //Check Flash Data
        $flash = $this->session->flashdata('project');
        if($flash !="")
        {
            $data['flash'] = $flash;
        }
        
        
        $data['headline'] = "Project Panel";
        $template = "main";
        $data['view_file'] = "project_main";
        $this->load->module('template');
        $this->template->$template($data);
    }
    
    
    function start()
    {
        //echo Modules::run('global_function/get_debug');
        
        $project_id = $this->uri->segment(3);
        
        Modules::run('project_right/check_project_access','read', $project_id);
        $order = $this->uri->segment(4);
        $limit = $this->uri->segment(5);
        if($limit == ""){$limit = 100;}
        if($limit == "all"){$limit = "";}
        $data['limit'] = $limit;
        
        //Order Settings
        //Default
        if($order == ""){$order = "contact_up";}
        //Company
        if($order == "company_up"){$order = "company ASC"; $order_data ="company_up";}
        if($order == "company_down"){$order = "company DESC"; $order_data ="company_down";}
        //City
        if($order == "city_up"){$order = "city ASC"; $order_data ="city_up";}
        if($order == "city_down"){$order = "city DESC"; $order_data ="city_down";}
        //Contact
        if($order == "contact_up"){$order = "last_name ASC"; $order_data ="company_up";}
        if($order == "contact_down"){$order = "last_name DESC"; $order_data ="company_down";}
        //Country
        if($order == "country_up"){$order = "country ASC"; $order_data ="country_up";}
        if($order == "country_down"){$order = "country DESC"; $order_data ="country_down";}
        //calls
        if($order == "calls_up"){$order = "calls ASC, company ASC"; $order_data ="calls_up";}
        if($order == "calls_down"){$order = "calls DESC, company ASC"; $order_data ="calls_down";}
        
        $data['order'] = $order_data;

        //$data['resub_list'] = $this->resubmission($project_id, 'include');
        $data['resub_list'] = $list = Modules::run('cp_resubmission/get_resbmission_list', $project_id, 'all', 'self');
        
        $data['customer_list'] = Modules::run('project_customer/customer_list', $project_id);
        
        
        $data['project_name'] = $this->get_project_name($project_id);
        $data['headline'] =  $data['project_name'];
        $template = "main";
        $data['project_id'] = $project_id;
        $data['view_file'] = "start";
        
        
        $this->load->module('template');
        $this->template->$template($data);
    }
    
    function resubmission($project_id, $typ = 'all', $ownership = 'all')
    {
        echo Modules::run('global_function/get_debug');

        $project_id = $this->uri->segment(3);

        Modules::run('project_right/check_project_access','read', $project_id);
      
        
        $data['owen_list'] = $list = Modules::run('customer_resubmission/get_resbmission_list', $project_id, 'all', 'self');
        $data['other_list'] = $list = Modules::run('customer_resubmission/get_resbmission_list', $project_id, 'all', 'other');
        
        $data['project_name'] = $this->get_project_name($project_id);
        $data['headline'] =  $data['project_name'];
        $template = "main";
        $data['project_id'] = $project_id;
        $data['view_file'] = "resubmission";

        $this->load->module('template');
        $this->template->$template($data);
    }
    
    
    function submit()
    {
        $update_id = $this->uri->segment(3);
        //deal with the submitted form
        $this->load->library('form_validation');
     
        $name_check = TRUE;
        if($update_id >0)
        {
            $data = $this->get_data_from_db($update_id);
            if($data['name'] == $this->input->post('name'))
            {
                $username_check = FALSE;
            }
        }
        if($name_check == TRUE)
        {
            $this->form_validation->set_rules('name', 'Project Name', 'required|min_length[3]|is_unique[project.name]');
            $this->form_validation->set_message('is_unique', 'This Project already exist');
        }
        $this->form_validation->set_rules('client', 'Client', 'required|trim');
        $this->form_validation->set_rules('project_manager', 'Project Manager', 'required');
        
        
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
                $this->_update($update_id, $data);
                $value = "<p style='color:green;'>The Project was successfully updated.</p>";
            }
            else
            {
                //This is a new record
                $data = $this->get_data_from_post();
                $this->_insert($data);
                $value = "<p style='color:green;'>The Project was successfully creates.</p>";
                $update_id = $this->get_max();
                
                //Get the Account how create the Project full access
                $login = $this->session->userdata('logged_in');
                $project_rights = array(
                    'project_id' =>       $update_id,
                    'account_id' =>       $login['id'],
                    'account_group_id' => 0,
                    'read' =>             1,
                    'edit' =>             1,
                    'report' =>           1
                );
                Modules::run('project_right/set_project_right', $project_rights);
            }
            
            //add flashdata to session
            $this->session->set_flashdata('project', $value);

            redirect('project');
        }
        
    }
       
    function create()
    { 
        $update_id = $this->uri->segment(3);
        $data = $this->get_data_from_post();
        $submit = $this->input->post('submit', TRUE);

        if($update_id>0)
        {
            if($submit !="Submit")
            {
                //form hat NOT been posted yet, so read from database
                $data = $this->get_data_from_db($update_id);
            }
            $data['headline'] = "Edit Project";
            $data['project_id'] = $update_id;
        }
        else
        {
            $data['headline'] = "New Project";
        }
       
        
        $current_url = current_url();
        $data['form_location'] = str_replace('/create', '/submit', $current_url);

        $template = "main";
        $data['view_file'] = "create";
        $this->load->module('template');
        $this->template->$template($data);
    }
    
    function right($project_id)
    {
        $submit = $this->input->post('submit', TRUE);
        if($submit == "Submit")
        {
             $account_query = Modules::run('account/get_where_custom','active', '1');
             foreach ($account_query->result() as $row)
             {
                $read = $this->input->post('read['.$row->id.']');
                $edit = $this->input->post('edit['.$row->id.']');
                $report = $this->input->post('report['.$row->id.']');
                if($read == "read"){$read = 1;}else{$read = 0;}
                if($edit == "edit"){$edit = 1;}else{$edit = 0;}
                if($report == "report"){$report = 1;}else{$report = 0;}
                $project_rights = array(
                    'project_id' =>       $project_id,
                    'account_id' =>       $row->id,
                    'account_group_id' => 0,
                    'read' =>             $read,
                    'edit' =>             $edit,
                    'report' =>           $report
                );
                
                $id = Modules::run('project_right/exist_project_right',$project_id, $row->id);
                if($id != FALSE)
                {
                    Modules::run('project_right/update_project_right', $id, $project_rights);
                }
                else
                {
                    Modules::run('project_right/set_project_right', $project_rights);
                } 
             }
             $value = "<p style='color:green;'>The project rights have been changed.</p>";
             $this->session->set_flashdata('project', $value);
             $data['flash'] = $flash = $this->session->flashdata('project');
        }
        
        $data['headline'] = "Project Rights";
        $data['form_location'] = current_url();
        $data['project_id'] = $project_id;
        $data['account_query'] = Modules::run('account/get_where_custom','active', '1');
        
        $template = "main";
        $data['view_file'] = "right";
        $this->load->module('template');
        $this->template->$template($data); 
    }
    
    
    function delete_project($project_id)
    { 
        $query = $this->get_where($project_id);
        foreach ($query->result() as $row)
        {
            $project_name = $row->name;
        }
        
        
        $submit = $this->input->post('submit', TRUE);
        if($submit == "No - Cancel")
        {
            redirect('project/create/'.$project_id);
        }
        if($submit == "Yes - Delete Project")
        {
            
            
            $this->_delete_project($project_id);
            
            //add flashdata
            $value = "<p style='color:green;'>The Project ".$project_name." and all associated data records were deleted.</p>";
            $this->session->set_flashdata('project', $value);
            
            redirect('project');
        }
        
        $data['project_name'] = $project_name;
        $data['project_id'] = $project_id;
        $data['form_location'] = current_url();
        $data['headline'] = "Delete Project";
        $template = "main";
        $data['view_file']="project_delete";
        $this->load->module('template');
        $this->template->$template($data); 
        
    }
    
    function _delete_project($project_id)
    {
        //Search Project Customer
        $mysql_query = "Select id from customer where project_id = ".$project_id;
        $query = $this->_custom_query($mysql_query);
        foreach ($query->result() as $row)
        {
            $customer_id = $row->id;
            //Delete Project Customer changes
            $mysql_query = "Delete from customer_changes where customer_id = ".$customer_id;
            $this->_custom_query($mysql_query);

            //Delete Project Customer info
            $mysql_query = "Delete from customer_info where customer_id = ".$customer_id;
            $this->_custom_query($mysql_query);

            //Delete Project Customer Resubmission
            $mysql_query = "Delete from customer_resubmission where customer_id = ".$customer_id;
            $this->_custom_query($mysql_query);
        }

        //Delete Project Customer
        $mysql_query = "Delete from customer where project_id = ".$project_id;
        $this->_custom_query($mysql_query);
        
        //Delete Project Right
        $mysql_query = "Delete from project_right where project_id = ".$project_id;
        $this->_custom_query($mysql_query);
        
        
        //Delete Project
        $mysql_query = "Delete from project where id = ".$project_id;
        $this->_custom_query($mysql_query);
        
       
    }
    
    function get_data_from_post()
    {
        $data['name'] = $this->input->post('name', TRUE);
        $data['client'] = $this->input->post('client', TRUE);
        $data['project_manager'] = $this->input->post('project_manager', TRUE);
        $data['description'] = $this->input->post('description', TRUE);
        
        return $data;
    }
    
    function get_data_from_db($update_id)
    {
        $query = $this->get_where($update_id);
        foreach ($query->result() as $row)            
        {
            $data['name'] = $row->name;
            $data['client'] = $row->client;
            $data['project_manager'] = $row->project_manager;
            $data['description'] = $row->description;
        }
        
        if(!isset($data))
        {
            $data = "";
        }
        return $data;
    }
    
    
    function get_project_name($id)
    {
        $query=$this->get_where($id);
        foreach ($query->result() as $row)
        {
            $project_name = $row->name;
        }
        return $project_name;
    }
    
    
    function get_project_list($typ)
    {
        $data['query'] = $this->get('name');
        if($typ == 'edit')
        {
            $this->load->view('project_edit_list', $data);
        }
        else
        {
            $this->load->view('project_start_list', $data);  
        }
    }

    function get_project_ids()
    {
        $query = $this->get('name');
        foreach ($query->result() as $row)
        {
            $project_ids[] = $row->id;
        }
        return $project_ids;
    }

    function get($order_by) 
    {
        $this->load->model('mdl_project');
        $query = $this->mdl_project->get($order_by);
        return $query;
    }

    function get_with_limit($limit, $offset, $order_by) 
    {
        $this->load->model('mdl_project');
        $query = $this->mdl_project->get_with_limit($limit, $offset, $order_by);
        return $query;
    }

    function get_where($id) 
    {
        $this->load->model('mdl_project');
        $query = $this->mdl_project->get_where($id);
        return $query;
    }

    function get_where_custom($col, $value) 
    {
        $this->load->model('mdl_project');
        $query = $this->mdl_project->get_where_custom($col, $value);
        return $query;
    }

    function _insert($data) 
    {
        $this->load->model('mdl_project');
        $this->mdl_project->_insert($data);
    }

    function _update($id, $data) 
    {
        $this->load->model('mdl_project');
        $this->mdl_project->_update($id, $data);
    }

    function _delete($id) 
    {
        $this->load->model('mdl_project');
        $this->mdl_project->_delete($id);
    }

    function count_where($column, $value) 
    {
        $this->load->model('mdl_project');
        $count = $this->mdl_project->count_where($column, $value);
        return $count;
    }

    function get_max() 
    {
        $this->load->model('mdl_project');
        $max_id = $this->mdl_project->get_max();
        return $max_id;
    }

    function _custom_query($mysql_query) 
    {
        $this->load->model('mdl_project');
        $query = $this->mdl_project->_custom_query($mysql_query);
        return $query;
    }

}