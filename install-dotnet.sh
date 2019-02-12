sudo apt-get -y update
sudo apt-get -y install libunwind8 gettext
wget https://dotnetcli.blob.core.windows.net/dotnet/Sdk/2.1.300/dotnet-sdk-2.1.300-linux-arm.tar.gz
wget https://dotnetcli.blob.core.windows.net/dotnet/aspnetcore/Runtime/2.1.0/aspnetcore-runtime-2.1.0-linux-arm.tar.gz
sudo mkdir /opt/dotnet
sudo tar -xvf dotnet-sdk-2.1.300-linux-arm.tar.gz -C /opt/dotnet/
sudo tar -xvf aspnetcore-runtime-2.1.0-linux-arm.tar.gz -C /opt/dotnet/
sudo ln -s /opt/dotnet/dotnet /usr/local/bin
dotnet --info

sudo apt-get -y install libunwind8 gettext samba samba-common-bin
sudo smbpasswd -a pi
