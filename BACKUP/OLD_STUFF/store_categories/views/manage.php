<h2><?php echo $headline ?></h2>

<?php
if(isset($flash))
{
    echo $flash;
    echo "<br>";
}
if($new_category_allowed==TRUE)
{
    echo anchor('store_categories/create/x/'.$parent_category, 'Create New Category (on this level)');
    echo nbs(7);  
}


if($parent_category>0)
{
	echo anchor('store_categories/create/'.$parent_category, 'Update Parent Category "'.$category_name.'"');
}

?>
<br><br>
<?php

echo Modules::run('store_categories/_display_categories_table', $parent_category);