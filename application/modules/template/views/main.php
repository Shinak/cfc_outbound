<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="<?php echo base_url().Modules::run('site_settings/get_css_path');?>admin.css">
        <link rel="stylesheet" href="<?php echo base_url().Modules::run('site_settings/get_css_path');?>project.css">
        <link rel="stylesheet" href="<?php echo base_url().Modules::run('site_settings/get_css_path');?>customer.css">
        <link rel="stylesheet" href="<?php echo base_url().Modules::run('site_settings/get_css_path');?>contact_person.css">
        <link rel="stylesheet" href="<?php echo base_url().Modules::run('site_settings/get_css_path');?>popup.css">
        <link rel="stylesheet" href="<?php echo base_url().Modules::run('site_settings/get_css_path');?>info.css">
    </head>
<body>
    <div id="container"> <!-- Haupt Container -->
		
        <div id="header"> <!-- div für das Menü -->
            <div class="top_menu"> <!-- das Menu als Liste in einem separaten div -->
                <ul>
                    <li class="main_link"><?php echo anchor('dashboard', 'Dashboard', 'title="Dashboard" class="btn"'); ?></li>
                    <li class="main_link"><?php echo anchor('project', 'Project Admin', 'title="Project Admin" class="btn"'); ?></li>
                    <?php
                    //Check if user is Admin or Supervisor
                    $admin = Modules::run('site_security/check_access', '1', 'off');
                    if($admin == TRUE)
                    {
                        echo "<li class='main_link'> ".anchor('account/admin', 'User Admin','class="btn"')."</li>";
                        echo "<li class='main_link'> ".anchor('company/admin', 'Customer DB','class="btn"')."</li>";
                    }
                    else
                    {   
                        echo "<li class='main_link'>".anchor('account/settings', 'Account Settings','class="btn"')."</li>";
                    }
                    ?>
                </ul>
            </div>
            
            <div class="top_menu menu2"> <!-- das Menu als Liste in einem separaten div -->
                <ul>
                    <li class='main_link'><?php echo anchor('account/logout', 'Logout','class="btn"'); ?></li>
                </ul>
            </div>
        </div>
        
        <?php 
            //DEBUG 
            echo Modules::run('global_function/get_debug');
        ?>
        
        <div id="section"> <!-- div für den Seiten Inhalt -->
            <div class="bg"></div> <!-- div für einen Hintergrund der Main Seite-->
            	
            <div class="contend">
                <?php
                if(!isset($module))
                {
                    $module = $this->uri->segment(1);
                }
                if(!isset($view_file))
                {
                   $view_file = $this->uri->segment(2); 
                }
                if (($module != "") && ($view_file !=""))
                {    
                    $path = $module.'/'.$view_file;
                    $this->load->view($path);
                }
                ?>
            </div><!-- Close contend-->
	</div><!-- Close section-->
		
	<div id="footer"> <!-- Seiten Footer -->
            <div class="footer_contend"> <!-- Footer contend -->
		<span>© Website &amp; design by Christian Barth</span>
            </div><!-- Close Footer contend-->
        </div><!-- Close Footer-->
		<!--<div id="nav_to_top">
			<a href="#" onclick="animateToTop(event)" title="Back to Top">^</a>
		</div> -->
    </div> <!-- Haupt Container schließen-->
</body>
</html>

