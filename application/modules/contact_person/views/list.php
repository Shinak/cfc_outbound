<div class="datagrid contack_person_list">
    <table>
        <thead>
        <tr>
            <th>Name</th>
            <th>Position</th> 
            <th>Phone</th> 
            <th>Fax</th>
            <th>Mail</th>
            <th>Default</th>
        </tr>
        </thead>
        <tbody>
        <?php
        $count = 0;
        foreach ($query->result() as $row)
        {
            $id = $row->id;
            $count++;    

            $zahl = $count + 2;
            if ($zahl % 2 != 0) 
            {
                echo "<tr>";
            } else {
                echo "<tr class='alt'>";
            }

            
            if($row->title != "")
            {
                $name = $row->salutation." ".$row->title." ".$row->first_name." ".$row->last_name;  
            }
            else
            {
                $name = $row->salutation." ".$row->first_name." ".$row->last_name;
            }

            ?>
                <td class="name"><?php echo $name;?></td>
                <td class="position"><?php echo $row->position; ?></td> 
                <td class="phone"><?php echo $row->phone; ?></td>  
                <td class="fax"><?php echo $row->fax; ?></td>  
                <td class="mail"><?php echo $row->email; ?></td>  
                <td class="default"><?php echo $row->default; ?></td>
            </tr>
            <?php            
        }
        ?>
        </tbody>
    </table>
</div>