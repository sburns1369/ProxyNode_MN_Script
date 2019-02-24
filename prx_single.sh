#!/bin/bash
#0.8a3-- NullEntryDev Script
NODESL=One
NODESN=1
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
echo -e ${GREEN}"Are you sure you want to continue installation of a ${NODESL} ProxyNode Masternode?"
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
echo
echo
echo
echo
echo -e ${RED}"Your Masternode Private Keys are needed,"${CLEAR}
echo -e ${GREEN}" -which can be generated from the local wallet"${CLEAR}
echo
echo -e ${YELLOW}"You can edit the config later if you don't have this"${CLEAR}
echo -e ${YELLOW}"Masternode may fail to start with invalid key"${CLEAR}
echo
echo -e ${YELLOW}"Right Click to paste in some SSH Clients"${CLEAR}
echo
echo -e ${GREEN}"Please Enter Your First Masternode Private Key:"${CLEAR}
read privkey
echo
echo "Creating ${NODESN} ProxyNode system users with no-login access:"
sudo adduser --system --home /home/proxynode proxynode
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
cd /var
sudo touch swap.img
sudo chmod 600 swap.img
sudo dd if=/dev/zero of=/var/swap.img bs=1024k count=4096
sudo mkswap /var/swap.img
sudo swapon /var/swap.img
cd ~
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
echo "rpcport=12196" >> /home/proxynode/.proxynode/prx.conf
echo "listen=0" >> /home/proxynode/.proxynode/prx.conf
echo "externalip=$(hostname -I | cut -f1 -d' '):12195" >> /home/proxynode/.proxynode/prx.conf
echo "masternodeprivkey=$privkey" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=128.199.229.219:12195" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=13.58.94.109:63650" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=138.197.190.15:12195" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=139.180.222.242:12195" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=142.44.246.71:12195" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=172.104.169.5:44244" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=172.104.34.114:12195" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=172.105.215.131:12195" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=149.56.109.85:48284" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=172.105.219.206:48008" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=173.212.242.63:33688" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=173.212.242.63:47470" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=176.9.238.181:57362" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=178.128.98.246:59052" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=178.159.42.138:39002" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=178.192.172.105:64396" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=178.32.121.122:48078" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=178.63.73.174:49710" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=192.99.59.104:12195" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=195.201.108.252:47834" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=198.13.45.106:39348" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=202.182.127.49:12195" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=208.167.245.143:12195" >> /home/proxynode/.proxynode/prx.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode1 : true" >> /usr/local/nullentrydev/prx.log
echo "walletVersion1 : 1.0.0" >> /usr/local/nullentrydev/prx.log
echo "scriptVersion1 : 0.8a3" >> /usr/local/nullentrydev/prx.log
fi
sleep 5
echo
echo -e ${YELLOW}"Launching First PRX Node"${CLEAR}
prxd -datadir=/home/proxynode/.proxynode -daemon
echo
echo -e ${YELLOW}"Looking for a Shared Masternode Service? Check out Crypto Hash Tank" ${CLEAR}
echo -e ${YELLOW}"Support my Project, and put your loose change to work for you!" ${CLEAR}
echo -e ${YELLOW}" https://www.cryptohashtank.com/TJIF "${CLEAR}
sleep 45
echo
echo -e ${BOLD}"All ${NODESN} PRX Nodes Launched, please wait for it to synchronize".${CLEAR}
echo
echo -e "${BOLD}Your Masternodes are synchronize this will take some time."${CLEAR}
echo -e "While you wait you can configure your masternode.conf in your local wallet"${CLEAR}
echo -e "The data below needs to be in your local masternode configuration file:${CLEAR}"
echo -e "${BOLD} Masternode - \#1 IP: $(hostname -I | cut -f1 -d' '):12195${CLEAR}"
echo -e "${BOLD} Masternode - \#2 IP: [$(hostname -I | cut -f2 -d' ')]:12195${CLEAR}"
echo
echo -e ${BOLD} "If you become disconnected, you can check the status of sync ing with"${CLEAR}
echo -e "${YELLOW}For prx-cli -datadir=/home/proxynode/.proxynode mnsync status"${CLEAR}
echo
echo -e "${BOLD}You can check the status of your PRX Masternode with"${CLEAR}
echo -e "${YELLOW}For prx-cli -datadir=/home/proxynode/.proxynode masternode status"${CLEAR}
echo
fi
echo -e ${BLUE}" Your patronage is apprappreciated, tipping addresses"${CLEAR}
echo -e ${BLUE}" ProxyNode address: PRa4W66rUB8VN3wiynBwC7YYFc8fC6ywxQ"${CLEAR}
echo -e ${BLUE}" LTC address: MUdDdVr4Az1dVw47uC4srJ31Ksi5SNkC7H"${CLEAR}
echo -e ${BLUE}" BTC address: 32FzghE1yUZRdDmCkj3bJ6vJyXxUVPKY93"${CLEAR}
echo
echo -e ${YELLOW}"Need help? Find Sburns1369\#1584 one Discord - https://discord.gg/YhJ8v3g"${CLEAR}
echo
echo -e ${RED}"The END."${CLEAR};
