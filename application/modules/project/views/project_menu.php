<div class="menu"> <!-- das Menu als Liste in einem separaten div -->
    <ul> 
        <?php
        //Check if user has access
        echo "<li>".anchor('project', 'Project List','class="btn"')."</li>";
        
        $admin = Modules::run('site_security/check_access', '1', 'off');
        if($admin == TRUE)
        {
            echo "<li>".anchor('project/create', 'Create a new Project','class="btn"')."</li>";
        }
        ?>
    </ul>
</div>


