<?php
//Check if user has access to this Project (This check is for url change by user himself)
Modules::run('project_right/check_project_access','read', $project_id); 
 
?>
<div id="contend_top"><!-- Contend  Top -->
    <div class="main"><!-- Main Top contend -->
<?php   
        echo "<div class='headline'><h2>".$headline."</h2></div>";
        
        //Start Form
        echo form_open($form_location);
        
        if($edit_customer == FALSE){include 'customer_show_menu.php';} 
        if($edit_customer == TRUE){include 'customer_edit_menu.php';} 
?>       
    </div><!-- Close Main contend-->
</div><!-- Close Contend Top -->

<div id="contend_main"><!--  Contend main-->
    <div class="left"><!-- Left contend-->
    <?php    
        echo Modules::run('global_function/timer', $start_time); 
        echo br(1);
        echo validation_errors('<p style="color: red;">', '</p>');
        if(isset($flash))
        {
            echo "<br>";
            echo "<p id='msg'>".$flash."</p>";
            echo "<br>";
        }
    ?>    
    </div><!-- Close Left contend-->

    <div class="main"> <!-- Main contend-->
        <?php
             foreach ($query->result() as $row)
            {
                $id = $row->id;
                $project_id = $row->project_id;
                $company = $row->company;
                $street = $row->street;
                $zip_code = $row->zip_code;
                $city = $row->city;
                $phone = $row->phone;
                $fax = $row->fax;
                $salutation = $row->salutation;
                $title = $row->title;
                $first_name = $row->first_name;
                $last_name = $row->last_name;
                $email = $row->email;
                $url = $row->url;
                $country = $row->country;
                $status = $row->status;
                $calls = $row->calls;
                $resub = $row->resubmission;
            } 

            ?>
            <input type="hidden" value="<?php echo $start_time?>" name="start_time">
            <?php
            if($edit_customer == FALSE)
            {
                include ('customer_show.php');
                
                echo br(1);
                echo "<div id='div_inser_info'>";
                $attributes = array('class' => 'label_inser_info');
                echo form_label('Insert a Customer Information', 'info_text', $attributes);
                echo br(1);
                $tetarea_data = array(
                                    'name'      => 'info_text',  
                                    'rows'      => 4,
                                    'cols'      => 80,
                                    'value'     => $value_info,
                                    'class'     => 'input_inser_info',
                                    ); 
                echo form_textarea($tetarea_data);
                echo "</div>";
                 
                $info = Modules::run('customer_info/list_info', $id);
                $changes = Modules::run('customer_info/list_change', $id);
                $system = Modules::run('customer_info/list_system', $id);
                
                if($info != "")
                {
                    echo br(2);
                    echo $info;
                }
                if($changes != "")
                {
                    echo br(2);
                    echo $changes;
                }
                if($system != "")
                {
                    echo br(2);
                    echo $system;
                }
            }
            if($edit_customer == TRUE)
            {
                include ('customer_edit.php');                
            }
            echo form_close();
            ?>

    </div><!-- Close Main contend-->

    <div class="right"><!-- Right contend-->
    <?php 
        if(isset($project_id))
        {
            //$this->load->view('additional_options');
            echo $project_id;
        }
    ?>
    </div><!-- Close Right contend-->
    
    
    
    
</div><!-- Close contend main-->