#!/bin/bash

#  frt install AIDocs               -d; aRepo="AIDocs"              ; aAppDir="AIDocs"          gitr clone aidocs_ -d

#  frt install AIDocs_demo1         -d; aRepo="AIDocs_demo1-master" ; aAppDir="AIDocs_demo1"    gitr clone aidocs_demo1
#  frt install AIDocs_demo1-master  -d; aRepo="AIDocs_demo1-master" ; aAppDir="AIDocs_demo1"
#  frt install AIDocs_/demo1-master -d; aRepo="AIDocs_/demo1-master"; aAppDir="AIDocs_demo1"

#  frt install AIDocs_dev01         -d; aRepo="AIDocs_dev01-robin"  ; aAppDir="AIDocs_dev01"
#  frt install AIDocs_dev01-robin   -d; aRepo="AIDocs_dev01-robin"  ; aAppDir="AIDocs_dev01"
#  frt install AIDocs_/dev01-robin  -d; aRepo="AIDocs_/dev01-robin" ; aAppDir="AIDocs_dev01"

#  aRepo="$1"; if [ "$1" == "" ]; then aRepo="AIDocs_demo1-master"; fi
#  aRepo="$1"; if [ "$1" == "" ]; then aRepo="AIDocs_demo1"; fi                         # .(50402.15.5)

   aAppDir="$1"; aAccount="$2"; # echo -e "\n  \$1: '$1', \$2: '$2'"; aAppDir="$1"; aAccount="$2"
   if [ "${aAppDir/_}" != "${aAppDir}" ]; then aStage="${aAppDir/*_}";aAppDir="${aAppDir/_*/}"; fi  # .(50402.15.2 RAM Split at _)

                                       aRepo="$1";                  aAppDir="$1"        # .(50402.15.x RAM Seems strange, but ...)
   if [ "${aStage}" == ""      ]; then aRepo="AIDocs_demo1-master"; aAppDir="no-stage"; fi
   if [ "${aStage}" == "demo1" ]; then aRepo="AIDocs_demo1-master"; aAppDir="demo1"; fi
   if [ "${aStage}" == "dev01" ]; then aRepo="AIDocs_dev01-robin";  aAppDir="dev01"; fi
   if [ "${aRepo/\//}" != "${aAppDir}" ]; then aRepo="${aRepo/\//}"; fi


#  ----------------------------------------------------------------------------
   export aQuiet=q                                                                      # .(50105.05b.7 RAM Add aQuiet)

#  echo -e "\n  aRepo: ${aRepo}', \$2: '$2'"; # exit
#  echo "  frt install '${aRepo}' ''           ''  '$3' -d;"; # exit
#  echo "  frt install '${aRepo}' '${aAppDir}' ''  '$3' -d;"; # exit
#          frt install  ${aRepo}  $ {aAppDir}  ''   $3  -d;                             # .(50105.05b.8 RAM Remove -q)
#          frt install  ${aRepo}  $ {aAppDir}  ''   $3;                                 # .(50105.05b.8 RAM Remove -q)

#          frt clone  {RepoName}  ''  {CloneDir} {Branch} {Account}
   echo "  frt clone   '${aRepo}' '' '${aAppDir}'    '${aAccount}' -d;"; # exit
#          frt clone    ${aRepo}  ''  ${aAppDir}  ''  ${aAccount}    ;   # exit
#          frt clone    ${aRepo}  ''  ${aAppDir}  ''  ${aAccount}  -b;     exit

           frt clone    ${aRepo}  ''  ${aAppDir}  ''  ${aAccount}  -d;   # exit

           aAppDir2="${aRepo/_*/}"                                                      # .(50402.18.1 RAM Gotta reassign aRepoDir Beg)
   if [ "${aAppDir/-}" == "${aAppDir}" ]; then aRepoDir="${aAppDir2}_${aAppDir}"; fi
   if [ "${aAppDir/-}" != "${aAppDir}" ]; then aRepoDir="${aAppDir}"; fi
#  if [ "${aAppDir}"   != ""           ]; then aRepoDir="${aAppDir2}_${aAppDir}"; fi;
   if [ "${aAppDir}" == "no-stage"     ]; then aRepoDir="${aAppDir2}"; fi               # .(50402.18.1 End)

#    aRepoDir="${aRepo}"; aRepo="${aRepo/\.code.workspace/}"                            ##.(50106.06.5 RAM Create aRepoDir).(50402.18.1)

#    aBinScr="$( which aidocs )"
#    aBinScr="$( pwd | awk '{ sub( /Repos|repos/, "" ); print $0 "._0/bin/aidocs" }' )" ##.(50402.19.1  RAM Re-create aidocs script Beg).(50402.19b.1)
#    aBinDir="$( pwd | awk '{ sub( /Repos|repos/, "" ); print $0 "._0/bin"        }' )" ##.(50402.19b.1 RAM Re-create aidocs script Beg).(50402.19c.1)
# if [ ! -d "${aBinDir}" ]; then mkdir -p "${aBinDir}"; echo "  Created ${aBinDir}"; fi ##.(50402.19b.2 RAM Re-create binDir for this AIDocs and without Sudo??).(50402.19c.1)
     aBinDir="$( which frt | awk '{ sub( /\/frt/, "" ); print }' )"                     # .(50402.19c.1 RAM Get the binDir from FRT)
     aBinScr="${aBinDir}/aidocs"                                                        # .(50402.19c.2)
#    echo "  aBinScr: '${aBinScr}'";  # exit
     aPath="$( pwd )/${aRepoDir}/run-aidocs.sh \"\$@\""
     echo "#!/bin/bash"  >"${aBinScr}"
     echo "${aPath}"    >>"${aBinScr}"   
     if [ "${OS.0.7}" != "Windows" ]; then sudo 777 "${aBinScr}"; fi                    # .(50402.19d.1 RAM Set permmission for aidocs if not Windows)
                                                                                        # .(50402.19.1 End)
# -----------------------------------------------
  if [ "1" == "2" ]; then
     aBinScr="$( which aidocs )"
#    aPath="$( cat "${aBinScr}" | awk 'NR == 2 { print }' )"
#    echo "  pwd: $( pwd )"
     aPath="$( pwd )/${aRepoDir}/run-aidocs.sh \"\$@\""
#    echo "  aPath: ${aPath}"

     echo "#!/bin/bash"  >"${aBinScr}"
     echo "${aPath}"    >>"${aBinScr}"
     cat "${aBinScr}"
     echo "  aRepoDir: ${aRepoDir}"
     echo "  aRepo:    ${aRepo}"
  if [ "${OS:0:7}"     != "Windows" ]; then echo ""; fi
     exit
     fi  # eif "1" == "2"
# --------------------------------------------------------------

   if [ $? -ne 1 ]; then                                                                # .(50106.04.15 RAM Exit if bDoit=0)

   if [ ! -d "AnyLLM" ]; then bAnyLLM=1; fi                                             # .(50402.15.6)

# --------------------------------------------------------------

if [ -d "${aRepoDir}/client1" ]; then

if [ -f "${aRepoDir}/._2/package.json" ]; then                                          # .(50402.20.1 RAM Run other npm installs Beg)
   echo -e "  cd ${aRepoDir}/._2";  # exit                                              ##.(50106.06.6).(50104.01.10)
     cd "${aRepoDir}/._2"
           npm install >/dev/null
     cd ../../
     fi
#   --------------------------------------------------

if [ -f "${aRepoDir}/client1/package.json" ]; then
   echo -e "  cd ${aRepoDir}/client1" # exit                                            ##.(50106.06.6).(50104.01.10)
     cd "${aRepoDir}/client1"                                                           # .(50106.06.7)
           npm install >/dev/null
     cd ../../
     fi # eif ${aRepoDir}/client1/package.json
#   --------------------------------------------------

if [ -f "${aRepoDir}/server1/package.json" ]; then
   echo -e "  cd ${aRepoDir}/server1" # exit                                            ##.(50106.06.6).(50104.01.10)
     cd "${aRepoDir}/server1"
   echo "  npm install"
           npm install | awk '{ print "    " $0 }'
     cd ../../                                                                          # .(50406.01c.1 RAM Return back to root dir) 
     fi                                                                                 # .(50402.20.1 End)
# --------------------------------------------------------------

function cpyEnv() {                                                                                         # .(50406.03.1 RAM Copy _env Beg)
      aFrom="$1/$2"; aTo="$1/$3"   
#     echo "    Copying .env file from ${aFrom}"    
#     echo "                      into ${aTo}"    
      if [ ! -f "${aFrom}" ]; then echo  "* Unable to copy: '${aFrom}'";  return; fi                        # .(50406.01d.1) 
      if [   -f "${aFrom}" ]; then cp -p "${aFrom}" "${aTo}"; fi
      if [ ! -f "${aTo}"   ]; then echo  "* Unable to copy to: '${aTo}'"; return; fi                        # .(50406.01d.2)
      }                                                                                                     # .(50406.03.1 End)
# --------------------------------------------------------------

#if [  -f "${aRepoDir}/client1/c16_aidocs-review-app/utils/FRTs/_env_local-local.txt" ]; then   
#   cp -p "${aRepoDir}/client1/c16_aidocs-review-app/utils/FRTs/_env_local-local.txt"  "${aRepos}/client1/c16_aidocs-review-app/utils/FRTs/_env"
#   fi
   echo ""                                                                              # .(50406.01e.1) 
   cpyEnv "./${aRepoDir}/client1/c16_aidocs-review-app/utils/FRTs"  "_env_local-local.txt"  "_env"          # .(50406.03.2 RAM Copy c16 _env) 
 if [ "$aStage}" == "dev01" ]; then                                                                         # .(50406.03b.1 RAM Only copy dev01's env)
   cpyEnv "./${aRepoDir}/server1/s12_websearch-app" ".env_example"  ".env"                                  # .(50406.03.3 RAM Copy s12 .env)
   fi                                                                                                       # .(50406.03b.2)
# --------------------------------------------------------------

 if [ "${bAnyLLM}" == "1" ] && [ "${aStage}" != "dev01" ]; then                         # .(50406.01.1).(50402.15.7 RAM Only set ANYLLM_KEY id it's installed)
#  echo ""
   echo -e   "  Edit SERVER_HOST and ANYLLM_API_KEY in _env:"                           # .(50406.01e.2 RAM Remove CR)
   echo -e   "     cd ${aRepoDir}"                                                      # .(50106.06.8
   echo -e   "     nano client1/c16_aidocs-review-app/utils/FRTs/_env"
   echo -e   "     ./run-client.sh\n"
   echo -e   "  or work on it in VSCode with: code ${aRepoDir/\//}*"                    # .(50105.05c.7).(50106.06.8).(50104.01.13 End)
 else                                                                                   # .(50406.01b.1 Display msg for AIDocs_dev01 Beg)
   echo -e   "  Run Models tests in ./server1/s##_...-app folders,"                     # .(50406.01e.3 RAM Remove CR)
   echo -e   "   after editing the model paramters in .env file, e.g." 
   echo -e "\n    cd ${aRepoDir}/server1/s12_*"                                         # .(50106.06.8
   echo -e   "     nano .env"
   echo -e   "     node interactive_search_u2.02.mjs [{Model}] [{CTX_Size}]"
   fi                                                                                   # .(50406.01b.1 End).(50406.01.1 End).(50106.04.16 RAM Exit if bDoit=0)

 else                                                                                   # .(50402.15.8)
   echo -e "* AIDocs didn't get installed into folder: ${aRepoDir}/client1.";           # .(50402.15.9)
#  exit
   fi # eif ${aRepoDir}/client1
 fi  # eif $? -ne 1                                                                     # .(50402.15.10)

  if [ "${OS:0:7}"     != "Windows" ]; then echo ""; fi

# frt clone AIDocs_demo1-master ''  ''            -->   AIDocs_demo1-master.git  AIDocs                x   AIDocs_demo1-master
# frt clone AIDocs_demo1-master ''  demo1         -->   AIDocs_demo1-master.git  AIDocs_demo1
# frt clone AIDocs_demo1-master ''  demo1-master  -->   AIDocs_demo1-master.git  AIDocs_demo1-master
# frt clone AIDocs_demo1-master '' /demo1-master  -->   AIDocs_demo1-master.git  AIDocs_/demo1-master

# frt clone AIDocs_dev01-robin  ''  dev01         --> x AIDocs_demo1-master.git" AIDocs_dev01          x
# frt clone AIDocs_dev01-robin  ''  dev01-robin   --> x AIDocs_demo1-master.git" AIDocs_dev01-robin    x
# frt clone AIDocs_dev01-robin  '' /dev01-robin   --> x AIDocs_demo1-master.git" AIDocs_/dev01-robin   x
