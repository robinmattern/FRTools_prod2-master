#!/bin/bash

     aZIPs_URL="https://raw.githubusercontent.com/robinmattern/FRTools_prod2-master/master/._2/ZIPs";
#    if ! curl -s "${aZIPs_URL}/set-repos-dir.sh" 2>/dev/null | bash; then
#    if ! curl    "${aZIPs_URL}/set-repos-dir.sh" | bash; then
     if ! curl    "${aZIPs_URL}/set-repos-dir.sh" -o set-repos-dir.sh 2>/dev/null ; then
     echo -e "\n* The script, set-repos-dir.sh, failed.";
     fi
     echo ""
