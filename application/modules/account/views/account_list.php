<?php
$num_rows = $query->num_rows();
if($num_rows>0)
{
?>
<div class="datagrid account">
    <table>
        <thead>
            <tr>
                <th>Count</th>
                <th>Last Name</th> 
                <th>First Name</th>
                <th>Username</th>
                <th>Action</th> 
            </tr>
        </thead>
        <tbody>
            <?php
            $count = 0;
            foreach ($query->result() as $row)
            {
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
                <td><?php echo $row->last_name; ?></td>
                <td><?php echo $row->first_name; ?></td>
                <td><?php echo $row->username; ?></td>
                <td class="action"><?php echo anchor('account/create/'.$row->id, 'Edit User', 'class="btn"'); ?></td> 
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