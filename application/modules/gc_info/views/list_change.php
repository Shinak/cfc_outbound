<?php
$imgpath =base_url().Modules::run('site_settings/get_img_path');
?>
    <div class="datainfo">
        <table >
            <thead>
                <tr>
                    <th >Change Info</th>
                    <th >Name</th>
                    <th >Time</th>
                    <th >Date</th>
                </tr>
            </thead>
            <tbody>
            <?php
            $count = 0;
            foreach ($query->result() as $row)
            {
                if($row->info_typ == 'user_change')
                {
                    $user = Modules::run('account/get_data_from_db',$row->user_id);

                    $date = substr($row->create_date, 0, 10);
                    $date = Modules::run('global_function/get_date',$date,'d.m.Y');
                    $time = substr($row->create_date, 11, 5);

                    $count++;

                    $zahl = $count + 2;
                    if ($zahl % 2 != 0) 
                    {
                        echo "<tr>";
                    } else {
                        echo "<tr class='alt'>";
                    }

                    if($row->info == 'Edit some customer values')
                    {

                        $div = Modules::run('gc_changes/list_changes', $row->customer_id, $row->user_id, $row->create_date);
                        echo "<td class='td_info'>".$row->info." <a class='a_span' href='#'><img src='".$imgpath."information.png'><span class='span_info'>".$div."</span></a></td>";

                    }
                    else
                    {
                        echo "<td class='td_info'>".$row->info."</td>";
                    }
                    ?>
                    <td ><?php echo $user['first_name'].' '.$user['last_name'];?></td>
                    <td ><?php echo $time; ?></td>
                    <td ><?php echo $date;?></td>
                </tr>

            <?php     
                }
            }
            ?>
            </tbody>
        </table>
    </div>
