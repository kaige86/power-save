#!/bin/bash

mod_delf=/etc/modprobe.d/blacklist-nvidia-nouveau.conf
rc_localf=/etc/rc.local


# disable nouveau and nvidia
touch $mod_delf
echo "blacklist nouveau" >> $mod_delf
echo "options nouveau modeset=0" >> $mod_delf
echo "blacklist nvidia" >> $mod_delf
echo "Add nouveau nvidia to blacklist"


# auto suspend nvidia after boot
devid=$(lspci | grep NVIDIA | awk '{print $1}')
if ! test -f $rc_localf ; then
  touch $rc_localf
  echo "#!/bin/bash" >> $rc_localf
fi
sed -i '/^exit/d' $rc_localf
echo "echo \"auto\" > /sys/bus/pci/devices/0000:$devid/power/control" >> $rc_localf
echo "exit 0" >> $rc_localf
chmod +x $rc_localf
echo "Set power auto for nvidia"


# reboot to take effect
echo "Reboot to take effect!"
