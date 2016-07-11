<?php
    //Check if the User has accesss tu edit 
    Modules::run('project_right/check_project_access', 'edit', $project_id);
?>

<div id="contend_top"><!-- Contend  Top -->
    <div class="main"><!-- Main Top contend -->
<?php   
        echo "<div class='headline'><h1>".$headline."</h1></div>";  
        $this->load->view('back menu');
?>       
    </div><!-- Close Main contend-->
</div><!-- Close Contend Top -->

<div id="contend_main"><!--  Contend main-->
    <div class="left"><!-- Left contend-->
        <?php if(isset($flash)){echo $flash;}?>
    </div><!-- Close Left contend-->
 

    <div class="main"> <!-- Main contend-->
       
        <table cellpadding="7" cellspacing="0" border="0" width="600">
            <tr>
                <td valign="top">User Name</td>
                <td>User Right</td>    
            </tr>  
        
        
        <?php
       
//echo nl2br(print_r($account_query->last_row(),true)); 

       echo form_open($form_location);
       
        $attributes = array
        (
            'class' => 'label',
            'style' => 'color: red;'
        );
       
        foreach ($account_query->result() as $row)
        {
            $id = $row->id;
            if($id != 1)
            {
                $project_right = Modules::run('project_right/get_project_right',$project_id, $row->id);
                $check_read = FALSE;
                $check_edit = FALSE;
                $check_report = FALSE;
                if($project_right['read'] == 1){$check_read = TRUE;}
                if($project_right['edit'] == 1){$check_edit = TRUE;}
                if($project_right['report'] == 1){$check_report = TRUE;}
                ?>
                    <tr>
                        <td valign="top"><?php echo $row->username;?></td>

                        <td>
                        <?php   
                            echo form_label('Read', 'right', $attributes).form_checkbox('read['.$id.']', 'read', $check_read);
                            echo form_label('Edit', 'right', $attributes).form_checkbox('edit['.$id.']', 'edit', $check_edit);
                            echo form_label('Report', 'right', $attributes).form_checkbox('report['.$id.']', 'report', $check_report);
                        ?>
                        </td>    
                    </tr>
                <?php
            }
        }
            ?>
                <tr>
                    <td valign="top"><?php echo form_button('cancel', 'Cancel', 'onclick="location.href=\''.base_url().'project/create/'.$project_id.'\'"')?></td>
                    <td><?php echo form_submit('submit', 'Submit');?></td>    
                </tr>
            </table>

            <?php
            echo form_close();
            ?>
    </div><!-- Close Main contend-->

</div><!-- Close contend main-->


