<?php
//$limit_link = "";
//if($limit != ""){$limit_link = "/".$limit;}
?>

<div class="menu"> <!-- das Menu als Liste in einem separaten div -->
    <ul> 
        <li><?php nbs(5) ?></li>
        <li><?php echo anchor('project/start/'.$project_id, 'Back to Project'); ?></li>
    </ul>
</div>
