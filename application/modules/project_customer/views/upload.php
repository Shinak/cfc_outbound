<?php
    //Check if the User has accesss tu edit 
    Modules::run('project_right/check_project_access', 'edit', $project_id);
?>

<div id="contend_top"><!-- Contend  Top -->
    <div class="main"><!-- Main Top contend -->
<?php   
        echo "<div class='headline'><h1>".$headline."</h1></div>";  
        $this->load->view('upload menu');
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
        ?>                   
    </div><!-- Close Left contend-->

    <div class="main"> <!-- Main contend-->

        <?php if(isset($flash)){echo $flash;}?>
        <?php echo form_open_multipart('customer/do_upload/'.$project_id);?>

        <input type="file" name="userfile" size="20" />

        <br /><br />

        <input type="submit" value="upload" />

        </form>  

        
    </div><!-- Close Main contend-->

    <div class="right"><!-- Right contend-->

    </div><!-- Close Right contend-->
</div><!-- Close contend main-->


    

