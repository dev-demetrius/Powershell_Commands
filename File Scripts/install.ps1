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


