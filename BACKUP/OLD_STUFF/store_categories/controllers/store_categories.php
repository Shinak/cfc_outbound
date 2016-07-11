<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Store_categories extends MX_Controller
{

    function __construct() 
    {
        parent::__construct();
    }
    
    function get_breadcrumb($category_id)
    {
        //$category_id = 11;
        $breadcrumb = "";
        do
        {
            if(!isset($parent_category))
            {
                $parent_category = $category_id;
            }
            
            if($parent_category>0)
            {
                $parents[] = $parent_category;
            }
            $parent_category = $this->get_parent_category($parent_category);
            //echo "Parent Cat = ".$parent_category."<br>";
            
        }while ($parent_category !="");
 
        //print_r($parents);
        if(isset($parents))
        {
            $parents = array_reverse($parents);
            $count = count($parents);
            //$parent_slice  = array_slice($parents, 0, $count);
            $a = 1;
            foreach ($parents as $parent)
            {
                $category_name = $this->get_category_name($parent);
                if($a<$count)
                {
                    $breadcrumb.= $category_name." > ";
                }
                else
                {
                    $breadcrumb.= $category_name;
                }
                $a++;
            }
        }
        
        //echo $breadcrumb."<br>";
        return $breadcrumb;
    }
            
    function get_end_of_line_categories()
    {
        $max_depth = Modules::run('site_settings/get_max_category_depth');
        $bread_depth = Modules::run('site_settings/get_breadcrumb_depth');
        $query = $this->get('order_category');
        foreach ($query->result() as $row)
        {
            $category_id = $row->id;
            //echo $row->category_name."<br>";
            $parent_category = $row->parent_category;
            $category_depth = $this->get_category_depth($parent_category);
           // echo "Category Depth for id ".$category_id." = ".$category_depth." - Max = ".$max_depth." - Bread = ".$bread_depth."<br>";
            //$category_name = $this->get_category_name($category_id);
            $category_name = $this->get_breadcrumb($category_id);
            //echo $category_name."<br>";
            if($category_depth==$max_depth)
            //if($category_depth>$bread_depth)
            {
                //This must be an 'end of line' category
                $categories[$category_name] = $category_id;
                //echo "set max ID = ".$category_id."<br>";
            }
            else
            {
                if($category_depth>=$bread_depth)
                {
                    $categories[$category_name] = $category_id;
                   // echo "set bread ID = ".$category_id." to bread ".$category_name."<br>";
                }
            }
        }
        if(!isset($categories))
        {
            $categories = "";
        }
       // print_r($categories);
        return $categories;
    }

    function _is_new_category_allowed($parent_category)
    {   //return TRUE or FALSE
        
        //get max allowed depth
        $max_depth = Modules::run('site_settings/get_max_category_depth');
        
        //get current category depth
        $current_depth = $this->get_category_depth($parent_category);
                
        //figure out if a new category is allowed
        if($current_depth < $max_depth)
        {
            return TRUE;
        }
        else
        {
            return FALSE;
        }
    }
    
    function get_category_depth($parent_category)
    {   //figure out how many layers deep a category is, base in the parent category
        //$parent_category = 10;
        $depth = 0;
        do
        {
            //echo $depth."depth<br>";
            //echo $parent_category ."parent_cat<br>";
            $depth++;
            $parent_category = $this->get_parent_category($parent_category);
        }while ($parent_category !="");
        //echo $depth;
        return $depth;
    }
    
    function get_parent_category($id)
    {
        $query = $this->get_where($id);
        foreach ($query->result() as $row)
        {
            $parent_category = $row->parent_category;
        }
        if(!isset($parent_category))
        {
            $parent_category = "";
        }
        
        return $parent_category;
    }
    
    function get_order_category($id)
    {
        $query = $this->get_where($id);
        foreach ($query->result() as $row)
        {
            $order_category = $row->order_category;
        }
        if(!isset($order_category))
        {
            $order_category = "";
        }
        return $order_category;
    }
    
    function get_last_order_category_id()
    {
        $query = $this->_custom_query("SELECT order_category FROM store_categories group by order_category");
        foreach ($query->result() as $row)
        {
            $order_category = $row->order_category;
        }
        return $order_category;
    }
    
    
    function _display_categories_table($parent_category)
    {
        $data['query'] = $this->get_where_custom('parent_category', $parent_category);
        $this->load->view('categories_table', $data);
    }
    

    function get_category_name($id)
    {
        $data = $this->get_data_from_db($id);
        $category_name = $data['category_name'];
        return $category_name;
    }


    function manage()
    {
        $parent_category = $this->uri->segment(3);
        if(($parent_category <1) || (!is_numeric($parent_category)))
        {
            $parent_category = 0;
        }

        $data['parent_category'] = $parent_category;

        if($parent_category > 0)
        {
            $data['headline'] = "Manage ".$this->get_category_name($parent_category);
            $data['category_name'] = $this->get_category_name($parent_category);
        }else{
            $data['headline'] = "Manage Store Category";
        }
        
        $flash = $this->session->flashdata('category');
        if($flash !="")
        {
            $data['flash'] = $flash;
        }
       
        $template = "admin";
        $data['new_category_allowed'] = $this->_is_new_category_allowed($parent_category);
        $data['view_file'] = "manage";
        $this->load->module('template');
        $this->template->$template($data);
    }
    
    function create()
    {
        $category_id = $this->uri->segment(3);
        $data = $this->get_data_from_post();
        $submit = $this->input->post('submit', TRUE);
        
        if($category_id>0)
        {
            if($submit !="Submit")
            {
                //form hat NOT been posted yet, so read from database
                $data = $this->get_data_from_db($category_id);
            }
            $data['headline'] = "Edit Category";
        }
        else
        {
            $data['headline'] = "Create New Category";
        }
        
        $current_url = current_url();
        $data['form_location'] = str_replace('/create', '/submit', $current_url);
        
        $flash = $this->session->flashdata('category');
        if($flash !="")
        {
            $data['flash'] = $flash;
        }
        
        $data['category_id'] = $category_id;
        $template = "admin";
        $data['view_file'] = "create";
        $this->load->module('template');
        $this->template->$template($data);
    }
    
    function submit()
    {
        //deal with the submitted form
        $parent_category = $this->uri->segment(4);
        $order_category = $this->get_order_category($parent_category);
        if(!is_numeric($parent_category))
        {
            $parent_category = 0;
        }
        if($parent_category == 0)
        {
            $order_category = $this->get_last_order_category_id() + 1;
        }
        
        $this->load->library('form_validation');
        $this->form_validation->set_rules('category_name', 'Category Name', 'required');

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
                //This is an EDIT (update) NOT a new Category
                $data = $this->get_data_from_post();
                $data['category_url'] = url_title($data['category_name']);
                $this->_update($update_id, $data);
                
                $value = "<p style='color:green;'>The category was successfully updated.</p>";
                $parent_category = $update_id;
            }
            else
            {
                //This is a new record
                $data = $this->get_data_from_post();
                $data['category_url'] = url_title($data['category_name']);
                $data['parent_category'] = $parent_category;
                $data['order_category'] = $order_category;
                $this->_insert($data);
                $value = "<p style='color:green;'>The category was successfully creates.</p>";
                $update_id = $this->get_max();
            }
            
            //add flashdata to session
            $this->session->set_flashdata('category', $value);

            redirect('store_categories/manage/'.$parent_category);
        }
        
        
    }
    
    function get_data_from_post()
    {
        $data['category_name'] = $this->input->post('category_name', TRUE);
        return $data;
    }
    
    function get_data_from_db($update_id)
    {
        $query = $this->get_where($update_id);
        foreach ($query->result() as $row)            
        {
            $data['category_name'] = $row->category_name;
        }
        
        if(!isset($data))
        {
            $data = "";
        }
        return $data;
    }
    
    function delete_category($category_id)
    {
        $submit = $this->input->post('submit', TRUE);
        if($submit == "No - Cancel")
        {
            redirect('store_categories/create/'.$category_id);
        }
        if($submit == "Yes - Delete Category")
        {
            $this->_delete($item_id);
            
            //add flashdata
            $value = "<p style='color:green;'>The Category was successfully deleted.</p>";
            $this->session->set_flashdata('item', $value);
            
            redirect('store_categories/manage');
        }
        
        $data['update_id'] = $category_id;
        $data['form_location'] = current_url();
        $template = "admin";
        $data['view_file']="delete_category";
        $this->load->module('template');
        $this->template->$template($data);  
    }
    
    function get($order_by) 
    {
        $this->load->model('mdl_store_categories');
        $query = $this->mdl_store_categories->get($order_by);
        return $query;
    }

    function get_with_limit($limit, $offset, $order_by) 
    {
        $this->load->model('mdl_store_categories');
        $query = $this->mdl_store_categories->get_with_limit($limit, $offset, $order_by);
        return $query;
    }

    function get_where($id) 
    {
        $this->load->model('mdl_store_categories');
        $query = $this->mdl_store_categories->get_where($id);
        return $query;
    }

    function get_where_custom($col, $value) 
    {
        $this->load->model('mdl_store_categories');
        $query = $this->mdl_store_categories->get_where_custom($col, $value);
        return $query;
    }

    function _insert($data) 
    {
        $this->load->model('mdl_store_categories');
        $this->mdl_store_categories->_insert($data);
    }

    function _update($id, $data) 
    {
        $this->load->model('mdl_store_categories');
        $this->mdl_store_categories->_update($id, $data);
    }

    function _delete($id) 
    {
        $this->load->model('mdl_store_categories');
        $this->mdl_store_categories->_delete($id);
    }

    function count_where($column, $value) 
    {
        $this->load->model('mdl_store_categories');
        $count = $this->mdl_store_categories->count_where($column, $value);
        return $count;
    }

    function get_max() 
    {
        $this->load->model('mdl_store_categories');
        $max_id = $this->mdl_store_categories->get_max();
        return $max_id;
    }

    function _custom_query($mysql_query) 
    {
        $this->load->model('mdl_store_categories');
        $query = $this->mdl_store_categories->_custom_query($mysql_query);
        return $query;
    }

}