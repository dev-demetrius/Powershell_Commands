# This script sets the execution policy to bypass to allow it to run without restrictions
Set-ExecutionPolicy Bypass -force

# This command adds a VPN connection named "VPN_Server" with the specified settings
Add-VpnConnection -Name "VPN_Server" -ServerAddress "192.168.1.1" -AllUserConnection $true -SplitTunneling $true -AuthenticationMethod MSChapv2 -TunnelType "L2tp" -EncryptionLevel Required -PassThru

