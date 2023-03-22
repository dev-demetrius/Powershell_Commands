$programs = @(
    @{Name = "Google Chrome"; Path = "D:\ChromeSetup.exe"; Args = ""},
    @{Name = "Java"; Path = "D:\JavaSetup8u181.exe"; Args = ""},
    @{Name = "Teamviewer"; Path = "D:\TeamViewer_Setup.exe"; Args = "/sAll"},
    @{Name = "Time Registry"; Path = "D:\HKLM-w32time.reg"; Args = "/sAll"}
)

$errors = @()
foreach ($program in $programs) {
    try {
        Write-Host "Installing $($program.Name)..."
        Start-Process -FilePath $program.Path -ArgumentList $program.Args -Wait -ErrorAction Stop
    }
    catch {
        $errors += $_.Exception.Message
        Write-Host "Error installing $($program.Name): $($_.Exception.Message)" -ForegroundColor Red
    }
}

if ($errors.Count -gt 0) {
    Write-Host "Installation complete with errors:" -ForegroundColor Red
    $errors | ForEach-Object { Write-Host "- $_" }
    $message = "Installation complete with errors.`n" + ($errors -join "`n")
} else {
    Write-Host "Installation complete." -ForegroundColor Green
    $message = "Installation complete."
}

Expand-Archive -Path "D:\dsa_station.zip" -DestinationPath "C:\"
Add-MpPreference -ExclusionPath "C:\path\to\your\folder"


$accountSid = "AC182cc57e35402f1eeb4f842f980ac96c"
$authToken = "7ff3e98603b58c3e3ff82a2bd376e1b0"

# Set your Twilio phone number and recipient phone number
$twilioPhoneNumber = "+18444390071"
$recipientPhoneNumber = "+12294499921"

# Send the message using the Twilio API
$uri = "https://api.twilio.com/2010-04-01/Accounts/$accountSid/Messages"
$body = @{
    From = $twilioPhoneNumber
    To = $recipientPhoneNumber
    Body = $message
} | ConvertTo-Json
$headers = @{
    Authorization = "Basic " + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("${accountSid}:${authToken}"))
    "Content-Type" = "application/json"
}

Invoke-RestMethod -Uri $uri -Method POST -Body $body -Headers $headers
