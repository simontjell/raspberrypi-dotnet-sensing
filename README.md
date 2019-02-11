# raspberrypi-dotnet-sensing

## Installing .NET Core and other packages
```bash
./install-dotnet.sh
``


## Enabling I2C
Start the configuration utility:
```bash
sudo raspi-config
```
Select point 5: "Interfacing options"
Select point 5: "I2C" and "Yes" to enable

## Setting up a Samba share
```bash
sudo leafpad /etc/samba/smb.conf
```
