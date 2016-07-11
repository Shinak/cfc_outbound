<?php
    //Check if the User has accesss tu edit 
    Modules::run('project_right/check_project_access', 'edit', $project_id);
?>
<div id="contend_top"><!-- Contend  Top -->
    <div class="main"><!-- Main Top contend -->
<?php   
        echo "<div class='headline'><h2>".$headline."</h2></div>";  
        include 'project_menu.php';
?>       
    </div><!-- Close Main contend-->
</div><!-- Close Contend Top -->

<div id="contend_main"><!--  Contend main-->
    <div class="left"><!-- Left contend-->
          <?php if(isset($flash)){echo $flash;}?>              
    </div><!-- Close Left contend-->
 

    <div class="main"> <!-- Main contend-->
       <p>Are you sure that you want to delete the Project "<?php echo $project_name; ?>"</p>

        <?php
        echo form_open($form_location);
        echo form_submit('submit', 'Yes - Delete Project');
        echo nbs(7);
        echo form_submit('submit', 'No - Cancel');
        echo form_close();
        ?>
    </div><!-- Close Main contend-->

</div><!-- Close contend main-->



