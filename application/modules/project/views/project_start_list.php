<?php
$imgpath =base_url().Modules::run('site_settings/get_img_path');
$num_rows = $query->num_rows();
if($num_rows>0)
{
?>
<div class="datagrid project_start">
    <table>
        <thead>
            <tr>
                <th>Count</th>
                <th>Project Name</th> 
                <th>Client</th> 
                <th>Start</th> 
            </tr>
        </thead>
        <tbody>
         <?php
        $count = 1;
        foreach ($query->result() as $row)
        {
            $id = $row->id;
            $project_right = Modules::run('project_right/check_project_right', $id);
            
            if($project_right['read'] == 1)
            {
                
                $zahl = $count + 2;
                if ($zahl % 2 != 0) 
                {
                    echo "<tr>";
                } else {
                    echo "<tr class='alt'>";
                }
                    
                ?>
                    <td class="count"><?php echo $count; ?></td>
                    <td class="name"><?php echo $row->name; ?></td> 
                    <td class="client"><?php echo $row->client; ?></td>  
                    <td class="aktion"><?php echo anchor('project/start/'.$row->id, 'Start', 'class="btn" title="Start Project"'); ?></td> 
                </tr>
                <?php
                $count++;
            }
        }
        ?>
        </tbody>
    </table>
</div>
<?php
}
?>