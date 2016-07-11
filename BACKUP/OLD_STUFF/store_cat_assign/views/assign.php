<h2>Category Assign</h2>
<?php

echo anchor('store_items/create/'.$item_id, 'Back to Item');
echo br(2);

echo Modules::run('store_cat_assign/_draw_assigned_categories', $item_id);

$this->load->module('store_categories');
$available_categories = $this->store_categories->get_end_of_line_categories();
echo form_open($form_location);


echo "Assign <B>".nbs(3).$item_name.nbs(3)."</b>";
?>
to Category 
<select name="category_id">
<?php 
foreach ($available_categories as $option)
{
    $breadcrumb = $this->store_categories->get_breadcrumb($option);
    echo '<option value"'.$option.'">'.$breadcrumb.'</option>';
}
?>
</select>

<?php
echo nbs(3);
echo form_submit('submit', 'Submit');
echo nbs(3);
echo form_submit('submit', 'Finished');
echo form_close();
?>