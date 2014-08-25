#set static IP address
$ipaddress = "192.168.0.225"
$ipprefix = "24"
$ipgw = "192.168.0.1"
$ipdns = "192.168.0.225"
$ipif = (Get-NetAdapter).ifIndex
New-NetIPAddress -IPAddress $ipaddress -PrefixLength $ipprefix `
-InterfaceIndex $ipif -DefaultGateway $ipgw
#rename the computer
$newname = "DC1"
Rename-Computer -NewName $newname -force
#install features
$featureLogPath = "c:\featurelog.txt"
New-Item $featureLogPath -ItemType file -Force
$addsTools = "RSAT-AD-Tools"
Add-WindowsFeature $addsTools
Get-WindowsFeature | Where installed >>$featureLogPath
#restart the computer
Restart-Computer