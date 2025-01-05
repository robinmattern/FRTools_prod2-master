#!/bin/bash

#  --------------------------------------------------------------
   aInstall="re-install"; if [ "$1" == "install" ]; then aInstall="$1"; shift; fi                           # .(50105.04.6 RAM Add Install command for help)

function deleteDir() {
   aRepoDir=$1; # echo -e "\n  Deleting ${aRepoDir}"; return

   if ! rm -rf "${aRepoDir}" 2>/dev/null;
   then echo -e "\n* Could not remove the Repo Folder ${aRepoDir}"; exit 1;
   else echo -e "\n  Deleted Repo Folder: ${aRepoDir}\n"; fi
   }
#  --------------------------------------------------------------

function reinstall() {

   aAppDir="$( echo $1 | awk '{ print tolower($0) }' )";
   aStage="$(  echo $2 | awk '{ print tolower($0) }' )";

   if [ "${aAppDir}" == "frtools" ]; then aAppDir="FRTools"; aStage="${aStage//frtools/FRTools}"; fi
   if [ "${aAppDir}" == "anyllm"  ]; then aAppDir="AnyLLM";  aStage="${aStage//anyllm/AnyLLM}";   fi
   if [ "${aAppDir}" == "aidocs"  ]; then aAppDir="AIDocs";  aStage="${aStage//aidocs/AIDocs}";   fi
   if [ "${aAppDir}" == "aicoder" ]; then aAppDir="AICodeR"; aStage="${aStage//aicoder/AICodeR}"; fi        # .(50104.01.14)

   aRepos="$( pwd | awk '{ print tolower($0) }' )";
   if [ "${aRepos/repos/}" == "${aRepos}" ]; then
      echo -e "\n* You must be in a Repos folder\n";  exit; fi
#     cd ${aRepos}; echo -e "\n  aRepos: $( pwd )\n"; exit

   aRepo="${aAppDir}";
   aRepoDir="${aRepo}"; if [ "${aStage}" != "" ]; then aRepoDir="${aRepo}_${aStage}"; fi

#  if [ -d "${aRepo}"    ]; then deleteDir "${aRepo}"; fi
#  if [ -d "${aRepoDir}" ]; then deleteDir "${aRepoDir}"; echo ""; fi
   if [ -d "${aRepoDir}" ]; then deleteDir "${aRepoDir}"; fi               # .(41208.01.1)

   aRepo="$( echo "${aRepo}" | awk '{ print tolower($0) }' )"

#  echo "  ./install-${aRepo}.sh ${aRepoDir}"
           ./install-${aRepo}.sh ${aRepoDir} "$2" "$3"                                                      # .(50105.04.7)                                                                          
   }
#  --------------------------------------------------------------

if [ "$1" == "" ]; then
   echo -e "\n  You can do: bash ${aInstall} FRTools, AICoder, AnyLLM or AIDocs"                            # .(50105.04.8 RAM Add dynamic ${aInstall} Beg)
   echo -e   "          or: bash ${aInstall} all"
   echo -e "\n  Other possible ways to install formR projects into their own repository folders:"
   echo -e   "              bash ${aInstall} frtools                     ->  FRTools"
   echo -e   "              bash ${aInstall} aicoder                     ->  AICodeR"                       # .(50104.01.15)
   echo -e   "              bash ${aInstall} anyllm                      ->  AnyLLM"                        # .(50105.04.10)
   echo -e   "              bash ${aInstall} aidocs                      ->  AIDocs_demo1-master"
   echo -e   "              bash ${aInstall} aidocs dev01-rick           ->  AIDocs_dev01-rick"
   echo -e   "              bash ${aInstall} aidocs aidocs_/dev03-robin  ->  AIDocs_/dev03-robin"           # .(50105.04.8 End)
   echo -e "\n* Note: You must install FRTools before any other projects.  After that,"                     # .(50105.04.9 RAM Add more options Beg)
   echo -e   "        you can clone or create your own projects folder with:"                                    
   echo -e "\n              frt clone {GitHub-Account} {Repo-Name}   -> {Repo-Name}" 
   echo -e   "              frt gitr init AI-Tests_/dev03-robin      ->  AI-Tests_/dev03-robin"         
   echo -e   "      or just     gitr init AI-Tests                   ->  AI-Tests"                          # .(50105.04.9 End)

   if [ "${OS:0:7}" != "Windows" ]; then echo ""; fi; exit
   fi
#  --------------------------------------------------------------

  if [ "$1" == "aidocs"   ]; then bCheck="1"; fi;
  if [ "$1" == "aicoder"  ]; then bCheck="1"; fi;                                                           # .(50104.01.16)
  if [ "$1" == "anyllm"   ]; then bCheck="1"; fi;
  if [ "${bCheck}" == "1" ] && [ "$( which npm )" == "" ]; then
     echo -e "\n* You need to install NVS, Node and NPM, first.\n"
     exit
     fi
  if [ "${bCheck}" == "1" ] && [ "$( which frt )" == "" ]; then
     echo -e "\n* Please run: bash re-install frtools, first.\n"
     exit
     fi

  if [ "$1" == "all" ]; then
     reinstall frtools
     reinstall anyllm
     reinstall aidocs
     reinstall aicoder                                                                                      # .(50104.01.17)
   else
     reinstall $1 $2
     fi
#  --------------------------------------------------------------


