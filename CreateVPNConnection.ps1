Set-ExecutionPolicy Bypass -force

Add-VpnConnection -Name "VPN_Server" -ServerAddress "192.168.1.1" -AllUserConnection $true -SplitTunneling $true -AuthenticationMethod MSChapv2 -TunnelType Automatic -EncryptionLevel Required -PassThru
