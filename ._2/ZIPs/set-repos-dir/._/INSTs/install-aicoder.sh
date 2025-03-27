#!/bin/bash

   aRepo="$1"; if [ "$1" == "" ]; then aRepo="AICodeR"; fi                              # .(50104.01.9 RAM Add AICodeR)
#  ----------------------------------------------------------------------------
   export aQuiet=q                                                                      # .(50105.05b.6 RAM Add aQuiet)

   frt install ${aRepo} $2 -d -q;                                                       # .(50105.05b.7)
#  frt install ${aRepo} $2    -q -b;                                                    # .(50105.05b.7)

   aRepoDir="${aRepo}"; aRepo="${aRepo/\.code.workspace/}"                              # .(50106.06.1 RAM Create aRepoDir)
 
if [ $? -ne 1 ]; then                                                                   # .(50106.04.13)

#  echo -e "\n  cd ${aRepoDir}/client1"                                                 ##.(50106.06.2).(50104.01.10)
#  cd ${aRepoDir}/client1                                                               # .(50106.06.2) 

#  echo "  npm install"                                                                 ##.(50104.01.11)
#  npm install | awk '{ print "    " $0 }'                                              ##.(50104.01.12)

#  cp -p ./._2/FRTs/AICodeR/metadata/_env.example ./._2/FRTs/AICodeR/_env               ##.(50104.01.12)

#  echo -e "\n  Edit SERVER_HOST and {LLM}_API_KEYs in _env:"                           ##.(50104.01.13 Beg)
#  echo -e   "     cd ${aRepoDir}"                                                      # .(50106.06.3) 
#  echo -e   "     nano client1/c16_aidocs-review-app/utils/FRTs/_env"
#  echo -e   "     ./run-client.sh"
#  echo -e   "  or open VSCode with: code ${aRepo/\//}*"                                ##.(50106.06.4).(50104.01.13 End)
 
   echo -e   "  Please change into the project folder: cd ${aRepoDir}"                  # .(50105.05c.5).(50106.06.4)
   echo -e   "  You can now work on it in VSCode with: code ${aRepo/\//}*"              # .(50105.05c.6)
   fi                                                                                   # .(50106.04.14)

   if [ "${OS:0:7}"     != "Windows" ]; then echo ""; fi
