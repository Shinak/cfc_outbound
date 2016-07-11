<div class="datainfo">
    <table>
        <thead>
            <tr>
                <th>Company Info to Project</th>
                <th>Name</th>
                <th>Time</th>
                <th>Date</th>
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
            
            if($row->info_typ == 'user_text')
            {
                $user = Modules::run('account/get_data_from_db',$row->user_id);
                
                $date = substr($row->create_date, 0, 10);
                $date = Modules::run('global_function/get_date',$date,'d.m.Y');
                $time = substr($row->create_date, 11, 5);
            ?>
            
                <td class="td_info"><?php echo $row->info; ?></td>
                <td><?php echo $user['first_name'].' '.$user['last_name'];?></td>
                <td><?php echo $time; ?></td>
                <td><?php echo $date;?></td>
            </tr>
        <?php
            }
        }
        ?>
        </tbody>
    </table>
</div>

