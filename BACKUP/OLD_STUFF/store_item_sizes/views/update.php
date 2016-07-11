<div id="contend">
    <div class="top">
        <h2>Update Item Size</h2>
        <p>Please enter a Size and then press Submit</p>
    </div>
    <div class="main">
        <div class="left">
            <?php
            echo form_open($form_location);
            echo form_input('item_size', '');
            echo nbs(3);
            echo form_submit('submit', 'Submit');
            echo nbs(3);
            echo form_submit('submit', 'Cancel');
            echo form_close();
            ?>
        </div>
        <div class="right">
            <?php
            echo Modules::run('store_item_sizes/_display_options', $item_id)
            ?>
        </div>
    </div>
</div>