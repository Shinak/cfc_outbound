<tr class='alt'>
    <?php $link = anchor($url."?cci=".$id, "<img src='".$imgpath."plus.png' title='Show Contack Person'>");
    if($cci == TRUE){$link = anchor($url."?cci=0", "<img src='".$imgpath."minus.png' title='Hide Contack Person'>");}?>
                
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
