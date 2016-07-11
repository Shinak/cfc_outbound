<?php 
    if(isset($flash)){echo $flash;}

    $imgpath =base_url().Modules::run('site_settings/get_img_path');
    $num_rows = $query->num_rows();
    if($num_rows>0)
    {
    ?>
        <div class="datagrid coustomer_list">
        <table>
            <thead>
            <tr>
                <th>C</th>
                <th>Company</th> 
                <th>City</th> 
                <th>State</th>
                <th>Country</th>
                <th>Buisness</th>
                <th>Owner</th>
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

                $resub = $row->resubmission;

                //Country Change to Flag
                if($row->country == "Deutschland")
                {
                    $country = "<img src='".$imgpath."/flag/de.gif' title='".$row->country."'>";
                }
                else
                {  
                    $country = "??";
                }
                
                $zahl = $count + 2;
                if ($zahl % 2 != 0) 
                {
                    echo "<tr>";
                } else {
                    echo "<tr class='alt'>";
                }          
                ?>
                    <td class="count"><?php echo $count; ?></td>
                    <td class="company"><?php echo $row->name; ?></td> 
                    <td class="city"><?php echo $row->city; ?></td>  
                    <td class="state"><?php echo $row->state; ?></td>  
                    <td class="country"><?php echo $country; ?></td>  
                    <td class="buisness"><?php echo $row->buisness; ?></td>  
                    <td class="owner"><?php echo $row->owner; ?></td>
                    <?php 
                    
                    if ($this->uri->segment(1) == "project")
                    {
                        echo "<td class='aktion'>";
                        $is_locked = Modules::run('customer_lock/check_lock',$row->id);
                        if($is_locked != FALSE)
                        {
                            $user = Modules::run('account/get_data_from_db',$is_locked['user_id']);
                            echo "<img src='".$imgpath."schloss.gif' title='is Locked by ".$user['first_name']." ".$user['last_name']."'>"; 
                            
                            echo anchor('customer/outbound/'.$project_id.'/'.$row->id, '<img src="'.$imgpath.'outgoing-call_lock.png" title="This Customer is Locked"');
                            
                        }
                        else
                        {
                            //If the Customer has a Resubmission
                            if($resub == 1)
                            {
                                $resub_data = Modules::run('Customer_resubmission/get_resub_data',$id);
                                
                                $timestamp = time();
                                $date_time = date("Y-m-d - H:i:s", $timestamp);
                                $sql_date_time = $resub_data['date']." - ".$resub_data['time'];
                                
                                $date = Modules::run('global_function/get_date', $resub_data['date'], 'D d.m.Y');
                                $time = substr($resub_data['time'], 0, 5);
                                
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
                                
                                
                            }
                            else
                            {
                                echo anchor('customer/outbound/'.$project_id.'/'.$row->id, '<img src="'.$imgpath.'outgoing-call.png" title="Call this Customer"');
                            }
                        }
                        
                        echo "</td>";
                    }
                    else
                    {
                        echo "<td>".anchor('customer/edit/'.$project_id.'/'.$row->id, 'Edit')."</td>";
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
    else
    {
        echo "<p style='color:red'>No Customers found!<br>You have to upload a Customer List to the Project '".$project_name."'</p>";
        echo anchor('project/create/'.$project_id, 'Edit '.$project_name);
    }
?>