#!/bin/bash

    aBIN="$HOME/bin/7z"
	winBIN="${USERPROFILE}\\\bin\\7z"
	if [ ! -d "${aBIN}" ]; then mkdir -p "${aBIN}"; fi
	cd "${aBIN}"

if [ "${OS:0:7}" == "Windows" ]; then
	curl -L "https://7-zip.org/a/7zr.exe" -o 7zr.exe
	curl -L "https://7-zip.org/a/7z2409-extra.7z" -o 7zip.7z
	7zr.exe x 7zip.7z
	echo -e "#\!/bin/bash\n${aBIN}/7za.exe \"\$@\"" >zip
	echo -e "@echo off\n${winBIN}\\7za.exe %*" >zip.cmd
#	echo -e "@echo off\n${USERPROFILE}\\\bin\\7z\\7za.exe %*" >zip.cmd
	cp zip     /c/Home/._0/bin/zip
	cp zip.cmd /c/Home/._0/Cmds/zip.cmd
	fi

if [ "${OSTYPE:0:6}" == "darwin" ]; then
	curl -L "https://7-zip.org/a/7z2409-mac.tar.xz" -o 7zip.tar.xz
	tar xf 7zip.tar.xz
	echo -e "#\!/bin/bash\n{$BIN}/7za \"\$@\"" >zip
	cp zip /Users/Shared/._0/bin/zip
	fi

if [ "${OSTYPE:0:5}" == "linux" ]; then
	curl -L "https://7-zip.org/a/7z2409-linux-x64.tar.xz" -o 7zip.tar.xz
	tar xf 7zip.tar.xz
	echo -e "#\!/bin/bash\n{$BIN}/7za \"\$@\"" >zip
	cp zip /Home/._0/bin/zip
	fi
