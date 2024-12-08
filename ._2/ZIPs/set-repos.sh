#!/bin/bash
   aZIPs_URL="https://raw.githubusercontent.com/robinmattern/FRTools_prod2-master/master/._2/ZIPs";
   if ! curl -s "${aZIPs_URL}/set-repos-dir.sh" 2>/dev/null | bash; then
   echo -e   "* The script, install-7zip.sh, failed.";
   exit; 
   fi
