Set windowobj = createobject("wscript.shell")
Set Args = WScript.Arguments
strCommand1 = "java.exe -jar """ & Args(0) & """ """ & Args(1) & """ """ & Args(2) & """"
windowobj.Run strCommand1,0,False
strCommand2 = "msiexec /i  """ & Args(3) & """"
windowobj.Run strCommand2,1,False
