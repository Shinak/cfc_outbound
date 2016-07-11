<?php

//Load Calenderdate JS File
echo '<script type="text/javascript" src="'.base_url().Modules::run('site_settings/get_js_path').'calendarDateInput.js"></script>';

$plus_day = strtotime("+1 day");
$rr_date1 = date('d-M-Y', $plus_day);
$now = date('H:i');
?>

<div id="err">
    <div class="bg1"></div>
    <div class="resubmission">
        <?php   echo form_open($form_location);?>
        <table>
            <tr>
                <td colspan="2">Resubmission to:</td>
            </tr>
            <tr>
                <td>Date:</td>
                <td>
                    <div class="date">	
                        <script>
                            var daten ="<?php  echo $rr_date1 ?>"
                            DateInput('date1', true, 'DD-MM-YYYY', daten)
                        </script>
                    </div>
                </td>
            </tr>
            <tr>
                <td>Time:</td>
                <td>
                    <?php
                    echo nbs(1).form_dropdown('resub_time_h', $input_time_h, $sel_h);
                    echo ": ";
                    echo form_dropdown('resub_time_m', $input_time_m, $sel_m);
                    ?>
                </td>
            </tr>
        </table>
        <?php    
            echo br(1);
            echo form_submit('save_resub', 'Save Resubmission');
            echo form_submit('cancel_resub', 'Cancel Resubmission');
            echo form_close();
        ?>
    </div>
</div>
