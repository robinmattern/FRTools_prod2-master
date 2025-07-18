#!/bin/bash
#*\
##=========+====================+================================================+
##RD         install            | FRTools Install Script
##RFILE    +====================+=======+=================+======+===============+
##FD         set-frtools.sh     |   9479| 10/30/24 20:45|   136| v1.05`41030.2045
#
##DESC     .--------------------+-------+-----------------+------+---------------+
#            Create ._0/bin folder and copy all command scripts there as well as
#            Update ,bashrc (or .zshrc) with PATH, THE_SERVER and OS Prompt.
#
##LIC      .--------------------+----------------------------------------------+
#            Copyright (c) 2024 formR Tools - 8020 Data * Released under
#            MIT License: http://www.opensource.org/licenses/mit-license.php
##FNCS     .--------------------+-------+-------------------+------+-----------+
#            help               | List of JPT commands
#            deleteDir          |
#            installRepo        |
#                               |
##CHGS     .--------------------+-------+-------------------+------+-----------+
#.(50407.01   4/07/25 RAM 12:30p| Remove re-install
#.(50518.04   5/18/25 RAM  1:20p| Add install aidocs testr
#.(50716.03   7/16/25 RAM  8:20p| Don't show FRTools instructions if installed
#
##PRGM     +====================+===============================================+
##ID FRT01.600. Main            |
##SRCE     +====================+===============================================+
#*/
#========================================================================================================== #  ===============================  #

# aVer="v1.01\`50407.1230"
  aVer="v1.02\`50716.0840"

# echo ""                                                                               ##.(50410.01.6 RAM I think)

# ---------------------------------------------------------------------------

#  aInstall="re-install"; if [ "$1" == "install" ]; then aInstall="$1"; shift; fi       ##.(50105.04.6 RAM Add Install command for help)(50407.01.1)
   aInstall="install"                                                                   # .(50407.01.2 RAM Remove re-install)

   if [ "$1" == "help" ]; then set -- ""; fi

function  deleteDir() {
   aRepoDir=$1; # echo -e "\n  Deleting ${aRepoDir}"; return

   if ! rm -rf "${aRepoDir}" 2>/dev/null;
   then echo -e "\n* Could not remove the Repo Folder ${aRepoDir}"; if [ "${OS:0:7}" != "Windows" ]; then echo ""; fi; exit 1;
   else echo -e "\n* Deleted Repo Folder: ${aRepoDir}"; fi
   }
#  --------------------------------------------------------------

function  installRepo() {                                                               # .(50407.01.3)

   aAppDir="$( echo $1 | awk '{ print tolower($0) }' )";
   aStage="$(  echo $2 | awk '{ print tolower($0) }' )"; bOk=0
   aAcct="$(   echo $3 | awk '{ print tolower($0) }' )";                                                    # .(50402.17.3)

   if [ "${aAppDir/_}" != "${aAppDir}" ]; then aAcct="${aStage}"; aStage="${aAppDir/*_}"; aAppDir="${aAppDir/_*/}"; fi   # .(50402.17.4).(50402.15.1 RAM Split at _)

   if [ "${aAppDir}" == "frtools" ]; then aAppDir="FRTools";             aStage="${aStage//frtools/FRTools}"; bOk=1; fi
   if [ "${aAppDir}" == "anyllm"  ]; then aAppDir="AnyLLM";              aStage="${aStage//anyllm/AnyLLM}";   bOk=1; fi
   if [ "${aAppDir}" == "aidocs"  ]; then aAppDir="AIDocs";              aStage="${aStage//aidocs/AIDocs}";   bOk=1;
      if [ "${aStage}" == "testr" ]; then                                aStage="testR"; fi; fi             # .(50518.04.1)
#  if [ "${aAppDir}" == "AIDocs"  ]; then if [ "${aStage}" == "" ]; then aStage="demo1-master";   fi; fi                 ##.(50105.05b.9).(50402.15.2)
#  if [ "${aAppDir}" == "AIDocs"  ]; then if [ "${aStage}" == "" ]; then aStage="";               fi; fi                 # .(50402.15.2).(50105.05b.9)
   if [ "${aAppDir}" == "aicoder" ]; then aAppDir="AICodeR";             aStage="${aStage//aicoder/AICodeR}"; bOk=1; fi  # .(50104.01.14)

   if [ "${bOk}" == "0" ]; then echo -e "\n* Invalid install project, '${aAppDir}'.  See: bash install help\n"; exit; fi # .(50105.05b.10)

   aRepos="$( pwd | awk '{ print tolower($0) }' )";
   if [ "${aRepos/repos/}" == "${aRepos}" ]; then
      echo -e "\n* You must be in a Repos folder\n";  exit; fi
#     cd ${aRepos}; echo -e "\n  aRepos: $( pwd )\n"; exit

   aRepo="${aAppDir}";
   aRepoDir="${aRepo}"; if [ "${aStage}" != "" ]; then aRepoDir="${aRepo}_${aStage}";
                if [ "${aStage}" == "no-stage" ]; then aRepoDir="${aRepo} ${aStage}"; fi; fi

#  if [ -d "${aRepo}"    ]; then deleteDir "${aRepo}"; fi
#  if [ -d "${aRepoDir}" ]; then deleteDir "${aRepoDir}"; echo ""; fi
   if [ -d "${aRepoDir}" ]; then deleteDir "${aRepoDir}"; fi                                                # .(41208.01.1)

   aRepo="$( echo "${aRepo}" | awk '{ print tolower($0) }' )"

#  echo ""
#  echo "  ./install-${aRepo}.sh ${aRepoDir}"
#          ./install-${aRepo}.sh ${aRepoDir} "$2" "$3"                                                      # .(50105.04.7)
#          ./install-${aRepo}.sh ${aRepoDir}                                                                ##.(50105.04.7)..(50327.01.2)
#  echo "./._/INSTs/install-${aRepo}.sh ${aRepoDir}  ${aAcct}"; # exit                                      # .(50402.17.5).(50327.01.2 RAM Move install scripts to INSTs)
         ./._/INSTs/install-${aRepo}.sh ${aRepoDir} "${aAcct}"                                              # .(50402.17.6).(50402.15.3).(50327.01.2 RAM Move install scripts to INSTs)
   }
#  --------------------------------------------------------------

function  help() {
#  echo -e "\n  You can do: bash ${aInstall} FRTools, AICoder, AnyLLM or AIDocs"                            ##.(50105.04.8 RAM Add dynamic ${aInstall} Beg).(50226.03.1 Beg)
#  echo -e   "          or: bash ${aInstall} all"
#  echo -e "\n  Other possible ways to install formR projects into their own repository folders:"
#  echo -e   "              bash ${aInstall} frtools                     ->  FRTools"
#  echo -e   "              bash ${aInstall} aicoder                     ->  AICodeR"                       # .(50104.01.15)
#  echo -e   "              bash ${aInstall} anyllm                      ->  AnyLLM"                        # .(50105.04.10)
#  echo -e   "              bash ${aInstall} aidocs                      ->  AIDocs_demo1-master"
#  echo -e   "              bash ${aInstall} aidocs no-stage             ->  AIDocs"
#  echo -e   "              bash ${aInstall} aidocs dev01-rick           ->  AIDocs_dev01-rick"
#  echo -e   "              bash ${aInstall} aidocs /dev03-robin         ->  AIDocs_/dev03-robin"           # .(50105.04.8 End)
#  echo -e "\n* Note: You must install FRTools before any other projects.  After that,"                     # .(50105.04.9 RAM Add more options Beg)
#  echo -e   "        you can clone or create your own projects folder with:"
#  echo -e "\n              frt clone {GitHub-Account} {Repo-Name}   -> {Repo-Name}"
#  echo -e   "              frt gitr init AI-Tests_/dev03-robin      ->  AI-Tests_/dev03-robin"
#  echo -e   "      or just     gitr init AI-Tests                   ->  AI-Tests"                          ##.(50105.04.9 End).(50226.03.1 End)

   aShell='.zshrc  '; if [ "${OSTYPE:0:7}" != "darwin2" ]; then aShell='.bashrc '; fi                       # .(50405.04.3 RAM Set aShell for Mac)
   if command -v frt >/dev/null 2>&1; then bHasFRTools="1"; else bHasFRTools="0";  fi                       # .(50716.03.x)

   echo -e "\n  You can now run any of these install commands from your Repos folder:"                      # .(50226.03.1 Rewrite Help Beg)
if [ "${bHasFRTools}" != "1" ]; then                                                                        # .(50716.03.x)
   echo -e "\n     bash ${aInstall} frtools       # first, then login again, or run:"
   echo -e   "       source ~/${aShell}           # then run, frt, to check it."                            # .(50405.04.4)
   fi                                                                                                       # .(50716.03.x)
   echo -e   ""
#  echo -e   "     bash ${aInstall} aidocs dev01  # then run, aidocs, to check it."                         ##.(50402.15.5).(50408.03.9)
#  echo -e   "     bash ${aInstall} aidocs test1  # then run, aitestr, to check it."                        # .(50408.03.9).(50402.15.5)
   echo -e   "     bash ${aInstall} aidocs testr  # then run, aitestr, to check it."                        # .(50518.04.2).(50408.03.9).(50402.15.5)
   echo -e   "     bash ${aInstall} aidocs demo1  # then run, aidocs, to check it."                         # .(50402.15.4)
   echo -e   "     bash ${aInstall} anyllm        # then run, anyllm, to check it."

if [ "${bHasFRTools}" != "1" ]; then                                                                        # .(50716.03.x)
   echo -e "\n* Note: You must install FRTools before any other projects.  After that,"                     # .(50105.04.9 RAM Add more options Beg)
   echo -e   "        you can clone or create your own projects folder with:"
 else                                                                                                       # .(50716.03.x)
   echo -e "\n  You can also clone or create your own projects folder with:"                                # .(50716.03.x)
   fi                                                                                                       # .(50716.03.x)
#  echo -e "\n     bash frt clone {GitHub-Account} {Repo-Name}"                                             # .(50226.03.1 End).(50327.02.9)
   echo -e "\n     bash frt clone {RepoName} '' {CloneDir} {Branch} {Account}"                              # .(50327.02.9)
   echo -e   "     bash frt new repo MyProject_/test1-master -d"                                            # .(50716.03.x)

   if [ "${OS:0:7}" != "Windows" ]; then echo ""; fi; exit
   } # eof help
#  --------------------------------------------------------------

  if [ "$1" == "" ]; then help; fi

  if [ "$1" == "aidocs"   ]; then bCheck="1"; fi;
  if [ "$1" == "aicoder"  ]; then bCheck="1"; fi;                                                           # .(50104.01.16)
  if [ "$1" == "anyllm"   ]; then bCheck="1"; fi;

  if [ "${bCheck}" == "1" ] && [ "$( which npm )" == "" ]; then
     echo -e "\n* You need to install NVS, Node and NPM, first.\n"
     exit
     fi
  if [ "${bCheck}" == "1" ] && [ "$( which frt )" == "" ]; then
     echo -e "\n* Please run: bash install frtools, first.\n"                           # .(50407.01.4)
     exit
     fi

  if [ "$1" == "all" ]; then
     installRepo frtools                                                                # .(50407.01.5 Beg)
     installRepo anyllm
     installRepo aidocs
     installRepo aicoder                                                                                        # .(50104.01.17)
   else
     installRepo $1 $2 $3                                                               # .(50407.01.5 End) # .(50402.15.6 RAM Add 3rd arg)
     fi
#  --------------------------------------------------------------

     echo -e "  Run, bash install, again to see other repos to install"                 # .(50407.01.6 RAM)
     if [ "${OS:0:7}" != "Windows" ]; then echo ""; fi; exit                            # .(50407.01.7 RAM)

