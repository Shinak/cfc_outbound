<div class="datainfo">
    <table>
        <thead>
            <tr>
                <th>System Info</th>
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
            if($row->info_typ == 'system')
            {

                $date = substr($row->create_date, 0, 10);
                $date = Modules::run('global_function/get_date',$date,'d.m.Y');
                $time = substr($row->create_date, 11, 5);
            ?>
                <td class='td_info'><?php echo $row->info; ?></td>
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

