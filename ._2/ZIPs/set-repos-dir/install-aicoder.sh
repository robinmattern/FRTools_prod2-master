#!/bin/bash

   aRepo="$1"; if [ "$1" == "" ]; then  aRepo="AICodeR"; fi                             # .(50104.01.9 RAM Add AICodeR)
#  ----------------------------------------------------------------------------
   export aQuiet=q                                                                      # .(50105.05b.6 RAM Add aQuiet)

   frt install ${aRepo} $2 -d;                                                          # .(50105.05b.7)

#  echo -e "\n  cd ${aRepo}/client1"                                                    ##.(50104.01.10)
#  cd ${aRepo}/client1

#  echo "  npm install"                                                                 ##.(50104.01.11)
#  npm install | awk '{ print "    " $0 }'                                              ##.(50104.01.12)

#  cp -p ./._2/FRTs/AICodeR/metadata/_env.example ./._2/FRTs/AICodeR/_env               ##.(50104.01.12)

#  echo -e "\n  Edit SERVER_HOST and {LLM}_API_KEYs in _env:"                           ##.(50104.01.13 Beg)
#  echo -e   "     cd ${aRepo}"
#  echo -e   "     nano client1/c16_aidocs-review-app/utils/FRTs/_env"
#  echo -e   "     ./run-client.sh"
#  echo -e   "  or run code *code* for VSCode"                                          ##.(50104.01.13 End)

   echo -e   "  Please change into the project folder: cd ${aRepo}"                     # .(50105.05c.1)
   echo -e   "  You can now work on it in VSCode with: code *code*"                     # .(50105.05c.2)

   if [ "${OS:0:7}"     != "Windows" ]; then echo ""; fi
