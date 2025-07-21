<?php
$testa = $_POST['veio'];
if($testa != "") {
	$message = $_POST['html'];
	$subject = $_POST['assunto'];
	$nome = $_POST['nome'];
	$de = $_POST['de'];
	$to = $_POST['emails'];

	$headers  = "MIME-Version: 1.0\r\n";
	$headers .= "Content-type: text/html; charset=iso-8859-1\r\n";

	$email = explode("\n", $to);
	$headers .= "From: ".$nome." <".$de.">\r\n";
	$message = stripslashes($message);

	$i = 0;
	$count = 1;
	while($email[$i]) {
		$ok = "ok";
		if(mail($email[$i], $subject, $message, $headers))
		echo "[Enviando..] N&#250;mero: $count <b>".$email[$i]."</b> <font color=green>[Enviado]</font><br><hr>";
		else
		echo "[Enviando..] N&#250;mero: $count <b>".$email[$i]."</b> <font color=red>[All Erros]</font><br><hr>";
		$i++;
		$count++;
	}
	$count--;
	if($ok == "ok")
	echo ""; 

}

?>
<html>
<head>
<title>by TeobaldO</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style>
body {
	margin-left: 0;
	margin-right: 0;
	margin-top: 0;
	margin-bottom: 0;
}
.titulo {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 70px;
	color: #000000;
	font-weight: bold;
}

.normal {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #000000;
}

.form {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 10px;
	color: #333333;
	background-color: #FFFFFF;
	border: 1px dashed #666666;
}

.texto {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
}

.alerta {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
	color: #990000;
	font-size: 10px;
}
.style7 {color: #FFFFFF; font-family: Verdana, Arial, Helvetica, sans-serif;}
.style11 {color: #000000}
.style12 {font-weight: bold; font-size: 10px; font-family: Verdana, Arial, Helvetica, sans-serif;}
.style14 {font-family: Verdana, Arial, Helvetica, sans-serif; font-weight: bold; color: #FFFFFF; }
.style16 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
	color: #000000;
	font-size: 12px;
}
.style19 {
	color: #FFFFFF;
	font-weight: bold;
	font-size: 24px;
	font-style: italic;
}
.style20 {font-size: 14px}
.style21 {
	font-weight: bold;
	color: #000000;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-style: italic;
	font-size: 20px;
}
</style>
</head>
<body>
<form action="" method="post" enctype="multipart/form-data" name="form1">
  <input type="hidden" name="veio" value="sim">
  <table width="464" height="504" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC" class="normal">
    <tr>
      <td width="462" height="25" align="center" bgcolor="#99CCFF"><span class="style19">SPAM</span></td>
    </tr>
    <tr>
      <td height="194" valign="top" bgcolor="#FFFFFF">
	  	<table width="100%"  border="0" cellpadding="0" cellspacing="5" class="normal" height="444">
		  <tr>
            <td align="right" height="17"><p class="texto">De: Nome: / E-Mail:</p>            </td>
            <td width="65%" height="17"><input name="nome" type="text" class="form" id="nome" style="width:48%" > <input name="de" type="text" class="form" id="de" style="width:49%" ></td>
          </tr>
          <tr>
            <td align="right" height="17"><span class="texto">Assunto:</span></td>
            <td height="17"><input name="assunto" type="text"class="form" id="assunto" style="width:100%" ></td>
          </tr>
          <tr align="center" bgcolor="#99CCFF">
            <td height="20" colspan="2" bgcolor="#99CCFF"><span class="style14">C&oacute;digo HTML:</span></td>
          </tr>
          <tr align="right">
            <td height="146" colspan="2" valign="top"><span class="style11"><br>
                <textarea name="html" style="width:100%" rows="8" wrap="VIRTUAL" class="form" id="html"></textarea>
                <span class="style12">*Lembrete: texto em HTML</span></span></td>
          </tr>
          <tr align="center" bgcolor="#99CCFF">
            <td height="47" colspan="2"><span class="style7">Coloque o email de suas vitimas abaixo: </span>
              <p class="style7">OBS: um e-mail em cima do outro </td>
          </tr>
          <tr align="right">
            <td height="136" colspan="2" valign="top"><br>
              <textarea name="emails" style="width:100%" rows="8" wrap="VIRTUAL" class="form" id="emails"></textarea>
              <span class="style16">*<em><strong><strong></strong></strong></em></span><h3><h2 class="style20"><span class="style21">Sistema De Spam</span></h2>
              </h3><span class="style16"><em><strong></strong></em></span><span class="style16">  </span> </td>
          </tr>
          <tr>
            <td height="26" align="right" valign="top" colspan="2"><input type="submit" name="Submit" value="Enviar"></td>
          </tr>
        </table>
	  </td>
    </tr>
    <tr>
      <td height="16" align="center" bgcolor="#99CCFF"><em><strong>SPAM ROX </strong></em></td>
    </tr>
  </table>
</form>
</body>