<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Project_customer extends MX_Controller
{

    function __construct() 
    {
        parent::__construct();
    }
    
    function customerlist()
    {
        $project_id = $this->uri->segment(3);
        Modules::run('project_right/check_project_access','read', $project_id);
        $data['order'] = "company_up";      
        $data['limit'] = "all";
        $data['project_id'] = $project_id;
        $project_name = Modules::run('get_project_name',$project_id);
        $data['headline'] = $project_name." Customer List";
        $template = "main";
        $data['view_file'] = "customer_list";
        $this->load->module('template');
        $this->template->$template($data); 
    }
    
    function outbound()
    {
        //Debug Ausgabe
        echo Modules::run('global_function/get_debug');
        

        //Project and customer id from url
        $project_id = $this->uri->segment(3);
        $id = $this->uri->segment(4);
        $uri_option = $this->uri->segment(5);
        
        if($uri_option == "ur")
        {
            Modules::run('cp_resubmission/unset_resubmission', $id);
        }
        
        //Resubmission Save
        $resub_save = $this->input->post('save_resub', TRUE);
        if($resub_save != '')
        {
            $resub_data['date'] = $this->input->post('date1');
            $time_h = $this->input->post('resub_time_h');
            $time_m = $this->input->post('resub_time_m');
            
            $timestamp = mktime($time_h,$time_m,0,0,0,0);
            $resub_data['time'] = date('H:i',$timestamp);

            $resub_data['project_id'] = $project_id;
            $resub_data['customer_id'] = $id;
            Modules::run('customer_resubmission/set_resubmission',$resub_data);   
        }
        
        
        // Save Post Values
        $c_info = $this->input->post('info_text', TRUE);
        if($c_info != '')
        {
            $this->session->set_flashdata('c_info', $c_info);
        }
        $status = $this->input->post('status', TRUE);
        if($status != '')
        {
            $this->session->set_flashdata('status', $status);
        }

        //If isset Post Submit
        $submit = $this->input->post('submit', TRUE);
        if($submit == "Submit")
        {
            //If Customer resubmission exist set status default to open
            if(Modules::run('customer_resubmission/check_resubmission',$id) == TRUE)
            {
                $data['status'] = 'open';
            }
            else
            {
                $data['status'] = $this->input->post('status', TRUE);
            }
            
            $data['info'] = $this->input->post('info_text', TRUE);
            $login_data = $this->session->userdata('logged_in');
            $data['user_id'] = $login_data['id'];
            $data['start_time'] = $this->input->post('start_time', TRUE);
           
            /*$data['first_name'] = $login_data['first_name'];
            $data['last_name'] = $login_data['last_name'];
            $data['username'] = $login_data['username'];*/
            $data['project_id'] = $project_id;
            $data['customer_id'] = $id;   
            
            $this->save_outbound($data);
            
            $this->session->unset_userdata('outbound');
            $this->session->unset_userdata('resubmisssion');
            Modules::run('customer_lock/unset_lock',$id);
            redirect('project/start/'.$project_id);
        } 

        //If isset Post cancel
        $cancel = $this->input->post('cancel', TRUE);
        if($cancel == "Cancel")
        {
            $this->session->unset_userdata('outbound');
            Modules::run('customer_lock/unset_lock',$id);
            redirect('project/start/'.$project_id);
        }
        
        //If isset Post cancel_edit
        $cancel_edit = $this->input->post('cancel_edit', TRUE);
        if($cancel_edit == "Cancel")
        {
            redirect('customer/outbound/'.$project_id.'/'.$id);
        }

        //If isset Post Save Edit
        $save_edit = $this->input->post('save_edit', TRUE);
        if($save_edit == "Save")
        {
            $post =  $this->input->post();
            $save_edit = $this->check_edit($post);
            if($save_edit == TRUE)
            {
                $this->session->set_flashdata('msg', 'Your changes has been saved!');
                redirect('customer/outbound/'.$project_id.'/'.$id);
            }
        }

        
        //Check if Customer is Locked
        $is_locked = Modules::run('customer_lock/check_lock',$id);
        
        //Open Customer if not locked
        if($is_locked == FALSE)
        {
            $msg = "";
            if($this->session->has_userdata('outbound') == FALSE)
            {
                $login = $this->session->userdata('logged_in');
                $sess_array = array(
                    'customer_id' => $id,
                    'project_id'=> $project_id,
                    'username' => $login['username'],
                    'start_time' => date('H:i:s')
                    );
                $this->session->set_userdata('outbound', $sess_array);
                //No Outbound data in Sesseion Lock this Customer
                Modules::run('customer_lock/set_lock',$id);
            }
            if($this->session->has_userdata('outbound') == TRUE)
            {
                $session_data = $this->session->userdata('outbound');
                if($id != $session_data['customer_id'])
                {
                    $msg = 'You can\'t open two Outbound calls at the same time you still have a open Outbound call';
                    //$this->session->set_flashdata('error_msg', $msg); 
                }
                if($project_id != $session_data['project_id'])
                {
                    $msg = 'You can\'t open a Outbound call in anaother Project you still have a open Outbound call';
                    //$this->session->set_flashdata('error_msg', $msg); 
                }
                $data = $session_data;
            }

            if($msg != "")
            {
                $count = 3;
                $link = base_url('/customer/outbound/'.$data['project_id'].'/'.$data['customer_id']);
                echo Modules::run('global_function/end_message',$msg,$count,$link);
            }
            
            // Data Values erst ab hier , zuvor werden session daten in data geschrieben was alles andere überschreibt
            
            $data['value_info'] = $this->session->flashdata('c_info');
            $data['value_status'] = $this->session->flashdata('status');
            
            $data['query'] = $this->get_where($id);
            
            echo Modules::run('site_settings/get_debug');

            $resub_start = $this->input->post('resub', TRUE);
            if($resub_start == "Resubmission")
            {
                echo Modules::run('customer_resubmission/open', $id);
            }
            
            $flash = $this->session->flashdata('msg');
            if($flash !="")
            {
                $data['flash'] = $flash;
            }
            
            $data['edit_customer'] = FALSE;
            if($uri_option == "edit")
            {
                $data['edit_customer'] = TRUE;
            }

            $data['customer_id'] = $id;
            $project_name = Modules::run('get_project_name',$project_id);
            $data['headline'] = $project_name." Outbound Call";
            $url = strstr( current_url() , '/ur' ,TRUE );
            $data['form_location'] = $url;
            $template = "main";
            $data['view_file'] = "outbound";
            $this->load->module('template');
            $this->template->$template($data); 
        }
        //If Customer is Locked
        if($is_locked != False)
        {
            $data = $is_locked;
            $user = Modules::run('account/get_data_from_db',$data['user_id']);
            $data['msg'] = 'This Customer is locked by '.$user['first_name'].', '.$user['last_name'].' since '.$data['lock_time'];
            $project_id = $this->uri->segment(3);
            $data['link'] = base_url().'project/start/'.$project_id;
            $data['view_file'] = "is_locked";
            $this->load->module('template');
            $template = "main";
            $this->template->$template($data);  
        }
    }

    function check_edit($post_data)
    {
        $this->load->library('form_validation');   
        $this->form_validation->set_rules('salutation', 'Salutation', 'required');
        $this->form_validation->set_rules('first_name', 'First Name', 'required');
        $this->form_validation->set_rules('last_name', 'Last Name', 'required');
        $this->form_validation->set_rules('email', 'Email', 'valid_email');
        $this->form_validation->set_rules('phone', 'Phone', 'required|alpha_dash');
        $this->form_validation->set_rules('fax', 'Fax', 'alpha_dash');
        $this->form_validation->set_rules('company', 'Company', 'required');
        $this->form_validation->set_rules('street', 'Street', 'required');
        $this->form_validation->set_rules('zip_code', 'Zip Code', 'max_length[5]|numeric|required');
        $this->form_validation->set_rules('country', 'Country', 'required');
        $this->form_validation->set_rules('url', 'Url', 'valid_url');
        
        if ($this->form_validation->run() == FALSE)
        {
            return FALSE;
        }
        else
        {
            $id = $post_data['customer_id'];
            unset($post_data['customer_id']);
            unset($post_data['start_time']);
            unset($post_data['save_edit']);
            
            $this->save_edit($id, $post_data);
            return TRUE;
            
        }
    }
    
    function save_edit($id, $data)
    {  
        $query = $this->get_where($id);
        $login_data = $this->session->userdata('logged_in');
        
        $change['customer_id'] = $id;
        $change['user_id'] = $login_data['id'];

        foreach ($query->result() as $row)
        {
            if($data['salutation'] != $row->salutation)
            {
                $change['table_field'] = 'salutation'; 
                $change['value_old'] = $row->salutation; 
                $change['value_new'] = $data['salutation'];
                Modules::run('customer_changes/save_changes',$change);
            }
            if($data['title'] != $row->title)
            {
                $change['table_field'] = 'title'; 
                $change['value_old'] = $row->title; 
                $change['value_new'] = $data['title'];
                Modules::run('customer_changes/save_changes',$change);
            }
            if($data['first_name'] != $row->first_name)
            {
                $change['table_field'] = 'first_name'; 
                $change['value_old'] = $row->first_name; 
                $change['value_new'] = $data['first_name'];
                Modules::run('customer_changes/save_changes',$change);
            }
            if($data['last_name'] != $row->last_name)
            {
                $change['table_field'] = 'last_name'; 
                $change['value_old'] = $row->last_name; 
                $change['value_new'] = $data['last_name'];
                Modules::run('customer_changes/save_changes',$change);
            }
            if($data['email'] != $row->email)
            {
                $change['table_field'] = 'email'; 
                $change['value_old'] = $row->email; 
                $change['value_new'] = $data['email'];
                Modules::run('customer_changes/save_changes',$change);
            }
            if($data['phone'] != $row->phone)
            {
                $change['table_field'] = 'phone'; 
                $change['value_old'] = $row->phone; 
                $change['value_new'] = $data['phone'];
                Modules::run('customer_changes/save_changes',$change);
            }
            if($data['fax'] != $row->fax)
            {
                $change['table_field'] = 'fax'; 
                $change['value_old'] = $row->fax; 
                $change['value_new'] = $data['fax'];
                Modules::run('customer_changes/save_changes',$change);
            }
            if($data['company'] != $row->company)
            {
                $change['table_field'] = 'company'; 
                $change['value_old'] = $row->company; 
                $change['value_new'] = $data['company'];
                Modules::run('customer_changes/save_changes',$change);
            }
            if($data['street'] != $row->street)
            {
                $change['table_field'] = 'street'; 
                $change['value_old'] = $row->street; 
                $change['value_new'] = $data['street'];
                Modules::run('customer_changes/save_changes',$change);
            }
            if($data['zip_code'] != $row->zip_code)
            {
                $change['table_field'] = 'zip_code'; 
                $change['value_old'] = $row->zip_code; 
                $change['value_new'] = $data['zip_code'];
                Modules::run('customer_changes/save_changes',$change);
            }
            if($data['country'] != $row->country)
            {
                $change['table_field'] = 'country'; 
                $change['value_old'] = $row->country; 
                $change['value_new'] = $data['country'];
                Modules::run('customer_changes/save_changes',$change);
            }
            if($data['url'] != $row->url)
            {
                $change['table_field'] = 'url'; 
                $change['value_old'] = $row->url; 
                $change['value_new'] = $data['url'];
                Modules::run('customer_changes/save_changes',$change);
            }
        } 
        $this->_update($id, $data);
        
        
        $info['customer_id'] = $id;
        $info['user_id'] = $login_data['id'];
        $info['info']= 'Edit some customer values';
        $info['info_typ'] = 'user_change';
        Modules::run('customer_info/save_info',$info);
    }
    
    
    function save_outbound($data)
    {
        $id = $data['customer_id'];
        
        if($data['info'] != "")
        {
           $info_data['user_id'] = $data['user_id'];
           $info_data['info_typ'] = "user_text";
           $info_data['info'] = $data['info'];
           $info_data['customer_id'] = $id;
           
           Modules::run('customer_info/save_info', $info_data);
        }
       
        $query = $this->get_where($id);
        foreach ($query->result() as $row)
        {
            $calls = $row->calls;
        }
        $calls = $calls+ 1;
        
        $time_data['user_id'] = $data['user_id'];
        $time_data['typ'] = "outbound";
        $time_data['info'] = $calls.". Outbound Call";
        $time_data['project_id'] = $data['project_id'];
        $time_data['customer_id'] = $data['customer_id'];
        $time_data['start_time'] = $data['start_time'];
       
        Modules::run('customer_time_info/save_time', $time_data);

        $update_data['status'] = $data['status'];
        $update_data['calls'] = $calls;
        $this->_update($id, $update_data);
    }
    
    function _update_resub($id,$resub_status)
    {
        $data['resubmission'] = $resub_status;
        $this->_update($id, $data);
    }
    
    
    
    function get_list($project_id, $order = "", $limit = "")
    {
        if($order == ""){$order = $this->uri->segment(4);}
        if($limit == ""){$limit = $this->uri->segment(5);}
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
        if($order == "contact_up"){$order = "b.name ASC"; $order_data ="company_up";}
        if($order == "contact_down"){$order = "last_name DESC"; $order_data ="company_down";}
        //Country
        if($order == "country_up"){$order = "country ASC"; $order_data ="country_up";}
        if($order == "country_down"){$order = "country DESC"; $order_data ="country_down";}
        //calls
        if($order == "calls_up"){$order = "calls ASC, company ASC"; $order_data ="calls_up";}
        if($order == "calls_down"){$order = "calls DESC, company ASC"; $order_data ="calls_down";}
        
        $data['project_id'] = $project_id;
        $data['order'] = $order_data;
        $data['query'] = $this->sql_customer_list($project_id, $order, $limit); 
        $data['project_id'] = $project_id;
        
        $this->load->view('list', $data);
    }
    
    function sql_customer_list($project_id, $order, $limit = "", $search="")
    {
        if($limit != ""){$limit = "limit ".$limit;}
        
        $search = "Deutschland";
        if($search != "")
        {
            
            $sql_search = "and (";
            $i = 0;
            $table_array = array('name', 'street', 'zip_code', 'city', 'country', 'state', 'buisness', 'class', 'owner');
            foreach ($table_array as $value) 
            {
               if($i != 0){$sql_search.= " or";}
               $sql_search.= " ".$value." = '".$search."'";
               $i++;
            }
            $sql_search.= ")";
            
        }else {$sql_search = "";}
        //and b.country = 'Deutschland' 
        $query = "SELECT * FROM project_customer a inner join company b ON (a.company_id = b.id) WHERE a.project_id = ".$project_id." ".$sql_search." order by ".$order." ".$limit;
        
        $data['query'] = $this->_custom_query($query);
        

        //$this->load->view('list', $data);
        return $data['query'];   
    }
            
    
    function upload()
    {
        
        $data['project_id'] = $this->uri->segment(3);
        
        //Check Flash Data
        $flash = $this->session->flashdata('customer');
        if($flash !="")
        {
            $data['flash'] = $flash;
        }
        
        
        $data['headline'] = "Customer Upload";
        $template = "main";
        $data['view_file'] = "upload";
        $this->load->module('template');
        $this->template->$template($data);
    }
            
    function do_upload($project_id)
    {
        //$path = Modules::run('site_settings/get_file_path');
        $config['overwrite']            = TRUE;
        $config['upload_path']          = './resources/files/';
        $config['allowed_types']        = 'csv';
        

        $this->load->library('upload', $config);

        if ( ! $this->upload->do_upload('userfile'))
        {
            $data['error'] = array('error' => $this->upload->display_errors("<p style='color: red;'>", "</p>"));
            $data['project_id'] = $project_id;
            $template = "main";
            $data['headline'] = "Customer Upload";
            $data['view_file'] = "upload";
            $this->load->module('template');
            $this->template->$template($data);

        }
        else
        {
            $data = $this->upload->data();
            $file_name = $data['file_name'];  //the name of the file that is now uploaded
            $value = "<p style='color:green;'>The file ".$file_name." is uploadet.</p>";
            $this->session->set_flashdata('customer', $value);
            
            //import data into DB
            $this->_import_in_customer($file_name, $project_id);
            //divert to a success page
            redirect("customer/upload/".$project_id);
            
        }
    }
            
    function _import_in_customer($file_name, $project_id)
    {
        $row = 0;
        $path = Modules::run('site_settings/get_file_path');
        //$path ='./resources/files/';
        $import_data = array();
        if (($handle = fopen($path.$file_name, "r")) !== FALSE) 
        {
            while (($data = fgetcsv($handle, 1000, ";")) !== FALSE) 
            {
                $row++;
                $num = count($data);
                if($num != 17)
                {
                   echo "Abbruch import in der Zeile sind ".$num." Felder und keine 17";
                   die();
                }
                //echo "<p> $num Felder in Zeile $row: <br /></p>\n";
            
                for ($c=0; $c < $num; $c++) 
                {
                    $import_data[$row][$c] = utf8_encode($data[$c]);
                    //$str = utf8_encode($data[$c]);
                    //echo mb_detect_encoding($str);
                    //echo $str . "<br />\n";
                }
               
            }
            fclose($handle);
        }
        $data = array();
        for($c=1; $c < $row; $c++)
        {
            $data = array();
            $data['project_id'] = $project_id;
            $data['company'] = $import_data[$c][0];
            $data['street'] = $import_data[$c][1];
            $data['zip_code'] = $import_data[$c][2];
            $data['city'] = $import_data[$c][3];
            $data['phone'] = $import_data[$c][4];
            $data['fax'] = $import_data[$c][5];
            $data['salutation'] = $import_data[$c][6];
            $data['title'] = $import_data[$c][7];
            $data['first_name'] = $import_data[$c][8];
            $data['last_name'] = $import_data[$c][9];
            $data['email'] = $import_data[$c][10];
            $data['url'] = $import_data[$c][11];
            $data['country'] = $import_data[$c][12];
            $data['state'] = $import_data[$c][13];
            $data['category_wzw'] = $import_data[$c][14];
            $data['class'] = $import_data[$c][15];
            $data['sales'] = $import_data[$c][16];
            $data['status'] = "new";

            $this->_insert($data);       
            //echo nl2br(print_r($data,true)); 
        } 
        //redirect("customer/upload/".$project_id);
    }
    

    function get($order_by) 
    {
        $this->load->model('mdl_project_customer');
        $query = $this->mdl_project_customer->get($order_by);
        return $query;
    }

    function get_with_limit($limit, $offset, $order_by) 
    {
        $this->load->model('mdl_project_customer');
        $query = $this->mdl_project_customer->get_with_limit($limit, $offset, $order_by);
        return $query;
    }

    function get_where($id) 
    {
        $this->load->model('mdl_project_customer');
        $query = $this->mdl_project_customer->get_where($id);
        return $query;
    }

    function get_where_custom($col, $value) 
    {
        $this->load->model('mdl_project_customer');
        $query = $this->mdl_project_customer->get_where_custom($col, $value);
        return $query;
    }

    function _insert($data) 
    {
        $this->load->model('mdl_project_customer');
        $this->mdl_project_customer->_insert($data);
    }

    function _update($id, $data) 
    {
        $this->load->model('mdl_project_customer');
        $this->mdl_project_customer->_update($id, $data);
    }

    function _delete($id) 
    {
        $this->load->model('mdl_project_customer');
        $this->mdl_project_customer->_delete($id);
    }

    function count_where($column, $value) 
    {
        $this->load->model('mdl_project_customer');
        $count = $this->mdl_project_customer->count_where($column, $value);
        return $count;
    }

    function get_max() 
    {
        $this->load->model('mdl_project_customer');
        $max_id = $this->mdl_project_customer->get_max();
        return $max_id;
    }

    function _custom_query($mysql_query) 
    {
        $this->load->model('mdl_project_customer');
        $query = $this->mdl_project_customer->_custom_query($mysql_query);
        return $query;
    }

}