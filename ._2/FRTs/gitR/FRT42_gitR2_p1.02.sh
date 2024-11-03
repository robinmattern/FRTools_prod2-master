#!/bin/bash
#*\
##=========+====================+================================================+
##RD         Main0              | GitR Tools
##RFILE    +====================+=======+===============+======+=================+
##FD   FRT22_GitR1.sh           |  21714| 10/26/24 17:20|   461| v1.01.41026.1720
##FD   FRT42_GitR2.sh           |  24865| 10/29/24  8:52|   488| v1.01.41029.0852
##FD   FRT42_GitR2.sh           |  27486| 10/30/24 20:28|   513| v1.01.41030.2028
##FD   FRT42_GitR2.sh           |  30370| 10/31/24 10:11|   544| v1.01.41031.0810
##FD   FRT42_GitR2.sh           |  43817| 11/03/24 13:03|   692| v1.01.41103.1303
##DESC     .--------------------+-------+---------------+------+-----------------+
#            This script has usefull GIT functions.
#
##LIC      .--------------------+----------------------------------------------+
#            Copyright (c) 2024 JScriptWare and 8020Date-FormR * Released under
#            MIT License: http://www.opensource.org/licenses/mit-license.php
##FNCS     .--------------------+----------------------------------------------+
#            shoLast            |
#            makRemote          |
#            trackBranch        |
#            mergeRemote        |
#            addRemote          |
#            delRemote          |
#            shoRemote          |
#            getCLI"            |
#            backupLocal        |
#            help               |
#            exit_withCR        |
#            setOSvars          |
#            getRepoDir         |
#            setFlags           |
#                               |
##CHGS     .--------------------+----------------------------------------------+
# .(41023.01  9/01/24 RAM 10:00a| Created
# .(41024.01 10/26/24 RAM 10:00a| Did something
# .(41025.02 10/26/24 RAM 10:00a| Did something else
# .(41026.07 10/26/24 RAM 17:20p| Add doc header
# .(41029.04 10/29/24 RAM  7:55a| Add msg to do make remote
# .(41029.05 10/29/24 RAM  8:11a| Add setRemote
# .(41029.06 10/29/24 RAM  8:44a| Add remote alias: frtools
# .(41029.07 10/29/24 RAM  8:52a| Opps, change git:github-ram to git@github-ram
# .(41030.04 10/29/24 RAM  5:56p| Fix show last n times
# .(41030.05 10/29/24 RAM  8:28p| Add command: show commit
# .(41031.03 10/31/24 RAM  7:25a| Add List last and list remotes
# .(41031.04 10/31/24 RAM  8:00a| Reformat date for List last
# .(41031.05 10/31/24 RAM  8:10a| Fix no more commits line
# .(41031.06 10/31/24 RAM  8:10a| Chop list last comment
# .(41031.07 10/31/24 RAM  9:45a| Add replace remote command
# .(41031.08 10/31/24 RAM 10:35a| Add help for Add remote commmand
# .(41102.01 11/02/24 RAM 11:52a| Add JPT12_Main2Fns_p1.07.sh
# .(41102.03 11/02/24 RAM  3:29p| Write setRemote and setRemote1
# .(41102.05 11/02/24 RAM  5:01p| Wierd fix for add remote origin, based on position
# .(41103.01 11/03/24 RAM 12:22p| Fix List last for merge commits
# .(41103.02 11/03/24 RAM 13:03p| Change FRT22_gitR1 to gitR2
#
##PRGM     +====================+===============================================+
##ID 69.600. Main0              |
##SRCE     +====================+===============================================+
#*/
#========================================================================================================== #  ===============================  #

        aVTitle="Useful gitR2 Tools by formR"; aVer="p0.05"; aVDt="Nov 03, 2024 1:00p" # .41023.1335"
        aVer="$( echo $0 | awk '{  match( $0, /_[dpstuv][0-9]+\.[0-9]+/ ); print substr( $0, RSTART+1, RLENGTH-1) }' )"  # .(21031.01.1 RAM Add [d...).(20416.03.8 "_p2.02", or _d1.09)

        LIB="gitR2"; LIB_LOG=${LIB}_LOG; LIB_USER=${LIB}_USER; Lib=${LIB}; aDir=$(dirname "${BASH_SOURCE}");             # .(41102.01.1 RAM Add JPT12_Main2Fns_p1.07.sh Beg).(80923.01.1)
        aFns="${aDir/FRTs*/JPTs}/JPT12_Main2Fns_p1.07.sh"; if [ ! -f "${aFns}" ]; then
        echo -e "\n ** gitR2[144]  JPT Fns script, '${aFns}', NOT FOUND\n"; exit; fi; #fi
        source "${aFns}";                                                                                                # .(41102.01.1 End)

        Begin "$@"                                                                                                       # .(41102.01.2)

# ---------------------------------------------------------------------------

function help() {
     echo ""
#    echo "  GitR Commands (${aVer})"
     echo "  ${aVTitle} (${aVer})          (${aVDt})"
     echo "  -------------------------------------------  ---------------------------------"
#    echo ""
     echo "    List last [nCnt]                           List last nCnt commits"                           # .(41031.03.1).(51030.05.1)
     echo "    Show commit [nCnt|aHash]                   Show files for commit -nCnt or aHash"             # .(41030.05.1)
     echo "    List remotes                               List current remote repositories"                 # .(41031.03.2)
     echo "    Set remote  {name} [{acct}] [{repo}] [-d]  Set current remote repository"
     echo "    Add remote  {name} [{acct}] [{repo}] [-d]  Add new origin remote repository"
     echo "    Make remote {name} [{acct}] [{repo}] [-d]  Create new remote repository in github"
     echo "    Remove remote [{name}]               [-d]  Remove origin or {name} remote"
     echo "    Replace [local] [{name}]             [-d]  Replace all files with origin or {name} remote"   # .(41031.07.1)
     echo "    Backup local                               Copy local repo to ../ZIPs"
     echo "    Track Branch                               Set tracking for origin/branch"
     echo "    Install gh                                 Install the GIT CLI"
     echo "    [-b]                                       Show debug messages"
     echo "    [-d]                                       Doit, i.e. execute the command"
#    echo ""
     echo "    Note: [name] defaults to ${aLocation}"
     echo "          [proj] defaults to ${aProject}"
     echo "          [acct] defaults to ${aAcct}"
     echo "          [repo] defaults to ${aProject}_${aStage}"
     exit_withCR
     }
# ---------------------------------------------------------------------------

function exit_withCR() {
  if [ "${OSTYPE:0:6}" == "darwin" ]; then echo ""; fi
# if [ "${aOS}" != "windows"       ]; then echo ""; fi
# if [ "$1" == "exit" ]; then exit; fi
     exit
     }
# ---------------------------------------------------------------------------

function setOSvars() {
     aTS=$( date '+%y%m%d.%H%M' ); aTS=${aTS:2}
     aBashrc="$HOME/.bashrc"
     aBinDir="/Home/._0/bin"
     aOS="linux"
  if [[ "${OS:0:7}" == "Windows" ]]; then
     aOS="windows";
     aBinDir="/C/Home/._0/bin"
     fi
  if [[ "${OSTYPE:0:6}" == "darwin" ]]; then
     aBashrc="$HOME/.zshrc"
     aBinDir="/Users/Shared/._0/bin"
     aOS="darwin"
     fi
     }
# -----------------------------------------------------------

 function getRepoDir() {

   aRepos="$( echo "$(pwd)"       | awk '{ match($0, /.*[Rr][Ee][Pp][Oo][Ss]/); print substr($0,1,RLENGTH) }' )"
   aRepo="$( git remote -v        | awk '/origin.+push/ { sub( /.+\//, ""); sub( /\.git.+/, "" ); print }' )"
#  aProjDir="${aRepoDir%%_*}"
#  aProjDir="$( echo "$(pwd)"     | awk '{ sub( "'${aRepoDir}'", "" ); print }' )"
#  aAWK='{ sub( "'${aRepos//\//\/}'/", "" ); sub( /[\/_].*/, "_"); print }';               echo "  aAWK:    '${aAWK}'"  # double up /s
   aAWK='{ sub( "'${aRepos}'/", "" );  sub( /_\/*.+/, "" ); sub( /\/.+/, "" ); print }'; # echo "  aAWK:    '${aAWK}'"
   aProject="$( echo "$(pwd)"     | awk "${aAWK}" )"
#  echo "  aProject:    '${aProject}'"; exit
   aStgDir="$(  echo "$(pwd)"     | awk '{ sub( "'.+${aProject}'", "" ); print }' )"
   aStage="$(   echo "${aStgDir}" | awk '{ sub( "^[_/]+"        , "" ); print }' )"
   aBranch="$( git branch | awk '/\*/ { sub( /.+at /, "" ); sub( /\)$/, "" ); print substr($0,3) }' )"      # .(41102.02.1 RAM Move to getRepoDir)
   aRepoDir="${aRepos}/${aProject}${aStgDir}"
   if [ "${aRepo}" == "" ]; then aRepo="${aProject}${aStgDir}"; fi

#          bDebug=1
   if [ "${bDebug}" == "1" ]; then
   echo "  aRepos:   '${aRepos}'"
   echo "  aRepo:    '${aRepo}'"
   echo "  aProject: '${aProject}'"
   echo "  aStage:   '${aStage}'"
   echo "  aBranch:  '${aBranch}'"                                                                          # .(41102.02.2)
   echo "  aRepoDir: '${aRepoDir}'"
#  exit_withCR
   fi
   }
# ---------------------------------------------------------------------------

# function setFlags

# Initialize variables
  bDebug=0; bDoit=0;  mArgs=(); mARGs=()
  aArg1=$1; aArg2=$2; aArg3=$3; aArg4=$4; aArg5=$5; aArg6=$6; aCmd=""

while [[ $# -gt 0 ]]; do  # Loop through all arguments
    case "$1" in
        -[bd]*)           # Handle combined flags
            if [[ "$1" =~ "b" ]]; then  bDebug=1; fi
            if [[ "$1" =~ "d" ]]; then  bDoit=1; fi
            ;;
        *)
            mArgs+=($( echo "${1:0:3}" | sed 'y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'))
            mARGs+=("$1")
            ;;
    esac
    shift
done
    set -- "${mArgs[@]}"  # Restore the remaining arguments
    aArg1=${mARGs[0]}; aArg2=${mARGs[1]}; aArg3=${mARGs[2]}; aArg4=${mARGs[3]}; aArg5=${mARGs[4]}; aArg6=${mARGs[5]};

# ---------------------------------------------------------------------------

  if [ "$1" == "lis" ] && [ "$2" == "las" ]; then aCmd="shoLast";      fi               # .(41031.03.4)
  if [ "$1" == "sho" ] && [ "$2" == "las" ]; then aCmd="shoLast";      fi
  if [ "$1" == "sho" ] && [ "$2" == "com" ]; then aCmd="shoCommit";    fi               # .(51030.05.2)
  if [ "$1" == "com" ] && [ "$2" == "sho" ]; then aCmd="shoCommit";    fi               # .(51030.05.3)
  if [ "$1" == "add" ] && [ "$2" == "rem" ]; then aCmd="addRemote";    fi
  if [ "$1" == "rem" ] && [ "$2" == "add" ]; then aCmd="addRemote";    fi
  if [ "$1" == "set" ] && [ "$2" == "rem" ]; then aCmd="setRemote";    fi
  if [ "$1" == "rem" ] && [ "$2" == "set" ]; then aCmd="setRemote";    fi
  if [ "$1" == "sho" ] && [ "$2" == "rem" ]; then aCmd="shoRemote";    fi
  if [ "$1" == "lis" ] && [ "$2" == "rem" ]; then aCmd="shoRemote";    fi               # .(41031.03.5)
  if [ "$1" == "rem" ] && [ "$2" == "lis" ]; then aCmd="shoRemote";    fi               # .(41031.03.6)
  if [ "$1" == "mer" ] && [ "$2" == "rem" ]; then aCmd="mergeRemote";  fi
  if [ "$1" == "rem" ] && [ "$2" == "mer" ]; then aCmd="mergeRemote";  fi
  if [ "$1" == "rem" ] && [ "$2" == "rem" ]; then aCmd="delRemote";    fi
  if [ "$1" == "mak" ] && [ "$2" == "rem" ]; then aCmd="makRemote";    fi
  if [ "$1" == "ins" ] && [ "$2" == "gh"  ]; then aCmd="getCLI";       fi
  if [ "$1" == "tra" ] && [ "$2" == "bra" ]; then aCmd="trackBranch";  fi
  if [ "$1" == "bac" ] && [ "$2" == "loc" ]; then aCmd="backupLocal";  fi
  if [ "$1" == "rep" ] && [ "$2" == "loc" ]; then aCmd="replaceLocal"; fi               # .(41031.07.2)

  if [ "${bDebug}" == "1" ]; then
#    echo -e "\n  aCmd: ${aCmd}, bDoit: ${bDoit}, bDebug: ${bDebug}, 1)$1, 2)$2, 3)$3, 4)$4, 5)$5, 6)$6."; # exit_withCR
     echo -e "\n  aCmd: ${aCmd}, bDoit: ${bDoit}, bDebug: ${bDebug}; 1)${aArg1}, 2)${aArg2}, 3)${aArg3}, 4)${aArg4}, 5)${aArg5}, 6)${aArg6}."; # exit_withCR
     fi
# ---------------------------------------------------------------------------

  if [ ! -d ".git" ]; then
     echo -e "\n* You are not in a Git Repository"
     exit_withCR
     fi
# ---------------------------------------------------------------------------

    getRepoDir

    aSSH="git@github-ram"                                                                                   # .(41029.07.1 RAM Was git:github-ram)
    aAcct="robinmattern"
    aLocation="origin"
#   aBranch="$( git branch | awk '/\*/ { sub( ".+at ", "" ); sub( "\)$", "" ); print }' )"                  ##.(41102.02.3)
#   aBranch="$( git branch | awk '/\*/ { sub( /.+at /, "" ); sub( /\)$/, "" ); print }' )"                  ##.(41102.02.3 RAM Move to getRepoDir)

    echo ""
#if [ "${aStage}"   == "$(pwd)" ]; then
 if [ "${aRepoDir}" == "" ]; then
#if [ "${aStage}"   == "" ]; then
    echo "* You are not in a ${aProject}_/{StgDir} Git Repository"
    exit_withCR
  else
    echo "  RepoDir is: ${aRepoDir}, branch: ${aBranch}";   # exit_withCR
    fi
# ---------------------------------------------------------------------------

  if [ "${aCmd}" == "" ]; then help; fi

# ---------------------------------------------------------------------------

function shoCommitMsg() {                                                                                   # .(41030.05.2 RAM Write showCommitMsg Beg)
     n=$(($1-1)); if [ "${#n}" == "1" ]; then m=" ${n}"; else m="${n}"; fi                                  # .(41031.05.1 RAM Move to here)
#    aAWK1='/^commit / { c = substr($0,8,8)        };                     /^Author:/ { a = substr($0,8) }; /^Date:/ { d = substr($0,6,27) }; NR == 5 { m = sprintf( "\"%-50s", ($0 != "") ? substr($0,5)"\"" : "n/a\"" ); print " " c d"   "m"  "a }'
     aAWK1='/^commit / { c = substr($0,8,8); n = 5 }; /^Merge/ { n = 6 }; /^Author:/ { a = substr($0,8) }; /^Date:/ { d = substr($0,6,27) }; NR == n { m = sprintf( "\"%-50s", ($0 != "") ? substr($0,5)"\"" : "n/a\"" ); print " " c d"   "m"  "a }'
     aAWK2='{ m = $3; d = $4; t = $5; y = $6; m = ( 2 + index( "JanFebMarAprMayJunJulAugSepOctNovDev", m ) ) / 3; print substr( $0, 1, 15)" "y"."m"."d" "t"   "substr( $0, 40 ) }';   #echo "  aAWK2: '${aAWK2}'"; exit # .(41031.04.1)
     aCommitHash=$( git rev-parse HEAD~$n 2>/dev/null ); # echo "  aCommitHash: '${aCommitHash}'"  # Get commit hash at current position
#    echo "  aCommitHash: ${aCommitHash}"; return
#    if [ "${#n}" == "1" ]; then m=" ${n}"; else m="${n}"; fi
     if [ "$?" -ne "0" ]; then echo -e "* ${m}.  There are no more commits (HEAD~$n)!"; exit_withCR; fi     # .(41031.05.2 RAM Was ${1})
     sayMsg  "gitR2[241]  ${m}. \$( git show \$(git rev-parse HEAD~$n)   | awk '${aAWK1}' )"  -0           # git show $aCommitHash | awk "${aAWK}" ##.(41031.04.2)
     echo "  ${m}. $( git show $(git rev-parse HEAD~$n) | awk "${aAWK1}" | awk "${aAWK2}" )"                # .(41031.04.2)
     }                                                                                                      # .(41030.05.2 End)
# ---------------------------------------------------------------------------

  if [ "${aCmd}" == "shoLast" ]; then
     nCnt=${aArg3}; if [ "${nCnt}" == "" ]; then nCnt=1; fi # echo "  nCnt: ${nCnt}"
#    aAWK='/^commit / { c = substr($0,8,8) }; /^Author:/ { a = substr($0,8) }; /^Date:/ { d = substr($0,6,27) }; NR == 5 { print "\n  " c $0 d"  "a }'
#    aAWK='/^commit / { c = substr($0,8,8) }; /^Author:/ { a = substr($0,8) }; /^Date:/ { d = substr($0,6,27) }; NR == 5 { m = sprintf( "\"%-50s", ($0 != "") ? substr($0,5)"\"" : "n/a\"" ); print " " c d"   "m"  "a }'
#    git show $(git rev-parse HEAD) | awk '/^commit / { c = substr($0,8,8) }; /^Author:/ { a = substr($0,8) }; /^Date:/ { print "\n" c substr($0,7,26) a }'
#    git show $(git rev-parse HEAD) | awk '/^commit / { c = substr($0,8,8) }; /^Author:/ { a = substr($0,8) }; /^Date:/ { d = substr($0,7,26) }; NR == 5 { print "\n  " c d a $0 }'
#    git show $(git rev-parse HEAD) | awk '/^commit / { c = substr($0,8,8) }; /^Author:/ { a = substr($0,8) }; /^Date:/ { d = substr($0,6,27) }; NR == 5 { print "\n  " c $0 d"  "a }'
     echo ""
     while [[ $i -lt $nCnt ]]; do
       i=$((i+1)); shoCommitMsg $i                                                                          # .(41030.04.1).(41030.05.3 RAM Use showCommitMsg)
#      aCommitHash=$(git rev-parse HEAD~$i 2>/dev/null); # echo "  aCommitHash: '${aCommitHash}'"  # Get commit hash at current position
#      if [ "$?" -ne "0" ]; then echo -e "* $i.  There are no more commits (HEAD~$i)!"; exit_withCR; fi
#      echo "  $i. $( git show $(git rev-parse HEAD~$i) | awk "${aAWK}" )"  # git show $aCommitHash | awk "${aAWK}"
#      i=$((i+1));                                                                                          ##.(41030.04.1 RAM Move above)
       done
     fi
# ---------------------------------------------------------------------------

  if [ "${aCmd}" == "shoCommit" ]; then                                                                     # .(41030.05.4 RAM Add shoCommit Beg)
     nCnt=${aArg3}; if [ "${nCnt}" == "" ]; then nCnt=0; fi # echo "  nCnt: ${nCnt}"
     echo ""; nCnt=$((nCnt+1)); shoCommitMsg ${nCnt};  nCnt=$((nCnt-1))  # echo "  shoCommitMsg ${nCnt}"
     aFilter="AMDR"; aAWK='/^['${aFilter}']/ { printf "      %-2s %s\n", substr($1,1,1), substr( $0, 6) }'; # echo "  aAWK: '${aAWK}'"
#    echo "git show --pretty=\"\" --name-status HEAD~${nCnt} | awk ${aAWK}"
           git show --pretty="" --name-status HEAD~${nCnt} | awk "${aAWK}"
     fi                                                                                                     # .(41030.05.4 End)
# ---------------------------------------------------------------------------

  if [ "${aCmd}" == "makRemote" ]; then
  if ! command -v gh >/dev/null 2>&1; then echo "  You need to install, gh.  Please run: gitr install gh"; exit_withCR; fi

     if [ "${aArg3}" == "" ]; then aStage="${aArg3}"; fi
     if [ "${aArg4}" != "" ]; then aProj="${aArg4}"; fi
     if [ "${aArg5}" != "" ]; then aAcct="${aArg5}"; fi

     aLoggedIn=$( gh auth status | awk "/${aAcct}/" )

  if [ "${aLoggedIn}" == "" ]; then
     aGIT1="gh auth login"
     echo -e "\n  ${aGIT1}\n"; # exit
     eval        "${aGIT1}"
     fi
     aGIT2="gh repo create ${aProj/_\//}_${aStage} --public"
     echo -e "\n  ${aGIT2} # Add -d to doit"; # exit                                    # .(41029.04.1 RAM Add doit msg)
 if [ "${bDoit}" == "1" ]; then
     eval        "${aGIT2}"
     fi
     exit_withCR

#  ? What account do you want to log into? GitHub.com
#  ? What is your preferred protocol for Git operations on this host? SSH
#  ? Upload your SSH public key to your GitHub account? C:\Users\Robin\.ssh\Robin.Mattern@GitHub_ram_a210727_key.pub
#  ? Title for your SSH key: (GitHub CLI) github-ram

#  ? Title for your SSH key: github-ram
#  ? How would you like to authenticate GitHub CLI? Login with a web browser

#  ! First copy your one-time code: FA85-111D
#  Press Enter to open github.com in your browser...
#  ? Authentication complete.
#  - gh config set -h github.com git_protocol ssh
#  ? Configured git protocol
#  ? SSH key already existed on your GitHub account: C:\Users\Robin\.ssh\Robin.Mattern@GitHub_ram_a210727_key.pub
#  ? Logged in as robinmattern
#  ! You were already logged in to this account
#  GraphQL: Name already exists on this account (createRepository)
     fi
# ---------------------------------------------------------------------------

  if [ "${aCmd}" == "trackBranch" ]; then
     aName="origin"; aBranch="${aArg3}"; if [ "${aBranch}" == "" ]; then aBranch="$( git branch | awk '/*/ { print substr($0,3) }' )"; fi
     aGIT1="git push origin \"HEAD:refs/heads/${aBranch}\""
     aGit2="git fetch origin"
     aGIT3="git branch --set-upstream-to  \"${aName}/${aBranch}\"  \"${aBranch}\""
     echo -e "\n  ${aGIT1}\n  ${aGIT2}\n  ${aGIT3}"; # exit
  if [ "${bDoit}" == "1" ]; then
     eval        "${aGIT1}"
     eval        "${aGIT2}"
     eval        "${aGIT3}"
     fi
     exit_withCR
     fi
# ---------------------------------------------------------------------------

  if [ "${aCmd}" == "replaceLocal" ]; then                                              # .(41031.07.3 Write replace local command Beg)
                                  aBranch="$( git branch | awk '/*/ { print substr($0,3) }' )"
                                  aRemote_name="origin"; if [ "${aBranch}" == "" ]; then aBranch="master"; fi
    if [ "${aArg3}" != "" ]; then aRemote_name="$( echo "${aArg3}" | awk '{ print tolower($0) }' )"; fi
    if [ "${bDoit}" != "1" ]; then
       echo ""
       git fetch "${aRemote_name}" | awk '{ print "  " $0 }; END{ if (NR > 0) { print "" }; print "Fetch complete " NR }'
       echo      "  The ${aRemote_name} repo has been fetched. To replace it add -d to run this git command:"
       echo      "     git reset --hard ${aRemote_name}/${aBranch}"
       fi
     if [ "${bDoit}" == "1" ]; then
       git reset --hard ${aRemote_name}/${aBranch} | awk '{ print "  " $0 }'
       fi
     fi                                                                                 # .(41031.07.3 End)
# ---------------------------------------------------------------------------

  if [ "${aCmd}" == "mergeRemote" ]; then
#    aName="origin";    aBranch="master"
#    aSSH="github-ram"; aAcct='robinmattern';  aStage="${aArg3}";
     if [ "${aArg3}" != "" ]; then aRemote_name="$( echo "${aArg3}" | awk '{ print tolower($0) }' )"; fi
     if [ "${aArg4}" != "" ]; then aRemoteBranch="${aArg4}"; fi
     if [ "${aArg5}" != "" ]; then aLocalBranch="${aArg5}"; fi

# echo "  aRemote_name: '${aRemote_name:0:7}'"
     if [ "${aRemote_name}"  == "" ]; then echo -e "\n* You must provide a remote repo name";       exit_withCR; fi

     if [ "${aRemote_name}" == "anythingllm_master" ]; then aRemote_name="anything-llm"; fi
     if [ "${aRemote_name}" == "anythingllm"        ]; then aRemote_name="anything-llm"; fi
     if [ "${aRemote_name}" == "anything-llm"       ]; then aRemoteName="AnythingLLM_master";   fi

     if [ "${aRemote_name}"     == "anyllm-altools" ]; then aRemote_name="anyllm_"; fi
     if [ "${aRemote_name}"     == "altools"        ]; then aRemote_name="anyllm_"; fi
     if [ "${aRemote_name:0:7}" == "anyllm_"        ]; then aRemoteName="AnyLLM_${aStage/-*/}";
        if [ "${aRemoteBranch}" == ""               ]; then aRemoteBranch="b241013.01_ALT"; fi
        if [ "${aLocalBranch}"  == ""               ]; then aLocalBranch="ALTools"; fi; fi
             aAWK="/${aRemoteName}/ { if (\$1 == \"${aRemoteName}\" && \$3 == \"(push)\") { print 1 } }"
#            echo "git remote -v | awk '${aAWK}'"
             bValid="$( git remote -v | awk "${aAWK}" )"
     if [ "${bValid}"       != "1" ]; then echo -e "\n* You must provide a valid remote repo name"; exit_withCR; fi

     if [ "${aRemoteBranch}" == "" ]; then echo -e "\n* You must provide a remote branch name";     exit_withCR; fi
     if [ "${aLocalBranch}"  == "" ]; then aLocalBranch=${aRemoteBranch}; fi

     echo "  Merging remote branch, ${aRemoteName}/${aRemoteBranch} into local branch ${aLocalBranch}"
     aGIT1="git fetch ${aRemoteName}"
     aGIT2="git checkout ${aLocalBranch}"
     aGIT3="git merge ${aRemoteName}/${aRemoteBranch}"

#    aGIT1="git pull ${RemoteName}/${RemoteBranch}"
     echo -e "\n  ${aGIT1} # Add -d to doit\n  ${aGIT2}\n  ${aGIT3}"                    # .(41029.04.2)
  if [ "${bDoit}" == "1" ]; then
     eval        "${aGIT1}"
     eval        "${aGIT2}"
     eval        "${aGIT2}"
     fi
     exit_withCR
     fi
# ---------------------------------------------------------------------------

  if [ "${aCmd}" == "addRemote" ] || [ "${aCmd}" == "setRemote" ]; then                 # .(41029.05.1 RAM Add seetRemote)
#    aName="origin";    aBranch="master"
#    aSSH="github-ram"; aAcct='robinmattern';  aStage="${aArg3}";
     if [ "${aArg3}" != "" ]; then aRemote_name="$( echo "${aArg3}" | awk '{ print tolower($0) }' )"; fi
     if [ "${aArg4}" != "" ]; then aAcct="${aArg4}"; fi
     if [ "${aArg5}" != "" ]; then aProject="${aArg5}"; fi
     if [ "${aArg6}" != "" ]; then aStage_="${aArg6}"; fi

     if [ "${aRemote_name}" == "" ]; then echo -e "\n* You must provide a remote repo name, i.e. origin or reponame"; exit_withCR; fi
     if [ "${aRemote_name}" == 'help' ]; then
             echo -e "\n  The arguments are Account, Project, Stage, or you can use"
             echo      "    anything-llm   for   Mintplex-Labs"
             echo      "    anyllm         for   AnyLLM_${aStage}"
             echo      "    altools        for   ALTools_${aStage}"
             echo      "    frtools        for   FRTools_${aStage}"
#            echo      "    jptools        for   JPTools_${aStage}"
             echo      "    jptools        for   AIDocs_${aStage}  {aAcct}, or"
             echo      "    [origin]   for any  {Project_Stage}"
             exit_withCR
             fi
             sayMsg  "gitR2[410]  aRemote_name: '${aRemote_name}', aArg3: '${aArg3}', aArg4: ${aArg4}'"  -1

     if [ "${aRemote_name}" == "origin" ] && [ "${aArg4}" == "" ]; then                 # .(41102.03.1 RAM Ask for Remote Name Beg)
             echo -e "\n    You must provide a Remote Name, e.g frtools, aidocs, anyllm, anyllm_dev03-robin";
             ask4Required  "  or anything-llm, anything, anythingllm, anythingllm_master." "  What is it."  "${aProject}_${aStage}";
             aArg3="${aAnswer}" # aRemote_name="${aAnswer}""
             fi                                                                         # .(41102.03.1 End)
     if [ "${aRemote_name}" != "origin" ]; then                                         # .(41102.05.1 RAM Wierd fix, based on position)
             aRemote_name="${aArg3}";                                                   # .(41102.05.2)
             fi                                                                         # .(41102.05.3)
     if [ "${aRemote_name}" == "origin" ] && [ "${aArg4}" != "" ]; then                 # .(41102.03.2 RAM Create origin project name Beg)
             aRemote_name="${aArg4}"; aArg4="${aArg5}"; echo "    {aArg4}: '${aArg4}'"
             aRemoteName="origin"
             fi                                                                         # .(41102.03.2 End)
             aRemoteURL=""                                                              # .(41102.03.4 End)

             sayMsg  "gitR2[426]  aRemote_name: '${aRemote_name}', aStage: '${aStage}', aStage_: ${aStage_}'"  -1
#    --------------------------------------------------------------------------------

     if [ "${aRemote_name/_/}" != "${aRemote_name}"    ]; then   # for any  {Project_Stage}"                # .(41102.03.5 RAM Write this Beg)

#            aProject="$( echo "${aRemote_name}" |  awk '{ sub( /_.+/, "" ); print }' )";   echo "    {aProject}:   '${aProject}'"
#            if [ "${aArg3}" == "origin"  ]; then aRemote_name="${aArg4}"; else aRemote_name="${aArg3}"; fi
             aProject="$( echo "${aRemote_name}" |  awk '{ sub( /_.+/, "" ); print }' )";   echo "    {aProject}:   '${aProject}'"
             aStage="$(   echo "${aRemote_name}" |  awk '{ sub( /.+_/, "" ); print }' )"; # echo "    {aStage/dev}: '${aStage/dev/}'"
             if [ "${aRemoteName}" != "origin" ]; then aRemoteName="${aProject}_${aStage/-*/}"; fi
             if [ "${aArg4}" != ""             ]; then aAcct="${aArg4}"; else aAcct="robinmattern"; fi; # echo "    {aArg4}: '${aArg4}'"
#            if [ "${aRemoteName}" == "origin" ] && [ "${aStage/dev}" != "${aStage}" ]; then
             if                                     [ "${aStage/dev}" != "${aStage}" ]; then
             aSSH="git@github.ram"; aAcct2=":${aAcct}"; else aSSH="https://github.com"; aAcct2="/${aAcct}"; fi; #  echo "    {aAcct2}: '${aAcct2}'"
             if [ "${aArg4}" == "" ]; then
             if [ "${aStage/rick/}"  != "${aStage}" ];  then aAcct2="/blueNSX";  aSSH="${aSSH/.ram/.rsh}"; fi
             if [ "${aStage/bruce/}" != "${aStage}" ];  then aAcct2="/8020data"; aSSH="${aSSH/.ram/.btg}"; fi ;fi;
             aRemoteURL="${aSSH}${aAcct2}/${aProject}_${aStage}.git";  #  echo "    aRemoteURL: '${aRemoteURL}'"
             fi                                                                                             # .(41102.03.5 End)
#    --------------------------------------------------------------------------------

#    if [ "${aRemote_name}"     == "anythingllm_master" ]; then aRemote_name="anything-llm"; fi
#    if [ "${aRemote_name}"     == "anythingllm"        ]; then aRemote_name="anything-llm"; fi
     if [ "${aRemote_name:0:8}" == "anything"           ]; then
             aSSH="https://github.com"
             aAcct="Mintplex-Labs"
             if [ "${aRemoteName}" != "origin" ]; then aRemoteName="${aRemote_name}"; fi
             aProject="anything-llm"
             aStage_="master"; aStage="master"
             aBranch="master"
             aRemoteURL="${aSSH}/${aAcct}/${aProject}${aStage_}.git"
             fi
        fi
#    --------------------------------------------------------------------------------
#    sayMsg  "gitR2[460]  aRemoteURL:   '${aRemoteURL}'"  -1

#    if [ "${aRemote_name}" == "anyllm"             ]; then aRemote_name="altools"; fi                      ##.(41102.03.6 RAM Replace anyllm  with setRemote1 Beg)
#    if [ "${aRemote_name:0:6}" == "anyllm"         ]; then
#    if [ "${aRemote_name}" == "anyllm_dev03-robin" ]; then
#            aSSH="git@github.ram"; else aSSH="https://github.com"; fi
#            aAcct="robinmattern"
#            aProject="AnyLLM"
#            aStage="dev03-robin"; aStage_="_${aStage}"
#            if [ "${aRemoteName}" != "origin" ]; then aRemoteName="${aProject}_${aStage/-*/}"; fi
#            aBranch="b241013.01_ALT"
#            aRemoteURL="${aSSH}${aAcct}/${aProject}${aStage_}.git"
#       fi                                                                                                  # .(41102.03.6 End)
#    --------------------------------------------------------------------------------
     sayMsg  "gitR2[474]  aRemoteURL:   '${aRemoteURL}'"  -1

#    if [ "${aRemote_name}" == "altools" ]; then  aRemote_name="anyllm-altools"; fi                         ##.(41102.03.6 RAM Replace altools with setRemote1 Beg)
#    if [ "${aRemote_name}" == "anyllm-altools" ]; then
##           aStage=""
##           aProject="APTools"
#            aSSH="https://github.com"
#            aAcct="robinmattern"
#            aBranch="b241013.01_ALT"
#            aRemoteName="AnyLLM_${aStage/-*/}"
#            aStage_="dev03-robin"  # "_${aStage}"
#            aRemoteURL="${aSSH}/${aAcct}/${aProject}_${aStage_}.git"
#            fi
#    if [ "${aRemote_name:0:7}"  == "altools"       ]; then                             # .(41029.06.1 RAM Add alias: frtools Beg)
#    if [ "${aRemote_name}"      == "altools_dev01" ]; then aRemote_name="altools_dev01-robin"; fi
#    if [ "${aRemote_name:0:11}" == "altools_dev"   ]; then
#            aSSH="git@github.ram"; else aSSH="https://github.com"; fi
#            aAcct="robinmattern"
#            aProject="ALTools"
#            aStage="prod1-master"; if [ "${aSSH:0:3}" == "git" ]; then aStage="${aRemote_name:8}"; fi; aStage_="_${aStage}"
#            aBranch="master"
#            if [ "${aRemoteName}" != "origin" ]; then aRemoteName="${aProject}_${aStage/-*/}"; fi
#            aRemoteURL="${aSSH}${aAcct}/${aProject}${aStage_}.git"
#       fi                                                                                                  ##.(41102.03.06 End)
#    --------------------------------------------------------------------------------

#    if [ "${aRemote_name:0:7}" == "frtools"         ]; then        ##.(41029.06.1 RAM Add alias: frtools Beg).(41102.03.6 RAM Replace frtools with setRemote1 Beg))
#            aStage=""
#            aProject="APTools"
#            aSSH="git@github.ram"
#            aAcct="robinmattern"
#            aBranch="master"
#            aRemoteName="origin"  # "FRTools_${aStage/-*/}"
#            aStage_="prod1-master"  # "_${aStage}"
#            aRemoteURL="${aSSH}:${aAcct}/${aProject}_${aStage_}.git"                   # .(41029.07.2 RAM Use : not /)
#       fi                                                                                 ##.(41029.06.1 End).(41102.03.6 End)

   function  setRemote1() {                                                                                 # .(41102.03.6 RAM Write setRemote1 Beg)
#    if "${aArg3}" == "origin", then Dev stages to: git@github.[ram|rsh|btg], else all stages go to https://github.com
             aPROJ=$1; aProj="$( echo "$1" | awk '{ print tolower($0) }' )"; w=${#aProj}; w1=$((w+1)); w2=$((w+4));  # echo "  ${aRemote_name}  w w1 w3: ${w} ${w1} ${w2}"
     if [ "${aRemote_name:0:${w}}"  == "${aProj}"       ]; then                            # .(41029.06.1 RAM Add alias: frtools Beg)
     if [ "${aRemote_name}"         == "${aProj}_dev01" ]; then aRemote_name="${aProj}_dev01-robin"; fi
     if [ "${aRemote_name:0:${w2}}" == "${aProj}_dev"   ]; then
             aSSH="git@github.ram"; else aSSH="https://github.com"; fi
             aProject="${aPROJ}"
             aBranch="master"; aStage2="${aStage}"
             sayMsg  "gitR2[520]  aStage: '${aStage}', aStage_: ${aStage_}'" -1
#            aStage="prod1-master"; if [ "${aSSH:0:3}" == "git" ]; then  aStage="${aRemote_name:${w1}}"; fi; aStage_="_${aStage}"
             aStage="${aRemote_name:${w1}}"; if [ "${aStage}" == "" ]; then aStage="${aStage2}"; fi  ; # echo "aStage: '${aStage}', aStage_: '${aStage_}'"
             aStage_="_${aStage}";  if [ "${aStage}" == "" ]; then aStage_=""; fi
#            aAcct="/robinmattern"; if [ "${aRemoteName}"  == "origin" ]; then  aAcct=":${aAcct:1}"; fi
             aAcct="/robinmattern"; if [ "${aSSH:0:3}" == "git" ]; then  aAcct=":${aAcct:1}"; fi
             if [ "${aRemoteName}"  != "origin"      ]; then aRemoteName="${aProject}${aStage_/-*/}"; fi
             aRemoteURL="${aSSH}${aAcct}/${aProject}${aStage_}.git"
        fi
     }                                                                                                      # .(41102.03.6 End)
#    --------------------------------------------------------------------------------

   function  setRemote() {                                                                                  # .(41102.03.5 RAM Write setRemote Beg)
#    if "${aArg3}" == "origin", then Dev stages to: git@github.[ram|rsh|btg], else all stages go to https://github.com
             aPROJ=$1; aProj="$( echo "$1" | awk '{ print tolower($0) }' )"; w=${#aProj}; w1=$((w+1)); w2=$((w+4));  # echo "  ${aRemote_name}  w w1 w3: ${w} ${w1} ${w2}"
     if [ "${aRemote_name:0:${w}}"  == "${aProj}"       ]; then                         # .(41029.06.1 RAM Add alias: frtools Beg)
#    if [ "${aRemote_name}"         == "${aProj}_dev01" ]; then aRemote_name="${aProj}_dev01-robin"; fi
     if [ "${aRemote_name}"         == "${aProj}_dev03" ]; then aRemote_name="${aProj}_dev03-robin"; fi
     if [ "${aRemote_name:0:${w2}}" == "${aProj}_dev"   ] && [ "${aArg3}" == "origin" ]; then
             aSSH="git@github.ram"; else aSSH="https://github.com"; fi
             aProject="${aPROJ}"
             aBranch="master"
#            aStage="prod1-master"; if [ "${aSSH:0:3}" == "git" ]; then aStage="${aRemote_name:7}"; fi; aStage_="_${aStage}"
             aStage="${aRemote_name:${w1}}"; aStage_="_${aStage}";  if [ "${aStage}" == "" ]; then aStage_=""; fi  ; # echo "aStage: '${aStage}', aStage_: '${aStage_}'"
             aAcct="/robinmattern"; if [ "${aStage/rick/}"  != "${aStage}" ]; then aAcct="/blueNSX";  aSSH="${aSSH/.ram/.rsh}"; fi
                                    if [ "${aStage/bruce/}" != "${aStage}" ]; then aAcct="/8020data"; aSSH="${aSSH/.ram/.btg}"; fi
             if [ "${aRemoteName}"  == "origin"         ]; then aAcct=":${aAcct:1}"; fi
#            if [ "${aRemoteName}"  != "origin"         ]; then aRemoteName="${aProject}_${aStage/-*/}"; fi
             if [ "${aRemoteName}"  != "origin"         ]; then aRemoteName="${aProject}${aStage_/-*/}"; fi
             aRemoteURL="${aSSH}${aAcct}/${aProject}${aStage_}.git"
        fi
     }                                                                                                      # .(41102.03.5 End)
#    --------------------------------------------------------------------------------

    if [ "${aRemoteURL}" == "" ]; then                                                                      # .(41102.03.8 Beg)
         setRemote  "AIDocs"                                                                                # .(41102.03.5)
         setRemote1 "AnyLLM"                                                                                # .(41102.03.6 End)
         setRemote1 "ALTools"                                                                               # .(41102.03.6 End)
         setRemote1 "FRTools"                                                                               # .(41102.03.6 End)
         fi                                                                                                 # .(41102.03.8 End)

#    sayMsg  "help"
     sayMsg  "gitR2[562]  aRemoteURL:   '${aRemoteURL}'"  -1 # Provided via aliases: frtools, altools* or anyllm*

     if [ "${aRemoteURL}" == "" ]; then    # Provided via arguments
#    echo "  say what: aArg3: '${aArg3}', aArg4: '${aArg4}', 'aArg5: '${aArg5}'"
#    echo "  say what: aProject: '${aProject}', aStage: '${aStage}'"

#    if [ "${aArg3}" == ""  ]; then aArg3="origin"; fi                                  # .(41029.06.2 RAM Add origin)
     if [ "${aArg4}" == ":" ]; then aArg4=":robinmattern"; fi                           # .(41029.06.3 RAM Was: aAcct=)
     if [ "${aArg4}" == "" ] && [ "${aArg5}" == "" ]; then                              # .(41029.06.4 RAM If no args Beg)
             aRemoteName="${aArg3}"
             aAcct2="/${aAcct}"; if [ "${aSSH:0:3}" == "git" ]; then aAcct2=":${aAcct}"; fi                 # .(41029.07.3)
             aRemoteURL="${aSSH}${aAcct2}/${aProject}_${aStage}.git"                                        # .(41029.07.4)
        fi                                                                              # .(41029.06.4 End)
     if [ "${aArg4}" != "" ] && [ "${aArg5}" == "" ]; then
             aAcct="${aArg4/\/*/}"
             aRemoteName="${aArg3}"
        if [ "${aArg4/\//}" != "${aArg4}" ]; then aProject="${aArg4/*\//}"
        fi
     if [ "${aAcct}" != "" ] && [ "${aProject}" != "" ]; then
         if [ "${aAcct:0:1}" != ":" ] || [ "${aAcct:0:1}" == "/" ]; then aAcct="/${aAcct}"; fi
         if [ "${aAcct:0:1}" == ":" ]; then aSSH="git@github.com:"; else aSSH="https://github.com/"; fi     # .(41029.07.5 RAM Was git:github-ram)
             aAcct="${aAcct:1}"
#            aAcctRepoName="${aAcct}{aProject}{aStage}"
#            echo "  aProject: ${aProject/_/} == ${aProject}"
             if [ "${aProject/_/}"  == "${aProject}" ]; then
             if [ "${aStage_}"     == ""  ]; then aStage_="${aStage}";   fi
             if [ "${aStage_:0:1}" != "_" ]; then aStage_="_${aStage_}"; fi; fi
             aRemoteURL="${aSSH}${aAcct}/${aProject}${aStage_}.git"
             fi
             aRemoteName="${aArg3}"
         echo "  aRemoteName: ${aRemoteName}, aRemoteURL: ${aRemoteURL}"; exit_withCR
         fi
     fi # eif no ${aRemoteURL}
#    -------------------------------------------------------------

#    sayMsg  "gitR2[597]  aProject: '${aProject}';  aStage: '${aStage}',  aBranch: '${aBranch}',  aRemoteName: ${aRemoteName/origin/origin      }, aRemoteURL: ${aRemoteURL}"  -1
     sayMsg  "gitR2[598]  '${aBranch}'  ${aRemoteName/origin/origin      }  '${aProject}_${aStage}'  '${aRemoteURL}'"  -1
#    sayMsg  "gitR2[599]  aRemoteURL:  '${aRemoteURL}'"  -1; exit # Say it

     if [ "${aRemoteName}"   == "" ]; then echo -e "\n* You must provide a remote repo name, i.e. origin or reponame:";
        echo "  e.g. anything-llm, anythingllm_master anyllm_dev03-robin, anyllm-altools, altools"; exit_withCR; fi

     aAcct="$( echo "${aAcct}" | awk '{ sub( /[:\/]/, "" ); print }' )"
# if [ "${aStage}" == "" ]; then
#    echo "* You must provide a Stage name."
#    exit_withCR
#    fi
#    -------------------------------------------------------------

     if [ "${aCmd}" == "setRemote" ]; then                                              # .(41029.05.2 RAM Beg)
     echo "  Setting Remote, ${aProject}, for Account, ${aAcct} and stage, ${aStage}"
     aGIT1="git remote set-url  ${aRemoteName}  ${aRemoteURL}"
#    aGIT2="git branch --set-upstream-to  ${aProject}/${aBranch}  ${aBranch}"
     fi                                                                                 # .(41029.05.2 End)
# ---------------------------------------------------------------------------

     if [ "${aCmd}" == "addRemote" ]; then                                              # .(41029.05.3)
     echo "  Adding a Remote, '${aProject}', for Account, '${aAcct}', and stage, '${aStage}'"
#    aGIT1="git remote add  ${aProject} git@${aSSH}:${aAcct}/${aProject}_${aStage}.git"
# if [ "${aSSH:0:3}" == "git" ]; then aAcct=":${aAcct}"; else aAcct="/${aAcct}"; fi
#    aGIT1="git remote add  ${aRemoteName}  ${aSSH}${aAcct}/${aProject}${aStage_}.git"
     aGIT1="git remote add  ${aRemoteName}  ${aRemoteURL}"
     fi                                                                                 # .(41029.05.4)
#    echo -e "\n  ${aGIT1}\n  ${aGIT2}"
     echo -e "\n  ${aGIT1} # Add -d to doit"                                            # .(41029.04.3)
  if [ "${bDoit}" == "1" ]; then
     eval        "${aGIT1}"
#    eval        "${aGIT2}"
     aCmd="shoRemote"
     fi
#    fi  # ???
# ---------------------------------------------------------------------------

  if [ "${aCmd}" == "delRemote" ]; then
     aName="${aArg3}"; if [ "${aName}" == "" ]; then aName="origin"; fi
     aGIT1="git remote remove ${aName}"
     echo -e "\n  ${aGIT1} # Add -d to doit"                                            # .(41029.04.4)
  if [ "${bDoit}" == "1" ]; then
     eval        "${aGIT1}"
     aCmd="shoRemote"
     fi
     fi
# ---------------------------------------------------------------------------

  if [ "${aCmd}" == "shoRemote" ]; then
     echo ""
     git remote -v | awk '{ print "  " $0 }'
     exit_withCR
     fi
# ---------------------------------------------------------------------------

  if [ "${aCmd}" == "getCLI" ]; then
     echo "" gh
# if [ "${aOS}" == "windows" ]; then
#    curl -LO https://github.com/cli/cli/releases/latest/download/gh_*_windows_amd64.msi   # no workie
#    msiexec.exe /i gh_*_windows_amd64.msi
#    rm gh_*_windows_amd64.msi
     npm install -g gh
#    fi
     fi
# ---------------------------------------------------------------------------

  if [ "${aCmd}" == "backupLocal" ]; then
#    aStage="${aArg3}"; if [ "${aStage}" == "" ]; then aStage="dev03-robin"; fi
                        if [ "${aArg3}"  != "" ]; then aStage="${aArg3}"; fi

     aPath="${aRepos}/${aProj}._/ZIPs/${aProj/_\//}_${aStage}"
     aTS=$( date '+%y%m%d.%H%M' ); aTS=${aTS:1}
     cd "${aRepoDir}"
     aBranch="$( git branch | awk '/*/ { print substr($0,3) }' )"
     aGIT1="mkdir -p  \"${aPath}\""
     aGIT2="git checkout-index -a -f --prefix=\"${aPath}/_v${aTS}_${aBranch}/\""
     echo -e "\n  ${aGIT1} # Add -d to doit\n  ${aGIT2}"; #  exit                       # .(41029.04.5)
     eval        "${aGIT1}"
     eval        "${aGIT2}"
     fi
# ---------------------------------------------------------------------------

#   mkdir -p ../temp-comparison/b41012.00_Master-files
#   mkdir -p ../temp-comparison/b41013.00_ALT-Changes
#   mkdir -p ../temp-comparison/b41013.01_Master-Changes
#   git archive master                   | tar -x -C ../temp-comparison/b41012.00_Master-files
#   git archive b41013.00_ALT-Changes    | tar -x -C ../temp-comparison/b41013.00_ALT-Changes
#   git archive b41013.01_Master-Changes | tar -x -C ../temp-comparison/b41013.01_Master-Changes

#   git clone --mirror /path/to/original/repo /path/to/backup/repo.git
#   git checkout-index -a -f --prefix=/path/to/backup/destination/
#   git ls-files --others --exclude-standard -z | xargs -0 -I {} cp --parents {} /path/to/backup/destination/ && git checkout-index -a -f --prefix=/path/to/backup/destination/

     exit_withCR
