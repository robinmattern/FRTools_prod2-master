#!/bin/bash

#*   -- --- ---------------  =  -----------------------------------------------------   #   ------------ *###

#    aVer=".(41208.05_Latest set-repos and set-repos-dir.sh"

     aCR=""; if [ "${OS:0:7}" != "Windows" ]; then aCR="\n"; fi                         # .(41120.01.6)
     bTest=0                                                                            # .(50102.05.1 RAM Test locally)

     aRepos="$( pwd | awk '{ print tolower($0) }' )";

  if [ "${aRepos/repos}" == "${aRepos}" ]; then bNotInRepos=1; fi                       # .(51123.03.1)
  if [ "${aRepos/webs}"  == "${aRepos}" ]; then bNotInWebs=1;  fi                       # .(51123.03.2)
  if [ "${bNotInRepos}" == "1" ] && [ "${bNotInWebs}" == "1" ]; then                    # .(51123.03.3)
     echo -e "* You must be in a Repos or Webs folder.\n"                               # .(51123.03.4)
     exit; fi

     aZIPs_URL="https://raw.githubusercontent.com/robinmattern/FRTools_prod2-master/master/._2/ZIPs"
#    aZIP_Ver="$( 7zip  -h 2>&1 | awk '/^7-Zip/      { print $3 }' )";                                                        ##.(50102.04.3)
     aZIP_Ver="$( 7zip  -h 2>&1 | awk '/\(c\).+Igor/ { print "7-Zip  7zip "  $3 }' )";     if [ "${aZIP_Ver}" == "" ]; then   # .(50102.04.3 RAM Check for many version of 7zip Beg)
     aZIP_Ver="$( zip   -h 2>&1 | awk '/\(c\).+Igor/ { print "7-Zip  zip "   $3 }' )"; fi; if [ "${aZIP_Ver}" == "" ]; then
     aZIP_Ver="$( 7z    -h 2>&1 | awk '/\(c\).+Igor/ { print "7-Zip  7z "    $3 }' )"; fi; if [ "${aZIP_Ver}" == "" ]; then
     aZIP_Ver="$( zip   -h 2>&1 | awk '/\(c\).+Igor/ { print "7-Zip  7-zip " $3 }' )"; fi; if [ "${aZIP_Ver}" == "" ]; then
     aZIP_Ver="$( 7-zip -h 2>&1 | awk '/Zip.+Usage/  { print "Info-Zip zip " $2 }' )"; fi;                                    # .(50102.04.3 End

 if [ "${aZIP_Ver}" == "" ]; then                                                                                             ##.(50907.01.1 RAM)
     aZIP_Ver="$( unzip    2>&1 | awk '/UnZip.+Debi/ { print "unzip  unzip " $2 }' )";  fi;                                   # .(50907.01.2 RAM On all Unix version?)

#    echo "  aZIP_Ver: '${aZIP_Ver}'"; # exit

  if [ "${aZIP_Ver}" != "" ]; then
     aZIP_Exe="$( echo "${aZIP_Ver}" | awk '{ print $2 }' )";                                                                 # .(50102.04.4)
     aZIP_Ver="$( echo "${aZIP_Ver}" | awk '{ print $1" v"$3 }' )";                                                           # .(50102.04.5)
     echo -e "\n  The current version of \"${aZIP_Exe}\" is ${aZIP_Ver}."
     fi
#    echo "  aZIP_Ver: '${aZIP_Ver}'"; # exit
#    echo "  aZIP_Exe: '${aZIP_Exe}'"; exit

  if [ "${aZIP_Ver:0:5}" != "unzip"  ]; then                                            # .(50907.01.3)

  if [ "${aZIP_Ver}" != "7-Zip v24.09" ]; then  # or if ! type zip >/dev/null 2>&1; then
     echo -e "\n  Executing: install-7zip.sh";
     if [ "${bTest}" == "1" ]; then ./install-7zip.sh 2>/dev/null; else                 # .(50102.05.2 RAM Test local version)
     if ! curl -s --ssl-no-revoke "${aZIPs_URL}/install-7zip.sh"   2>/dev/null | bash 2>/dev/null; then # .(50907.02.1 No revoke fails in ubuntu v14?).(50716.10.3)
#    if ! curl -s                 "${aZIPs_URL}/install-7zip.sh"   2>/dev/null | bash 2>/dev/null; then ##.(50907.02.1).(50716.10.3)
#    if ! curl    "${aZIPs_URL}/install-7zip.sh" -o install-7zip.sh 2>/dev/null; then
     echo -e   "* Failed to execute the script, install-7zip.sh, at ${aZIPs_URL}."      # .(50717.02.1)
     echo      "  We tried to use ${aZIP_Exe} version ${aZIP_Ver}.${aCR}"               # .(50717.02.2 RAM Add message)
     exit; fi; fi                                                                       # .(50102.05.3)

     aZIP_Exe="$( cat "$HOME/bin/7z/@ZIP_Exe" )"; # rm "$HOME/bin/7z/@ZIP_Exe"          # .(50102.04.6 RAM Retrieve 7Zip name)
#    echo "  aZIP_Exe: '${aZIP_Exe}'"; exit

  if [ "${aZIP_Exe}" == "" ]; then exit; fi
     echo -e "\n  The current version of \"${aZIP_Exe}\" v24.09 has been installed."
     fi
  fi                                                                                    # .(50907.01.4)

     if [ "${bTest}" == "0" ]; then                                                     # .(50102.05.4 RAM Test local version)
       echo "  curl -s \"${aZIPs_URL}/set-repos-dir.zip\"  -o set-repos-dir.zip"
  if ! curl -s --ssl-no-revoke "${aZIPs_URL}/set-repos-dir.zip"  -o set-repos-dir.zip 2>/dev/null; then # .(50907.02.2).(50716.10.4).(50406.05.1 Seems to fail if not in Repos folder)
#  if ! curl -s                "${aZIPs_URL}/set-repos-dir.zip"  -o set-repos-dir.zip 2>/dev/null; then ##.(50907.02.2).(50716.10.4).(50406.05.1 Seems to fail if not in Repos folder)
       echo -e "\n* Failed to download, set-repos-dir.zip, at ${aZIPs_URL}."              # .(50717.02.3)
       echo -e   "  We tried to use ${aZIPs_URL} version (${aZIP_Ver}).${aCR}"            # .(50717.02.4 RAM Add message)
       exit;
     fi; fi
                                                                                        # .(50102.05.5)
     echo -e "\n  Unzipping, set-repos-dir.zip, with ${aZIP_Exe} version ${aZIP_Ver}."  # .(50717.02.5
     aArgs="x -aoa -y"; if [ "${aZIP_Ver:0:5}" == "unzip"  ]; then aArgs=""; fi         # .(50907.01.5)

#    ${aZIP_Exe} x      -y set-repos-dir.zip 2>&1 | awk '/Extract|Files|Folders/ { print "    " $0 }'  ##.(50102.04.10).(50102.04.7 RAM Was 7zip).(50102.04b.1)
#    ${aZIP_Exe} x -aoa -y set-repos-dir.zip 2>&1 | awk '/Extract|Files|Folders/ { print "    " $0 }'  # .(50102.04b.1 RAM Override existing files).(50102.04.7 RAM Was 7zip)
     ${aZIP_Exe}  ${aArgs} set-repos-dir.zip 2>&1 | awk '/Extract|Files|Folders/ { print "    " $0 }'  # .(50102.04b.1 RAM Override existing files).(50102.04.7 RAM Was 7zip)

     if [ ! -f "install.sh" ]; then                                                     # .(50408.04.1 RAM Change from re-install)
     echo -e "\n* Failed to unzip, set-repos-dir.zip."                                  # .(50717.02.6 )
     echo -e "  We tried to use ${aZIP_Exe} version (${aZIP_Ver}).${aCR}"               # .(50717.07.2 RAM Add message)
     exit
     fi
# -----------------------------------------------------------------------------------

     if [ "${OS:0:7}" != "Windows" ]; then echo ""; sudo chmod 755 *.sh; fi             # .(50101.04.1 RAM Opps Windows check)
     if [ "${OS:0:7}" != "Windows" ]; then echo ""; sudo chmod 755 ._/INSTs/*.sh; fi    # .(50327.01.1 RAM Set chmod on moved INSTs scripts)
     if [ "$?" != "0" ]; then exit; fi                                                  # .(50516.01.2)

#    mv re-install.sh re-install                                                        ##.(50407.01.1 RAM Remove re-install).(50408.04.2)
     mv    install.sh    install                                                        # .(50408.04.3).(50105.04.3 RAM For the new `install` script)

     echo -e "\n  The FormR install scripts have been downloaded into your Repos folder."
     echo      "  We used ${aZIP_Exe} version ${aZIP_Ver} to unzip them."               # .(50717.02.7 RAM Add message)

     echo -e "\n//  ------  End of Install  ----------------------------------------------------------------------------- \\"   # .(50516.01.3 RAM Add End of Install msg)

#    echo -e "  You can now run any of these install scripts -- "                       ##.(50105.04.4 RAM Add install help).(50405.04.2 RAM Remove)
     bash install                                                                       # .(50105.04.5)

     if [ "${bTest}" == "0" ]; then                                                     # .(50408.04.4)
       if [ -f "set-repos-dir.sh"  ]; then rm "set-repos-dir.sh";  fi                   # .(50408.04.5 RAM Erase this too)
       if [ -f "set-repos-dir.zip" ]; then rm "set-repos-dir.zip"; fi                   # .(50102.05.6 RAM If not testing locally).(41226.04.1 RAM Erase it)
       fi                                                                               # .(50408.04.6)
#    if [ "${aCR}" != "" ]; then echo ""; fi                                            # .(50105.04.6)

#*   -- --  --------------  =  ------------------------------------------------------   #   ------------ *#




















