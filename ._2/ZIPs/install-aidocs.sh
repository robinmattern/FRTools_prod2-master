#!/bin/bash

#  frt install AIDocs_demo1-master  -d; aRepo="AIDocs_demo1-master"
#  frt install AIDocs_/demo1-master -d; aRepo="AIDocs_/demo1-master"
#  frt install AIDocs               -d; aRepo="AIDocs"

   aRepo="$1"; if [ "$1" == "" ]; then  aRepo="AIDocs"; fi
#  ----------------------------------------------------------------------------

   frt install ${aRepo} $2 -d;

   cd ${aRepo}/client1

   npm install

   cp -p ./c16_aidocs-review-app/utils/FRTs/_env_local-local.txt ./c16_aidocs-review-app/utils/FRTs/_env

#  echo ""
   echo -e "\n  Edit SERVER_HOST and ANYLLM_API_KEY in _env:"
   echo -e "      cd ${aRepo}"
   echo -e "      nano client1/c16_aidocs-review-app/utils/FRTs/_env"
   echo -e "      ./run-client.sh\n"

