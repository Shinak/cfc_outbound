<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Customer_time_info extends MX_Controller
{

    function __construct() 
    {
        parent::__construct();
    }
    
    function save_time($data)
    {
        $stop_time = date("H:i:s");
        $start_time = $data['start_time'];
        $data['total_time'] = $this->get_start_stop_sec($start_time, $stop_time);
        $data['stop_time'] = $stop_time;
        $data['date'] = date("Y-m-d");
        
        $this->_insert($data);
    }
    
    function get_start_stop_sec($start_time, $stop_time)
    {
        $start_st = substr($start_time, 0, 2) * 60 * 60;
        $start_min = substr($start_time, 3, 2) * 60;
        $start_sek = substr($start_time, 6, 2);

        $stop_st = substr($stop_time, 0, 2) * 60 * 60;
        $stop_min = substr($stop_time, 3, 2) * 60;
        $stop_sek = substr($stop_time, 6, 2);

        $start_total = $start_sek + $start_min + $start_st;
        $stop_total = $stop_sek + $stop_min + $stop_st;
        $time = $stop_total - $start_total;

        if($start_st > $stop_st)
        {
                $day_change = 24 * 60 * 60;
                $first_time = $day_change - $start_total;
                $secend_time = $stop_total;
                $time = $first_time + $secend_time;
        }
        return $time;
    }

    function get($order_by) 
    {
        $this->load->model('mdl_customer_time_info');
        $query = $this->mdl_customer_time_info->get($order_by);
        return $query;
    }

    function get_with_limit($limit, $offset, $order_by) 
    {
        $this->load->model('mdl_customer_time_info');
        $query = $this->mdl_customer_time_info->get_with_limit($limit, $offset, $order_by);
        return $query;
    }

    function get_where($id) 
    {
        $this->load->model('mdl_customer_time_info');
        $query = $this->mdl_customer_time_info->get_where($id);
        return $query;
    }

    function get_where_custom($col, $value) 
    {
        $this->load->model('mdl_customer_time_info');
        $query = $this->mdl_customer_time_info->get_where_custom($col, $value);
        return $query;
    }

    function _insert($data) 
    {
        $this->load->model('mdl_customer_time_info');
        $this->mdl_customer_time_info->_insert($data);
    }

    function _update($id, $data) 
    {
        $this->load->model('mdl_customer_time_info');
        $this->mdl_customer_time_info->_update($id, $data);
    }

    function _delete($id) 
    {
        $this->load->model('mdl_customer_time_info');
        $this->mdl_customer_time_info->_delete($id);
    }

    function count_where($column, $value) 
    {
        $this->load->model('mdl_customer_time_info');
        $count = $this->mdl_customer_time_info->count_where($column, $value);
        return $count;
    }

    function get_max() 
    {
        $this->load->model('mdl_customer_time_info');
        $max_id = $this->mdl_customer_time_info->get_max();
        return $max_id;
    }

    function _custom_query($mysql_query) 
    {
        $this->load->model('mdl_customer_time_info');
        $query = $this->mdl_customer_time_info->_custom_query($mysql_query);
        return $query;
    }

}