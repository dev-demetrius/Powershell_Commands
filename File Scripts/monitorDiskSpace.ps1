$Message = ""
$Title = "Drive Details"
$Icon = "Information"
$Threshold = 50

# Get a list of all drives
$Drives = Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType=3" | Select-Object DeviceID,FreeSpace,Size

# Check each drive to see if it's over the threshold
foreach ($Drive in $Drives) {
    $PercentUsed = ($Drive.Size - $Drive.FreeSpace) / $Drive.Size * 100
    if ($PercentUsed -ge $Threshold) {
        $OverThreshold = $true
        Write-Host "Drive $($Drive.DeviceID) is over $($Threshold)% full. ($($PercentUsed)% used)"
        $Message += "Drive $($Drive.DeviceID) is over $($Threshold)% full. ($($PercentUsed)% used)`n"
    } else {
        Write-Host "Drive $($Drive.DeviceID) is $($PercentUsed)% full."
        $Message += "Drive $($Drive.DeviceID) is $($PercentUsed)% full.`n"
    }
}

# Notify user of drive details
[System.Windows.Forms.MessageBox]::Show($Message, $Title, [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::$Icon)

# Notify if any drives are over the threshold
if ($OverThreshold) {
    $Message = "One or more shared drives on this computer are over $($Threshold)% full."
    $Title = "Drive usage warning"
    $Icon = "Warning"
    [System.Windows.Forms.MessageBox]::Show($Message, $Title, [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::$Icon)
} 