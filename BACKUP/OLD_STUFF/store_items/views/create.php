<div id="contend">
    <div class="top">
        <h2><?php echo $headline; ?></h2>
        <h2><?php echo anchor('store_items/manage', 'Back to Item List');?></h2>
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
                    <td valign="top">Item Name</td>
                    <td><?php echo form_input('item_name', $item_name);?></td>    
                </tr>
                <tr>
                    <td valign="top">Item Price</td>
                    <td><?php echo form_input('item_price', $item_price);?></td>    
                </tr>
                <tr>
                    <td valign="top">Item Description</td>
                    <td><?php echo form_textarea('item_description', $item_description);?></td>    
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
            if($item_id>0)
            {
                //we do edit an item
                include('additional_options.php');
                if($smal_pic != "")
                {
                    echo img(base_url().'itempics/'.$smal_pic);
                }
            }
            ?>
        </div>
    </div>
</div>