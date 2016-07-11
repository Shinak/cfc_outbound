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
             
    </div><!-- Close Left contend-->


    <div class="main"> <!-- Main contend-->
        <?php 
            if(isset($flash))
            {
                echo $flash;
            }
             //Check if user has access
            //$admin = Modules::run('site_security/check_access', '1', 'off');
           // if($admin == TRUE)
            //{
                echo Modules::run('account/_display_account_list');
            //}
        ?>
        
    </div><!-- Close Main contend-->


    <div class="right"><!-- Right contend-->
        <p>Inhalt rechts</p>
    </div><!-- Close Right contend-->
</div><!-- Close contend main-->


