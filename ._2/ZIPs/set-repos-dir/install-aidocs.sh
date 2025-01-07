#!/bin/bash

#  frt install AIDocs_demo1-master  -d; aRepo="AIDocs_demo1-master"
#  frt install AIDocs_/demo1-master -d; aRepo="AIDocs_/demo1-master"
#  frt install AIDocs               -d; aRepo="AIDocs"

   aRepo="$1"; if [ "$1" == "" ]; then aRepo="AIDocs_demo1-master"; fi
#  ----------------------------------------------------------------------------
   export aQuiet=q                                                                      # .(50105.05b.7 RAM Add aQuiet)
 
   echo "  frt install ${aRepo} '$2' '$3' -d;"
           frt install ${aRepo}  $2   $3  -d;                                           # .(50105.05b.8 RAM Remove -q)

   aRepoDir="${aRepo}"; aRepo="${aRepo/\.code.workspace/}"                              # .(50106.06.5 RAM Create aRepoDir)

   if [ $? -ne 1 ]; then                                                                # .(50106.04.15 RAM Exit if bDoit=0)

   echo -e "\n  cd ${aRepoDir}/client1" # exit                                          ##.(50106.06.6).(50104.01.10)
#  cd ${aRepoDir}/client1                                                               # .(50106.06.7) 

   echo "  npm install"                                                                 
           npm install | awk '{ print "    " $0 }'                                       

   cp -p ./c16_aidocs-review-app/utils/FRTs/_env_local-local.txt ./c16_aidocs-review-app/utils/FRTs/_env

#  echo ""
   echo -e "\n  Edit SERVER_HOST and ANYLLM_API_KEY in _env:"
   echo -e   "     cd ${aRepoDir}"                                                      # .(50106.06.8 
   echo -e "      nano client1/c16_aidocs-review-app/utils/FRTs/_env"
   echo -e "     ./run-client.sh\n"
   echo -e   "  or open VSCode with: code ${aRepo/\//}*"                                ##.(50106.06.8).(50104.01.13 End)
   fi                                                                                   # .(50106.04.16 RAM Exit if bDoit=0)

   if [ "${OS:0:7}"     != "Windows" ]; then echo ""; fi