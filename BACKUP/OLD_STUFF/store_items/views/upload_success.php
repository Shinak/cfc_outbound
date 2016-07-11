<h2>Upload Success</h2>
<p>The Image was successfully uploaded.</p>
<?php
echo "<p>".anchor('store_items/create/'.$item_id, 'Return To Edit Item')."</p>";
if(isset($big_pic))
{
    $pic_path = base_url()."itempics/".$big_pic;
    echo "<p>";
    echo "<img src='".$pic_path."'>";
    echo "</p>";
}
