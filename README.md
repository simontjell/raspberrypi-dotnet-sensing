# raspberrypi-dotnet-sensing

## Installing .NET Core and other packages
```bash
./install-dotnet.sh
```

## Enabling I2C and the SSH daemon
Start the configuration utility:
```bash
sudo raspi-config
```
Select point 5: "Interfacing options"
Select point 2: "SSH" and "Yes" to enable the daemon to run at startup
Select point 5: "I2C" and "Yes" to enable

## Setting up a Samba share
```bash
sudo leafpad /etc/samba/smb.conf
```
(add a share for the 'pi' user)

## Browsing files in Windows
Get the IP address of the Raspberry PI device
```bash
hostname -I
```

In Windows Explorer, navigate to \\\\(IP address) and enter the credentials added to the Samba configuration.

## Using dotnet-sshdeploy
First, install the tool globally:
´´´bash
dotnet tool install -g dotnet-sshdeploy
```

Next, add the following (properly adjusted) to the first property group of the project file:
```xml
    <SshDeployHost>raspberrypi</SshDeployHost>
    <SshDeployTargetPath>/home/pi/publish/web</SshDeployTargetPath>
    <SshDeployUsername>pi</SshDeployUsername>
    <SshDeployPassword>(your password)</SshDeployPassword>
```

Deployment is done in the following way:
```bash
dotnet-sshdeploy.exe push
```

When deployment succeeds, the web app can be started in the Raspberry PI:
```bash
cd /home/pi/publish/web
dotnet web.dll
```
