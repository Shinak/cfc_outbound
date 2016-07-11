<link rel="stylesheet" href="<?php echo base_url().Modules::run('site_settings/get_css_path');?>info_msg.css">
<?php
    $imgpath =base_url().Modules::run('site_settings/get_img_path');
?>
<div id='info_full'>
    <div class='bg'></div>
    <div class='info'>
        <p><?php echo $msg; ?></p>
        <p>Wait <?php echo $count;?> seconds you will redireckt<img src='<?php echo $imgpath ?>wait.gif' title='Wait'></p>
    </div>
</div>
<META HTTP-EQUIV=Refresh CONTENT='<?php echo $count."; URL=".$link?>'>

