#!/bin/bash

#  --------------------------------------------------------------

function deleteDir() {
   aRepoDir=$1; # echo -e "\n  Deleting ${aRepoDir}"; return

   if ! rm -rf "${aRepoDir}" 2>/dev/null;
   then echo -e "\n* Could not remove the Repo Folder ${aRepoDir}"; exit 1;
   else echo -e "\n  Deleted Repo Folder: ${aRepoDir}"; fi
   }
#  --------------------------------------------------------------

function reinstall() {

   aAppDir="$( echo $1 | awk '{ print tolower($0) }' )";
   aStage="$(  echo $2 | awk '{ print tolower($0) }' )";

   if [ "${aAppDir}" == "frtools" ]; then aAppDir="FRTools"; aStage="${aStage//frtools/FRTools}"; fi
   if [ "${aAppDir}" == "anyllm"  ]; then aAppDir="AnyLLM";  aStage="${aStage//anyllm/AnyLLM}";   fi
   if [ "${aAppDir}" == "aidocs"  ]; then aAppDir="AIDocs";  aStage="${aStage//aidocs/AIDocs}";   fi

   aRepos="$( pwd | awk '{ print tolower($0) }' )";
   if [ "${aRepos/repos/}" == "${aRepos}" ]; then
      echo -e "\n* You must be in a Repos folder\n";  exit; fi
#     cd ${aRepos}; echo -e "\n  aRepos: $( pwd )\n"; exit

   aRepo="${aAppDir}";
   aRepoDir="${aRepo}"; if [ "${aStage}" != "" ]; then aRepoDir="${aRepo}_${aStage}"; fi

#  if [ -d "${aRepo}"    ]; then deleteDir "${aRepo}"; fi
#  if [ -d "${aRepoDir}" ]; then deleteDir "${aRepoDir}"; echo ""; fi
   if [ -d "${aRepoDir}" ]; then deleteDir "${aRepoDir}"; fi               # .(41208.0

   aRepo="$( echo "${aRepo}" | awk '{ print tolower($0) }' )"

#  echo "  ./install-${aRepo}.sh ${aRepoDir}"
           ./install-${aRepo}.sh ${aRepoDir}
   }
#  --------------------------------------------------------------

if [ "$1" == "" ]; then
   echo -e "\n  You can do: ./re-install.sh FRTools, AnyLLM or AIDocs"
   echo -e   "          or: ./re-install.sh all"
   echo -e "\n  Other possible forms to install into different project folders:"
   echo -e   "              ./re-install.sh frtools                           ->  FRTools"
   echo -e   "              ./re-install.sh aidocs                            ->  AIDocs_demo1-master"
   echo -e   "              ./re-install.sh aidocs dev01-rick                 ->  AIDocs_dev01-rick"
   echo -e   "              ./re-install.sh aidocs /aidocs/aidocs_dev03-robin ->  AIDocs_/AIDocs_dev03-robin"
   echo ""; exit
   fi
#  --------------------------------------------------------------

  if [ "$1" == "aidocs"   ]; then bCheck="1"; fi;
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
   else
     reinstall $1 $2
     fi
#  --------------------------------------------------------------


