<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Company extends MX_Controller
{

    function __construct() 
    {
        parent::__construct();
    }

    
    function index()
    {
        $data['headline'] = "Company";
        
        $template = "main";
        $data['view_file'] = "index";
        //$data['upload'] = $this->upload();
        $this->load->module('template');
        $this->template->$template($data);
    }
    
    /*function admin()
    {
        $data['headline'] = "Company DB";
        
        $template = "main";
        $data['view_file'] = "admin";
        $data['query'] = $this->get('Name');
        $this->load->module('template');
        $this->template->$template($data);
    }*/
    
    function admin()
    {
        $data['headline'] = "Company DB";
        
        $template = "main";
        $data['view_file'] = "list_header";
        $data['query'] = $this->get('Name');
        $this->load->module('template');
        $this->template->$template($data);
    }
    
    
    function upload()
    {
        $data['redirect'] = $this->uri->segment(1);
        $data['info'] = "Upload Company";
        //Check Flash Data
        $flash = $this->session->flashdata('msg');
        if($flash !="")
        {
            $data['flash'] = $flash;
        }
        $flash_import = $this->session->flashdata('msg_import');
        if($flash_import !="")
        {
            $data['flash_import'] = $flash_import;
        }

        $this->load->view('upload', $data);
    }
            
    function do_upload($redirect="")
    {

        //$path = Modules::run('site_settings/get_file_path');
        $config['overwrite']            = TRUE;
        $config['upload_path']          = './resources/files/';
        $config['allowed_types']        = 'csv';
        

        $this->load->library('upload', $config);

        if ( ! $this->upload->do_upload('userfile'))
        {
            $error = array('error' => $this->upload->display_errors("<p style='color: red;'>", "</p>"));
            $this->session->set_flashdata('msg',$error['error']);

        }
        else
        {
            $data = $this->upload->data();
            $file_name = $data['file_name'];  //the name of the file that is now uploaded
            $value = "<p style='color:green;'>The file ".$file_name." is uploadet.</p>";
            $this->session->set_flashdata('msg', $value);
            
            //import data into DB
            //echo "Upload Done<br>";
            $this->_import_in_customer($file_name);
            //divert to a success page
            
        }
        
        redirect('company/'.$redirect);
    }
            
    function _import_in_customer($file_name)
    {
        $row = 0;
        $this->load->module('contact_person');
        $path = Modules::run('site_settings/get_file_path');
        $import_data = array();
        if (($handle = fopen($path.$file_name, "r")) !== FALSE) 
        {
            while (($data = fgetcsv($handle, 1000, ";")) !== FALSE) 
            {
                $row++;
                $num = count($data);
                if($num != 18)
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
        $value = "<p style='color: blue;'>";
        for($c=1; $c < $row; $c++)
        {
            $company = array();
            $contact = array();
            if($import_data[$c][0] != "###")
            {
                $insert_contact = TRUE;
                $company['name'] = $import_data[$c][0];
                $company_name = $company['name'];
                $company['street'] = $import_data[$c][1];
                $company['zip_code'] = $import_data[$c][2];
                $company['city'] = $import_data[$c][3];
                $company['url'] = $import_data[$c][4];
                $company['country'] = $import_data[$c][5];
                $company['state'] = $import_data[$c][6];
                $company['buisness'] = $import_data[$c][7];
                $company['class'] = $import_data[$c][8];
                $company['owner'] = $import_data[$c][9];
                
                $dubletten = $this->check_dubletten($company['name'], $company['city'],$company['zip_code']);
                if($dubletten['num'] == 0)
                {
                    $this->_insert($company);
                    $update_id = $this->get_max();
                }
                else
                {
                    $value.= "<br>Die Firma '".$company['name']."' gibt es schon in der Datenbank<br>";
                    $insert_contact = FALSE; //Wenn es die Firma schon gibt auch die Contackt Personen auf Doppelte Prüfen.
                    $update_id = $dubletten['id'];
                }    
                
                $default = 1;
            }
            if($import_data[$c][0] == "###"){$default = 0;}
            
            $contact['company_id'] = $update_id;
            $contact['salutation'] = $import_data[$c][10];
            $contact['title'] = $import_data[$c][11];
            $contact['first_name'] = $import_data[$c][12];
            $contact['last_name'] = $import_data[$c][13];
            $contact['position'] = $import_data[$c][14];
            $contact['phone'] = $import_data[$c][15];
            $contact['fax'] = $import_data[$c][16];
            $contact['email'] = $import_data[$c][17];
            $contact['default'] = $default;
            
            if($insert_contact == FALSE)
            {
                $insert_contact = $this->contact_person->check_dubletten($contact['company_id'], $contact['first_name'], $contact['last_name']);
                if($insert_contact == FALSE)
                {
                    $value.= "Den Kontack '".$contact['first_name']." ".$contact['last_name']."' für die Firma '".$company_name."' gibt es schon in der Datenbank<br>";
                }
            }
            
            if($insert_contact == TRUE) // Nur den Contackt Spiechern wenn insert_contact TRUE ist
            {
                $this->contact_person->_insert($contact); 
            } 
        } 
        //redirect("customer/upload/".$project_id);*/
        //echo nl2br(print_r($import_data,true));
        $value.="</p>";
        $this->session->set_flashdata('msg_import', $value);
    }
    
    function check_dubletten($name, $city, $zip)
    {
        $mysql_query = "Select * from company where name = '".$name."' and city = '".$city."' and zip_code = '".$zip."'";
        $query = $this->_custom_query($mysql_query);
        $num = $query->num_rows();
        $data['id'] = FALSE;
        if($num != 0)
        {
            foreach ($query->result() as $row)
            {
                $id = $row->id;
            }
            $data['id'] = $id;
        }
        $data['num'] = $num;
        return $data;
    }
    
    
    
    function get($order_by) 
    {
        $this->load->model('mdl_company');
        $query = $this->mdl_company->get($order_by);
        return $query;
    }

    function get_with_limit($limit, $offset, $order_by) 
    {
        $this->load->model('mdl_company');
        $query = $this->mdl_company->get_with_limit($limit, $offset, $order_by);
        return $query;
    }

    function get_where($id) 
    {
        $this->load->model('mdl_company');
        $query = $this->mdl_company->get_where($id);
        return $query;
    }

    function get_where_custom($col, $value) 
    {
        $this->load->model('mdl_company');
        $query = $this->mdl_company->get_where_custom($col, $value);
        return $query;
    }

    function _insert($data) 
    {
        $this->load->model('mdl_company');
        $this->mdl_company->_insert($data);
    }

    function _update($id, $data) 
    {
        $this->load->model('mdl_company');
        $this->mdl_company->_update($id, $data);
    }

    function _delete($id) 
    {
        $this->load->model('mdl_company');
        $this->mdl_company->_delete($id);
    }

    function count_where($column, $value) 
    {
        $this->load->model('mdl_company');
        $count = $this->mdl_company->count_where($column, $value);
        return $count;
    }

    function get_max() 
    {
        $this->load->model('mdl_company');
        $max_id = $this->mdl_company->get_max();
        return $max_id;
    }

    function _custom_query($mysql_query) 
    {
        $this->load->model('mdl_company');
        $query = $this->mdl_company->_custom_query($mysql_query);
        return $query;
    }

}