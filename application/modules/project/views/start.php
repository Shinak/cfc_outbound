<div id="contend_top"><!-- Contend  Top -->
    <div class="main"><!-- Main Top contend -->
<?php   
        $imgpath =base_url().Modules::run('site_settings/get_img_path');
        echo "<div class='headline'><h1>".$headline."</h1></div>";  
        $this->load->view('start_menu');
?>       
    </div><!-- Close Main contend-->
</div><!-- Close Contend Top -->

<div id="contend_main"><!--  Contend main-->
    <div class="left"><!-- Left contend-->
        <?php 

        $count_self = Modules::run('customer_resubmission/count_resub', $project_id, 'self');
        $count_other = Modules::run('customer_resubmission/count_resub', $project_id, 'other');
        
        echo "<div id='resub_info'>You have <b><font color='blue'>".$count_self['all']."</font></b> Customers in Resubmission.</br>";
        echo "<b><font color='orange'>".$count_self['queue']."</font></b> are in Status Queue</br>";
        echo "and <b><font color='red'>".$count_self['ready']."</font></b> are Ready</br>";
        echo "</br>";
        echo "There are <b><font color='blue'>".$count_other['all']."</font></b> other customers in resubmission of other employees</br>";
        echo "<b><font color='orange'>".$count_other['queue']."</font></b> are in Status Queue</br>";
        echo "and <b><font color='red'>".$count_other['ready']."</font></b> are Ready</br>";
        echo "</div>";
        
        $url = base_url();
        
        echo anchor($url.'project/resubmission/'.$project_id, 'Resubmission Overview');
        
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
        if($resub_list != "")
        {
            echo "<h2>Owen Resubmissions (".$count_self['all'].")</h2>";
            echo "<div id=resub_list_self>";
            echo "<div id='plus_minus'>";
            if($_SESSION['d_self_resub'] == 1){echo anchor(current_url().'?rs_list=0', '<img src="'.$imgpath.'minus.png" title="Do not display this list">'); $d_rs_list = 1;}
            if($_SESSION['d_self_resub'] == 0){echo anchor(current_url().'?rs_list=1', '<img src="'.$imgpath.'plus.png" title=Display this list">'); $d_rs_list = 0;}
            echo "</div>";
            if($d_rs_list == 1)
            {
                echo $resub_list;
            }
            echo "</div><hr>";
        }
        echo "<h2>Customer List</h2>";
        echo "<div id=customer_list>";
            echo "<div id='plus_minus'>";
            if($_SESSION['d_customer'] == 1){echo anchor(current_url().'?c_list=0', '<img src="'.$imgpath.'minus.png" title="Do not display this list">'); $d_c_list = 1;}
            if($_SESSION['d_customer'] == 0){echo anchor(current_url().'?c_list=1', '<img src="'.$imgpath.'plus.png" title=Display this list">'); $d_c_list = 0;}
            echo "</div>";
            if($d_c_list == 1)
            {
                echo $customer_list;
            }
        echo "</div>";
    ?>

    </div><!-- Close Main contend-->
</div><!-- Close contend main--> 


