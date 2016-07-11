<?php

echo "Cornjob index Page";
echo br(2);
echo "<ul>";
echo "<li>".anchor('cronjob/check_lock', 'Check User Customer Lock')."</li>";
echo "<li>".anchor('cronjob/check_resubmission', 'Check Resubmission Expired')."</li>";
echo "</ul>";

?>
