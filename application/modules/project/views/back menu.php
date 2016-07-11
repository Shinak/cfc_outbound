<div class="menu"> <!-- das Menu als Liste in einem separaten div -->
    <ul> 
        <?php if($this->uri->segment(2) != 'create')
        {?>
        <li><?php echo anchor('project/create/'.$project_id, 'Back to Project');?></li>
        <?php
        }
        else
        {?>
        <li><?php echo anchor('project', 'Back to Project List');?></li>
        <?php
        }?>
    </ul>
</div>

