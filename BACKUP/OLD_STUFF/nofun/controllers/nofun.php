<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Nofun extends MX_Controller 
{
    
    function index()
    {
        echo "Hello your are looking good today";
    } 
    
    function sayhello($firstname, $lastname)
    {
        echo "Hello. How do you do $firstname $lastname?";
    }
    
}
