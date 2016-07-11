<?php
echo "<div class='info_div'>";
if($query->num_rows() > 0)
{
    echo "<table id='change_info'><tr><th>Old Value</th><th>New Value</th></tr>";
        
    foreach ($query->result() as $row)
    {
        echo "<tr>";
            echo "<td class='td_old'>".$row->value_old."</td>";  
            echo "<td class='td_new'>".$row->value_new."</td>";
        echo "</tr>";    
    }
    echo "</table>";
}
else
{
    echo "<p>No Data Found</p>";
}
echo "</div>";
