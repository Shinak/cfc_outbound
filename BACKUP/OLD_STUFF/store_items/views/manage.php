<h2>Manage Your Items</h2>

<?php
if(isset($flash))
{
    echo $flash;
    echo "<br>";
}
echo anchor('store_items/create', 'Create New Item');
?>
<br><br>
<?php

echo Modules::run('store_items/_display_items_table');


