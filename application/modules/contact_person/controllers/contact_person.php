<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Contact_person extends MX_Controller
{

    function __construct() 
    {
        parent::__construct();
    }
    
    function check_dubletten($company_id, $first_name, $last_name)
    {
        $mysql_query = "Select * from contact_person where company_id = '".$company_id."' and first_name = '".$first_name."' and last_name = '".$last_name."'";
        $query = $this->_custom_query($mysql_query);
        $num = $query->num_rows();
        
        if($num != 0)
        {
            return FALSE;
        }
        else
        {
            return TRUE;
        }
    }
    
    /*
     * Get Contackt Persons List to the Company ID
     */
    function get_cp_list($company_id) 
    {
        $data['query'] = $this->get_where_custom('company_id', $company_id);
        $this->load->view('list', $data);
    }
    
    function get($order_by) 
    {
        $this->load->model('mdl_contact_person');
        $query = $this->mdl_contact_person->get($order_by);
        return $query;
    }

    function get_with_limit($limit, $offset, $order_by) 
    {
        $this->load->model('mdl_contact_person');
        $query = $this->mdl_contact_person->get_with_limit($limit, $offset, $order_by);
        return $query;
    }

    function get_where($id) 
    {
        $this->load->model('mdl_contact_person');
        $query = $this->mdl_contact_person->get_where($id);
        return $query;
    }

    function get_where_custom($col, $value) 
    {
        $this->load->model('mdl_contact_person');
        $query = $this->mdl_contact_person->get_where_custom($col, $value);
        return $query;
    }

    function _insert($data) 
    {
        $this->load->model('mdl_contact_person');
        $this->mdl_contact_person->_insert($data);
    }

    function _update($id, $data) 
    {
        $this->load->model('mdl_contact_person');
        $this->mdl_contact_person->_update($id, $data);
    }

    function _delete($id) 
    {
        $this->load->model('mdl_contact_person');
        $this->mdl_contact_person->_delete($id);
    }

    function count_where($column, $value) 
    {
        $this->load->model('mdl_contact_person');
        $count = $this->mdl_contact_person->count_where($column, $value);
        return $count;
    }

    function get_max() 
    {
        $this->load->model('mdl_contact_person');
        $max_id = $this->mdl_contact_person->get_max();
        return $max_id;
    }

    function _custom_query($mysql_query) 
    {
        $this->load->model('mdl_contact_person');
        $query = $this->mdl_contact_person->_custom_query($mysql_query);
        return $query;
    }

}