#!/bin/bash
#0.99-- NullEntryDev Script
NODESL=Eight
NODESN=8
BLUE='\033[0;96m'
GREEN='\033[0;92m'
RED='\033[0;91m'
YELLOW='\033[0;93m'
CLEAR='\033[0m'
if [[ $(lsb_release -d) != *16.04* ]]; then
"echo -e ${RED}"The operating system is not Ubuntu 16.04. You must be running on ubuntu 16.04."${CLEAR}"
exit 1
fi
echo
echo
echo -e ${GREEN}"Are you sure you want to continue the installation of ${NODESL} ProxyNode Masternodes?"
echo -e "type y/n followed by [ENTER]:"${CLEAR}
read AGREE
if [[ $AGREE =~ "y" ]] ; then
echo
echo
echo
echo
echo -e ${BLUE}"May this script will store a small amount data in /usr/local/nullentrydev/ ?"${CLEAR}
echo -e ${BLUE}"This information is for version updates and later implimentation"${CLEAR}
echo -e ${BLUE}"Zero Confidental information or Wallet keys will be stored in it"${CLEAR}
echo -e ${YELLOW}"Press y to agree followed by [ENTER], or just [ENTER] to disagree"${CLEAR}
read NULLREC
echo
echo -e ${GREEN}"Would you like to enter custom IP addresses?"${CLEAR}
echo -e ${YELLOW}"If you don't know the answer, hit n for no"${CLEAR}
echo -e ${YELLOW}"If you have custom IPs hit y for yes"${CLEAR}
read customIP
echo "Creating ${NODESN} ProxyNode system user(s) with no-login access:"
if id "proxynode" >/dev/null 2>&1; then
echo "user exists"
MN1=1
else
sudo adduser --system --home /home/proxynode proxynode
MN1=0
fi
if id "proxynode2" >/dev/null 2>&1; then
echo -e ${YELLOW} "Found user proxynode2!"${CLEAR}
MN2=1
else
sudo adduser --system --home /home/proxynode2 proxynode2
MN2=0
fi
if id "proxynode3" >/dev/null 2>&1; then
echo -e ${YELLOW} "Found user proxynode3!"${CLEAR}
MN3=1
else
sudo adduser --system --home /home/proxynode3 proxynode3
MN3=0
fi
if id "proxynode4" >/dev/null 2>&1; then
echo -e ${YELLOW} "Found user proxynode4!"${CLEAR}
MN4=1
else
sudo adduser --system --home /home/proxynode4 proxynode4
MN4=0
fi
if id "proxynode5" >/dev/null 2>&1; then
echo -e ${YELLOW} "Found user proxynode5!"${CLEAR}
MN5=1
else
sudo adduser --system --home /home/proxynode5 proxynode5
MN5=0
fi
if id "proxynode6" >/dev/null 2>&1; then
echo -e ${YELLOW} "Found user proxynode6!"${CLEAR}
MN6=1
else
sudo adduser --system --home /home/proxynode6 proxynode6
MN6=0
fi
if id "proxynode7" >/dev/null 2>&1; then
echo -e ${YELLOW} "Found user proxynode7!"${CLEAR}
MN7=1
else
sudo adduser --system --home /home/proxynode7 proxynode7
MN7=0
fi
if id "proxynode8" >/dev/null 2>&1; then
echo -e ${YELLOW} "Found user proxynode8!"${CLEAR}
MN8=1
else
sudo adduser --system --home /home/proxynode8 proxynode8
MN8=0
fi
echo
echo
echo
echo
echo -e ${RED}"Your New Masternode Private Keys are needed,"${CLEAR}
echo -e ${GREEN}" -which can be generated from the local wallet"${CLEAR}
echo
echo -e ${YELLOW}"You can edit the config later if you don't have this"${CLEAR}
echo -e ${YELLOW}"Masternode may fail to start with invalid key"${CLEAR}
echo -e ${YELLOW}"And the script installation will hang and fail"${CLEAR}
echo
echo -e ${YELLOW}"Right Click to paste in some SSH Clients"${CLEAR}
echo
if [[ "$MN1" -eq "0" ]]; then
echo -e ${GREEN}"Please Enter Your First Masternode Private Key:"${CLEAR}
read MNKEY
echo
else
echo -e ${YELLOW}"Skipping First Masternode Key"${CLEAR}
fi
if [[ "$MN2" -eq "0" ]]; then
echo -e ${GREEN}"Please Enter Your Second Masternode Private Key:"${CLEAR}
read MNKEY2
echo
else
echo -e ${YELLOW}"Skipping Second Masternode Key"${CLEAR}
fi
if [[ "$MN3" -eq "0" ]]; then
echo -e ${GREEN}"Please Enter Your Third Masternode Private Key:"${CLEAR}
read MNKEY3
echo
else
echo -e ${YELLOW}"Skipping Third Masternode Key"${CLEAR}
fi
if [[ "$MN4" -eq "0" ]]; then
echo -e ${GREEN}"Please Enter Your Fourth Masternode Private Key:"${CLEAR}
read MNKEY4
echo
else
echo -e ${YELLOW}"Skipping Fourth Masternode Key"${CLEAR}
fi
if [[ "$MN5" -eq "0" ]]; then
echo -e ${GREEN}"Please Enter Your Fifth Masternode Private Key:"${CLEAR}
read MNKEY5
echo
else
echo -e ${YELLOW}"Skipping Fifth Masternode Key"${CLEAR}
fi
if [[ "$MN6" -eq "0" ]]; then
echo -e ${GREEN}"Please Enter Your Sixth Masternode Private Key:"${CLEAR}
read MNKEY6
echo
else
echo -e ${YELLOW}"Skipping Sixth Masternode Key"${CLEAR}
fi
if [[ "$MN7" -eq "0" ]]; then
echo -e ${GREEN}"Please Enter Your Seventh Masternode Private Key:"${CLEAR}
read MNKEY7
echo
else
echo -e ${YELLOW}"Skipping Seventh Masternode Key"${CLEAR}
fi
if [[ "$MN8" -eq "0" ]]; then
echo -e ${GREEN}"Please Enter Your Eigth Masternode Private Key:"${CLEAR}
read MNKEY8
echo
else
echo -e ${YELLOW}"Skipping Eigth Masternode Key"${CLEAR}
fi
cd ~
if [[ $NULLREC = "y" ]] ; then
if [ ! -d /usr/local/nullentrydev/ ]; then
echo -e ${YELLOW}"Making /usr/local/nullentrydev"${CLEAR}
sudo mkdir /usr/local/nullentrydev
else
echo -e ${YELLOW}"Found /usr/local/nullentrydev"${CLEAR}
fi
if [ ! -f /usr/local/nullentrydev/prx.log ]; then
echo -e ${YELLOW}"Making /usr/local/nullentrydev/prx.log"${CLEAR}
sudo touch /usr/local/nullentrydev/prx.log
else
echo -e ${YELLOW}"Found /usr/local/nullentrydev/prx.log"${CLEAR}
fi
if [ ! -f /usr/local/nullentrydev/mnodes.log ]; then
echo -e ${YELLOW}"Making /usr/local/nullentrydev/mnodes.log"${CLEAR}
sudo touch /usr/local/nullentrydev/mnodes.log
else
echo -e ${YELLOW}"Found /usr/local/nullentrydev/mnodes.log"${CLEAR}
fi
fi
echo -e ${RED}"Updating Apps"${CLEAR}
sudo apt-get -y update
echo -e ${RED}"Upgrading Apps"${CLEAR}
sudo apt-get -y upgrade
if grep -Fxq "dependenciesInstalled: true" /usr/local/nullentrydev/mnodes.log
then
echo
echo -e ${RED}"Skipping... Dependencies & Software Libraries - Previously installed"${CLEAR}
echo
else
echo ${RED}"Installing Dependencies & Software Libraries"${CLEAR}
sudo apt-get -y install software-properties-common
sudo apt-get -y install build-essential
sudo apt-get -y install libtool autotools-dev autoconf automake
sudo apt-get -y install libssl-dev
sudo apt-get -y install libevent-dev
sudo apt-get -y install libboost-all-dev
sudo apt-get -y install pkg-config
echo -e ${RED}"Press [ENTER] if prompted"${CLEAR}
sudo add-apt-repository -yu ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get -y install libdb4.8-dev
sudo apt-get -y install libdb4.8++-dev
echo -e ${YELLOW} "Here be dragons"${CLEAR}
sudo apt-get -y install libminiupnpc-dev libzmq3-dev libevent-pthreads-2.0-5
sudo apt-get -y install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev
sudo apt-get -y install libqrencode-dev bsdmainutils unzip
if [[ $NULLREC = "y" ]] ; then
echo "dependenciesInstalled: true" >> /usr/local/nullentrydev/mnodes.log
fi
fi
if [[ customIP = "y" ]] ; then
echo -e ${GREEN}"IP for Masternode 1"${CLEAR}
read MNIP1
echo -e ${GREEN}"IP for Masternode 2"${CLEAR}
read MNIP2
echo -e ${GREEN}"IP for Masternode 3"${CLEAR}
read MNIP3
echo -e ${GREEN}"IP for Masternode 4"${CLEAR}
read MNIP4
echo -e ${GREEN}"IP for Masternode 5"${CLEAR}
read MNIP5
echo -e ${GREEN}"IP for Masternode 6"${CLEAR}
read MNIP6
echo -e ${GREEN}"IP for Masternode 7"${CLEAR}
read MNIP7
echo -e ${GREEN}"IP for Masternode 8"${CLEAR}
read MNIP8
else
regex='^([0-9a-fA-F]{0,4}:){1,7}[0-9a-fA-F]{0,4}$'
FINDIP=$(hostname -I | cut -f2 -d' '| cut -f1-7 -d:)
if [[ $FINDIP =~ $regex ]]; then
echo "IPv6 Address check is good"
echo ${FINDIP} testing note
IP=${FINDIP}
echo ${IP}
else
echo "IPv6 Address check is not expected, getting IPv6 Helper to recalculate"
echo $FINDIP - testing note 1
sudo apt-get install sipcalc
echo $FINDIP - testing note 2
FINDIP=$(hostname -I | cut -f3 -d' '| cut -f1-8 -d:)
echo $FINDIP - check 3
echo "Attempting to adjust results and re-calculate IPv6 Address"
FINDIP=$(sipcalc ${FINDIP} | fgrep Expanded | cut -d ' ' -f3)
if [[ $FINDIP =~ $regex ]]; then
FINDIP=$(echo ${FINDIP} | cut -f1-7 -d:)
echo "IPv6 Address check is good"
IP=${FINDIP}
else
echo "IPv6 Addressing check has failed. Contact NullEntry Support"
echo ${IP} testing note
exit 1
fi
fi
echo ${MNIP1} testing note
echo ${IP} testing note
echo -e ${YELLOW} "Building IP Tables"${CLEAR}
sudo touch ip.tmp
for i in {15361..15375}; do printf "${IP}:%.4x\n" $i >> ip.tmp; done
MNIP1=$(sed -n '1p' < ip.tmp)
MNIP2=$(sed -n '2p' < ip.tmp)
MNIP3=$(sed -n '3p' < ip.tmp)
MNIP4=$(sed -n '4p' < ip.tmp)
MNIP5=$(sed -n '5p' < ip.tmp)
MNIP6=$(sed -n '6p' < ip.tmp)
MNIP7=$(sed -n '7p' < ip.tmp)
MNIP8=$(sed -n '8p' < ip.tmp)
rm -rf ip.tmp
fi
if grep -Fxq "swapInstalled: true" /usr/local/nullentrydev/mnodes.log
then
echo -e ${RED}"Skipping... Swap Area already made"${CLEAR}
else
cd /var
sudo touch swap.img
sudo chmod 600 swap.img
sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=4096
sudo mkswap /var/swap.img
sudo swapon /var/swap.img
if [[ $NULLREC = "y" ]] ; then
echo "swapInstalled: true" >> /usr/local/nullentrydev/mnodes.log
fi
fi
cd ~
touch prxcheck.tmp
ps aux | grep proxynode >> prxcheck.tmp
if grep home/proxynode/.prx prxcheck.tmp
then
echo Found OLD ${NC} prx Node running
OldNode="1"
else
echo No ${NC} prx Node not running
OldNode="0"
fi
until [[ $NC = 9 ]]; do
if grep /home/proxynode${NC}/.prx prxcheck.tmp
then
echo Found ${NC} prx Node running
declare IPN$NC="1"
RB=1
else
echo No ${NC} prx Node not running
declare IPN$NC="0"
echo $NC
fi
NC=$[$NC+1]
done
rm -r prxcheck.tmp
if [[ "$OldNode" = "1" ]]; then
prx-cli -datadir=/home/proxynode/.proxynode stop
fi
if [[ "$IPN1" = "1" ]]; then
prx-cli -datadir=/home/proxynode1/.proxynode stop
fi
if [[ "$IPN2" = "1" ]]; then
prx-cli -datadir=/home/proxynode2/.proxynode stop
fi
if [[ "$IPN3" = "1" ]]; then
prx-cli -datadir=/home/proxynode3/.proxynode stop
fi
if [[ "$IPN4" = "1" ]]; then
prx-cli -datadir=/home/proxynode4/.proxynode stop
fi
if [[ "$IPN5" = "1" ]]; then
prx-cli -datadir=/home/proxynode5/.proxynode stop
fi
if [[ "$IPN6" = "1" ]]; then
prx-cli -datadir=/home/proxynode6/.proxynode stop
fi
if [[ "$IPN7" = "1" ]]; then
prx-cli -datadir=/home/proxynode7/.proxynode stop
fi
if [[ "$IPN8" = "1" ]]; then
prx-cli -datadir=/home/proxynode8/.proxynode stop
fi
if [[ "$IPN9" = "1" ]]; then
prx-cli -datadir=/home/proxynode9/.proxynode stop
fi
if [[ "$IPN0" = "1" ]]; then
prx-cli -datadir=/home/proxynode0/.proxynode stop
fi
if [ ! -d /root/prx ]; then
sudo mkdir /root/prx
fi
cd /root/prx
echo "Downloading latest ProxyNode binaries"
wget https://github.com/ProxyNode/proxynode/releases/download/v1.0.0/Linux.zip
unzip Linux.zip
sleep 3
sudo mv /root/prx/Linux/bin/prxd /root/prx/Linux/bin/prx-cli /usr/local/bin
sudo chmod 755 -R /usr/local/bin/prx*
rm -rf /root/prx
if [ ! -f /home/proxynode/.proxynode/prx.conf ]; then
echo -e "${GREEN}Configuring First ProxyNode Node${CLEAR}"
sudo mkdir /home/proxynode/.proxynode
sudo touch /home/proxynode/.proxynode/prx.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/proxynode/.proxynode/prx.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/proxynode/.proxynode/prx.conf
echo "rpcallowip=127.0.0.1" >> /home/proxynode/.proxynode/prx.conf
echo "server=1" >> /home/proxynode/.proxynode/prx.conf
echo "daemon=1" >> /home/proxynode/.proxynode/prx.conf
echo "maxconnections=250" >> /home/proxynode/.proxynode/prx.conf
echo "masternode=1" >> /home/proxynode/.proxynode/prx.conf
echo "rpcport=12195" >> /home/proxynode/.proxynode/prx.conf
echo "listen=0" >> /home/proxynode/.proxynode/prx.conf
echo "externalip=[${MNIP1}]:12195" >> /home/proxynode/.proxynode/prx.conf
echo "masternodeprivkey=$MNKEY" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=23.94.102.195" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=108.61.75.117" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=178.32.121.122" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=207.148.85.235" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=192.99.59.104" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=45.32.14.151" >> /home/proxynode/.proxynode/prx.conf
MN1=0
if [[ $NULLREC = "y" ]] ; then
echo "masterNode1 : true" >> /usr/local/nullentrydev/prx.log
echo "walletVersion1 : 1.0.0" >> /usr/local/nullentrydev/prx.log
echo "scriptVersion1 : 0.99" >> /usr/local/nullentrydev/prx.log
fi
else
echo -e ${YELLOW}"Found /home/proxynode/.proxynode/prx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Configuration there"${CLEAR}
fi
echo
echo -e ${YELLOW}"Launching First PRX Node"${CLEAR}
prxd -datadir=/home/proxynode/.proxynode -daemon
echo
echo -e ${YELLOW}"Looking for a Shared Masternode Service? Check out Crypto Hash Tank" ${CLEAR}
echo -e ${YELLOW}"Support my Project, and put your loose change to work for you!" ${CLEAR}
echo -e ${YELLOW}" https://www.cryptohashtank.com/TJIF "${CLEAR}
echo
echo -e ${YELLOW}"Special Thanks to the BitcoinGenX (BGX) Community" ${CLEAR}
sleep 20
if [ ! -f /home/proxynode2/.proxynode/prx.conf ]; then
if [ ! -f /home/proxynode2/prx.conf ]; then
echo -e "${YELLOW}Second ProxyNode Normal Warning - Node Configuration Not Found....${CLEAR}"
echo -e "${GREEN}Configuring Second ProxyNode Node${CLEAR}"
sudo mkdir /home/proxynode2/.proxynode
sudo touch /home/proxynode2/prx.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/proxynode2/prx.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/proxynode2/prx.conf
echo "rpcallowip=127.0.0.1" >> /home/proxynode2/prx.conf
echo "server=1" >> /home/proxynode2/prx.conf
echo "daemon=1" >> /home/proxynode2/prx.conf
echo "maxconnections=250" >> /home/proxynode2/prx.conf
echo "masternode=1" >> /home/proxynode2/prx.conf
echo "rpcport=12196" >> /home/proxynode2/prx.conf
echo "listen=0" >> /home/proxynode2/prx.conf
echo "externalip=[${MNIP2}]:12195" >> /home/proxynode2/prx.conf
echo "masternodeprivkey=$MNKEY2" >> /home/proxynode2/prx.conf
echo "addnode=[${MNIP1}]" >> /home/proxynode/.proxynode/prx.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode2 : true" >> /usr/local/nullentrydev/prx.log
echo "walletVersion2 : 1.0.0" >> /usr/local/nullentrydev/prx.log
echo "scriptVersion2 : 0.99" >> /usr/local/nullentrydev/prx.log
fi
else
echo
echo -e ${GREEN}"Found /home/proxynode2/prx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Pre-stage for Second Node "${CLEAR}
MN2=0
fi
else
echo -e ${YELLOW}"Found /home/proxynode2/.proxynode/prx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Configuration for Second Node"${CLEAR}
fi
echo
if [ ! -f /home/proxynode3/.proxynode/prx.conf ]; then
if [ ! -f /home/proxynode3/prx.conf ]; then
echo -e "${GREEN}Third ProxyNode Node Configuration Not Found....${CLEAR}"
echo -e "${GREEN}Configuring Third ProxyNode Node${CLEAR}"
sudo mkdir /home/proxynode3/.proxynode
sudo touch /home/proxynode3/prx.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/proxynode3/prx.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/proxynode3/prx.conf
echo "rpcallowip=127.0.0.1" >> /home/proxynode3/prx.conf
echo "server=1" >> /home/proxynode3/prx.conf
echo "daemon=1" >> /home/proxynode3/prx.conf
echo "maxconnections=250" >> /home/proxynode3/prx.conf
echo "masternode=1" >> /home/proxynode3/prx.conf
echo "rpcport=12198" >> /home/proxynode3/prx.conf
echo "listen=0" >> /home/proxynode3/prx.conf
echo "externalip=[${MNIP3}]:12195" >> /home/proxynode3/prx.conf
echo "masternodeprivkey=$MNKEY3" >> /home/proxynode3/prx.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode3 : true" >> /usr/local/nullentrydev/prx.log
echo "walletVersion3 : 1.0.0" >> /usr/local/nullentrydev/prx.log
echo "scriptVersion3 : 0.99" >> /usr/local/nullentrydev/prx.log
fi
else
echo -e ${YELLOW}"Found /home/proxynode3/prx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Pre-stage for Third Node "${CLEAR}
MN3=0
fi
echo
else
echo -e ${YELLOW}"Found /home/proxynode3/.proxynode/prx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Configuration for Third Node"${CLEAR}
fi
echo
if [ ! -f /home/proxynode4/.proxynode/prx.conf ]; then
if [ ! -f /home/proxynode4/prx.conf ]; then
echo -e "${GREEN}Fourth ProxyNode Node Configuration Not Found....${CLEAR}"
echo -e "${GREEN}Configuring Fourth ProxyNode Node${CLEAR}"
sudo mkdir /home/proxynode4/.proxynode
sudo touch /home/proxynode4/prx.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/proxynode4/prx.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/proxynode4/prx.conf
echo "rpcallowip=127.0.0.1" >> /home/proxynode4/prx.conf
echo "server=1" >> /home/proxynode4/prx.conf
echo "daemon=1" >> /home/proxynode4/prx.conf
echo "maxconnections=250" >> /home/proxynode4/prx.conf
echo "masternode=1" >> /home/proxynode4/prx.conf
echo "rpcport=12199" >> /home/proxynode4/prx.conf
echo "listen=0" >> /home/proxynode4/prx.conf
echo "externalip=[${MNIP4}]:12195" >> /home/proxynode4/prx.conf
echo "masternodeprivkey=$MNKEY4" >> /home/proxynode4/prx.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode4 : true" >> /usr/local/nullentrydev/prx.log
echo "walletVersion4 : 1.0.0" >> /usr/local/nullentrydev/prx.log
echo "scriptVersion4 : 0.99" >> /usr/local/nullentrydev/prx.log
fi
else
echo
echo -e ${YELLOW}"Found /home/proxynode4/prx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Pre-stage for Fourth Node "${CLEAR}
MN4=0
fi
else
echo -e ${YELLOW}"Found /home/proxynode4/.proxynode/prx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Configuration for Fourth Node"${CLEAR}
fi
if [ ! -f /home/proxynode5/.proxynode/prx.conf ]; then
if [ ! -f /home/proxynode5/prx.conf ]; then
echo -e "${GREEN}Fifth ProxyNode Node Configuration Not Found....${CLEAR}"
echo -e "${GREEN}Configuring Fifth ProxyNode Node${CLEAR}"
sudo mkdir /home/proxynode5/.proxynode
sudo touch /home/proxynode5/prx.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/proxynode5/prx.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/proxynode5/prx.conf
echo "rpcallowip=127.0.0.1" >> /home/proxynode5/prx.conf
echo "server=1" >> /home/proxynode5/prx.conf
echo "daemon=1" >> /home/proxynode5/prx.conf
echo "maxconnections=250" >> /home/proxynode5/prx.conf
echo "masternode=1" >> /home/proxynode5/prx.conf
echo "rpcport=12200" >> /home/proxynode5/prx.conf
echo "listen=0" >> /home/proxynode5/prx.conf
echo "externalip=[${MNIP5}]:12195" >> /home/proxynode5/prx.conf
echo "masternodeprivkey=$MNKEY5" >> /home/proxynode5/prx.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode5 : true" >> /usr/local/nullentrydev/prx.log
echo "walletVersion5 : 1.0.0" >> /usr/local/nullentrydev/prx.log
echo "scriptVersion5 : 0.99" >> /usr/local/nullentrydev/prx.log
fi
else
echo
echo -e ${YELLOW}"Found /home/proxynode5/prx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Pre-stage for Fifth Node "${CLEAR}
MN5=0
fi
else
echo -e ${YELLOW}"Found /home/proxynode5/.proxynode/prx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Configuration for Fifth Node"${CLEAR}
fi
if [ ! -f /home/proxynode6/.proxynode/prx.conf ]; then
if [ ! -f /home/proxynode6/prx.conf ]; then
echo -e "${GREEN}Sixth ProxyNode Node Configuration Not Found....${CLEAR}"
echo -e "${YELLOW}Configuring Sixth ProxyNode Node${CLEAR}"
sudo mkdir /home/proxynode6/.proxynode
sudo touch /home/proxynode6/prx.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/proxynode6/prx.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/proxynode6/prx.conf
echo "rpcallowip=127.0.0.1" >> /home/proxynode6/prx.conf
echo "server=1" >> /home/proxynode6/prx.conf
echo "daemon=1" >> /home/proxynode6/prx.conf
echo "maxconnections=250" >> /home/proxynode6/prx.conf
echo "masternode=1" >> /home/proxynode6/prx.conf
echo "rpcport=12201" >> /home/proxynode6/prx.conf
echo "listen=0" >> /home/proxynode6/prx.conf
echo "externalip=[${MNIP6}]:12195" >> /home/proxynode6/prx.conf
echo "masternodeprivkey=$MNKEY6" >> /home/proxynode6/prx.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode6 : true" >> /usr/local/nullentrydev/prx.log
echo "walletVersion6 : 1.0.0" >> /usr/local/nullentrydev/prx.log
echo "scriptVersion6 : 0.99" >> /usr/local/nullentrydev/prx.log
fi
else
echo
echo -e ${YELLOW}"Found /home/proxynode6/prx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Pre-stage for Sixth Node "${CLEAR}
MN6=0
fi
else
echo -e ${YELLOW}"Found /home/proxynode6/.proxynode/prx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Configuration for Sixth Node"${CLEAR}
fi
echo
if [ ! -f /home/proxynode7/.proxynode/prx.conf ]; then
if [ ! -f /home/proxynode7/prx.conf ]; then
echo -e "${GREEN}Seventh ProxyNode Node Configuration Not Found....${CLEAR}"
echo -e "${YELLOW}Configuring Seventh ProxyNode Node${CLEAR}"
sudo mkdir /home/proxynode7/.proxynode
sudo touch /home/proxynode7/prx.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/proxynode7/prx.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/proxynode7/prx.conf
echo "rpcallowip=127.0.0.1" >> /home/proxynode7/prx.conf
echo "server=1" >> /home/proxynode7/prx.conf
echo "daemon=1" >> /home/proxynode7/prx.conf
echo "maxconnections=250" >> /home/proxynode7/prx.conf
echo "masternode=1" >> /home/proxynode7/prx.conf
echo "rpcport=12202" >> /home/proxynode7/prx.conf
echo "listen=0" >> /home/proxynode7/prx.conf
echo "externalip=[${MNIP7}]:12195" >> /home/proxynode7/prx.conf
echo "masternodeprivkey=$MNKEY7" >> /home/proxynode7/prx.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode7 : true" >> /usr/local/nullentrydev/prx.log
echo "walletVersion7 : 1.0.0" >> /usr/local/nullentrydev/prx.log
echo "scriptVersion7 : 0.99" >> /usr/local/nullentrydev/prx.log
fi
else
echo
echo -e ${YELLOW}"Found /home/proxynode7/prx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Pre-stage for Seventh Node "${CLEAR}
MN7=0
fi
else
echo -e ${YELLOW}"Found /home/proxynode7/.proxynode/prx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Configuration for Seventh Node"${CLEAR}
fi
echo
if [ ! -f /home/proxynode8/.proxynode/prx.conf ]; then
if [ ! -f /home/proxynode8/prx.conf ]; then
echo -e "${GREEN}Eigth ProxyNode Node Configuration Not Found....${CLEAR}"
echo -e "${YELLOW}Configuring Eigth ProxyNode Node${CLEAR}"
sudo mkdir /home/proxynode8/.proxynode
sudo touch /home/proxynode8/prx.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/proxynode8/prx.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/proxynode8/prx.conf
echo "rpcallowip=127.0.0.1" >> /home/proxynode8/prx.conf
echo "server=1" >> /home/proxynode8/prx.conf
echo "daemon=1" >> /home/proxynode8/prx.conf
echo "maxconnections=250" >> /home/proxynode8/prx.conf
echo "masternode=1" >> /home/proxynode8/prx.conf
echo "rpcport=12203" >> /home/proxynode8/prx.conf
echo "listen=0" >> /home/proxynode8/prx.conf
echo "externalip=[${MNIP8}]:12195" >> /home/proxynode8/prx.conf
echo "masternodeprivkey=$MNKEY8" >> /home/proxynode8/prx.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode8 : true" >> /usr/local/nullentrydev/prx.log
echo "walletVersion8 : 1.0.0" >> /usr/local/nullentrydev/prx.log
echo "scriptVersion8 : 0.99" >> /usr/local/nullentrydev/prx.log
fi
else
echo
echo -e ${YELLOW}"Found /home/proxynode8/prx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Pre-stage for Eigth Node "${CLEAR}
MN8=0
fi
else
echo -e ${YELLOW}"Found /home/proxynode8/.proxynode/prx.conf"${CLEAR}
echo -e ${YELLOW}"Skipping Configuration for Eigth Node"${CLEAR}
fi
echo
echo -e "${RED}This process can take a while!${CLEAR}"
echo -e "${YELLOW}Waiting on First Masternode Block Chain to Synchronize${CLEAR}"
echo -e "${YELLOW}Once complete, it will stop and copy the block chain to${CLEAR}"
echo -e "${YELLOW}the other masternodes. This prevent all masternodes${CLEAR}"
echo -e "${YELLOW}from downloading the block chain individually; taking up${CLEAR}"
echo -e "${YELLOW}more time and resources. Current Block count will be displayed below.${CLEAR}"
until prx-cli -datadir=/home/proxynode/.proxynode mnsync status | grep -m 1 'IsBlockchainSynced" : true'; do
prx-cli -datadir=/home/proxynode/.proxynode getblockcount
sleep 60
done
echo -e "${GREEN}Haulting and Replicating First ProxyNode Node${CLEAR}"

prx-cli -datadir=/home/proxynode/.proxynode stop
sleep 10
if [[ "$MN2" -eq "0" ]]; then
sudo cp -r /home/proxynode/.proxynode/* /home/proxynode2/.proxynode
rm /home/proxynode2/.proxynode/prx.conf
cp -r /home/proxynode2/prx.conf /home/proxynode2/.proxynode/prx.conf
sleep 1
fi
if [[ "$MN3" -eq "0" ]]; then
sudo cp -r /home/proxynode/.proxynode/* /home/proxynode3/.proxynode
rm /home/proxynode3/.proxynode/prx.conf
cp -r /home/proxynode3/prx.conf /home/proxynode3/.proxynode/prx.conf
sleep 1
fi
if [[ "$MN4" -eq "0" ]]; then
sudo cp -r /home/proxynode/.proxynode/* /home/proxynode4/.proxynode
rm /home/proxynode4/.proxynode/prx.conf
cp -r /home/proxynode4/prx.conf /home/proxynode4/.proxynode/prx.conf
sleep 1
fi
if [[ "$MN5" -eq "0" ]]; then
sudo cp -r /home/proxynode/.proxynode/* /home/proxynode5/.proxynode
rm /home/proxynode5/.proxynode/prx.conf
cp -r /home/proxynode5/prx.conf /home/proxynode5/.proxynode/prx.conf
sleep 1
fi
if [[ "$MN6" -eq "0" ]]; then
sudo cp -r /home/proxynode/.proxynode/* /home/proxynode6/.proxynode
rm /home/proxynode6/.proxynode/prx.conf
cp -r /home/proxynode6/prx.conf /home/proxynode6/.proxynode/prx.conf
sleep 1
fi
if [[ "$MN7" -eq "0" ]]; then
sudo cp -r /home/proxynode/.proxynode/* /home/proxynode7/.proxynode
rm /home/proxynode7/.proxynode/prx.conf
cp -r /home/proxynode7/prx.conf /home/proxynode7/.proxynode/prx.conf
sleep 1
fi
if [[ "$MN8" -eq "0" ]]; then
sudo cp -r /home/proxynode/.proxynode/* /home/proxynode8/.proxynode
rm /home/proxynode8/.proxynode/prx.conf
cp -r /home/proxynode8/prx.conf /home/proxynode8/.proxynode/prx.conf
sleep 1
fi
echo -e ${YELLOW}"Launching First PRX Node"${CLEAR}
prxd -datadir=/home/proxynode/.proxynode -daemon
sleep 20
echo -e ${YELLOW}"Launching Second PRX Node"${CLEAR}
prxd -datadir=/home/proxynode2/.proxynode -daemon
sleep 20
echo -e ${YELLOW}"Launching Third PRX Node"${CLEAR}
prxd -datadir=/home/proxynode3/.proxynode -daemon
sleep 20
echo -e ${YELLOW}"Launching Fourth PRX Node"${CLEAR}
prxd -datadir=/home/proxynode4/.proxynode -daemon
sleep 20
echo -e ${YELLOW}"Launching Fifth PRX Node"${CLEAR}
prxd -datadir=/home/proxynode5/.proxynode -daemon
sleep 20
echo -e ${YELLOW}"Launching Sixth PRX Node"${CLEAR}
prxd -datadir=/home/proxynode6/.proxynode -daemon
sleep 20
echo -e ${YELLOW}"Launching Seventh PRX Node"${CLEAR}
prxd -datadir=/home/proxynode7/.proxynode -daemon
sleep 20
echo -e ${YELLOW}"Launching Eigth PRX Node"${CLEAR}
prxd -datadir=/home/proxynode8/.proxynode -daemon
sleep 20
echo -e ${BOLD}"All ${NODESN} PRX Nodes Launched".${CLEAR}
echo

echo -e "${GREEN}You can check the status of your PRX Masternode with"${CLEAR}
echo -e "${YELLOW}For mn1: \"prx-cli -datadir=/home/proxynode/.proxynode masternode status\""${CLEAR}
echo -e "${YELLOW}For mn2: \"prx-cli -datadir=/home/proxynode2/.proxynode masternode status\""${CLEAR}
echo -e "${YELLOW}For mn3: \"prx-cli -datadir=/home/proxynode3/.proxynode masternode status\""${CLEAR}
echo -e "${YELLOW}For mn4: \"prx-cli -datadir=/home/proxynode4/.proxynode masternode status\""${CLEAR}
echo -e "${YELLOW}For mn5: \"prx-cli -datadir=/home/proxynode5/.proxynode masternode status\""${CLEAR}
echo -e "${YELLOW}For mn6: \"prx-cli -datadir=/home/proxynode6/.proxynode masternode status\""${CLEAR}
echo -e "${YELLOW}For mn7: \"prx-cli -datadir=/home/proxynode7/.proxynode masternode status\""${CLEAR}
echo -e "${YELLOW}For mn8: \"prx-cli -datadir=/home/proxynode8/.proxynode masternode status\""${CLEAR}
echo
echo -e "${RED}Status 29 may take a few minutes to clear while the daemon processes the chainstate"${CLEAR}
echo -e "${GREEN}The data below needs to be in your local masternode configuration file:${CLEAR}"
echo -e "${BOLD} Masternode - \#1 IP: [${MNIP1}]:12195${CLEAR}"
echo -e "${BOLD} Masternode - \#2 IP: [${MNIP2}]:12195${CLEAR}"
echo -e "${BOLD} Masternode - \#3 IP: [${MNIP3}]:12195${CLEAR}"
echo -e "${BOLD} Masternode - \#4 IP: [${MNIP4}]:12195${CLEAR}"
echo -e "${BOLD} Masternode - \#5 IP: [${MNIP5}]:12195${CLEAR}"
echo -e "${BOLD} Masternode - \#6 IP: [${MNIP6}]:12195${CLEAR}"
echo -e "${BOLD} Masternode - \#7 IP: [${MNIP7}]:12195${CLEAR}"
echo -e "${BOLD} Masternode - \#8 IP: [${MNIP8}]:12195${CLEAR}"
fi
echo -e ${BLUE}" Your patronage is appreciated, tipping addresses"${CLEAR}
echo -e ${BLUE}" ProxyNode address: PRa4W66rUB8VN3wiynBwC7YYFc8fC6ywxQ"${CLEAR}
echo -e ${BLUE}" XGS address: BayScFpFgPBiDU1XxdvozJYVzM2BQvNFgM"${CLEAR}
echo -e ${BLUE}" LTC address: MUdDdVr4Az1dVw47uC4srJ31Ksi5SNkC7H"${CLEAR}
echo
echo -e ${YELLOW}"Need help? Find Sburns1369\#1584 on Discord - https://discord.gg/YhJ8v3g"${CLEAR}
echo -e ${YELLOW}"If Direct Messaged please verify by clicking on the profile!"${CLEAR}
echo -e ${YELLOW}"it says Sburns1369 in bigger letters followed by a little #1584" ${CLEAR}
echo -e ${YELLOW}"Anyone can clone my name, but not the #1384".${CLEAR}
echo
echo -e ${RED}"The END."${CLEAR};
