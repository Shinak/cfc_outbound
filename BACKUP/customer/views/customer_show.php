    
<div class="datagrid customer">
    <table>
        <thead>
            <tr>
                <th class='label_top' colspan ='2'>Customer Information</th>   
            </tr> 
        </thead>
        <tbody>
            <tr>
                <td class='label'>Name</td>
                <td class='data'><?php echo $salutation." ".$title." ".$first_name." ".$last_name;?></td>    
            </tr>
            <tr class='alt'>
                <td class='label'>e-Mail</td>
                <td class='data'><?php if($email != ""){echo mailto($email, $email);}?></td>    
            </tr>
            <tr>
                <td class='label'>Phone</td>
                <td class='data'><?php echo $phone ?></td>    
            </tr>
            <tr class='alt'>
                <td class='label'>Fax</td>
                <td class='data'><?php echo $fax ?></td>    
            </tr>
        </tbody>
    </table>
</div>
<br>
    <div class="datagrid customer">
    <table>
        <thead>
            <tr>
                <th class='label_top' colspan='2'>Company Information</th>   
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class='label'>Company</td>
                <td class='data'><?php echo $company;?></td>    
            </tr>
             <tr class='alt'>
                <td class='label'>Street</td>
                <td class='data'><?php echo $street;?></td>    
            </tr>
            <tr>
                <td class='label'>Zip Code - City</td>
                <td class='data'><?php echo $zip_code." ".$city;?></td>    
            </tr>
            <tr class='alt'>
                <td class='label'>Country</td>
                <td class='data'><?php echo $country;?></td>    
            </tr>
            <tr>
                <td class='label'>Homepage</td>
                <td class='data'><?php 
                    if($url != "")
                    {
                        $url_name = str_ireplace('http://www.', '', $url);
                        $strlen = strlen($url_name);
                        $url_name = substr($url_name, 0, $strlen-1);
                        echo anchor_popup($url, $url_name);
                    }
                    else
                    {
                        echo "Emptry";
                    }
                ?></td>    
            </tr>
        </tbody>
    </table>
</div>

