#!/bin/bash
#0.9d-- NullEntryDev Script
NODESL=Four
NODESN=4
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
echo
echo
echo
echo
echo -e ${RED}"Your Masternode Private Keys are needed,"${CLEAR}
echo -e ${GREEN}" -which can be generated from the local wallet"${CLEAR}
echo
echo -e ${YELLOW}"You can edit the config later if you don't have this"${CLEAR}
echo -e ${YELLOW}"Masternode may fail to start with invalid key"${CLEAR}
echo -e ${YELLOW}"And the script installation will hang and fail"${CLEAR}
echo
echo -e ${YELLOW}"Right Click to paste in some SSH Clients"${CLEAR}
echo
echo -e ${GREEN}"Please Enter Your First Masternode Private Key:"${CLEAR}
read privkey
echo
echo -e ${GREEN}"Please Enter Your Second Masternode Private Key:"${CLEAR}
read privkey2
echo
echo -e ${GREEN}"Please Enter Your Third Masternode Private Key:"${CLEAR}
read privkey3
echo
echo -e ${GREEN}"Please Enter Your Fourth Masternode Private Key:"${CLEAR}
read privkey4
echo
echo "Creating ${NODESN} ProxyNode system users with no-login access:"
sudo adduser --system --home /home/proxynode proxynode
sudo adduser --system --home /home/proxynode2 proxynode2
sudo adduser --system --home /home/proxynode3 proxynode3
sudo adduser --system --home /home/proxynode4 proxynode4
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
echo -e ${YELLOW} "Building IP Tables"${CLEAR}
sudo touch ip.tmp
IP=$(hostname -I | cut -f2 -d' '| cut -f1-7 -d:)
for i in {15361..15375}; do printf "${IP}:%.4x\n" $i >> ip.tmp; done
MNIP1=$(sed -n '1p' < ip.tmp)
MNIP2=$(sed -n '2p' < ip.tmp)
MNIP3=$(sed -n '3p' < ip.tmp)
MNIP4=$(sed -n '4p' < ip.tmp)
if [[ $NULLREC = "y" ]] ; then
sudo touch /usr/local/nullentrydev/iptable.log
sudo cp ip.tmp >> /usr/local/nullentrydev/iptable.log
fi
rm -rf ip.tmp
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
echo "externalip=[${MNIP1}]:12195" >> /home/proxynode/.proxynode/prx.conf
echo "masternodeprivkey=$privkey" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=103.29.70.126:12195" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=128.199.107.197:32882" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=128.199.167.252:42924" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=128.199.168.20:12195" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=139.162.239.231:58414" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=142.93.107.4:12195" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=144.76.100.197:12195" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=149.248.62.57:47318" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=149.28.46.44:12195" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=149.56.109.85:44970" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=149.56.142.46:42828" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=159.69.71.146:54542" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=159.69.72.29:39554" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=172.104.225.25:12195" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=172.105.219.206:12195" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=173.212.227.202:12195" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=178.128.98.126:48538" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=178.128.98.246:12195" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=185.232.131.131:12195" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=185.233.107.253:12195" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=185.246.65.67:12195" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=195.201.108.252:50074" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=207.154.197.200:12195" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=209.97.164.11:50296" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=211.205.247.145:60696" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=221.161.103.238:59270" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=45.32.102.50:57578" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=45.32.140.204:46108" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=45.32.19.53:39240" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=45.77.10.164:37162" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=45.79.90.91:12195" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=51.15.197.67:12195" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=51.158.78.150:33426" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=64.182.71.72:57863" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=81.156.103.48:54192" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=94.25.178.72:64521" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=95.179.146.143:12195" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=95.216.126.213:12195" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=95.216.37.67:40476" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=95.216.37.67:46514" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=95.216.37.93:43024" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=95.216.73.18:53274" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=95.216.74.153:37320" >> /home/proxynode/.proxynode/prx.conf
echo "addnode=95.216.74.158:42276" >> /home/proxynode/.proxynode/prx.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode1 : true" >> /usr/local/nullentrydev/prx.log
echo "walletVersion1 : 1.0.0" >> /usr/local/nullentrydev/prx.log
echo "scriptVersion1 : 0.9d" >> /usr/local/nullentrydev/prx.log
fi
sleep 5
echo
echo -e ${YELLOW}"Launching first PRX Node"${CLEAR}
prxd -datadir=/home/proxynode/.proxynode -daemon
echo
echo -e ${YELLOW}"Looking for a Shared Masternode Service? Check out Crypto Hash Tank" ${CLEAR}
echo -e ${YELLOW}"Support my Project, and put your loose change to work for you!" ${CLEAR}
echo -e ${YELLOW}" https://www.cryptohashtank.com/TJIF "${CLEAR}
echo
echo -e ${YELLOW}"Special Thanks to the BitcoinGenX (BGX) Community" ${CLEAR}
sleep 20
echo -e "${GREEN}Configuring second ProxyNode Node${CLEAR}"
sudo mkdir /home/proxynode2/.proxynode
sudo touch /home/proxynode2/prx.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/proxynode2/prx.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/proxynode2/prx.conf
echo "rpcallowip=127.0.0.1" >> /home/proxynode2/prx.conf
echo "server=1" >> /home/proxynode2/prx.conf
echo "daemon=1" >> /home/proxynode2/prx.conf
echo "maxconnections=250" >> /home/proxynode2/prx.conf
echo "masternode=1" >> /home/proxynode2/prx.conf
echo "rpcport=12197" >> /home/proxynode2/prx.conf
echo "listen=0" >> /home/proxynode2/prx.conf
echo "externalip=[${MNIP2}]:12195" >> /home/proxynode2/prx.conf
echo "masternodeprivkey=$privkey2" >> /home/proxynode2/prx.conf
echo "addnode=103.29.70.126:12195" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=128.199.107.197:32882" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=128.199.167.252:42924" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=128.199.168.20:12195" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=139.162.239.231:58414" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=142.93.107.4:12195" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=144.76.100.197:12195" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=149.248.62.57:47318" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=149.28.46.44:12195" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=149.56.109.85:44970" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=149.56.142.46:42828" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=159.69.71.146:54542" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=159.69.72.29:39554" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=172.104.225.25:12195" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=172.105.219.206:12195" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=173.212.227.202:12195" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=178.128.98.126:48538" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=178.128.98.246:12195" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=185.232.131.131:12195" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=185.233.107.253:12195" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=185.246.65.67:12195" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=195.201.108.252:50074" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=207.154.197.200:12195" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=209.97.164.11:50296" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=211.205.247.145:60696" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=221.161.103.238:59270" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=45.32.102.50:57578" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=45.32.140.204:46108" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=45.32.19.53:39240" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=45.77.10.164:37162" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=45.79.90.91:12195" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=51.15.197.67:12195" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=51.158.78.150:33426" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=64.182.71.72:57863" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=81.156.103.48:54192" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=94.25.178.72:64521" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=95.179.146.143:12195" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=95.216.126.213:12195" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=95.216.37.67:40476" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=95.216.37.67:46514" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=95.216.37.93:43024" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=95.216.73.18:53274" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=95.216.74.153:37320" >> /home/proxynode2/.proxynode/prx.conf
echo "addnode=95.216.74.158:42276" >> /home/proxynode2/.proxynode/prx.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode2 : true" >> /usr/local/nullentrydev/prx.log
echo "walletVersion2 : 1.0.0" >> /usr/local/nullentrydev/prx.log
echo "scriptVersion2 : 0.9d" >> /usr/local/nullentrydev/prx.log
fi
sleep 5
echo
echo -e "${GREEN}Configuring third ProxyNode Node${CLEAR}"
sudo mkdir /home/proxynode3/.proxynode
sudo touch /home/proxynode3/prx.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/proxynode3/prx.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/proxynode3/prx.conf
echo "rpcallowip=127.0.0.1" >> /home/proxynode3/prx.conf
echo "server=1" >> /home/proxynode3/prx.conf
echo "daemon=1" >> /home/proxynode3/prx.conf
echo "maxconnections=250" >> /home/proxynode3/prx.conf
echo "masternode=1" >> /home/proxynode3/prx.conf
echo "rpcport=12199" >> /home/proxynode3/prx.conf
echo "listen=0" >> /home/proxynode3/prx.conf
echo "externalip=[${MNIP3}]:12195" >> /home/proxynode3/prx.conf
echo "masternodeprivkey=$privkey3" >> /home/proxynode3/prx.conf
echo "addnode=103.29.70.126:12195" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=128.199.107.197:32882" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=128.199.167.252:42924" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=128.199.168.20:12195" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=139.162.239.231:58414" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=142.93.107.4:12195" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=144.76.100.197:12195" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=149.248.62.57:47318" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=149.28.46.44:12195" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=149.56.109.85:44970" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=149.56.142.46:42828" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=159.69.71.146:54542" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=159.69.72.29:39554" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=172.104.225.25:12195" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=172.105.219.206:12195" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=173.212.227.202:12195" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=178.128.98.126:48538" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=178.128.98.246:12195" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=185.232.131.131:12195" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=185.233.107.253:12195" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=185.246.65.67:12195" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=195.201.108.252:50074" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=207.154.197.200:12195" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=209.97.164.11:50296" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=211.205.247.145:60696" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=221.161.103.238:59270" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=45.32.102.50:57578" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=45.32.140.204:46108" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=45.32.19.53:39240" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=45.77.10.164:37162" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=45.79.90.91:12195" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=51.15.197.67:12195" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=51.158.78.150:33426" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=64.182.71.72:57863" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=81.156.103.48:54192" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=94.25.178.72:64521" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=95.179.146.143:12195" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=95.216.126.213:12195" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=95.216.37.67:40476" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=95.216.37.67:46514" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=95.216.37.93:43024" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=95.216.73.18:53274" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=95.216.74.153:37320" >> /home/proxynode3/.proxynode/prx.conf
echo "addnode=95.216.74.158:42276" >> /home/proxynode3/.proxynode/prx.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode3 : true" >> /usr/local/nullentrydev/prx.log
echo "walletVersion3 : 1.0.0" >> /usr/local/nullentrydev/prx.log
echo "scriptVersion3 : 0.9d" >> /usr/local/nullentrydev/prx.log
fi
sleep 5
echo
echo -e "${GREEN}Configuring fourth ProxyNode Node${CLEAR}"
sudo mkdir /home/proxynode4/.proxynode
sudo touch /home/proxynode4/prx.conf
echo "rpcuser=user"`shuf -i 100000-9999999 -n 1` >> /home/proxynode4/prx.conf
echo "rpcpassword=pass"`shuf -i 100000-9999999 -n 1` >> /home/proxynode4/prx.conf
echo "rpcallowip=127.0.0.1" >> /home/proxynode4/prx.conf
echo "server=1" >> /home/proxynode4/prx.conf
echo "daemon=1" >> /home/proxynode4/prx.conf
echo "maxconnections=250" >> /home/proxynode4/prx.conf
echo "masternode=1" >> /home/proxynode4/prx.conf
echo "rpcport=12200" >> /home/proxynode4/prx.conf
echo "listen=0" >> /home/proxynode4/prx.conf
echo "externalip=[${MNIP4}]:12195" >> /home/proxynode4/prx.conf
echo "masternodeprivkey=$privkey4" >> /home/proxynode4/prx.conf
echo "addnode=103.29.70.126:12195" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=128.199.107.197:32882" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=128.199.167.252:42924" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=128.199.168.20:12195" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=139.162.239.231:58414" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=142.93.107.4:12195" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=144.76.100.197:12195" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=149.248.62.57:47318" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=149.28.46.44:12195" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=149.56.109.85:44970" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=149.56.142.46:42828" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=159.69.71.146:54542" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=159.69.72.29:39554" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=172.104.225.25:12195" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=172.105.219.206:12195" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=173.212.227.202:12195" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=178.128.98.126:48538" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=178.128.98.246:12195" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=185.232.131.131:12195" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=185.233.107.253:12195" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=185.246.65.67:12195" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=195.201.108.252:50074" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=207.154.197.200:12195" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=209.97.164.11:50296" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=211.205.247.145:60696" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=221.161.103.238:59270" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=45.32.102.50:57578" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=45.32.140.204:46108" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=45.32.19.53:39240" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=45.77.10.164:37162" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=45.79.90.91:12195" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=51.15.197.67:12195" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=51.158.78.150:33426" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=64.182.71.72:57863" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=81.156.103.48:54192" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=94.25.178.72:64521" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=95.179.146.143:12195" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=95.216.126.213:12195" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=95.216.37.67:40476" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=95.216.37.67:46514" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=95.216.37.93:43024" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=95.216.73.18:53274" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=95.216.74.153:37320" >> /home/proxynode4/.proxynode/prx.conf
echo "addnode=95.216.74.158:42276" >> /home/proxynode4/.proxynode/prx.conf
if [[ $NULLREC = "y" ]] ; then
echo "masterNode4 : true" >> /usr/local/nullentrydev/prx.log
echo "walletVersion4 : 1.0.0" >> /usr/local/nullentrydev/prx.log
echo "scriptVersion4 : 0.9d" >> /usr/local/nullentrydev/prx.log
fi
sleep 5
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
sudo cp -r /home/proxynode/.proxynode/* /home/proxynode2/.proxynode
sleep 3
sudo cp -r /home/proxynode/.proxynode/* /home/proxynode3/.proxynode
sleep 3
sudo cp -r /home/proxynode/.proxynode/* /home/proxynode4/.proxynode
sleep 3
rm /home/proxynode2/.proxynode/prx.conf
sleep 1
rm /home/proxynode3/.proxynode/prx.conf
sleep 1
rm /home/proxynode4/.proxynode/prx.conf
sleep 1
cp -r /home/proxynode2/prx.conf /home/proxynode2/.proxynode/prx.conf
sleep 1
cp -r /home/proxynode3/prx.conf /home/proxynode3/.proxynode/prx.conf
sleep 1
cp -r /home/proxynode4/prx.conf /home/proxynode4/.proxynode/prx.conf
sleep 1
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
echo -e ${BOLD}"All ${NODESN} PRX Nodes Launched".${CLEAR}
echo

echo -e "${GREEN}You can check the status of your PRX Masternode with"${CLEAR}
echo -e "${YELLOW}For mn1: \"prx-cli -datadir=/home/proxynode/.proxynode masternode status\""${CLEAR}
echo -e "${YELLOW}For mn2: \"prx-cli -datadir=/home/proxynode2/.proxynode masternode status\""${CLEAR}
echo -e "${YELLOW}For mn3: \"prx-cli -datadir=/home/proxynode3/.proxynode masternode status\""${CLEAR}
echo -e "${YELLOW}For mn4: \"prx-cli -datadir=/home/proxynode4/.proxynode masternode status\""${CLEAR}
echo
echo -e "${RED}Status 29 may take a few minutes to clear while the daemon processes the chainstate"${CLEAR}
echo -e "${GREEN}The data below needs to be in your local masternode configuration file:${CLEAR}"
echo -e "${BOLD} Masternode - \#1 IP: [${MNIP1}]:12195${CLEAR}"
echo -e "${BOLD} Masternode - \#2 IP: [${MNIP2}]:12195${CLEAR}"
echo -e "${BOLD} Masternode - \#3 IP: [${MNIP3}]:12195${CLEAR}"
echo -e "${BOLD} Masternode - \#4 IP: [${MNIP4}]:12195${CLEAR}"
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
