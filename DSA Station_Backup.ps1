$name = $env:COMPUTERNAME
$file = "\\Main_Server\Station_Backups\$name.zip"

$compress = @{
  Path = "C:\dsa_station"
  CompressionLevel = "Optimal"
  DestinationPath = $file
}
if (Test-Path $file) {
    
    Write-Host "File Already exists"

} else {

    Stop-Service -Name "dglux_server"

    Compress-Archive @compress -Force

    Start-Service -Name "dglux_server"
    
}
