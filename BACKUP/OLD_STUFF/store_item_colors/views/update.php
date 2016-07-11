<div id="contend">
    <div class="top">
        <h2>Update Item Colors</h2>
        <p>Please enter a Color and then press Submit</p>
    </div>
    <div class="main">
        <div class="left">
            <?php
            echo form_open($form_location);
            echo form_input('item_color', '');
            echo nbs(3);
            echo form_submit('submit', 'Submit');
            echo nbs(3);
            echo form_submit('submit', 'Cancel');
            echo form_close();
            ?>
        </div>
        <div class="right">
            <?php
            echo Modules::run('store_item_colors/_display_options', $item_id)
            ?>
        </div>
    </div>
</div>