sudo apt-get -y update
sudo apt-get -y install libunwind8 gettext
wget https://download.visualstudio.microsoft.com/download/pr/83bca990-9618-46d8-b096-32ecdf3ae492/c2f9d2785e78f20de0c3bb2adb880c5e/dotnet-sdk-3.0.100-preview-010184-linux-arm.tar.gz
wget https://download.visualstudio.microsoft.com/download/pr/c83595cd-7f49-484d-89cf-3dfffc1cca15/de670466aeeb953b5487d44039e65ca7/aspnetcore-runtime-3.0.0-preview-19075-0444-linux-arm.tar.gz
sudo mkdir /usr/share/dotnet
sudo tar -xvf dotnet-sdk-3.0.100-preview-010184-linux-arm.tar.gz -C /usr/share/dotnet/
sudo tar -xvf aspnetcore-runtime-3.0.0-preview-19075-0444-linux-arm.tar.gz -C /usr/share/dotnet/
sudo ln -s /usr/share/dotnet/dotnet /usr/local/bin
dotnet --info

#sudo apt-get -y install libunwind8 gettext samba samba-common-bin
#sudo smbpasswd -a pi
