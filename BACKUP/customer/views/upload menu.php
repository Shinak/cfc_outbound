<div class="menu"> <!-- das Menu als Liste in einem separaten div -->
    <ul> 
        <li><?php echo anchor('customer/customerlist/'.$project_id, 'Customer List');?></li>
        <li><?php echo anchor('project/create/'.$project_id, 'Back to Project');?></li>
    </ul>
</div>