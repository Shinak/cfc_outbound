<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Gc_changes extends MX_Controller
{
    function __construct() 
    {
        parent::__construct();
    }
    
    function list_changes($customer_id, $user_id, $change_date)
    {
        $sql = "Select * from gc_changes where customer_id = ".$customer_id." and user_id = ".$user_id." and change_date = '".$change_date."'";
        $data['query'] = $this->_custom_query($sql);
        
        return $this->load->view('change_list', $data);
    }
    
    function save_changes ($data)
    {
        $this->_insert($data);
    }
    
    function get($order_by) 
    {
        $this->load->model('mdl_gc_changes');
        $query = $this->mdl_gc_changes->get($order_by);
        return $query;
    }

    function get_with_limit($limit, $offset, $order_by) 
    {
        $this->load->model('mdl_gc_changes');
        $query = $this->mdl_gc_changes->get_with_limit($limit, $offset, $order_by);
        return $query;
    }

    function get_where($id) 
    {
        $this->load->model('mdl_gc_changes');
        $query = $this->mdl_gc_changes->get_where($id);
        return $query;
    }

    function get_where_custom($col, $value) 
    {
        $this->load->model('mdl_gc_changes');
        $query = $this->mdl_gc_changes->get_where_custom($col, $value);
        return $query;
    }

    function _insert($data) 
    {
        $this->load->model('mdl_gc_changes');
        $this->mdl_gc_changes->_insert($data);
    }

    function _update($id, $data) 
    {
        $this->load->model('mdl_gc_changes');
        $this->mdl_gc_changes->_update($id, $data);
    }

    function _delete($id) 
    {
        $this->load->model('mdl_gc_changes');
        $this->mdl_gc_changes->_delete($id);
    }

    function count_where($column, $value) 
    {
        $this->load->model('mdl_gc_changes');
        $count = $this->mdl_gc_changes->count_where($column, $value);
        return $count;
    }

    function get_max() 
    {
        $this->load->model('mdl_gc_changes');
        $max_id = $this->mdl_gc_changes->get_max();
        return $max_id;
    }

    function _custom_query($mysql_query) 
    {
        $this->load->model('mdl_gc_changes');
        $query = $this->mdl_gc_changes->_custom_query($mysql_query);
        return $query;
    }

}