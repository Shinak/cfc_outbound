<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Store_items extends MX_Controller
{

    function __construct() 
    {
        parent::__construct();
    }
    
    function upload_success($item_id)
    {
        $query = $this->get_where($item_id);
        foreach ($query->result() as $row)
        {
            $data['big_pic'] = $row->big_pic;
        }
        
        $data['item_id'] = $item_id;
        $template = "admin";
        $data['view_file'] = "upload_success";
        $this->load->module('template');
        $this->template->$template($data);
    }
    
    function do_upload($item_id)
    {
        Modules::run('site_security/check_is_admin');
        $config['upload_path']          = './itempics/';
        $config['allowed_types']        = 'gif|jpg|png';
        $config['max_size']             = 1000;
        $config['max_width']            = 2024;
        $config['max_height']           = 2768;

        $this->load->library('upload', $config);

        if ( ! $this->upload->do_upload('userfile'))
        {
            $data['error'] = array('error' => $this->upload->display_errors("<p style='color: red;'>", "</p>"));
            $data['item_id'] = $item_id;
            $template = "admin";
            $data['view_file'] = "upload_pic";
            $this->load->module('template');
            $this->template->$template($data);

        }
        else
        {
            $data = $this->upload->data();
            $file_name = $data['file_name'];  //the name of the file that is now uploaded

            //create a Thumbnail
            $config['image_library'] = 'gd2';
            $config['source_image']	= './itempics/'.$file_name;
            $config['create_thumb'] = TRUE;
            $config['maintain_ratio'] = TRUE;
            $config['width']	= 137;
            $config['height']	= 137;

            $this->load->library('image_lib', $config); 
            $this->image_lib->resize();    

            //resize the lager picture (make it 400px x 400px)
            $new_width = 400;
            $new_height = 400;
            $this->_resiize_pic($file_name, $new_width, $new_height);
            
            //update the store_item database
            $raw_file_name = $data['raw_name'];
            $file_ext = $data['file_ext'];
            
            unset($data);
            $data['smal_pic'] = $raw_file_name."_thumbs".$file_ext;
            $data['big_pic'] = $file_name;
            $this->_update($item_id, $data);

            //divert to a success page
            redirect("store_items/upload_success/".$item_id);
            
        }
    }
    

    function _resiize_pic($file_name, $new_width, $new_height)
    {
        Modules::run('site_security/check_is_admin');
        $config['image_library'] = 'gd2';
        $config['source_image']	= './itempics/'.$file_name;
        $config['create_thumb'] = FALSE;
        $config['maintain_ratio'] = TRUE;
        $config['width']	= $new_width;
        $config['height']	= $new_height;

        $this->image_lib->initialize($config);
        $this->load->library('image_lib', $config); 
        $this->image_lib->resize();
    }
    
    function upload_pic($item_id)
    {
        $data['item_id'] = $item_id;
        $template = "admin";
        $data['view_file'] = "upload_pic";
        $this->load->module('template');
        $this->template->$template($data);
    }
    
    function delete_item($item_id)
    {
        $submit = $this->input->post('submit', TRUE);
        if($submit == "No - Cancel")
        {
            redirect('store_items/create/'.$item_id);
        }
        if($submit == "Yes - Delete Item")
        {
            $this->_delete($item_id);
            
            //add flashdata
            $value = "<p style='color:green;'>The item was successfully deleted.</p>";
            $this->session->set_flashdata('item', $value);
            
            redirect('store_items/manage');
        }
        
        $data['update_id'] = $item_id;
        $data['form_location'] = current_url();
        $template = "admin";
        $data['view_file']="delete_item";
        $this->load->module('template');
        $this->template->$template($data);  
    }
    
    
    function _display_items_table()
    {
        Modules::run('site_security/check_is_admin');
        $data['query'] = $this->get('item_name');
        $this->load->view('items_table', $data);
    }
    
    function get_data_from_post()
    {
        $data['item_name'] = $this->input->post('item_name', TRUE);
        $data['item_price'] = $this->input->post('item_price', TRUE);
        $data['item_description'] = $this->input->post('item_description', TRUE);
        return $data;
    }
    
    function get_data_from_db($update_id)
    {
        $query = $this->get_where($update_id);
        foreach ($query->result() as $row)            
        {
            $data['item_name'] = $row->item_name;
            $data['item_price'] = $row->item_price;
            $data['smal_pic'] = $row->smal_pic;
            $data['big_pic'] = $row->big_pic;
            $data['item_url'] = $row->item_url;
            $data['item_description'] = $row->item_description;
        }
        
        if(!isset($data))
        {
            $data = "";
        }
        return $data;
    }
    
    function get_pic_file_name ($id)
    {
        $query = $this->get_where($id);
        foreach ($query->result() as $row)
        {
            $img['smal'] = $row->smal_pic;
            $img['big'] = $row->big_pic;
        }
        return $img;    
    }
    
    function create()
    {
        $item_id = $this->uri->segment(3);
        $data = $this->get_data_from_post();
        $submit = $this->input->post('submit', TRUE);
        
        if($item_id>0)
        {
            if($submit !="Submit")
            {
                //form hat NOT been posted yet, so read from database
                $data = $this->get_data_from_db($item_id);
            }
            $data['headline'] = "Edit Item";
        }
        else
        {
            $data['headline'] = "Create New Item";
        }
        
        $current_url = current_url();
        $data['form_location'] = str_replace('/create', '/submit', $current_url);
        
        $flash = $this->session->flashdata('item');
        if($flash !="")
        {
            $data['flash'] = $flash;
        }
        
        $img = $this->get_pic_file_name($item_id);
        
        $data['pic_smal'] = $img['smal'];
        $data['pic_big'] = $img['big'];
        
        $data['item_id'] = $item_id;
        $template = "admin";
        $data['view_file'] = "create";
        $this->load->module('template');
        $this->template->$template($data);
    }
    
    function submit()
    {
        //deal with the submitted form
        $this->load->library('form_validation');
        $this->form_validation->set_rules('item_name', 'Item Name', 'required');
        $this->form_validation->set_rules('item_price', 'Item Price', 'required|is_numeric');
        $this->form_validation->set_rules('item_description', 'Description', 'required');

        $update_id = $this->input->post('update_id', TRUE);
        
        if ($this->form_validation->run() == FALSE)
        {
                $this->create();
        }
        else
        {
            $update_id = $this->uri->segment(3);
            if($update_id>0)
            {
                //This is an EDIT (update) NOT a new Item
                $data = $this->get_data_from_post();
                $data['item_url'] = url_title($data['item_name']);
                $this->_update($update_id, $data);
                $value = "<p style='color:green;'>The item was successfully updated.</p>";
            }
            else
            {
                //This is a new record
                $data = $this->get_data_from_post();
                $data['item_url'] = url_title($data['item_name']);
                $this->_insert($data);
                $value = "<p style='color:green;'>The item was successfully creates.</p>";
                $update_id = $this->get_max();
            }
            
            //add flashdata to session
            $this->session->set_flashdata('item', $value);

            redirect('store_items/create/'.$update_id);
        }
        
    }
    
    function manage()
    {
        $flash = $this->session->flashdata('item');
        if($flash !="")
        {
            $data['flash'] = $flash;
        }
        
        $template = "admin";
        $data['view_file'] = "manage";
        $this->load->module('template');
        $this->template->$template($data);
    }
    
    function get($order_by) 
    {
        $this->load->model('mdl_store_items');
        $query = $this->mdl_store_items->get($order_by);
        return $query;
    }

    function get_with_limit($limit, $offset, $order_by) 
    {
        $this->load->model('mdl_store_items');
        $query = $this->mdl_store_items->get_with_limit($limit, $offset, $order_by);
        return $query;
    }

    function get_where($id) 
    {
        $this->load->model('mdl_store_items');
        $query = $this->mdl_store_items->get_where($id);
        return $query;
    }

    function get_where_custom($col, $value) 
    {
        $this->load->model('mdl_store_items');
        $query = $this->mdl_store_items->get_where_custom($col, $value);
        return $query;
    }

    function _insert($data) 
    {
        $this->load->model('mdl_store_items');
        $this->mdl_store_items->_insert($data);
    }

    function _update($id, $data) 
    {
        $this->load->model('mdl_store_items');
        $this->mdl_store_items->_update($id, $data);
    }

    function _delete($id) 
    {
        $this->load->model('mdl_store_items');
        $this->mdl_store_items->_delete($id);
    }

    function count_where($column, $value) 
    {
        $this->load->model('mdl_store_items');
        $count = $this->mdl_store_items->count_where($column, $value);
        return $count;
    }

    function get_max() 
    {
        $this->load->model('mdl_store_items');
        $max_id = $this->mdl_store_items->get_max();
        return $max_id;
    }

    function _custom_query($mysql_query) 
    {
        $this->load->model('mdl_store_items');
        $query = $this->mdl_store_items->_custom_query($mysql_query);
        return $query;
    }

}