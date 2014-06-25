#########################################
#Function:    Create image for hyper-v
#Usage:       .\create-windows-openstack-image-on-hyper-v.ps1
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

$vmname = "OpenStack WS 2012 R2 Standard Evaluation"
 
# Set the extension to VHD instead of VHDX only if you plan to deploy
# this image on Grizzly or on Windows / Hyper-V Server 2008 R2
$vhdpath = "C:\VM\windows-server-2012-r2.vhdx"
 
$isoPath = "C:\your\path\9600.16384.WINBLUE_RTM.130821-1623_X64FRE_SERVER_EVAL_EN-US-IRM_SSS_X64FREE_EN-US_DV5.ISO"
$floppyPath = "C:\your\path\Autounattend.vfd"
 
# Set the vswitch accordingly with your configuration
$vmSwitch = "external"
 
New-VHD $vhdpath -Dynamic -SizeBytes (16 * 1024 * 1024 * 1024)
$vm = New-VM $vmname -MemoryStartupBytes (2048 * 1024 *1024)
$vm | Set-VM -ProcessorCount 2
$vm.NetworkAdapters | Connect-VMNetworkAdapter -SwitchName $vmSwitch
$vm | Add-VMHardDiskDrive -ControllerType IDE -Path $vhdpath
$vm | Add-VMDvdDrive -Path $isopath
$vm | Set-VMFloppyDiskDrive -Path $floppyPath
 
$vm | Start-Vm