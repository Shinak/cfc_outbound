<div id="contend_top"><!-- Contend  Top -->
    <div class="main"><!-- Main Top contend -->
<?php   
        echo "<div class='headline'><h2>".$headline."</h2></div>";  
        include 'resub_menu.php';
?>       
    </div><!-- Close Main contend-->
</div><!-- Close Contend Top -->

<div id="contend_main"><!--  Contend main-->
    <div class="left"><!-- Left contend-->
        <?php  
        if(isset($error))
        {
            foreach($error as $fault)
            {
                echo $fault;
            }
        }
        ?>                   
    </div><!-- Close Left contend-->

    <div class="main"> <!-- Main contend-->

    <?php 
        if(isset($flash)){echo $flash;}
        if($owen_list != "")
        {
            echo "<h2>Owen Resubmissions</h2>";
            echo $owen_list;
            echo "<br><hr><br>";
        }
        
        echo "<h2>Other Resubmissions</h2>";
        echo $other_list;        
               
    ?>

    </div><!-- Close Main contend-->
</div><!-- Close contend main--> 


