<html>
    <head></head>
    <body style="background-color: blue;">   
        <table width="900" align="center" border="1" style="background-color: yellow;">
            <tr><td align="center" valign="center" colspan="2" style="background-color: cyan;"><h1>TWO COL LAYOUT</h1></td></tr> 
            <tr>
                <td width="200" valign="top" style="background-color: pink;">LEFT NAV HERE</td>
                <td height="500" valign="top">
                    <?php
                        $this->load->view($module.'/'.$view_file);
                    ?>
                </td>
            </tr>  
        </table> 
    </body>   
</html>




