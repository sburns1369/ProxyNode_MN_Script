#!/bin/bash
#0.9d-- NullEntryDev Script
NODESL=Eight
NODESN=8
BLUE='\033[0;96m'
GREEN='\033[0;92m'
RED='\033[0;91m'
YELLOW='\033[0;93m'
CLEAR='\033[0m'
prx-cli -datadir=/home/proxynode/.proxynode stop
sleep 5
cd /home/proxynode/.proxynode
rm -r peers*
wget https://github.com/sburns1369/ProxyNode_MN_Script/raw/master/peers.dat
prxd -datadir=/home/proxynode/.proxynode
echo
echo -e "${RED}This process can take a while!${CLEAR}"
echo -e "${YELLOW}Waiting on First Masternode Block Chain to Synchronize${CLEAR}"
echo -e "${YELLOW}Once complete, it will stop and copy the block chain to${CLEAR}"
echo -e "${YELLOW}the other masternodes. This prevent all masternodes${CLEAR}"
echo -e "${YELLOW}from downloading the block chain individually; taking up${CLEAR}"
echo -e "${YELLOW}more time and resources. Current Block count will be displayed below.${CLEAR}"
sleep 10
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
sudo cp -r /home/proxynode/.proxynode/* /home/proxynode5/.proxynode
sleep 3
sudo cp -r /home/proxynode/.proxynode/* /home/proxynode6/.proxynode
sleep 3
sudo cp -r /home/proxynode/.proxynode/* /home/proxynode7/.proxynode
sleep 3
sudo cp -r /home/proxynode/.proxynode/* /home/proxynode8/.proxynode
sleep 3
rm /home/proxynode2/.proxynode/prx.conf
sleep 1
rm /home/proxynode3/.proxynode/prx.conf
sleep 1
rm /home/proxynode4/.proxynode/prx.conf
sleep 1
rm /home/proxynode5/.proxynode/prx.conf
sleep 1
rm /home/proxynode6/.proxynode/prx.conf
sleep 1
rm /home/proxynode7/.proxynode/prx.conf
sleep 1
rm /home/proxynode8/.proxynode/prx.conf
sleep 1
cp -r /home/proxynode2/prx.conf /home/proxynode2/.proxynode/prx.conf
sleep 1
cp -r /home/proxynode3/prx.conf /home/proxynode3/.proxynode/prx.conf
sleep 1
cp -r /home/proxynode4/prx.conf /home/proxynode4/.proxynode/prx.conf
sleep 1
cp -r /home/proxynode5/prx.conf /home/proxynode5/.proxynode/prx.conf
sleep 1
cp -r /home/proxynode6/prx.conf /home/proxynode6/.proxynode/prx.conf
sleep 1
cp -r /home/proxynode7/prx.conf /home/proxynode7/.proxynode/prx.conf
sleep 1
cp -r /home/proxynode8/prx.conf /home/proxynode8/.proxynode/prx.conf
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
echo -e "${YELLOW} prx-cli -datadir=/home/proxynode/.proxynode masternode status"${CLEAR}
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
