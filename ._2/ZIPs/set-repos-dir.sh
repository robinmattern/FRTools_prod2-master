#!/bin/bash

#    aVer=".(41208.05_Latest set-repos and set-repos-dir.sh"

     aCR=""; if [ "${OS:0:7}"     != "Windows" ]; then aCR="\n"; fi                     # .(41120.01.6) 

     aRepos="$( pwd | awk '{ print tolower($0) }' )";
if [ "${aRepos/repos}" == "${aRepos}" ]; then
     echo -e "* You must be in a Repos folder.\n"
     exit; fi

     aZIPs_URL="https://raw.githubusercontent.com/robinmattern/FRTools_prod2-master/master/._2/ZIPs"
     a7zip_Ver="$( 7zip -h 2>&1 | awk '/^7-Zip/ { print $3 }' )";
if [ "${a7zip_Ver}" != "" ]; then
     echo -e "\n  The current version of 7-Zip is ${a7zip_Ver}."
   else
     a7zip_Ver="$( zip -h 2>&1 | awk '/^Zip/ { print $2 }' )";
     if [ "${a7zip_Ver}" != "" ]; then
     echo -e "\n  The current version of Info-ZIP is ${a7zip_Ver}."; fi
     a7zip_Ver=""
     fi
if [ "${a7zip_Ver}" != "24.09" ]; then  # or if ! type zip >/dev/null 2>&1; then
     echo -e "\n  Executing: install-7zip.sh"
     if ! curl -s "${aZIPs_URL}/install-7zip.sh" 2>/dev/null | bash 2>/dev/null; then
#    if ! curl    "${aZIPs_URL}/install-7zip.sh" -o install-7zip.sh 2>/dev/null; then
     echo -e   "* The script, install-7zip.sh, failed.${aCR}"
     exit; fi
     fi

     if ! curl -s "${aZIPs_URL}/set-repos-dir.zip"  -o set-repos-dir.zip  2>/dev/null; then
     echo -e "\n* Failed to download, set-repos-dir.zip.${aCR}"
     exit; fi

     echo -e "\n  Unzipping: set-repos-dir.zip."
#    7zip x -y set-repos-dir.zip | awk '{ print "  " $0 }'
     7z x -y set-repos-dir.zip | awk '{ print "  " $0 }'

     if [ "${OS}" != "Windows" ]; then echo ""; sudo chmod 755 *.sh; fi
     mv re-install.sh re-install

     rm set-repos-dir.zip                                                               # .(41226.04.1 RAM Erase it)
     if [ "${aCR}" != "" ]; then echo ""; fi
