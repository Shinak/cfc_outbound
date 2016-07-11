<h2>Addition Options</h2>

<ul id="addiitional_options">
    <li><?php echo anchor('store_item_colors/update/'.$item_id, 'Update Item Color'); ?></li>
    <li><?php echo anchor('store_item_sizes/update/'.$item_id, 'Update Item Size'); ?></li>
    <li><?php echo anchor('store_items/upload_pic/'.$item_id, 'Update Item Picture'); ?></li>
    <li><?php echo anchor('store_cat_assign/assign/'.$item_id, 'Category Assign'); ?></li>
    <li><?php echo anchor('store_items/delete_item/'.$item_id, '<span style="color:red">Delete Item</span>'); ?></li>
</ul>

