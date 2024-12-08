#!/bin/bash

     aRepos="$( pwd | awk '{ print tolower($0) }' )";
if [ "${aRepos/repos}" == "${aRepos}" ]; then
     echo -e "\n* You must be in a Repos folder."
     exit; fi

     aZIPs_URL="https://raw.githubusercontent.com/robinmattern/FRTools_prod2-master/master/._2/ZIPs"
     a7zip_Ver="$( zip -h 2>&1 | awk '/^7-Zip/ { print $3 }' )";
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
#    if ! curl -s "${aZIPs_URL}/install-7zip.sh" 2>/dev/null | bash 2>/dev/null; then
     if ! curl    "${aZIPs_URL}/install-7zip.sh" -o install-7zip.sh 2>/dev/null; then
     echo -e   "* The script, install-7zip.sh, failed."
     exit; fi
     fi

     if ! curl -s "${aZIPs_URL}/set-repos.zip"  -o set-repos.zip  2>/dev/null; then
     echo -e "\n* Failed to download, set-repos.zip."
     exit; fi

     echo -e "\n  Unzipping: set-repos.zip"
     zip x set-repos.zip
