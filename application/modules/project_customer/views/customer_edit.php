    
<?php

echo form_hidden('customer_id', $customer_id);

?>
    <table id="outbound_customer" cellpadding="7" cellspacing="0" border="0" width="600">
        <tr>
            <td valign="top" colspan = 2>Customer Information</td>   
        </tr>
        <tr>
            <td valign="top">
            <?php 
                $data_salut = array(
                    'name'          => 'salutation',
                    'id'            => 'salutation',
                    'value'         => $salutation,
                    'maxlength'     => '4',
                    'size'          => '4' 
                );
                echo form_label('Salutation', 'salutation')."</td><td>".form_input($data_salut);
            ?>
            </td>    
        </tr>
        <tr>
            <td valign="top">
            <?php 
                $data_title = array(
                    'name'          => 'title',
                    'id'            => 'title',
                    'value'         => $title,
                    'maxlength'     => '5',
                    'size'          => '5' 
                );
                echo form_label('Title', 'title')."</td><td>".form_input($data_title);
            ?>
            </td>    
        </tr>
        <tr>
            <td valign="top">
            <?php 
                $data_first_name = array(
                    'name'          => 'first_name',
                    'id'            => 'first_name',
                    'value'         => $first_name,
                    'maxlength'     => '50',
                    'size'          => '20' 
                );
                echo form_label('First Name', 'first_name')."</td><td>".form_input($data_first_name);
            ?>
            </td>    
        </tr>
        <tr>
            <td valign="top">
            <?php 
                $data_last_name = array(
                    'name'          => 'last_name',
                    'id'            => 'last_name',
                    'value'         => $last_name,
                    'maxlength'     => '50',
                    'size'          => '20' 
                );
                echo form_label('Last Name', 'last_name')."</td><td>".form_input($data_last_name);
            ?>
            </td>    
        </tr>
        <tr>
            <td valign="top">
            <?php 
                $data_email = array(
                    'name'          => 'email',
                    'id'            => 'email',
                    'value'         => $email,
                    'maxlength'     => '50',
                    'size'          => '20' 
                );
                echo form_label('E-Mail', 'email')."</td><td>".form_input($data_email);
            ?>
            </td>    
        </tr>
        <tr>
            <td valign="top">
            <?php 
                $data_phone = array(
                    'name'          => 'phone',
                    'id'            => 'phone',
                    'value'         => $phone,
                    'maxlength'     => '50',
                    'size'          => '20' 
                );
                echo form_label('Phone', 'phone')."</td><td>".form_input($data_phone);
            ?>
            </td>    
        </tr>
        <tr>
            <td valign="top">
            <?php 
                $data_fax = array(
                    'name'          => 'fax',
                    'id'            => 'fax',
                    'value'         => $fax,
                    'maxlength'     => '50',
                    'size'          => '20' 
                );
                echo form_label('Fax', 'fax')."</td><td>".form_input($data_fax);
            ?>
            </td>    
        </tr>
    </table>
    <table id="outbound_company" cellpadding="7" cellspacing="0" border="0" width="600">
        <tr>
            <td valign="top" colspan = 2>Company Information</td>   
        </tr>
        <tr>
            <td valign="top">
            <?php 
                $data_company = array(
                    'name'          => 'company',
                    'id'            => 'company',
                    'value'         => $company,
                    'maxlength'     => '50',
                    'size'          => '20' 
                );
                echo form_label('Company', 'company')."</td><td>".form_input($data_company);
            ?>
            </td>    
        </tr>
        <tr>
            <td valign="top">
            <?php 
                $data_street = array(
                    'name'          => 'street',
                    'id'            => 'street',
                    'value'         => $street,
                    'maxlength'     => '50',
                    'size'          => '20' 
                );
                echo form_label('Street', 'street')."</td><td>".form_input($data_street);
            ?>
            </td>    
        </tr>
        <tr>
            <td valign="top">
            <?php 
                $data_zip_code = array(
                    'name'          => 'zip_code',
                    'id'            => 'zip_code',
                    'value'         => $zip_code,
                    'maxlength'     => '6',
                    'size'          => '5' 
                );
                echo form_label('Zip Code', 'zip_code')."</td><td>".form_input($data_zip_code);
            ?>
            </td>    
        </tr>
        <tr>
            <td valign="top">
            <?php 
                $data_country = array(
                    'name'          => 'country',
                    'id'            => 'country',
                    'value'         => $country,
                    'maxlength'     => '50',
                    'size'          => '20' 
                );
                echo form_label('Country', 'country')."</td><td>".form_input($data_country);
            ?>
            </td>    
        </tr>
        <tr>
            <td valign="top">
            <?php 
                $data_url = array(
                    'name'          => 'url',
                    'id'            => 'url',
                    'value'         => $url,
                    'maxlength'     => '50',
                    'size'          => '20' 
                );
                echo form_label('Url', 'url')."</td><td>".form_input($data_url);
            ?>
            </td>    
        </tr>
    </table>

