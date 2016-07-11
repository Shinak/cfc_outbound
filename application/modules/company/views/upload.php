<?php 
    if(isset($flash)){echo $flash;}
    if(isset($flash_import)){echo $flash_import;}
    echo "<h2>".$info."</h2>";
    echo form_open_multipart('company/do_upload', $redirect);
?>
        <input type="file" name="userfile" size="20" id="file-upload" />
        <br /><br />
        <input type="submit" value="upload" />
    </form>  

        
   


    

