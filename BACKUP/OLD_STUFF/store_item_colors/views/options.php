<?php
$num_rows = $query->num_rows();
if($num_rows>0)
{
    echo '<h2>Options Color</h2>';
    echo "<ul>";
    foreach ($query->result() as $row)
    {
        echo "<li>";
        echo $row->item_color." ";
        echo anchor('store_item_colors/ditch/'.$row->id.'/'.$item_id, '<span style="color: red;">Delete</span>');
        echo "</li>";        
    }
    echo "</ul>";
}


