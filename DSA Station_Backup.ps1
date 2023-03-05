$name = $env:COMPUTERNAME
$sourceFolder = "C:\dsa_station"
$destinationFolder = "\\Shared_Computer\Station_Backups"
$zipFilePath = "C:\$name.zip"

Stop-Service -Name "dglux_server"

if (!(Test-Path $zipFilePath)) {
    
    [System.IO.Compression.ZipFile]::CreateFromDirectory($sourceFolder, $zipFilePath, [System.IO.Compression.CompressionLevel]::Optimal, $false)
    
} else {

    Compress-Archive -Path $sourceFolder -Update -DestinationPath $zipFilePath -Force

}

Copy-Item $zipFilePath $destinationFolder -Recurse

Start-Service -Name "dglux_server"
