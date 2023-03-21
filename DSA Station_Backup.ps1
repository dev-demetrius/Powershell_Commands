#---------------------------------------------------------
<#This script creates a backup of a folder containing data, 
compresses it, and copies it to a destination folder while 
also stopping and starting a service. Note that certain 
folders may be used by an application and cannot be 
moved, copied, or deleted #until the application has 
terminated.#>
#---------------------------------------------------------


# Get the name of the current computer
$name = $env:COMPUTERNAME

# Define the source folder containing the data to be backed up
$sourceFolder = "C:\dsa_station"

# Define the destination folder where the backup will be stored
$destinationFolder = "\\Shared_Computer\Station_Backups"

# Define the path for the zip file that will be created
$zipFilePath = "C:\$name.zip"

# Stop the service
Stop-Service -Name "dglux_server"

# If the zip file doesn't exist, create it from the source folder
if (!(Test-Path $zipFilePath)) {
    
    [System.IO.Compression.ZipFile]::CreateFromDirectory($sourceFolder, $zipFilePath, [System.IO.Compression.CompressionLevel]::Optimal, $false)
    
} 
# If the zip file does exist, update it with the latest changes to the source folder
else {

    Compress-Archive -Path $sourceFolder -Update -DestinationPath $zipFilePath -Force

}

# Copy the zip file to the destination folder
Copy-Item $zipFilePath $destinationFolder -Recurse

# Start the service
Start-Service -Name "dglux_server"
