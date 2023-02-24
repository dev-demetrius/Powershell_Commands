while ($true)
{
    $vpnname = "VPN_Server"
    $vpn = Get-VpnConnection -AllUserConnection | where {$_.Name -eq $vpnname}
    if ($vpn.ConnectionStatus -eq "Disconnected")
    {
        start-process "C:\Windows\AutoConnectVPN.bat"
    }

    Start-Sleep -seconds 300
    
}
