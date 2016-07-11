<div class="menu"> <!-- das Menu als Liste in einem separaten div -->
    <ul>
        <?php
        //Check if user has access
        $admin = Modules::run('site_security/check_access', '1', 'off');
        if($admin == TRUE)
        {
            echo "<li>".anchor('account/create', 'Create a new Account', 'class="btn"')."</li>";
            echo "<li>".anchor('account/admin', 'Account List', 'class="btn_b"')."</li>";
        }
        else
        {
            echo "<li>".anchor('account/settings', 'Account Settings', 'class="btn"')."</li>";
        }
        ?>
    </ul>
</div>

<?php //echo anchor('account/account_list', 'Account List'); ?>

