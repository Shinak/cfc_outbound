<?php

$imgpath =base_url().Modules::run('site_settings/get_img_path');
    $num_rows = $query->num_rows();
    if($num_rows>0)
    {
        $explode = explode('?', current_url());
        $url = $explode['0'];
    ?>
        
    <div class="datagrid coustomer_list">
        <table>
            <thead>
            <tr>
                <th></th>
                <th>Company</th> 
                <th>City</th> 
                <th>Zip Code</th>
                <th>Street</th>
                <th>Country</th>
                <th>URL</th>
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

                //Plus Minus Check cci (customer contact info)
                $cci = false;
                if($_SESSION['d_customer_contact_info'] == $id){$cci = true;}
                
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
                
                $link = anchor($url."?cci=".$id, "<img src='".$imgpath."plus.png' title='Show Contack Person'>");
                if($cci == TRUE){$link = anchor($url."?cci=0", "<img src='".$imgpath."minus.png' title='Hide Contack Person'>");}
                ?>
                    <td class="count"><?php echo $link ?></td>
                    <td class="name"><?php echo $row->name; ?></td> 
                    <td class="city"><?php echo $row->city; ?></td>  
                    <td class="zip_code"><?php echo $row->zip_code; ?></td>  
                    <td class="street"><?php echo $row->street; ?></td>  
                    <td class="country"><?php echo $country; ?></td>
                    <td class="url"><?php echo anchor($row->url, $row->url,'class="url"'); ?></td> 
                    <td class="ower"><?php echo $row->owner; ?></td>
                    <td class="aktion"><?php echo "Edit"; ?></td>
                </tr>
                <?php
                if($cci == TRUE)
                {
                    echo "<tr><td colspan = '9'>";
                        echo Modules::run('contact_person/get_cp_list', $id);
                    echo "</td><tr>";  
                }
            }
            ?>
            </tbody>
        </table>
        </div>
    <?php
    }
    else
    {
        echo "<p style='color:red'>No Company found!<br>You have to upload some Companys and with Contact Person</p>";
        //echo anchor('project/create/'.$project_id, 'Edit '.$project_name);
    }
?>

