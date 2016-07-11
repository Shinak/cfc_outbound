<script type="text/javascript" src="<?php echo base_url();?>resources/js/counter.js"></script> 
<link rel="stylesheet" href="<?php echo base_url();?>resources/css/timer.css">
<script type="text/javascript">				
    window.onload = function () 
    {
        new countdown(<?php  echo $p_time ?>, 'counter1');
    };		
</script>

<div id="timer">
    <div class="stime">
        <div class="text">Start Time:</div>
        <div class="data"><?php echo $start_time;?></div>
    </div>    
    
    <div id="task_rtime" class="atime">
	<div class="text">Active Time:</div> 
	<div id="counter1" class="data"></div>
    </div>
</div>