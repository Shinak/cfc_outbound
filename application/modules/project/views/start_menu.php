<?php
$imgpath =base_url().Modules::run('site_settings/get_img_path');
$limit_link = "";
if($limit != ""){$limit_link = "/".$limit;}
?>

<div class="spl_menu"> <!-- das Menu als Liste in einem separaten div -->
    <ul> 
        <li class='text'>Company</li>
        <li class='link_up'><?php echo anchor('project/start/'.$project_id.'/company_up'.$limit_link, 'UP');?></li>
        <li class='link_down'><?php echo anchor('project/start/'.$project_id.'/company_down'.$limit_link, '', 'title="Down"');?></li>
        <li class='text'>| City</li>
        <li class='link_up'><?php echo anchor('project/start/'.$project_id.'/city_up'.$limit_link, '', 'title="Up"');?></li>
        <li class='link_down'><?php echo anchor('project/start/'.$project_id.'/city_down'.$limit_link, '', 'title="Down"');?></li>
        <li class='text'>| Contact</li>
        <li class='link_up'><?php echo anchor('project/start/'.$project_id.'/contact_up'.$limit_link, '', 'title="Up"');?></li>
        <li class='link_down'><?php echo anchor('project/start/'.$project_id.'/contact_down'.$limit_link, '', 'title="Down"');?></li>
        <li class='text'>| Country</li>
        <li class='link_up'><?php echo anchor('project/start/'.$project_id.'/country_up'.$limit_link, '', 'title="Up"');?></li>
        <li class='link_down'><?php echo anchor('project/start/'.$project_id.'/country_down'.$limit_link, '', 'title="Down"');?></li>
        <li class='text'>| Calls</li>
        <li class='link_up'><?php echo anchor('project/start/'.$project_id.'/calls_up'.$limit_link, '', 'title="Up"');?></li>
        <li class='link_down'><?php echo anchor('project/start/'.$project_id.'/calls_down'.$limit_link, '', 'title="Down"');?></li>
        <li class='text'>|</li>
        <li class='link_10'><?php echo anchor('project/start/'.$project_id.'/'.$order.'/10', '', 'title="Show 10"');?></li>
        <li class='link_50'><?php echo anchor('project/start/'.$project_id.'/'.$order.'/50', '', 'title="Show 50"');?></li>
        <li class='link_100'><?php echo anchor('project/start/'.$project_id.'/'.$order.'/100', '', 'title="Show 100"');?></li>
        <li class='link_all'><?php echo anchor('project/start/'.$project_id.'/'.$order.'/all', '', 'title="Show All"');?></li>
        <li class='text'><?php nbs(5) ?></li>
        <li class='link_back'><?php echo anchor('dashboard', '', 'title="Back to Dashboard"'); ?></li>
    </ul>
</div>


<?php

/*
 * <div class="menu"> <!-- das Menu als Liste in einem separaten div -->
    <ul> 
        <li class='text'>Company</li>
        <li class='link'><?php echo anchor('project/start/'.$project_id.'/company_up'.$limit_link, '<img src="'.$imgpath.'up.png" title="UP">');?></li>
        <li class='link'><?php echo anchor('project/start/'.$project_id.'/company_down'.$limit_link, '<img src="'.$imgpath.'down.png" title="DOWN">');?></li>
        <li class='text'>| City</li>
        <li class='link'><?php echo anchor('project/start/'.$project_id.'/city_up'.$limit_link, '<img src="'.$imgpath.'up.png" title="UP">');?></li>
        <li class='link'><?php echo anchor('project/start/'.$project_id.'/city_down'.$limit_link, '<img src="'.$imgpath.'down.png" title="DOWN">');?></li>
        <li class='text'>| Contact</li>
        <li class='link'><?php echo anchor('project/start/'.$project_id.'/contact_up'.$limit_link, 'UP', 'class="home"');?></li>
        <li class='link'><?php echo anchor('project/start/'.$project_id.'/contact_down'.$limit_link, '<img src="'.$imgpath.'down.png" title="DOWN">');?></li>
        <li class='text'>| Country</li>
        <li class='link'><?php echo anchor('project/start/'.$project_id.'/country_up'.$limit_link, '<img src="'.$imgpath.'up.png" title="UP">');?></li>
        <li class='link'><?php echo anchor('project/start/'.$project_id.'/country_down'.$limit_link, '<img src="'.$imgpath.'down.png" title="DOWN">');?></li>
        <li class='text'>| Calls</li>
        <li class='link'><?php echo anchor('project/start/'.$project_id.'/calls_up'.$limit_link, '<img src="'.$imgpath.'up.png" title="UP">');?></li>
        <li class='link'><?php echo anchor('project/start/'.$project_id.'/calls_down'.$limit_link, '<img src="'.$imgpath.'down.png" title="DOWN">');?></li>
        <li class='text'>|</li>
        <li class='link'><?php echo anchor('project/start/'.$project_id.'/'.$order.'/10', '<img src="'.$imgpath.'10.png" title="Limit 10">');?></li>
        <li class='link'><?php echo anchor('project/start/'.$project_id.'/'.$order.'/50', '<img src="'.$imgpath.'50.png" title="Limit 50">');?></li>
        <li class='link'><?php echo anchor('project/start/'.$project_id.'/'.$order.'/100', '<img src="'.$imgpath.'100.png" title="Limit 100">');?></li>
        <li class='link'><?php echo anchor('project/start/'.$project_id.'/'.$order.'/all', '<img src="'.$imgpath.'all.png" title="No Limit">');?></li>
        <li class='link'><?php nbs(5) ?></li>
        <li class='link'><?php echo anchor('dashboard', '<img src="'.$imgpath.'back.png" title="Back to Dashboard">'); ?></li>
    </ul>
</div>
 */