
$UserCredential = Get-Credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/mycompany/ -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session

ADD FORWARDING
Set-Mailbox -Identity user@domain.example -ForwardingSMTPAddress user@domain.example

REMOVE FORWARDING
Set-Mailbox -Identity user@domain.example -ForwardingSMTPAddress $null

LIST ALL FORWARDINGS CURRENTLY SET
Get-Mailbox | select ForwardingSmtpAddress,DeliverToMailboxAndForward

LIST FORWARDING SET FOR USER
Get-Mailbox user@domain.example | Format-List ForwardingSMTPAddress,DeliverToMailboxandForward

Remove-PSSession $Session