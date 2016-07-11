<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Customer_resubmission extends MX_Controller
{

    function __construct() 
    {
        parent::__construct();
    }
    
    function get_resbmission_list($project_id, $typ = 'all', $ownership = 'all')
    {
        /*
         * Function: get_resubmission_list
         * Description: Gibt eine Liste aus mit den angegebenen Resubmissions (siehe Parameter $ownership) 
         * param:$project_id = ID von dem Projekt
         * param:$typ = Type der Resubmission, default ist 'all'
         *       all = alle
         *       queue = Nur die die noch in Status Queue sind (ablaufzeit noch nicht erreicht
         *       ready = Alle die ready sind und über der Ablaufzeit liegen 
         * param:$ownership = Default ist 'all', Optionen 'all', 'self', 'other', gibt an welche Resubmissions angeigt werden sollen
         *       all = alle
         *       self = nur die eigenen
         *       other = nur die von anderen usern 
         */
        $login = $this->session->userdata('logged_in');
        $user_id = $login['id'];
        if($user_id == ""){$user_id = 9999999;}
        $timestamp = time();
        $date = date("Y-m-d", $timestamp);
        $time = date("H:i:s", $timestamp);
        
        if($typ == 'all'){$sql_typ = '';}
        if($typ == 'queue'){$sql_typ = 'and resub.date >= "'.$date.'" and resub.time > "'.$time.'"';}
        if($typ == 'ready'){$sql_typ = 'and (resub.date < "'.$date.'" or resub.date = "'.$date.'" and resub.time < "'.$time.'")';}
        
        if($ownership == 'all'){$sql_user = '';}
        if($ownership == 'self'){$sql_user = 'and resub.user_id = '.$user_id.'';}
        if($ownership == 'other'){$sql_user = 'and resub.user_id != '.$user_id.'';}
        
        $sql = 'Select * from customer_resubmission as resub inner join customer as cust where resub.customer_id = cust.id and resub.project_id = '.$project_id.' '.$sql_typ.' '.$sql_user.' order by date desc, time desc';
        $query = $this->_custom_query($sql);
        $data['project_id'] = $project_id;
        $data['query'] = $query;
        $data['sql'] = $sql;

        $this->load->view('list', $data);
    }

    function open($id)
    {
        $data['id'] = $id;
        $data['form_location'] = current_url();
        
        
        $data['sel_h'] = date('H');
        $data['sel_m'] = '00';
        
        $data['input_time_h'] = array(
            '07' => '07',
            '08' => '08',
            '09' => '09',
            '10' => '10',
            '11' => '11',
            '12' => '12',
            '13' => '13',
            '14' => '14',
            '15' => '15',
            '16' => '16',
            '17' => '17',
            '18' => '18',
            '19' => '19'
            );
        
        $data['input_time_m'] = array(
            '00' => '00',
            '05' => '05',
            '10' => '10',
            '15' => '15',
            '20' => '20',
            '25' => '25',
            '30' => '30',
            '35' => '35',
            '40' => '40',
            '45' => '45',
            '50' => '50',
            '55' => '55'
            );
        
        $this->load->view('resubmission', $data);
    }
 
    function set_resubmission($data)
    {
        $data['date'] = Modules::run('global_function/get_date',$data['date'], 'Y-m-d', 'd-m-Y');
        $data['priority'] = '0';
        $login_data = $this->session->userdata('logged_in');
        $data['user_id'] = $login_data['id'];
        
        $info_data['user_id'] = $data['user_id'];
        $info_data['info_typ'] = 'user_change';
        $check = $this->check_resubmission($data['customer_id']);
        if($check == FALSE)
        { 
            $this->_insert($data);
            $msg_part = "set a";
            $info_data['info'] = 'Set resubmission to '.$data['date'].' on '.$data['time'];
        }
        else
        {
            $id = $this->get_resub_id($data['customer_id']);
            $this->_update($id, $data);
            $msg_part = "update the";
            $info_data['info'] = 'Update resubmission to '.$data['date'].' on '.$data['time']; 
        } 
        $info_data['customer_id'] = $data['customer_id'];
        Modules::run('customer_info/save_info', $info_data);
        Modules::run('customer/_update_resub', $data['customer_id'], 1);
        
        $date = Modules::run('global_function/get_date',$data['date'], 'D d.m.Y');
            
        $msg = 'You have '.$msg_part.' Resubmission to '.$data['time'].' a clock on '.$date;
        $this->session->set_userdata('resubmission', '1');
        $this->session->set_flashdata('msg', $msg);
    }
    
    function unset_resubmission($customer_id)
    {

        $id = $this->get_resub_id($customer_id);
        $query = $this->get_where($id);
        $this->_delete($id);
        $data['resubmission'] = 0;
        Modules::run('customer/_update', $customer_id, $data);
        foreach ($query->result() as $row)
        {
           $sql_date_time = $row->date." - ".$row->time;
        }
        
        $timestamp = time();
        $date_time = date("Y-m-d - H:i:s", $timestamp);
        if($date_time < $sql_date_time)
        {
            $login_data = $this->session->userdata('logged_in');
            $info_data['user_id'] = $login_data['id'];
            $info_data['info'] = 'Unset resubmission befor time expired';
            $info_data['info_typ'] = 'user_change';
            $info_data['customer_id'] = $customer_id;
            Modules::run('customer_info/save_info', $info_data);
        }  
    }
    
    function count_resub($project_id, $how = 'self')
    {
        if($how != 'all')
        {
            $login_data = $this->session->userdata('logged_in');
            $user_id = $login_data['id'];
        }
        if($how == 'all')
        {
            $sql_stat = '';
        }
        if($how == 'other')
        {
            $sql_stat = 'and user_id != '.$user_id.'';
        }
        if($how == 'self')
        {
            $sql_stat = 'and user_id = '.$user_id.'';
        }
        
        $timestamp = time();
        $date = date("Y-m-d", $timestamp);
        $time = date("H:i:s", $timestamp);
        
        //Resubmission in Queue
        $query_all = $this->_custom_query('Select * from customer_resubmission where project_id = '.$project_id.' '.$sql_stat.'');
        $all_resub = $query_all->num_rows();

        //Resubmission Ready
        $query_ready = $this->_custom_query('Select * from customer_resubmission where project_id = '.$project_id.' '.$sql_stat.' and ( date < "'.$date.'" or  date = "'.$date.'" and time < "'.$time.'")');
        
        $ready_resub = $query_ready->num_rows();
        $queue_resub = $all_resub - $ready_resub;
        $data['all'] = $all_resub;
        $data['ready'] = $ready_resub;
        $data['queue'] = $queue_resub;
        //$data['query_all'] = $query_all;
        
        return $data;
    }
    
    function count_other($project_id)
    {
        $login_data = $this->session->userdata('logged_in');
        $user_id = $login_data['id'];
        $timestamp = time();
        $date = date("Y-m-d", $timestamp);
        $time = date("H:i:s", $timestamp);
        //Resubmission by others in Queue
        $query_all = $this->_custom_query('Select * from customer_resubmission where project_id = '.$project_id.' and user_id != '.$user_id);
        $all_resub = $query_all->num_rows();

        //Resubmission by others Ready
        $query_ready = $this->_custom_query('Select * from customer_resubmission where project_id = '.$project_id.' and user_id != '.$user_id.' and time > '.$time.' and date >= '.$date);
        
        $ready_resub = $query_ready->num_rows();
        $queue_resub = $all_resub - $ready_resub;
        $data['ready'] = $ready_resub;
        $data['queue'] = $queue_resub;
        //$data['query_all'] = $query_all;
        
        return $data;
    }
    
    //Prüft ob es zu der Project ID eine Resubmission gibt, wenn ja gibt die Funktion den query zurück ansonsten FALSE
    function get_project_resub($project_id)
    {
        $query = $this->get_where_custom('project_id', $project_id);
        if($query->num_rows() > 0)
        {
            return $query;
        }
        else
        {
            return FALSE;
        }
    }
    
    //Prüft ob es zu der Customer ID eine Resubmission gibt, gibt TRUE oder FALSE zurück
    function check_resubmission($customer_id)
    {
        $query = $this->get_where_custom('customer_id', $customer_id);
        if($query->num_rows() > 0)
        {
            $return = TRUE;
        }
        else
        {
            $return = FALSE;
        }
        return $return;
    }
    
    function get_resub_id($customer_id)
    {
        $query = $this->get_where_custom('customer_id', $customer_id);
        foreach ($query->result() as $row)
        {
            $id = $row->id;
        }
        return $id;
    }
    
    function get_resub_data($customer_id)
    {
        $id = $this->get_resub_id($customer_id);
        $query = $this->get_where($id);
        foreach ($query->result() as $row)
        {
            $data['id'] = $row->id;
            $data['user_id'] = $row->user_id;
            $data['date'] = $row->date;
            $data['time'] = $row->time;
            $data['timestamp'] = $row->timestamp;
            $user = Modules::run('account/get_data_from_db', $data['user_id']);
            $data['user_name'] = $user['first_name'].",".$user['last_name'];
        }
        return $data;
    }
    
    function get($order_by) 
    {
        $this->load->model('mdl_customer_resubmission');
        $query = $this->mdl_customer_resubmission->get($order_by);
        return $query;
    }

    function get_with_limit($limit, $offset, $order_by) 
    {
        $this->load->model('mdl_customer_resubmission');
        $query = $this->mdl_customer_resubmission->get_with_limit($limit, $offset, $order_by);
        return $query;
    }

    function get_where($id) 
    {
        $this->load->model('mdl_customer_resubmission');
        $query = $this->mdl_customer_resubmission->get_where($id);
        return $query;
    }

    function get_where_custom($col, $value) 
    {
        $this->load->model('mdl_customer_resubmission');
        $query = $this->mdl_customer_resubmission->get_where_custom($col, $value);
        return $query;
    }

    function _insert($data) 
    {
        $this->load->model('mdl_customer_resubmission');
        $this->mdl_customer_resubmission->_insert($data);
    }

    function _update($id, $data) 
    {
        $this->load->model('mdl_customer_resubmission');
        $this->mdl_customer_resubmission->_update($id, $data);
    }

    function _delete($id) 
    {
        $this->load->model('mdl_customer_resubmission');
        $this->mdl_customer_resubmission->_delete($id);
    }

    function count_where($column, $value) 
    {
        $this->load->model('mdl_customer_resubmission');
        $count = $this->mdl_customer_resubmission->count_where($column, $value);
        return $count;
    }

    function get_max() 
    {
        $this->load->model('mdl_customer_resubmission');
        $max_id = $this->mdl_customer_resubmission->get_max();
        return $max_id;
    }

    function _custom_query($mysql_query) 
    {
        $this->load->model('mdl_customer_resubmission');
        $query = $this->mdl_customer_resubmission->_custom_query($mysql_query);
        return $query;
    }

}