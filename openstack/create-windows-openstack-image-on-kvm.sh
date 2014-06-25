#!/usr/bin/env bash
#########################################
#Function:    Create windows image for kvm
#Usage:       bash create-windows-openstack-image-on-kvm.sh
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

IMAGE=windows-server-2012-r2.qcow2
FLOPPY=Autounattend.vfd
VIRTIO_ISO=virtio-win-0.1-52.iso
ISO=9600.16384.WINBLUE_RTM.130821-1623_X64FRE_SERVER_EVAL_EN-US-IRM_SSS_X64FREE_EN-US_DV5.ISO
 
KVM=/usr/libexec/qemu-kvm
if [ ! -f "$KVM" ]; then
    KVM=/usr/bin/kvm
fi
 
qemu-img create -f qcow2 -o preallocation=metadata $IMAGE 16G
 
$KVM -m 2048 -smp 2 -cdrom $ISO -drive file=$VIRTIO_ISO,index=3,media=cdrom -fda $FLOPPY $IMAGE \
-boot d -vga std -k en-us -vnc :1