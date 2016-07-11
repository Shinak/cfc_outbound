<?php
    //Check if the User has accesss to read 
    Modules::run('project_right/check_project_access', 'read', $project_id);
?>

<div id="contend_top"><!-- Contend  Top -->
    <div class="main"><!-- Main Top contend -->
<?php   
        echo "<div class='headline'><h1>".$headline."</h1></div>";  
        $this->load->view('list_menu');
?>       
    </div><!-- Close Main contend-->
</div><!-- Close Contend Top -->

<div id="contend_main"><!--  Contend main-->
    <div class="left"><!-- Left contend-->
        <?php echo $project_id; 

        if(isset($error))
        {
            foreach($error as $fault)
            {
                echo $fault;
            }
        }
        if(isset($flash)){echo $flash;}
        ?>                   
    </div><!-- Close Left contend-->

    <div class="main"> <!-- Main contend-->

    <?php 
        echo Modules::run('project_customer/get_list', $project_id);
    ?>
 
    </div><!-- Close Main contend-->

    <div class="right"><!-- Right contend-->

    </div><!-- Close Right contend-->
</div><!-- Close contend main-->
