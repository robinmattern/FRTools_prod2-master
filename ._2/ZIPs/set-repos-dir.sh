#!/bin/bash

#    aVer=".(41208.05_Latest set-repos and set-repos-dir.sh"

     aCR=""; if [ "${OS:0:7}" != "Windows" ]; then aCR="\n"; fi                         # .(41120.01.6)
     bTest=0                                                                            # .(50102.05.1 RAM Test locally)

     aRepos="$( pwd | awk '{ print tolower($0) }' )";
  if [ "${aRepos/repos}" == "${aRepos}" ]; then
     echo -e "* You must be in a Repos folder.\n"
     exit; fi

     aZIPs_URL="https://raw.githubusercontent.com/robinmattern/FRTools_prod2-master/master/._2/ZIPs"
#    aZIP_Ver="$( 7zip  -h 2>&1 | awk '/^7-Zip/      { print $3 }' )";                                                        ##.(50102.04.3)
     aZIP_Ver="$( 7zip  -h 2>&1 | awk '/\(c\).+Igor/ { print "7-Zip  7zip "  $3 }' )";     if [ "${aZIP_Ver}" == "" ]; then   # .(50102.04.3 RAM Check for many version of 7zip Beg)
     aZIP_Ver="$( zip   -h 2>&1 | awk '/\(c\).+Igor/ { print "7-Zip  zip "   $3 }' )"; fi; if [ "${aZIP_Ver}" == "" ]; then
     aZIP_Ver="$( 7z    -h 2>&1 | awk '/\(c\).+Igor/ { print "7-Zip  7z "    $3 }' )"; fi; if [ "${aZIP_Ver}" == "" ]; then
     aZIP_Ver="$( zip   -h 2>&1 | awk '/\(c\).+Igor/ { print "7-Zip  7-zip " $3 }' )"; fi; if [ "${aZIP_Ver}" == "" ]; then
     aZIP_Ver="$( 7-zip -h 2>&1 | awk '/Zip.+Usage/  { print "Info-Zip zip " $2 }' )"; fi;                                    # .(50102.04.3 End

#    echo "  aZIP_Ver: '${aZIP_Ver}'"

  if [ "${aZIP_Ver}" != "" ]; then
     aZIP_Exe="$( echo "${aZIP_Ver}" | awk '{ print $2 }' )";                                                                 # .(50102.04.4)
     aZIP_Ver="$( echo "${aZIP_Ver}" | awk '{ print $1" v"$3 }' )";                                                           # .(50102.04.5)
     echo -e "\n  The current version of \"${aZIP_Exe}\" is ${aZIP_Ver}."
     fi

  if [ "${aZIP_Ver}" != "7-Zip v24.09" ]; then  # or if ! type zip >/dev/null 2>&1; then
     echo -e "\n  Executing: install-7zip.sh";
     if [ "${bTest}" == "1" ]; then ./install-7zip.sh 2>/dev/null; else                 # .(50102.05.2 RAM Test local version)
     if ! curl -s "${aZIPs_URL}/install-7zip.sh" 2>/dev/null | bash 2>/dev/null; then
#    if ! curl    "${aZIPs_URL}/install-7zip.sh" -o install-7zip.sh 2>/dev/null; then
     echo -e   "* Failed to execute the script, install-7zip.sh.${aCR}"
     exit; fi; fi                                                                       # .(50102.05.3)

     aZIP_Exe="$( cat "$HOME/bin/7z/@ZIP_Exe" )"; # rm "$HOME/bin/7z/@ZIP_Exe"          # .(50102.04.6 RAM Retrieve 7Zip name)
#    echo "  aZIP_Exe: '${aZIP_Exe}'"; exit

  if [ "${aZIP_Exe}" == "" ]; then exit; fi
     echo -e "\n  The current version of \"${aZIP_Exe}\" v24.09 has been installed."
     fi

     if [ "${bTest}" == "0" ]; then                                                     # .(50102.05.4 RAM Test local version)
  if ! curl -s "${aZIPs_URL}/set-repos-dir.zip"  -o set-repos-dir.zip  2>/dev/null; then
     echo -e "\n* Failed to download, set-repos-dir.zip.${aCR}"
     exit;
     fi; fi                                                                             # .(50102.05.5)
     echo -e "\n  Unzipping, set-repos-dir.zip, with ${aZIP_Exe} --"
     ${aZIP_Exe} x -y set-repos-dir.zip 2>&1 | awk '/Extract|Files|Folders/ { print "    " $0 }'  # .(50102.04.10).(50102.04.7 RAM Was 7zip)

     if [ ! -f "re-install.sh" ]; then
     echo -e "\n* Failed to unzip, set-repos-dir.zip.${aCR}"
     exit
     fi
     if [ "${OS:0:7}" != "Windows" ]; then echo ""; sudo chmod 755 *.sh; fi             # .(50101.04.1 RAM Opps Windows check)
    
     mv re-install.sh re-install
     mv    install.sh    install                                                        # .(50105.04.3 RAM For the new `install` script)

     echo -e "  The FormR install scripts have been downloaded into your Repos folder."
     echo -e "  You can now run these install scripts -- "                              # .(50105.04.4 RAM Add install help)
     bash install                                                                       # .(50105.04.5)

     if [ "${bTest}" == "0" ]; then rm set-repos-dir.zip; fi                            # .(50102.05.6 RAM If not testing locally).(41226.04.1 RAM Erase it)
     if [ "${aCR}" != "" ]; then echo ""; fi
