<?php
$imgpath =base_url().Modules::run('site_settings/get_img_path');
$disable = '';
//Prüfen ob ein Resubmission gesetzt wurde.
if($this->session->has_userdata('resubmission') == TRUE)
{
    $options = array(
            'open'          => 'Open',
            );
    $disable = 'disabled = "disabled"';
}
else
{
    $options = array(
            'open'          => 'Open',
            'c_finish'      => 'Close Success',
            'c_faild'       => 'Close Faild',
            );
}

if($value_status != ''){$select = $value_status;}
else {$select = 'open';}
    
    
?>

<div class="menu"> <!-- das Menu als Liste in einem separaten div -->
    <ul>
        <li><?php echo form_label('Change Status information', 'status').": ".form_dropdown('status', $options, $select); ?></li>
        <li>&nbsp;&nbsp;</li>
        <li><?php echo form_submit('submit', 'Submit'); ?></li>
        <li>&nbsp;&nbsp;</li>
        <li><?php echo form_submit('cancel', 'Cancel',$disable); ?></li>
        <li>&nbsp;&nbsp;</li>
        <li><?php echo form_submit('resub', 'Resubmission'); ?></li>
        <li>&nbsp;&nbsp;</li>
        <li><?php echo anchor('customer/outbound/'.$project_id.'/'.$customer_id.'/edit', '<img src="'.$imgpath.'form_edit.png" title="Edit this Customer">'); ?></li>
    </ul>
</div>



