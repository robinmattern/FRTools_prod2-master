#!/bin/bash

#  frt install AIDocs_demo1-master  -d; aRepo="AIDocs_demo1-master"
#  frt install AIDocs_/demo1-master -d; aRepo="AIDocs_/demo1-master"
#  frt install AIDocs               -d; aRepo="AIDocs"

   aRepo="$1"; if [ "$1" == "" ]; then  aRepo="AIDocs"; fi
#  ----------------------------------------------------------------------------

   frt install ${aRepo} $2 -dq;                                                         # .(50104.03.4 RAM Add -q)

   echo -e "\n  cd ${aRepo}/client1"                                                    # .(50104.03.5)
   cd ${aRepo}/client1

   echo "  npm install"                                                                 # .(50104.03.6)
   npm install | awk '{ print "    " $0 }'                                              # .(50104.03.7)

   cp -p ./c16_aidocs-review-app/utils/FRTs/_env_local-local.txt ./c16_aidocs-review-app/utils/FRTs/_env

#  echo ""
   echo -e "\n  Edit SERVER_HOST and ANYLLM_API_KEY in _env:"
   echo -e "      cd ${aRepo}"
   echo -e "      nano client1/c16_aidocs-review-app/utils/FRTs/_env"
   echo -e "     ./run-client.sh\n"
   echo -e "  or  code *code* for VSCode"   

   if [ "${OS:0:7}"     != "Windows" ]; then echo ""; fi 