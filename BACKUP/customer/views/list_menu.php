<?php
$imgpath =base_url().Modules::run('site_settings/get_img_path');
$limit_link = "";
if($limit != ""){$limit_link = "/".$limit;}
?>

<div class="spl_menu"> <!-- das Menu als Liste in einem separaten div -->
    <ul>
        <li><?php echo " Company ".anchor('customer/index/'.$project_id.'/company_up'.$limit_link, '<img src="'.$imgpath.'up.png" title="UP"')." ".anchor('customer/index/'.$project_id.'/company_down'.$limit_link, '<img src="'.$imgpath.'down.png" title="DOWN"'); ?> |</li>
        <li><?php echo " City ".anchor('customer/index/'.$project_id.'/city_up'.$limit_link, '<img src="'.$imgpath.'up.png" title="UP"')." ".anchor('customer/index/'.$project_id.'/city_down'.$limit_link, '<img src="'.$imgpath.'down.png" title="DOWN"'); ?>|</li>
        <li><?php echo " Contact ".anchor('customer/index/'.$project_id.'/contact_up'.$limit_link, '<img src="'.$imgpath.'up.png" title="UP"')." ".anchor('customer/index/'.$project_id.'/contact_down'.$limit_link, '<img src="'.$imgpath.'down.png" title="DOWN"'); ?> |</li>
        <li><?php echo " Country ".anchor('customer/index/'.$project_id.'/country_up'.$limit_link, '<img src="'.$imgpath.'up.png" title="UP"')." ".anchor('customer/index/'.$project_id.'/country_down'.$limit_link, '<img src="'.$imgpath.'down.png" title="DOWN"'); ?> |</li>
        <li><?php echo " Calls ".anchor('customer/index/'.$project_id.'/calls_up'.$limit_link, '<img src="'.$imgpath.'up.png" title="UP"')." ".anchor('customer/index/'.$project_id.'/calls_down'.$limit_link, '<img src="'.$imgpath.'down.png" title="DOWN"'); ?> |</li>
        <li><?php nbs(3) ?></li>
        <li><?php echo " Limit ".anchor('customer/index/'.$project_id.'/'.$order.'/10', '10'); ?> |</li>
        <li><?php echo anchor('customer/index/'.$project_id.'/'.$order.'/50', '50'); ?> |</li>
        <li><?php echo anchor('customer/index/'.$project_id.'/'.$order.'/100', '100'); ?> |</li>
        <li><?php echo anchor('customer/index/'.$project_id.'/'.$order.'/all', 'All'); ?> |</li>
        <li><?php nbs(3) ?></li>
        <li><?php echo anchor('project/create/'.$project_id, 'Back to Project'); ?></li>
    </ul>
</div>



