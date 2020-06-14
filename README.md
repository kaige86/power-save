# power-save

Save power on Ubuntu Desktop for laptop

The main purpose is to use the default graphic card(e.g. intel integrited graphic card), other than Nvidia card for normal use.

## usage

- backup your nvidia kernel modules, if you have installed the nvidia driver

```
mkdir nvidia_driver_bkup
mv /lib/modules/$(uname -r)/kernel/drivers/video/nvidia* nvidia_driver_bkup
```

- run the script power-save.sh

sudo ./power-save.sh


- reboot your laptop

**CAUTION**

**IF YOU HAVE ONLY ONE GRAPHIC CARD, DO NOT USE**
