$hostname_srv = hostname

$log_file = "C:\Scripts\WSUSCleanup\WSUSCleanup_$(Get-Date -Format "MM-dd-yyyy-HH-mm").log"

try {
    $upd_1 = Get-WsusServer $hostname_srv -PortNumber 8530 | Invoke-WsusServerCleanup -CleanupObsoleteComputers -ErrorAction SilentlyContinue
    add-content $log_file -Value $upd_1
    $upd_2 = Get-WsusServer $hostname_srv -PortNumber 8530 | Invoke-WsusServerCleanup -CleanupObsoleteUpdates -ErrorAction SilentlyContinue
    add-content $log_file -Value $upd_2
    $upd_3 = Get-WsusServer $hostname_srv -PortNumber 8530 | Invoke-WsusServerCleanup -DeclineSupersededUpdates -ErrorAction SilentlyContinue
    add-content $log_file -Value $upd_3
    $upd_4 = Get-WsusServer $hostname_srv -PortNumber 8530 | Invoke-WsusServerCleanup -DeclineExpiredUpdates -ErrorAction SilentlyContinue
    add-content $log_file -Value $upd_4
    $upd_5 = Get-WsusServer $hostname_srv -PortNumber 8530 | Invoke-WsusServerCleanup -CleanupUnneededContentFiles -ErrorAction SilentlyContinue
    add-content $log_file -Value $upd_5
    $upd_6 = Get-WsusServer $hostname_srv -PortNumber 8530 | Invoke-WsusServerCleanup -CompressUpdates -ErrorAction SilentlyContinue
    add-content $log_file -Value $upd_6
    $approved_upd = (Get-WsusUpdate -Approval Approved -Status Any | measure).count
    add-content $log_file -Value $approved_upd
}
catch {
    $Error_message = $PSItem.Exception.Message
    add-content $log_file -Value $Error_message
}

$Body = "
<html>
<body>
<table border='2' style='background-color:#FFFFE0;>
<tr style='background-color:CCFFFF'>
<th>
<h3>Очистка WSUS</h3>
</th>
</tr>
<tr>
<p>$upd_1</p>
</tr>
<tr>
<p>$upd_2</p>
</tr>
<tr>
<p>$upd_3</p>
</tr>
<tr>
<p>$upd_4</p>
</tr>
<tr>
<p>$upd_5</p>
</tr>
<tr>
<p>$upd_6</p>
</tr>
<tr>
<th>
<p><b>Approved</b></p>
</th>
</tr>
<tr>
<p>Count: $approved_upd</p>
</tr>

</table>
</body>
</html>
"


$From = $hostname_srv+"@domain.com"
$To = "Information@domain.com" 
$Subject = "Очистка WSUS"
$SMTPServer = "smtp.domain.com"
$SMTPPort = "25"
$encoding = [System.Text.Encoding]::UTF8


Send-MailMessage -From $From -to $To -Subject $Subject -Bodyashtml -Body $Body -SmtpServer $SMTPServer -Port $SMTPPort -Attachments $log_file -Encoding $encoding -ErrorAction Stop
# kurdyaevdo