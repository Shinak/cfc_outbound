<?php
$num_rows = $query->num_rows();
if($num_rows>0)
{
?>
<div class="datagrid project">
    <table>
        <thead>
            <tr>
                <th>Count</th>
                <th>Project Name</th> 
                <th>Client</th> 
                <th>Aktion</th> 
            </tr>
        </thead>
        <tbody>
        <?php
        $count = 0;
        foreach ($query->result() as $row)
        {
            $id = $row->id;
            $project_right = Modules::run('project_right/check_project_right', $id);


            $count++;    
            $zahl = $count + 2;
            if ($zahl % 2 != 0) 
            {
                echo "<tr>";
            } else {
                echo "<tr class='alt'>";
            }
            ?>
                <td><?php echo $count; ?></td>
                <td><?php echo $row->name; ?></td> 
                <td><?php echo $row->client; ?></td>
                <?php
                if($project_right['edit'] == 1)
                {
                    echo "<td class='action'>".anchor('project/create/'.$row->id, 'Edit', 'class="btn"')."</td>";
                }
                else
                {
                    echo "<td class='action'>No Access</td>";
                }
                ?>
            </tr>
        <?php
        }
        ?>
        </tbody>
    </table>
</div>  
<?php
}
?>