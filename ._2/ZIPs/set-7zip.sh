#!/bin/bash
   a7zip="7zip1"
   a7zip_exe="/C/Program Files/7-Zip/7z.exe"
   w7zip_exe="C:\\Program Files\\7-Zip/7z.exe"

   echo -e "#\!/bin/bash" >${a7zip}
   echo -e "if [ \"\$1\" == \"\" ]; then \"${a7zip_exe}\" | awk '/<Switches>/ { exit }; { print }'" >>${a7zip}
   echo -e  "                   else \"${a7zip_exe}\" \"\$@\"; fi" >>${a7zip}

   echo -e "@echo off              \n \"${w7zip_exe}\"  %*"         >${a7zip}.cmd
