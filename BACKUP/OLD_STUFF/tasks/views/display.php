<h1>Your Tasks</h1>

<?php
    echo anchor('tasks/create', 'Create New Tasks');

    foreach ($query->result() as $row)
    {
        $edit_url = base_url().'tasks/create/'.$row->id;
        echo "<h2>".$row->title." &nbsp; &nbsp; <a href='".$edit_url."'>EDIT</a></h2>";
    }

    echo "<hr>";
    $firstname = "Christian";
    $lastname = "Barth";
    $this->load->module('nofun');
    $this->nofun->sayhello($firstname, $lastname);
    
    echo "<hr>";
    
    echo Modules::run('nofun/sayhello', $firstname, $lastname);
    
?>

