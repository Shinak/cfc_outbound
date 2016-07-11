<div class="menu"> <!-- das Menu als Liste in einem separaten div -->
    <ul> 
        <li><?php echo anchor('project/right/'.$project_id, 'Project Rights' ,'class="btn"' );?></li>
      <!--  <li><?php echo anchor('customer/upload/'.$project_id, 'Upload Customer', 'class="btn"');?></li> -->
        <li><?php echo anchor('project_customer/customerlist/'.$project_id, 'Customer List', 'class="btn"');?></li>
        <li><?php echo anchor('project/delete_project/'.$project_id, 'Delete Project', 'class="btn"');?></li>
        <?php if($this->uri->segment(2) != 'create')
        {?>
        <li><?php echo anchor('project/create/'.$project_id, 'Back to Project', 'class="btn_b"');?></li>
        <?php
        }
        else
        {?>
        <li><?php echo anchor('project', 'Back to Project List', 'class="btn_b"');?></li>
        <?php
        }?>
    </ul>
</div>

