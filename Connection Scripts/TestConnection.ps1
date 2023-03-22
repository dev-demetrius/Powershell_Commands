# Import the bacnet-object module
Import-Module bacnet-object

# Set the BACnet device ID and object ID for the notification
$deviceId = 1212
$objectId = "binary value 1"

# Set the IP address or hostname of the device to test
$ipAddress = "172.31.7.160"

# Test the connection to the device
$result = Test-NetConnection $ipAddress -InformationLevel Quiet
if ($result) {
    # Connection succeeded, do nothing
} else {
    # Connection failed, send a BACnet notification
    $notification = New-BacnetEventNotification -DeviceId $deviceId -ObjectId $objectId -Message "Connection to $ipAddress failed."
    Send-BacnetEventNotification -Notification $notification
}



