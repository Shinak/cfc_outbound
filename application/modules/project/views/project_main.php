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
       <?php echo Modules::run('project/get_project_list', 'edit');?>
    </div><!-- Close Main contend-->

</div><!-- Close contend main-->


