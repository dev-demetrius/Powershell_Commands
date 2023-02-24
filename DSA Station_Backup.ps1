$name = $env:COMPUTERNAME
$file = "\\EC2AMAZ-PQI6RL3\Station_Backups\$name.zip"

$compress = @{
  Path = "C:\dsa_station"
  CompressionLevel = "Fastest"
  DestinationPath = $file
}
if (Test-Path $file) {
    
    Write-Host "File Already exists"

} else {

    Stop-Service -Name "dglux_server"

    Compress-Archive @compress -Force

    Start-Service -Name "dglux_server"
    
}
