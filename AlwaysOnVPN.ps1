#--------------------------------------------------
<#This PowerShell script runs an infinite loop that
continuously checks the status of a VPN connection. 
If the connection is currently disconnected, the 
script executes a batch to reconnect to server.#>
#---------------------------------------------------

# Loop to check connection status every 5 minutes
while ($true)
{
    $vpnname = "VPN_Server"
    $vpn = Get-VpnConnection -AllUserConnection | where {$_.Name -eq $vpnname}
    if ($vpn.ConnectionStatus -eq "Disconnected")
    {
        # Referenced .bat file that includes connection and credentials
        start-process "C:\Windows\AutoConnectVPN.bat"
    }

    Start-Sleep -seconds 300
    
}
