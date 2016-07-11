<?php
    if(isset($project_id))
    {
        //Check if the User has accesss to edit 
        Modules::run('project_right/check_project_access', 'edit', $project_id);
    }
    else
    {
        //Check if user has access
        Modules::run('site_security/check_access', '1', 'on', 'project');
    }
?>
<div id="contend_top"><!-- Contend  Top -->
    <div class="main"><!-- Main Top contend -->
<?php   
        echo "<div class='headline'><h1>".$headline."</h1></div>";
        
        if(isset($project_id))
        {
            $this->load->view('project_edit_menu');
        }
        //$this->load->view('back menu');

?>       
    </div><!-- Close Main contend-->
</div><!-- Close Contend Top -->

<div id="contend_main"><!--  Contend main-->
    <div class="left"><!-- Left contend-->
        <?php  echo Modules::run('project/get_project_name',$project_id);?>
        <?php    echo validation_errors('<p style="color: red;">', '</p>');?>       
    </div><!-- Close Left contend-->

    <div class="main"> <!-- Main contend-->
        <?php
            echo form_open($form_location);
            ?>
            <table cellpadding="7" cellspacing="0" border="0" width="600">
                <tr>
                    <td valign="top">Project Name</td>
                    <td><?php echo form_input('name', $name);?></td>    
                </tr>  
                <tr>
                    <td valign="top">Client</td>
                    <td><?php echo form_input('client', $client);?></td>    
                </tr>
                <tr>
                    <td valign="top">Project Manager</td>
                    <td><?php echo form_input('project_manager', $project_manager);?></td>    
                </tr>
                <tr>
                    <td valign="top">Description</td>
                    <td><?php echo form_textarea('description', $description);?></td>    
                </tr>
                <tr>
                    <td valign="top"><?php echo form_button('cancel', 'Cancel', 'onclick="location.href=\''.base_url().'project\'" class="btn_b"')?></td>
                    <td><?php echo form_submit('submit', 'Submit');?></td>    
                </tr>
            </table>

            <?php
            echo form_close();
            ?>
    </div><!-- Close Main contend-->

    <div class="right"><!-- Right contend-->
    
    </div><!-- Close Right contend-->
    
    
    
    
</div><!-- Close contend main-->


