#Rename computer
(Get-WmiObject win32_computersystem).rename("newname")
#Join Domain
add-computer -Credential sp-idc1\administrator -DomainName sp-idc1.com
#Restart computer
Restart-Computer