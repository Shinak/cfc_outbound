<div id="contend_top"><!-- Contend  Top -->
    <div class="main"><!-- Main Top contend -->
<?php   
        echo "<div class='headline'><h1>".$headline."</h1></div>";  
        //include 'dashboard_menu.php';
        
?>       
    </div><!-- Close Main contend-->
</div><!-- Close Contend Top -->

<div id="contend_main"><!--  Contend main-->

    <div class="left"><!-- Left contend-->
            Inhalt Links 
            <?php
            $login = $this->session->userdata('logged_in');
            echo '<br>Account ID = '.$login['id'];
           // echo "<div id='debug'>";
            //echo nl2br(print_r($this->session->userdata(),true));
            //echo "</div>";
            echo '<br>Account Right = '.$login['right'];;
            echo '<br>'.$session_id;
            echo br(1);
            echo $_SESSION['last_action'];
            echo br(1);
            echo time();
            ?>
    </div><!-- Close Left contend-->


    <div class="main"> <!-- Main contend-->
        <?php if(isset($flash)){echo $flash;}?>
        <?php echo Modules::run('project/get_project_list', 'start');?>
    </div><!-- Close Main contend-->

</div><!-- Close contend main-->





