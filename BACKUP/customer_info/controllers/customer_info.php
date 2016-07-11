<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Customer_info extends MX_Controller
{

    function __construct() 
    {
        parent::__construct();
    }
    
    function list_info($customer_id)
    {
        $mysql_query = "Select * from customer_info where customer_id =".$customer_id." and info_typ = 'user_text' order by create_date desc";
        $data['query'] = $this->_custom_query($mysql_query);
        if($data['query']->num_rows() > 0)
        {
            $this->load->view('list_info', $data);
        }
    }
    
    function list_change($customer_id)
    { 
        $mysql_query = "Select * from customer_info where customer_id =".$customer_id." and info_typ = 'user_change' order by create_date desc";
        $data['query'] = $this->_custom_query($mysql_query);
        if($data['query']->num_rows() > 0)
        {
            $this->load->view('list_change', $data);
        }
    }
    
    function list_system($customer_id)
    { 
        $mysql_query = "Select * from customer_info where customer_id =".$customer_id." and info_typ = 'system' order by create_date desc";
        $data['query'] = $this->_custom_query($mysql_query);
        if($data['query']->num_rows() > 0)
        {
            $this->load->view('list_system', $data);
        }
    }

    function save_info($data)
    {
        $this->_insert($data);
    }
    
    
    function get($order_by) 
    {
        $this->load->model('mdl_customer_info');
        $query = $this->mdl_customer_info->get($order_by);
        return $query;
    }

    function get_with_limit($limit, $offset, $order_by) 
    {
        $this->load->model('mdl_customer_info');
        $query = $this->mdl_customer_info->get_with_limit($limit, $offset, $order_by);
        return $query;
    }

    function get_where($id) 
    {
        $this->load->model('mdl_customer_info');
        $query = $this->mdl_customer_info->get_where($id);
        return $query;
    }

    function get_where_custom($col, $value) 
    {
        $this->load->model('mdl_customer_info');
        $query = $this->mdl_customer_info->get_where_custom($col, $value);
        return $query;
    }

    function _insert($data) 
    {
        $this->load->model('mdl_customer_info');
        $this->mdl_customer_info->_insert($data);
    }

    function _update($id, $data) 
    {
        $this->load->model('mdl_customer_info');
        $this->mdl_customer_info->_update($id, $data);
    }

    function _delete($id) 
    {
        $this->load->model('mdl_customer_info');
        $this->mdl_customer_info->_delete($id);
    }

    function count_where($column, $value) 
    {
        $this->load->model('mdl_customer_info');
        $count = $this->mdl_customer_info->count_where($column, $value);
        return $count;
    }

    function get_max() 
    {
        $this->load->model('mdl_customer_info');
        $max_id = $this->mdl_customer_info->get_max();
        return $max_id;
    }

    function _custom_query($mysql_query) 
    {
        $this->load->model('mdl_customer_info');
        $query = $this->mdl_customer_info->_custom_query($mysql_query);
        return $query;
    }

}