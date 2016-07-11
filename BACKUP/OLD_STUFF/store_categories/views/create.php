<div id="contend">
    <div class="top">
        <h2><?php echo $headline; ?></h2>
        <h2><?php echo anchor('store_categories/manage', 'Back to Categories List');?></h2>
    </div>
    <div class="main">
        <div class="left">
            <?php
            if(isset($flash))
            {
                echo $flash;
            }

            echo validation_errors('<p style="color: red;">', '</p>');
            echo form_open($form_location);
            ?>
            <table cellpadding="7" cellspacing="0" border="0" width="600">
                <tr>
                    <td valign="top">Category Name</td>
                    <td><?php echo form_input('category_name', $category_name);?></td>    
                </tr>
                <tr>
                    <td valign="top">&nbsp;</td>
                    <td><?php echo form_submit('submit', 'Submit');?></td>    
                </tr>
            </table>

            <?php
            echo form_close();
            ?>
        </div>
        <div class="right">
            <?php
            if($category_id>0)
            {
                //we do edit an category
                include('additional_options.php');
            }
            ?>
        </div>
    </div>
</div>


