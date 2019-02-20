#!/bin/bash
#Setting Colors
BLUE='\033[0;96m'
GREEN='\033[0;92m'
RED='\033[0;91m'
YELLOW='\033[0;93m'
#clear font
CLEAR='\033[0m'

#Checking OS
if [[ $(lsb_release -d) != *16.04* ]]; then
  echo -e ${RED}"The operating system is not Ubuntu 16.04. You must be running on ubuntu 16.04."${CLEAR}
  exit 1
fi
#Menu to Confirm and Pull correct scripts
echo
echo
echo
echo
echo
echo -e ${BLUE}
echo " _ __       _  _  __                                      ";
echo "' )  )     // // /  \`     _/_                            ";
echo " /  / . . // // /--  ____  /  __  __  ,                   ";
echo "/  (_(_/_</_</_(___,/ / <_<__/ (_/ (_/_                   ";
echo "                                    /                     ";
echo "                                   '                      ";
echo "     _ _ _                                                ";
echo "    ' ) ) )         _/_                   /               ";
echo "     / / / __.  _   /  _  __  ____  __ __/ _              ";
echo "    / ' (_(_/|_/_)_<__</_/ (_/ / <_(_)(_/_</_             ";
echo "                                                          ";
echo "                                                          ";
echo "             _                      _  _                  ";
echo "            | )           _/_      // //     _/_          ";
echo "        ,---|/  ____  _   /  __.  // // __.  /  o __ ____ ";
echo "         \_/ \_/ / <_/_)_<__(_/|_</_</_(_/|_<__<_(_)/ / <_";
echo "                                                          ";
echo "                                                          ";
echo -e ${YELLOW}" For ProxyNode MasterNode :: Script Version:0.08a"${CLEAR}
echo -e ${YELLOW}"        Pre-Release Test"${CLEAR}
echo
echo -e ${YELLOW}"Welcome to the Feston Beta Automated Install Script by ${BLUE}NullEntry"${CLEAR}
echo -e ${RED}'THE SCRIPT IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND'${CLEAR}
echo -e ${YELLOW}"Durring this Process Please Hit Enter or Input What is Asked."${CLEAR}
echo
echo -e ${GREEN}"Are you sure you want to install ProxyNode Masternode(s)?"${CLEAR}
echo -e ${GREEN} "Press y for yes, and n for no followed by [ENTER]:"${CLEAR}
read AGREE
if [[ $AGREE =~ "y" ]] ; then
echo
echo
echo
echo -e ${RED}"PLEASE READ "${CLEAR}
#echo -e ${YELLOW}"Installing more then 2 Masternodes, Masternode may not function correctly"${CLEAR}
echo -e ${YELLOW}"If you don't receive payment for multiple mastnodes, contact Support "${CLEAR}
echo -e ${YELLOW}"Find Sburns1369#1584 on Discord - https://discord.gg/YhJ8v3g"${CLEAR}
echo
echo -e ${GREEN}"(1) = 1 IPv4 Masternode"${CLEAR}
echo -e ${GREEN}"(2) = 1 IPv4 Masternode and 1 IPv6 Masternode"${CLEAR}
echo -e ${GREEN}"Please enter the number (1-2) of $COIN Masternode(s)"${CLEAR}
echo -e ${GREEN}"you would like to install :"${CLEAR}
read NUMBER
case $NUMBER in
  1)bash <(curl -Ls https://raw.githubusercontent.com/sburns1369/ProxyNode_MN_Script/master/prx_single.sh);;
  2)bash <(curl -Ls https://raw.githubusercontent.com/sburns1369/ProxyNode_MN_Script/master/prx_2pack.sh);;
  *)echo -e ${RED}"Invalid Option - Exiting Setup - Re-run to try again"${CLEAR};;
esac
else
echo -e "Exiting Setup!  You can re-run to try again"
fi
