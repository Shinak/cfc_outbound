<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Project_right extends MX_Controller
{

    function __construct() 
    {
        parent::__construct();
    }
    
    function check_project_right($project_id)
    { 
        $account_id = $this->session->logged_in['id'];
        $count = 0;
        if($account_id == 1)//SYSTEM ADMIN ACCOUNT
        {
            $project_right['read'] = 1;
            $project_right['edit'] = 1;
            $project_right['report'] = 1;
        }
        else
        {
            $mysql_query = "Select * from project_right where project_id ='".$project_id."' and account_id = '".$account_id."'";
            $query = $this->_custom_query($mysql_query);
            foreach ($query->result() as $row)
            {
                $count ++;
                $project_right['read'] = $row->read;
                $project_right['edit'] = $row->edit;
                $project_right['report'] = $row->report;
            }
            if($count == 0)
            {
                $project_right['read'] = 0;
                $project_right['edit'] = 0;
                $project_right['report'] = 0;
            }
        }
        return $project_right;
    }
    
    function check_project_access($access_typ, $project_id, $path = "dashboard")
    {
        $project_right = $this->check_project_right($project_id);
        
        $access = FALSE;
        if($access_typ == 'read')
        {
            if($project_right['read'] == 1){$access = TRUE;}
        }
        if($access_typ == 'edit')
        {
            if($project_right['edit'] == 1){$access = TRUE;}
        }  
        if($access_typ == 'report')
        {
            if($project_right['report'] == 1){$access = TRUE;}
        }  
        if($access == TRUE)
        {
            return TRUE;
        }
        else
        {
            //Check if user has access
            Modules::run('site_security/check_access', '-1', 'on', $path);
        }       
        
    }
        
    function set_project_right($data_array)
    {   
        $this->_insert($data_array);
    }
    
    function update_project_right($id, $data_array)
    {   
        $this->_update($id, $data_array);
    }
    
    function exist_project_right($project_id, $account_id)
    {   
        $exist = false;
        $query_mysql = "Select * from project_right where project_id = ".$project_id." and account_id = ".$account_id."";
        $query = $this->_custom_query($query_mysql);
        if($query->num_rows()>0)
        {
            $row = $query->row();
            $id = $row->id;
        }
        else 
        {
            $id = FALSE;
        }
        return $id;
    }
    
    function get_project_right($project_id, $account_id)
    {
        $mysql_query = "Select * from project_right where project_id ='".$project_id."' and account_id = '".$account_id."'";
        $query = $this->_custom_query($mysql_query);
        foreach ($query->result() as $row)
        {
            $count ++;
            $project_right['read'] = $row->read;
            $project_right['edit'] = $row->edit;
            $project_right['report'] = $row->report;
        }
        if($count == 0)
        {
            $project_right['read'] = 0;
            $project_right['edit'] = 0;
            $project_right['report'] = 0;
        }
        return $project_right;  
    }
    
    
    
    function get($order_by) 
    {
        $this->load->model('mdl_project_right');
        $query = $this->mdl_project_right->get($order_by);
        return $query;
    }

    function get_with_limit($limit, $offset, $order_by) 
    {
        $this->load->model('mdl_project_right');
        $query = $this->mdl_project_right->get_with_limit($limit, $offset, $order_by);
        return $query;
    }

    function get_where($id) 
    {
        $this->load->model('mdl_project_right');
        $query = $this->mdl_project_right->get_where($id);
        return $query;
    }

    function get_where_custom($col, $value) 
    {
        $this->load->model('mdl_project_right');
        $query = $this->mdl_project_right->get_where_custom($col, $value);
        return $query;
    }

    function _insert($data) 
    {
        $this->load->model('mdl_project_right');
        $this->mdl_project_right->_insert($data);
    }

    function _update($id, $data) 
    {
        $this->load->model('mdl_project_right');
        $this->mdl_project_right->_update($id, $data);
    }

    function _delete($id) 
    {
        $this->load->model('mdl_project_right');
        $this->mdl_project_right->_delete($id);
    }

    function count_where($column, $value) 
    {
        $this->load->model('mdl_project_right');
        $count = $this->mdl_project_right->count_where($column, $value);
        return $count;
    }

    function get_max() 
    {
        $this->load->model('mdl_project_right');
        $max_id = $this->mdl_project_right->get_max();
        return $max_id;
    }

    function _custom_query($mysql_query) 
    {
        $this->load->model('mdl_project_right');
        $query = $this->mdl_project_right->_custom_query($mysql_query);
        return $query;
    }

}