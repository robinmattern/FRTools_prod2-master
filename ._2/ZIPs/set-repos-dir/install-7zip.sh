#!/bin/bash

    a7zip="7zip"   # "not 7z, 7zz, 7za or zip"

    aBIN="$HOME/bin/7z"
	winBIN="${USERPROFILE}\\\bin\\7z"
	if [ ! -d "${aBIN}" ]; then mkdir -p "${aBIN}"; fi
	cd "${aBIN}"

#   -----------------------------------------------------

function exit_wCR() {
  if [ "${OS:0:7}"     != "Windows" ]; then echo ""; fi                                 # .(41120.01.5)
    exit
    }
#   -----------------------------------------------------

function download() {                    echo -e "\n  Downloading: $2";
	if ! curl -L "$1" -o $2;        then echo -e   "* Download of $2 failed\n"; exit_wCR; fi
	if [ -f "$2" ] && [ -s "$2" ];  then echo -e   "  Downloaded: ${aBIN}/$2";
                                    else echo -e   "* Download of $2 failed\n"; exit_wCR; fi
         }
#   -----------------------------------------------------

function check7z {                  echo -e "\n  Unzipping: 7-Zip";
     if [ "$1" != ""     ]; then if [ -f "$1" ]; then a7z=$1; fi; fi
     if [ "$2" != ""     ]; then if [ -f "$2" ]; then a7z=$2; fi; fi
     if [ "${a7z}" != "" ]; then    echo -e   "  Installed: 7-Zip as ${a7z}";
                            else    echo -e "    Unzip of 7-Zip failed\n"; exit_wCR; fi
         }
#   -----------------------------------------------------------------------

if [ "${OS:0:7}" == "Windows" ]; then

#   curl -L  "https://7-zip.org/a/7zr.exe"         -o 7zr.exe 2>/dev/null
#	curl -L  "https://7-zip.org/a/7z2409-extra.7z" -o 7zip.7z 2>/dev/null
    download "https://7-zip.org/a/7zr.exe"            7zr.exe
    download "https://7-zip.org/a/7z2409-extra.7z"    7zip.7z

	./7zr.exe x 7zip.7z; ./check7z 7za.exe                                             # .(50716.07.1 RAM Add ./)

	echo -e "@echo off\n${winBIN}\\7za.exe %*"      >${a7zip}.cmd
	echo -e "#\!/bin/bash\n${aBIN}/7za.exe \"\$@\"" >${a7zip}
	echo -e "if [ \"\$1\" == \"\" ]; then ${aBIN}/${a7z} | awk '/<Switches>/ { exit }; { print }'; exit; fi" >>${a7zip}

    if [ ! -d  /c/Home/._0/bin  ]; then mkdir -p /c/Home/._0/bin; fi
    if [ ! -d  /c/Home/._0/Cmds ]; then mkdir -p /c/Home/._0/Cmds; fi
	cp ${a7zip}     /c/Home/._0/bin/${a7zip}
	cp ${a7zip}.cmd /c/Home/._0/Cmds/${a7zip}.cmd
	echo "${a7zip}" >"$HOME/bin/7z/@ZIP_Exe"                    # .(50102.04.9 RAM Save 7Zip name)
	fi
#   -----------------------------------------------------------------------

if [ "${OSTYPE:0:6}" == "darwin" ]; then

#   curl -L  "https://7-zip.org/a/7z2409-mac-tar.xz" -o 7zip.tar.xz 2>/dev/null
    download "https://7-zip.org/a/7z2409-mac.tar.xz"    7zip.tar.xz

	tar xf 7zip.tar.xz; check7z 7zz 7z

	echo -e "#\!/bin/bash\n${aBIN}/${a7z} \"\$@\"" >${a7zip}
	echo -e "if [ \"\$1\" == \"\" ]; then ${aBIN}/${a7z} | awk '/<Switches>/ { exit }; { print }'; exit; fi" >>${a7zip}
	chmod 755 ${a7zip}
 
    if [ ! -d  /Users/Shared/._0/bin ]; then mkdir -p /Users/Shared/._0/bin; fi
	     cp ${a7zip}  /Users/Shared/._0/bin/${a7zip}
	sudo cp ${a7zip}         /usr/local/bin/${a7zip}
	echo "${a7zip}" >"$HOME/bin/7z/@ZIP_Exe"                    # .(50102.04.10 RAM Save 7Zip name)
	fi
#   -----------------------------------------------------------------------

if [ "${OSTYPE:0:5}" == "linux" ]; then

#   curl -L  "https://7-zip.org/a/7z2409-linux-x64.tar.xz" -o 7zip.tar.xz 2>/dev/null
    download "https://7-zip.org/a/7z2409-linux-x64.tar.xz"    7zip.tar.xz

	tar xf 7zip.tar.xz; check7z 7zz 7z

	echo -e "#\!/bin/bash\n${aBIN}/${a7z} \"\$@\"" >${a7zip}
	echo -e "if [ \"\$1\" == \"\" ]; then ${aBIN}/${a7z} | awk '/<Switches>/ { exit }; { print }'; exit; fi" >>${a7zip}
	chmod 755 ${a7zip}

    if [ ! -d   /home/._0/bin ]; then mkdir -p /home/._0/bin; fi
     	 cp ${a7zip}  /home/._0/bin/${a7zip}
	sudo cp ${a7zip} /usr/local/bin/${a7zip}
	echo "${a7zip}" >"$HOME/bin/7z/@ZIP_Exe"                    # .(50102.04.11 RAM Save 7Zip name)
	fi
#   -----------------------------------------------------------------------

	echo "  Your command for 7-Zip is: ${a7zip}"
	exit_wCR
