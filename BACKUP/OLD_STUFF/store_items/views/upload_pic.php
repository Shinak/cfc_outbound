<h2>Upload Item Picture</h2>
<p>Choose a piture from your computer an then hit 'upload'</p>

<?php 
if(isset($error))
{
    foreach($error as $fault)
    {
        echo $fault;
    }
}
?>

<?php echo form_open_multipart('store_items/do_upload/'.$item_id);?>

<input type="file" name="userfile" size="20" />

<br /><br />

<input type="submit" value="upload" />

</form>


