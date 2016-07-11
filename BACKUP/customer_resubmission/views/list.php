<?php 
    $imgpath =base_url().Modules::run('site_settings/get_img_path');
    //echo $sql."<br><br>";
    $num_rows = $query->num_rows();
    if($num_rows>0)
    {
        //<table cellpadding="2" cellspacing="0" border="1" >
    ?>
    <div class="datagrid coustomer_list">
        <table>
            <thead>
                <tr>
                    <th>Count</th>
                    <th>Company</th> 
                    <th>City</th> 
                    <th>Contact</th>
                    <th>Country</th>
                    <th>Status</th>
                    <th>Calls</th>
                    <th>Resubmission</th> 
                    <th>Action</th>

                </tr>
            </thead>
            <tbody>
            <?php
            $count = 0;
            foreach ($query->result() as $row)
            {
                $id = $row->id;
                $count++;    

                $salut = $row->salutation;
                $title = $row->title;
                $first = $row->first_name;
                $last = $row->last_name;
                $resub = $row->resubmission;

                $name = $salut." ".$title.$first." ".$last;

                //Country Change to Flag
                if($row->country == "Deutschland")
                {
                    $country = "<img src='".$imgpath."/flag/de.gif' title='".$row->country."'>";
                }
                else
                {  
                    $country = "??";
                }

                $resub_data = Modules::run('Customer_resubmission/get_resub_data',$id);

                $timestamp = time();
                $date_time = date("Y-m-d - H:i:s", $timestamp);
                $sql_date_time = $resub_data['date']." - ".$resub_data['time'];

                $date = Modules::run('global_function/get_date', $resub_data['date'], 'D d.m');
                $time = substr($resub_data['time'], 0, 5);

                $zahl = $count + 2;
                if ($zahl % 2 != 0) 
                {
                    echo "<tr>";
                } else {
                    echo "<tr class='alt'>";
                }
                
                ?>
                    <td class="count"><?php echo $count; ?></td>
                    <td class="company"><?php echo $row->company; ?></td> 
                    <td class="city"><?php echo $row->city; ?></td>  
                    <td class="name"><?php echo $name; ?></td>  
                    <td class="country"><?php echo $country; ?></td>  
                    <td class="status"><?php echo $row->status; ?></td>  
                    <td class="calls"><?php echo $row->calls; ?></td>      
                    <?php 
                    if($date_time >= $sql_date_time){echo "<td style='color:red;' >";}
                    else{echo "<td>";}
                        echo $date.' - '.$time; 
                    echo "</td>";                
                    echo "<td>";
                        if($date_time >= $sql_date_time)
                        {
                            $title = "The resubmission time has expired! ".$resub_data['user_name']." had set the resubmission to ".$date." on ".$time." a'clock";
                            echo anchor('customer/outbound/'.$project_id.'/'.$row->id.'/ur', '<img src="'.$imgpath.'clock_red_32.png" title="'.$title.'">');
                        }
                        else
                        {
                            $title = "This customer has a resubmission from ".$resub_data['user_name']." to ".$date." on ".$time." a'clock";
                            echo anchor('customer/outbound/'.$project_id.'/'.$row->id.'/ur', '<img src="'.$imgpath.'clock_32.png" title="'.$title.'">');
                        }  
                    echo "</td>";
                echo "</tr>";
            }
            ?>
            </tbody>       
        </table>
    </div>
    <?php
    }
    
?>
