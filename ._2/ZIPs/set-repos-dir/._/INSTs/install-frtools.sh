#!/bin/bash

#  aRepo="FRTools_prod2-master"
#  aRepo="FRTools_/prod2-master"
#  aRepo="FRTools"

   aRepo="$1"; if [ "$1" == "" ]; then aRepo="FRTools"; fi
#  ----------------------------------------------------------------------------

   if [ "$( which git )" == "" ]; then echo -e "\n* You must install git, first\n"; exit; fi   # .(50810.01.1 RAM Check for git)

   git clone https://github.com/robinmattern/FRTools_prod2-master.git "${aRepo}"

   cd ${aRepo}

   if [ "${OS}" != "Windows" ]; then sudo chmod 755 *.sh; fi

   ./set-frtools.sh doit
