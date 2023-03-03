#-------------------------------------------------------------
 This script is used to gather disabled Active Directory users
 and email the result.
#-------------------------------------------------------------


# Define the email parameters
$EmailTo = "email recipient"
$EmailFrom = "email used to send"
$EmailPassword = "xynskjxvucuvllbm"
$SMTPServer = "smtp.gmail.com"
$SMTPPort = 587

# Create a credential object for authenticating with Gmail
$Credential = New-Object System.Management.Automation.PSCredential ($EmailFrom, (ConvertTo-SecureString $EmailPassword -AsPlainText -Force))

# Get all disabled user accounts in Active Directory
$DisabledUsers = Get-ADUser -Filter {Enabled -eq $False} -Properties *

# If any disabled users were found, email the list to yourself
if ($DisabledUsers) {
    # Construct the email body
    $EmailSubject = "List of Disabled User Accounts in Active Directory"
    $EmailBody = "The following user accounts are currently disabled in Active Directory:`r`n`r`n"
    foreach ($User in $DisabledUsers) {
        $EmailBody += "- $($User.SamAccountName) ($($User.EmailAddress))"
    }

    # Send the email using Gmail's SMTP server
    Send-MailMessage -To $EmailTo -From $EmailFrom -Subject $EmailSubject -Body $EmailBody -SmtpServer $SMTPServer -Port $SMTPPort -UseSsl -Credential $Credential
}
else {
    Write-Output "No disabled user accounts found in Active Directory."
}
