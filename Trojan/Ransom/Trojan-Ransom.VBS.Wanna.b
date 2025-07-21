SET ow = WScript.CreateObject("WScript.Shell")
SET om = ow.CreateShortcut("C:\Users\Admin\Desktop\@WanaDecryptor@.exe.lnk")
om.TargetPath = "C:\Users\Admin\Desktop\@WanaDecryptor@.exe"
om.Save
