<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Cp_lock extends MX_Controller
{

    function __construct() 
    {
        parent::__construct();
    }

    
    function set_lock($company_id, $project_id)
    {
        $data['company_id'] = $company_id;
        $data['project_id'] = $project_id;
        $login_data = $this->session->userdata('logged_in');
        $data['user_id'] = $login_data['id'];
        
        $this->_insert($data);
        return TRUE;
    }
    
    function unset_lock($company_id, $project_id)
    {
        $sql = "DELETE FROM `cp_lock` WHERE `company_id` = '".$company_id."' and `project_id` = '".$project_id."'";
        $this->_custom_query($sql);
        return TRUE;
    }
    
    function user_unset_lock($user_id)
    {

        $sql = "DELETE FROM `cp_lock` WHERE `user_id` = '".$user_id."'";
        $this->_custom_query($sql);
        return TRUE;
    }
    
    function check_lock($company_id, $project_id)
    {
        //return data if it is locked and FALSE if it is not locked
        $sql = "Select * from cp_lock where company_id = ".$company_id." and project_id = ".$project_id;
        $query = $this->_custom_query($sql);
        if($query->num_rows() >0 )
        {
            $row = $query->row_array();
            $data['user_id'] = $row['user_id'];
            $data['lock_time'] = $row['lock_time'];
            $data['company_id'] = $row['company_id'];
            
       
            $login_data = $this->session->userdata('logged_in');
            if($data['user_id'] == $login_data['id'])
            {
                $is_locked = FALSE;
            }
            else
            {
                
                /*
                 * $user = Modules::run('account/get_data_from_db',$data['user_id']);
                $msg = 'This Customer is locked by '.$user['first_name'].', '.$user['last_name'].' since '.$data['lock_time'];
                $project_id= $this->uri->segment(3);
                $link = base_url().'project/start/'.$project_id;
                return Modules::run('global_function/end_message', $msg, 5, $link); 
                 */
                //$data['project_id']= $this->uri->segment(3);
                
                $is_locked = $data;
                
            } 
            return $is_locked;
        }
        else
        {
            $is_locked = FALSE;
            return $is_locked;
        }
    }
    
    function check_user_lock($user_id)
    {
        //return data if it is locked and FALSE if it is not locked
        $query = $this->get_where_custom('user_id',$user_id);
        if($query->num_rows() >0 )
        {
            $row = $query->row_array();
            $data['user_id'] = $row['user_id'];
            $data['lock_time'] = $row['lock_time'];
            $data['company_id'] = $row['company_id'];
   
            $is_locked = $data;
                
        }
        else
        {
            $is_locked = FALSE;
        }
            return $is_locked;
    }
    
    function get_lock_data($id)
    {
        $query = $this->get_where($id);
        if($query->num_rows() >0 )
        {
            $row = $query->row_array();
            $data['user_id'] = $row['user_id'];
            $data['lock_time'] = $row['lock_time'];
            $data['company_id'] = $row['company_id'];
            $data['project_id'] = $row['project_id'];
            return $data;
        }
        else
        {
            return FALSE;
        }     
    }

    function get($order_by) 
    {
        $this->load->model('mdl_cp_lock');
        $query = $this->mdl_cp_lock->get($order_by);
        return $query;
    }

    function get_with_limit($limit, $offset, $order_by) 
    {
        $this->load->model('mdl_cp_lock');
        $query = $this->mdl_cp_lock->get_with_limit($limit, $offset, $order_by);
        return $query;
    }

    function get_where($id) 
    {
        $this->load->model('mdl_cp_lock');
        $query = $this->mdl_cp_lock->get_where($id);
        return $query;
    }

    function get_where_custom($col, $value) 
    {
        $this->load->model('mdl_cp_lock');
        $query = $this->mdl_cp_lock->get_where_custom($col, $value);
        return $query;
    }

    function _insert($data) 
    {
        $this->load->model('mdl_cp_lock');
        $this->mdl_cp_lock->_insert($data);
    }

    function _update($id, $data) 
    {
        $this->load->model('mdl_cp_lock');
        $this->mdl_cp_lock->_update($id, $data);
    }

    function _delete($id) 
    {
        $this->load->model('mdl_cp_lock');
        $this->mdl_cp_lock->_delete($id);
    }

    function count_where($column, $value) 
    {
        $this->load->model('mdl_cp_lock');
        $count = $this->mdl_cp_lock->count_where($column, $value);
        return $count;
    }

    function get_max() 
    {
        $this->load->model('mdl_cp_lock');
        $max_id = $this->mdl_cp_lock->get_max();
        return $max_id;
    }

    function _custom_query($mysql_query) 
    {
        $this->load->model('mdl_cp_lock');
        $query = $this->mdl_cp_lock->_custom_query($mysql_query);
        return $query;
    }

}