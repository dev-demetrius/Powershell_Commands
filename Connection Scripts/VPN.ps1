Set-ExecutionPolicy Bypass -force

Add-VpnConnection -Name "MetroLink" -ServerAddress "54.210.213.187" -AllUserConnection $true -SplitTunneling $true -AuthenticationMethod MSChapv2 -TunnelType Automatic -EncryptionLevel Required -PassThru
