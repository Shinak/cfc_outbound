<?php
//Check if user has access
Modules::run('site_security/check_access', '1', 'on', 'dashboard');
?>
<div id="contend_top"><!-- Contend  Top -->
    <div class="main"><!-- Main Top contend -->
<?php   
        echo "<div class='headline'><h2>".$headline."</h2></div>";  
        include 'admin_menu.php';
?>       
    </div><!-- Close Main contend-->
</div><!-- Close Contend Top -->

<div id="contend_main"><!--  Contend main-->
    <div class="left"><!-- Left contend-->
        <?php    echo validation_errors('<p style="color: red;">', '</p>');?>       
    </div><!-- Close Left contend-->

    <div class="main"> <!-- Main contend-->
        <?php
            echo form_open($form_location);
            ?>
            <table cellpadding="7" cellspacing="0" border="0" width="400">
                <tr>
                    <td valign="top">Username</td>
                    <td><?php echo form_input('username', $username);?></td>    
                </tr>
                <tr>
                    <td valign="top">First_name</td>
                    <td><?php echo form_input('first_name', $first_name);?></td>    
                </tr>
                <tr>
                    <td valign="top">Last Name</td>
                    <td><?php echo form_input('last_name', $last_name);?></td>    
                </tr>
                <tr>
                    <td valign="top">Password</td>
                    <td><?php echo form_password('password', $password);?></td>    
                </tr>
                <tr>
                    <td valign="top">Password Confirmation</td>
                    <td><?php echo form_password('passconf', $passconf);?></td>    
                </tr>
                <tr>
                    <td valign="top">User Rights</td>
                    <td><?php echo form_dropdown('right', $options_rights, $option_sel);?></td>    
                </tr>
                <tr>
                    <td valign="top"><?php echo form_button('cancel', 'Cancel', 'onclick="location.href=\''.base_url().'account/admin\'" class="btn_b"')?></td>
                    <td><?php echo form_submit('submit', 'Submit');?></td>    
                </tr>
            </table>

            <?php
            echo form_close();
            ?>
    </div><!-- Close Main contend-->

</div><!-- Close contend main-->


