#!/bin/sh

if [ -d /usr/share/enigma2/PLi-FullNightFHD_Mod-HA ]; then
echo "> removing package please wait..."
sleep 3s 
rm -rf /usr/share/enigma2/PLi-FullNightFHD_Mod-HA >/dev/null 2>&1

echo "*******************************************"
echo "*             Removed Finished            *"
echo "*******************************************"
sleep 3s

else

#config
skin=PLi-FullNightFHD_Mod-HA
version=1.0
url=https://gitlab.com/h-ahmed/Panel/-/raw/main/pli/PLi-FullNightFHD_Mod-HA.tar.gz
package=/var/volatile/tmp/$skin-$version.tar.gz

echo "> Downloading $skin-$version skin  please wait ..."
sleep 3s

#remove unnecessary files and folders
if [  -d "/CONTROL" ]; then
rm -r  /CONTROL >/dev/null 2>&1
fi
rm -rf /control >/dev/null 2>&1
rm -rf /postinst >/dev/null 2>&1
rm -rf /preinst >/dev/null 2>&1
rm -rf /prerm >/dev/null 2>&1
rm -rf /postrm >/dev/null 2>&1
rm -rf /tmp/*.ipk >/dev/null 2>&1
rm -rf /tmp/*.tar.gz >/dev/null 2>&1

wget -O $package --no-check-certificate $url
tar -xzf $package -C /
extract=$?
rm -rf package >/dev/null 2>&1

echo ''
if [ $extract -eq 0 ]; then 
echo "> $skin-$version skin installed successfully"
sleep 3s
else
echo "> $skin-$version skin installation failed"
sleep 3s
fi
fi

wait
sleep 2;
echo "" 
echo "" 
echo "*********************************************************"
echo "#                   INSTALLED SUCCESSFULLY              #"
echo "*                       ON - Panel                      *"
echo "*                Enigma2 restart is required            *"
echo "*********************************************************"
echo "               UPLOADED BY  >>>>   HAMDY_AHMED           "
sleep 4;
	echo '================================================='
###########################################                                                                                                                  
echo ". >>>>         RESTARING     <<<<"
echo "*********************************************************"
wait
killall -9 enigma2
exit 0
