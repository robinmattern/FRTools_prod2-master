#!/bin/bash
#*\
##=========+====================+================================================+
##RD         Main0              | GitR Tools
##RFILE    +====================+=======+===============+======+=================+
##FD   FRT22_GitR1.sh           |  21714| 10/26/24 17:20|   461| p1.02`.41026.1720
##FD   FRT42_GitR2.sh           |  24865| 10/29/24  8:52|   488| p1.02`.41029.0852
##FD   FRT42_GitR2.sh           |  27486| 10/30/24 20:28|   513| p1.02`.41030.2028
##FD   FRT42_GitR2.sh           |  30370| 10/31/24 10:11|   544| p1.02`.41031.0810
##FD   FRT42_GitR2.sh           |  43817| 11/03/24 13:03|   692| p1.02`.41103.1303
##FD   FRT42_GitR2.sh           |  62603| 11/04/24  9:45|   979| p1.02`.41104.1222
##FD   FRT42_GitR2.sh           |  67220| 11/07/24  9:15|  1023| p1.02`.41107.0745
##FD   FRT42_GitR2.sh           |  78987| 11/09/24 10:32|  1196| p1.02`.41109.1355
##FD   FRT42_GitR2.sh           |  86844| 11/09/24 15:00|  1291| p1.02`.41109.1500
##FD   FRT42_GitR2.sh           |  88127| 11/11/24 19:15|  1305| p1.02`.41111.1915
##FD   FRT42_GitR2.sh           |  88208| 11/12/24 10:00|  1306| p1.02`.41112.1000
##FD   FRT42_GitR2.sh           |  92817| 11/14/24 18:32|  1367| p1.02`.41114.1830
##FD   FRT42_GitR2.sh           |  96740| 11/16/24 11:25|  1423| p1.02`.41116.1125
##FD   FRT42_GitR2.sh           |  98952| 11/18/24 10:15|  1444| p1.02`.41118.1015
##FD   FRT42_GitR2.sh           | 101830| 11/20/24 11:45|  1474| p1.02`.41120.1145
##FD   FRT42_GitR2.sh           | 108122| 11/23/24 19:00|  1534| p1.02`.41123.1900
##FD   FRT42_GitR2.sh           | 113886| 11/24/24 19:45|  1596| p1.02`.41124.1945
##FD   FRT42_GitR2.sh           | 121112| 12/01/24 12:32|  1705| p1.02`.41201.1232

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
#            exit_wCR           |
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
# .(41103.02 11/03/24 RAM  1:03p| Change FRT22_gitR1 to gitR2
# .(41103.03 11/03/24 RAM  2:20p| Add gitr init with chkRepo
# .(41103.04 11/03/24 RAM  3:48p| Found dangling if .. fi
# .(41103.05 11/03/24 RAM  5:10p| Added default commands for remote and commit
# .(41103.06 11/03/24 RAM  8:40p| Add gitr commands clone, pull and push
# .(41104.01 11/04/24 RAM  9:15a| Write getRemoteName and getProjectStage_fromURL
# .(41104.02 11/04/24 RAM 12:22p| Check for merge conflicts Beg
# .(41104.04 11/04/24 RAM  7:47p| Write getBranch; awk '/*/ {}' not allowed on Mac
# .(41104.05 11/04/24 RAM  8:33p| Move git clone and get branch
# .(41104.06 11/04/24 RAM 11:10p| Kludges just for AnythingLLM
# .(41104.07 11/04/24 RAM 11:55p| Add aCloneDir to gitR
# .(41105.01 11/05/24 RAM  7:42p| Don't do light branch clone
# .(41105.02 11/05/24 RAM  8:05p| Add -force option to git pull
# .(41105.03 11/05/24 RAM  8:30p| Add Sudo and chmod to get pull/clone
# .(41107.02 11/07/24 RAM  7:45a| Change default StageDir for clone
# .(41109.01 11/09/24 RAM  9:45a| Add other Project/Stage arg combinations
# .(41109.02 11/09/24 RAM  9:45a| Allow initGit with 1 arg
# .(41109.03 11/09/24 RAM 10:30a| Create initGit vars
# .(41109.04 11/09/24 RAM  1:55p| Add Docsify to initGit
# .(41109.05 11/09/24 RAM  3:00p| Add last command and update others
# .(41110.01 11/10/24 RAM  8:15a| See if commit exists for list last
# .(41110.02 11/10/24 RAM 11:00a| Fix clone command args
# .(41110.03 11/10/24 RAM  6:50p| Add .code-workspace file if needed for clone
# .(41111.02 11/11/24 RAM  7:15p| Commit .code-workspace file after clone
# .(41114.03 11/14/24 RAM 11:00a| Get branch name another way
# .(41114.04 11/14/24 RAM 12:30p| Added gitr show branch and gitr branch command
# .(41114.05 11/14/24 RAM  5.15p| Display branches if none given
# .(41114.06 11/14/24 RAM  6.00p| Use askRequired
# .(41114.07 11/14/24 RAM  6.30p| Write function chkUser
# .(41116.01 11/16/24 RAM 11.25a| Add gitR update command
# .(41118.01 11/18/24 RAM  8:30a| Fix AIDocs URL and clone help
# .(41118.02 11/18/24 RAM  8:45a| Fix clone args processing
# .(41116.01 11/18/24 RAM 10:15a| Fix gitR update issues
# .(20420.07 11/19/24 RAM  8:10a| Add Version vars
# .(41119.01 11/19/24 RAM  9:10a| Check for MT gitR clone dir
# .(41119.01 11/19/24 RAM  9:50a| Fix clone afteremath
# .(41120.01 11/20/24 RAM  9:00a| Fix exit_CR
# .(41120.02 11/20/24 RAM 11:45a| Ignore file permissions globally
# .(41120.02 11/23/24 RAM  9:20a| Don't Ignore file permissions globally
# .(41123.02 11/23/24 RAM 10:00a| Add gitr status command
# .(41123.03 11/23/24 RAM 10:20a| Fix git status awk END
# .(41123.05 11/23/24 RAM  5:30p| Update a different remote/branch
# .(41123.07 11/23/24 RAM  6:30p| Add List nCnt commits from nBeg
# .(41123.08 11/23/24 RAM  7:00p| Add Show nCnt commits from nBeg
# .(41123.05 11/24/24 RAM  4:15p| Fix gitr update for MacOS
# .(41124.06 11/24/24 RAM  6:55p| Add Date to git status
# .(41124.06 11/24/24 RAM  7:45p| Add Date to git show commit
# .(41129.02 11/29/24 RAM  1:00p| Change git status -u to get all working files
# .(41129.03 11/29/24 RAM  1:15p| Add add command
# .(41129.04 11/29/24 RAM  2:50p| Fix make remote args
# .(41031.04 12/01/24 RAM 12:32p| Fix List Commits Dec<-"Dev" date calc
# .(41105.03 12/01/24 RAM  1:15p| Fix "${OS:0:7}" != "Windows" 
# .(41123.05 12/01/24 RAM  1:33p| Adjust spacing for gitr update 
# .(41123.05 12/01/24 RAM  2:25p| Fix if [ "aRemote" == "" ]

##PRGM     +====================+===============================================+
##ID 69.600. Main0              |
##SRCE     +====================+===============================================+
#*/
#========================================================================================================== #  ===============================  #

        aVDt="Dec 01, 2024 2:25p"; aVer="p1.02"; aVTitle="Useful gitR2 Tools by formR";                                  # .(41103.02.2 RAM Was: gitR1)
        aVer="$( echo "$0" | awk '{ match( $0, /_[dpstuv][0-9]+\.[0-9]+/ ); print substr( $0, RSTART+1, RLENGTH-1) }' )"  # .(21031.01.1 RAM Add [d...).(20416.03.8 "_p2.02", or _d1.09)

        LIB="gitR2"; LIB_LOG=${LIB}_LOG; LIB_USER=${LIB}_USER; Lib=${LIB}; aDir=$(dirname "${BASH_SOURCE}");              # .(41103.02.3).(41102.01.1 RAM Add JPT12_Main2Fns_p1.07.sh Beg).(80923.01.1)
        aFns="${aDir/FRTs*/JPTs}/JPT12_Main2Fns_p1.07.sh"; if [ ! -f "${aFns}" ]; then
        echo -e "\n ** gitR2[144]  JPT Fns script, '${aFns}', NOT FOUND\n"; exit; fi; #fi
        source "${aFns}";                                                                                                 # .(41102.01.1 End)

        aVdt="${aVDt}"; aVtitle="gitR Tools"                                                                              # .(20420.07.2 RAM JPT12_Main2Fns uses these)
        Begin "$@"                                                                                                        # .(41102.01.2)

# ---------------------------------------------------------------------------

function help() {
     echo ""
#    echo "  GitR Commands (${aVer})"
     echo "  ${aVTitle} (${aVer})         (${aVDt})"
     echo "  -------------------------------------------  ---------------------------------"
#    echo ""
     echo "    clone [name] [stagedir]                    Clone files from remote name to stagedir"         # .(41103.06.1)
     echo "    clone branch [name] [stagedir] [branch]    Clone files from remote name/branch to stagedir"  # .(41103.06.2)
     echo "    Status                                     Show uncommitted files in working tree, if any"   # .(41123.02.1)
     echo "    Show commit  [{beg}|{hash}] [{cnt}]        Show files for {cnt} commits from {beg}/{hash}"   # .(41123.08.1).(41030.05.1)
     echo "    List commits [{beg}] [{cnt}]               List last {cnt} commits from {beg}"               # .(41123.07.1).(41031.03.1).(51030.05.1)
     echo "    List remotes                               List current remote repositories"                 # .(41031.03.2)
     echo "    List branches                              List current remote repositories"                 # .(41114.04.1)
     echo "    Branch {branch}                            Checkout branch {branch}"                         # .(41114.04.2)
     echo "    Add commit {msg}                           Add and commit working files to .({TS})"          # .(41129.03.1)
     echo "    Track Branch                               Set tracking for origin/branch"
     echo "    Set remote  {name} [{acct}] [{repo}] [-d]  Set current remote repository"
     echo "    Add remote  {name} [{acct}] [{repo}] [-d]  Add new origin remote repository"
#    echo "    Make remote {name} [{acct}] [{repo}] [-d]  Create new remote repository in github"           ##.(41129.04.1)
     echo "    Make remote {project_stage} [{acct}] [-d]  Create new remote repository in github"           # .(41129.04.1)
     echo "    Remove remote [{name}]               [-d]  Remove origin or {name} remote"
     echo "    pull  [name] [branch]                      Pull files from remote name and branch"           # .(41103.06.3)
     echo "    pull  [name] [branch] [-f]                 Overwrite files from remote name and branch"      # .(41103.06.4)
     echo "    push  [name] [branch]                      Push files to remote name and branch"             # .(41129.06.1)
     echo "    Replace [local] [{name}]             [-d]  Replace all files from origin or remote {name}"   # .(41031.07.1)
     echo "    Update [{branch}] [{name}]      [-f] [-d]  Update all files from {name} [-f for no stash]"   # .(41116.01.1)
     echo "    Backup local                               Copy local repo to ../ZIPs"
     echo "    Install gh                                 Install the GIT CLI"
     echo "    Init                                       Initialize a git repository"                      # .(41103.03.1)
     echo "    [-b]                                       Show debug messages"
     echo "    [-d]                                       Doit, i.e. execute the command"
#    echo ""
     echo "    Note: [name] defaults to ${aLocation}"
     echo "          [acct] defaults to ${aAcct}"
  if [ "${aProject}" != "" ]; then
     echo "          [proj] defaults to ${aProject}"
     echo "          [repo] defaults to ${aProject}_${aStage}"
     else
     echo "          [proj] defaults to a Project_ folder"
     echo "          [repo] defaults to a Project_/Stage folder"
     fi
     exit_wCR
     }
# ---------------------------------------------------------------------------

function exit_wCR() {
# if [ "${OSTYPE:0:6}" == "darwin"  ]; then echo ""; fi                                 ##.(41120.01.1)
  if [ "${OS:0:7}"     != "Windows" ]; then echo ""; fi                                 # .(41120.01.1 RAM Fix exit_wCR)
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

function Sudo() {                                                                                           # .(41105.03.1 RAM Write Sudo)
  if [[ "${OS:0:7}" != "Windows" ]]; then if [ "${USERNAME}" != "root" ]; then sudo "$@"; fi; fi            # .(41105.03.12 RAM Was: "windows").(41105.03.2)
     }                                                                                                      # .(41105.03.3)
# -----------------------------------------------------------

# function setFlags

# Initialize variables
    bDebug=0; bDoit=0;  mArgs=(); mARGs=()
    aArg1=$1; aArg2=$2; aArg3=$3; aArg4=$4; aArg5=$5; aArg6=$6; aCmd=""
    sayMsg  "gitR2[207]  \$aArg1: '$aArg1',   \$aArg2:    '$aArg2',  \$aArg3:    '$aArg3',    \$aArg4:    '$aArg4',  \$aArg5:    '$aArg5',  \$aArg6:    '$aArg6'" -1

while [[ $# -gt 0 ]]; do  # Loop through all arguments
    case "$1" in
#       -[bdf]*)           # Handle combined flags                                      ##.(41105.02.1 Beg)
#           if [[ "$1" =~ "b" ]]; then  bDebug=1; fi
#           if [[ "$1" =~ "d" ]]; then  bDoit=1; fi
#           if [[ "$1" =~ "f" ]]; then  bForce=1; fi                                    ##.(41105.02.1 Beg)
        -doit|--doit)    bDoit=1 ;;                                                     # .(41105.02.2 RAM Rewrite)
        -debug|--debug)  bDebug=1 ;;                                                    # .(41105.02.3)
        -force|--force)  bForce=1 ;;                                                    # .(41105.02.4)
        -[bdf]*)         [[ "$1" =~ "b" ]] && bDebug=1; [[ "$1" =~ "d" ]] && bDoit=1; [[ "$1" =~ "f" ]] && bForce=1 ;;  # .(41105.02.5)
        *)
         mArgs+=("$( echo "${1:0:3}" | sed 'y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/')"); # mARGs+=("$1")
         mARGs+=("$1")
         i=${#mARGs[@]}
#        sayMsg  "gitR2[181]  \${mARGs[${i}]}: '${mARGs[${i}]}', \$$i: '$1'" 1
         ;;
    esac
    shift
done
    set -- "${mArgs[@]}"  # Restore the command arguments, lower case, three letters
    aArg1=${mARGs[0]}; aArg2=${mARGs[1]}; aArg3=${mARGs[2]}; aArg4=${mARGs[3]}; aArg5=${mARGs[4]}; aArg6=${mARGs[5]};
    aArg7=${mARGs[6]}; aArg8=${mARGs[7]}; aArg9=${mARGs[8]}                                                 # .(41107.02.1 RAM Add aArg7,,aArg9 and aArg8)
#   sayMsg  "gitR2[231]                     \$mARGs[1]: '${mARGs[1]}',  \$mARGs[2]: '${mARGs[2]}',    \$mARGs[3]: '${mARGs[3]}',  \$mARGs[4]: '${mARGs[4]}',  \$mARGs[5]: '${mARGs[5]}',  \$mARGs[6]: '${mARGs[6]}',  \$mARGs[7]: '${mARGs[7]}'" 1
#   sayMsg  "gitR2[232]  \$1:     '$1',     \$2:        '$2',          \$3:        '$3',      \$4:        '$4',     \$5:        '$5',   \$6:        '$6',  \$7:        '$7'" 1
    sayMsg  "gitR2[233]  \$aArg1: '$aArg1',   \$aArg2:    '$aArg2',  \$aArg3:    '$aArg3',    \$aArg4:    '$aArg4',  \$aArg5:    '$aArg5',  \$aArg6:    '$aArg6',  \$aArg7:    '$aArg7'" -1
    sayMsg  "gitR2[234]  \$bDoit: '$bDoit', \$bForce: '$bForce', \$bDebug: '$bDebug'" -1
#   sayMsg  "gitR2[235]  \$mARGs[2]: '${mARGs[2]}',  \$aArg3: '$aArg3',  \$3 '$3'" 1
#   sayMsg  "gitR2[236]  \$mARGs[3]: '${mARGs[3]}', \$aArg4: '$aArg4', \$4 '$4'" 1
# ---------------------------------------------------------------------------

  if [ "$1" == "ini" ];                      then aCmd="init";         fi               # .(41103.03.2)
  if [ "$1" == "sta" ];                      then aCmd="status";       fi                                   # .(41123.02.2)

  if [ "$1" == "clo" ];                      then aCmd="cloneRemote";  fi               # .(41103.06.5)
  if [ "$1" == "clo" ] && [ "$2" == "rem" ]; then aCmd="cloneRemote";  fi               # .(41103.06.6)
  if [ "$1" == "clo" ] && [ "$2" == "bra" ]; then aCmd="cloneBranch";  fi               # .(41103.06.7)

  if [ "$1" == "pul" ];                      then aCmd="pullRemote";   fi               # .(41103.06.8)
  if [ "$1" == "rem" ] && [ "$2" == "pul" ]; then aCmd="pullRemote";   fi               # .(41103.06.9)
  if [ "$1" == "pus" ];                      then aCmd="pushRemote";   fi                                   # .(41129.06.2)
  if [ "$1" == "rem" ] && [ "$2" == "pus" ]; then aCmd="pushRemote";   fi                                   # .(41129.06.3)

  if [ "$1" == "com" ];                      then aCmd="shoLast"; aArg3=$2; aArg4=$3; fi                    # .(41123.07.2).(41103.05.1 RAM Was: 9)
  if [ "$1" == "com" ] && [ "$2" == "las" ]; then aCmd="shoLast";      fi               # .(51030.05.3)
  if [ "$1" == "lis" ] && [ "$2" == "las" ]; then aCmd="shoLast";      fi               # .(41031.03.4)
  if [ "$1" == "las" ];                      then aCmd="shoLast"; if [ "$2" == "" ]; then aArg3=1; else aArg3=$2; aArg4=$3; fi; fi  # .(41123.07.3).(41109.05.1 RAM Last with no 2nd arg)
  if [ "$1" == "las" ] && [ "$2" == "sho" ]; then aCmd="shoLast"; if [ "$3" == "" ]; then aArg3=1; else aArg3=$3; aArg4=$4; fi; fi  # .(41123.07.4).(41109.05.2 RAM Show 1 for last if not given)
  if [ "$1" == "sho" ] && [ "$2" == "las" ]; then aCmd="shoLast"; if [ "$3" == "" ]; then aArg3=1; else aArg3=$3; aArg4=$4; fi; fi  # .(41123.07.5).(41109.05.3)
  if [ "$1" == "lis" ] && [ "$2" == "com" ]; then aCmd="shoLast";      fi

  if [ "$1" == "sho" ] && [ "$2" == "com" ]; then aCmd="shoCommit"; aArg3=$3; aArg4=$4; fi                  # .(41123.08.2 RAM Add aArgs).(51030.05.2)
  if [ "$1" == "com" ] && [ "$2" == "sho" ]; then aCmd="shoCommit"; aArg3=$3; aArg4=$4; fi                  # .(41123.08.3).(51030.05.3)

  if [ "$1" == "bra" ];                      then aCmd="checkoutBranch";  fi                                # .(41114.04.3 RAM Checkout Branch).(41103.05.2)
  if [ "$1" == "che" ];                      then aCmd="checkoutBranch";  fi                                # .(41114.04.4 RAM Checkout Branch).(41103.05.2)

  if [ "$1" == "lis" ] && [ "$2" == "bra" ]; then aCmd="listBranches";  fi              # .(41103.05.2 RAM List Branchs)
  if [ "$1" == "bra" ] && [ "$2" == "lis" ]; then aCmd="listBranches";  fi              # .(41103.05.2 RAM List Branchs)
  if [ "$1" == "tra" ] && [ "$2" == "bra" ]; then aCmd="trackBranch";  fi
  if [ "$1" == "bra" ] && [ "$2" == "tra" ]; then aCmd="trackBranch";  fi

  if [ "$1" == "bac" ] && [ "$2" == "loc" ]; then aCmd="backupLocal";  fi
  if [ "$1" == "rep" ] && [ "$2" == "loc" ]; then aCmd="replaceLocal"; fi               # .(41031.07.2)

  if [ "$1" == "upd" ];                      then aCmd="update";       fi                                   # .(41116.01.2)

  if [ "$1" == "add" ];                      then aCmd="addCommit";    fi                                   # .(41129.03.2)
  if [ "$1" == "add" ] && [ "$2" == "com" ]; then aCmd="addCommit";    fi                                   # .(41129.03.3)
  if [ "$1" == "com" ] && [ "$2" == "add" ]; then aCmd="addCommit";    fi                                   # .(41129.03.4)

  if [ "$1" == "rem" ];                      then aCmd="shoRemote";    fi               # .(41103.05.3 RAM Remote cmds)
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
  if [ "$1" == "del" ] && [ "$2" == "rem" ]; then aCmd="delRemote";    fi               # .(41103.05.4)
  if [ "$1" == "rem" ] && [ "$2" == "del" ]; then aCmd="delRemote";    fi               # .(41103.05.5)
  if [ "$1" == "mak" ] && [ "$2" == "rem" ]; then aCmd="makRemote";    fi

  if [ "$1" == "ins" ] && [ "$2" == "gh"  ]; then aCmd="getCLI";       fi

# if [ "${bDebug}" == "1" ]; then
#   echo -e "\n  aCmd: ${aCmd}, bDoit: ${bDoit}, bDebug: ${bDebug}, 1)$1, 2)$2, 3)$3, 4)$4, 5)$5, 6)$6."; # exit_wCR
#   echo -e "\n  aCmd: ${aCmd}, bDoit: ${bDoit}, bDebug: ${bDebug}; 1)${aArg1}, 2)${aArg2}, 3)${aArg3}, 4)${aArg4}, 5)${aArg5}, 6)${aArg6}."; # exit_wCR
    sayMsg  "gitR2[291]  aCmd: ${aCmd}, aArg1: '$aArg1', aArg2: '$aArg2', aArg3: '$aArg4', aArg4: '$aArg4', bDoit: '$bDoit', bForce: '$bForce'" -1
#    fi
# ---------------------------------------------------------------------------

function chkUser() {                                                                    # .(41114.07.1 RAM Write it)
         aGitUserName="$( git config --get user.name )"
 if [ "${aGitUserName}" == "" ]; then
         echo -e "\n  * You haven't told Git who you are. Please do so now."
         aGitUserName="$(  ask4Required "    Enter your name. " )"                      # .(41114.06.3 RAM Use it)
         aGitUserEmail="$( ask4Required "    Enter your email." )"                      # .(41114.06.4 RAM Use it)
         git config --global user.name  "${aGitUserName}"
         git config --global user.email "${aGitUserEmail}"
         fi
#        git config --global core.fileMode false                                        ##.(41120.02.3 RAM Don't).(41120.02.1 RAM Ignore file permissions)
    } # eof chkUser                                                                     # .(41114.07.1 End)
# ---------------------------------------------------------------------------

function chkRepo() {                                                                                        # .(41103.03.3 RAM Write chkRepo Beg)

#if [ "${aStage}"   == "$(pwd)" ]; then
 if [ "${aRepoDir}" == "" ]; then
#if [ "${aStage}"   == "" ]; then
    echo "* You are not in a ${aProject}_/{StgDir} Git Repository"
    exit_wCR
  else
    echo "  RepoDir is: ${aRepoDir}, branch: ${aBranch}";   # exit_wCR
    fi
    }                                                                                                       # .(41103.03.4 End)
# ---------------------------------------------------------------------------

function getBranch( ) {                                                                                     # .(41104.04.1 RAM Create getBranch function Beg)
     if [ -d .git ]; then                                                                                   # .(41104.05.1)
#       aBranch="$( git branch | awk '/\*/ { sub( /.+at /, "" ); sub( /\)$/, "" ); print substr($0,3) }' )" ##.(41114.03.1)
        aBranch="$( git symbolic-ref --short HEAD )"                                                        # .(41114.03.1 RAM More reliable).(41102.02.1)
     fi                                                                                                     # .(41104.05.2)
     }                                                                                                      # .(41104.04.1 End)
# ---------------------------------------------------------------------------

 function getRepoDir() {

   aRepos="$( echo "$(pwd)"       | awk '{ match( $0, /.*[Rr][Ee][Pp][Oo][Ss]/); print substr($0,1,RLENGTH) }' )"
   if [ "${aRepos}" == "" ];        then aRepos="$( dirname $(pwd) )"; fi; # echo "  aRepos: '${aRepos}'"   # .(41129.05.1 RAM What if no Repos dir)
   aRepo="$( git remote -v        | awk '/origin.+push/ { sub( /.+\//, ""); sub( /\.git.+/, "" ); print }' )"
#  aProjDir="${aRepoDir%%_*}"
#  aProjDir="$( echo "$(pwd)"     | awk '{ sub( "'${aRepoDir}'", "" ); print }' )"
#  aAWK='{ sub( "'${aRepos//\//\/}'/", "" ); sub( /[\/_].*/, "_"); print }';             # echo "  aAWK:    '${aAWK}'"  # double up /s
   aAWK='{ sub( "'${aRepos}'/", "" );  sub( /_\/*.+/, "" ); sub( /\/.+/, "" ); print }'; # echo "  aAWK: echo \"\$(pwd)\" | awk '${aAWK}'"
   aProject="$( echo "$(pwd)"     | awk "${aAWK}" )"
#  echo "  aProject:    '${aProject}'"; exit
   aStgDir="$(  echo "$(pwd)"     | awk '{ sub( "'.+"${aProject}"'", "" ); print }' )"                      # .(41103.04.1 RAM Added "{aProject}" based on ShellCheck)
   aStage="$(   echo "${aStgDir}" | awk '{ sub( "^[_/]+", "" ); print }' )"
   aRepoDir="${aRepos}/${aProject}${aStgDir}"
   if [ "${aRepo}" == "" ]; then aRepo="${aProject}${aStgDir}"; fi

   getBranch                                                                                                # .(41104.04.2)
#          bDebug=1
   if [ "${bDebug}" == "1" ]; then
   echo "  - aRepos:   '${aRepos}'"
   echo "  - aRepo:    '${aRepo}'"
   echo "  - aProject: '${aProject}'"
   echo "  - aStage:   '${aStage}'"
   echo "  - aBranch:  '${aBranch}'"                                                                          # .(41102.02.2)
   echo "  - aRepoDir: '${aRepoDir}'"
   echo "  - aAcct:    '${aAcct}'"
   echo ""
#  exit_wCR
   fi
   } # eof getRepoDir
# ---------------------------------------------------------------------------

function shoCommitMsg() {                                                                                   # .(41030.05.2 RAM Write showCommitMsg Beg)

     n=$(($1-1)); if [ "${#n}" == "1" ]; then m=" ${n}"; else m="${n}"; fi                                  # .(41031.05.1 RAM Move to here)
#    aAWK1='/^commit / { c = substr($0,8,8)        };                     /^Author:/ { a = substr($0,8) }; /^Date:/ { d = substr($0,6,27) }; NR == 5 {                                   m = sprintf( "\"%-50s", ($0 != "") ? substr( $0, 5                      )   "\"" : "n/a\"" ); print " " c d"   "m"  "a }' ##.(41031.06.1)
#    aAWK1='/^commit / { c = substr($0,8,8)        };                     /^Author:/ { a = substr($0,8) }; /^Date:/ { d = substr($0,6,27) }; NR == 5 { p = length($0) > 63 ? "..." : ""; m = sprintf( "\"%-61s", ($0 != "") ? substr( $0, 5, 60-(p > "" ? 3 : 0) ) p "\"" : "n/a\"" ); print " " c d"   "m" "a  }' ##.(41031.06.1).(41103.01.1)
     aAWK1='/^commit / { c = substr($0,8,8); n = 5 }; /^Merge/ { n = 6 }; /^Author:/ { a = substr($0,8) }; /^Date:/ { d = substr($0,6,27) }; NR == n { p = length($0) > 63 ? "..." : ""; m = sprintf( "\"%-61s", ($0 != "") ? substr( $0, 5, 60-(p > "" ? 3 : 0) ) p "\"" : "n/a\"" ); print " " c d"   "m"  "a }' # .(41103.01.1).(41031.06.1)
#    aAWK2='{ m = $3;                       d = $4;                       t = $5; y = $6; m = ( 2 + index( "JanFebMarAprMayJunJulAugSepOctNovDev", m ) ) / 3;   print substr($0,1,15)" "y"."m"."d" "t"   "substr( $0, 40 ) }'; # echo "  aAWK2: '${aAWK2}'"; exit # .(41031.04.1)
#    aAWK2='{ m = $3; m = m > 9 ? m : "0"m; d = $4; d = d > 9 ? d : "0"d; t = $5; y = $6; m = ( 2 + index( "JanFebMarAprMayJunJulAugSepOctNovDev", m ) ) / 3;   print substr($0,1,15)" "y"."m"."d" "t"   "substr( $0, 40 ) }';   sayMsg "gitR2[387]  aAWK2: '${aAWK2}'" 2; # .(41031.04.1)
     aAWK2='{ d = $4; d = d > 9 ? d : "0"d; t = $5; y = $6;   m = ( 2 + index( "JanFebMarAprMayJunJulAugSepOctNovDec", $3 ) ) / 3; m = m > 9 ? m : "0"m;        print substr($0,1,15)" "y"."m"."d" "t"   "substr( $0, 40 ) }'; # sayMsg "gitR2[388]  aAWK2: '${aAWK2}'" 1; # .(41031.04.12 RAM Was Dev).(41031.04.2)
#    aCommitHash="$( git rev-parse HEAD~$n 2>/dev/null )"; # echo "  aCommitHash: '${aCommitHash}'"         # Get commit hash at current position
#    echo "  aCommitHash: ${aCommitHash}"; return
#    if [ "${#n}" == "1" ]; then m=" ${n}"; else m="${n}"; fi
#    if [ "$?" -ne "0" ]; then echo -e "* ${m}.  There are no more commits (HEAD~$n)!"; exit_wCR; fi        ##.(41031.05.2 RAM Was ${1}).(41110.01.1
#    if [ git rev-parse --verify HEAD~${n} >/dev/null 2>&1; then                                            ##.(41110.01.1 RAM No workie)
#    echo "  ${m}. $( git show "$(git rev-parse HEAD~$n)" | awk "${aAWK1}" | awk "${aAWK2}" )"              ##.(41031.04.2).(41110.01.2)
#    if [ "$?" -ne "0"        ]; then echo -e "* ${m}.  There are no more commits (HEAD~$n)!"; exit_wCR; fi ##.(41110.01.2 RAM Move to here).(41031.05.2 RAM Was ${1}).(41110.01.3)
     aComHash="$( git rev-parse HEAD~${n} 2>/dev/null | awk '! /HEAD/ { print $0 }' )"                      # .(41110.01.3
#    sayMsg  "gitR2[240]  ${m}. \$( git show \$(git rev-parse HEAD~$n) | awk '${aAWK1}' ) '${aComHash}'" 2  ##.(41031.04.2 RAM git show $aCommitHash | awk "${aAWK}" )
     if [ "${aComHash}" == "" ]; then echo -e "* ${m}.  There are no more commits (HEAD~$n)!"; exit_wCR; fi # .(41110.01.4 RAM Move to here).(41031.05.2 RAM Was ${1})
#    sayMsg "gitR2[399] git show \"${aComHash}\" | awk '${aAWK2}'" 1; echo ""
     echo "  ${m}. $( git show "${aComHash}" | awk "${aAWK1}" | awk "${aAWK2}" )"                           # .(41110.01.5).(41031.04.2)
                                                                                                            # .(41030.05.2 End)
   } # eof shoCommitMsg
# ---------------------------------------------------------------------------

function shoWorkingFiles() {                                                                                # .(41124.06.1 RAM Write showWorkingFiles Beg)
#    aAWKpgm='                                                                                              ##.(41124.06.2)
#function getDate( aFile ) { return "2024-11-24 16:40" }; { d = getDate( substr($0,4) ); print d " " $0 }'  ##.(41124.06.2)
#    aAWK_GetDate( aFile )='                                                                                # .(41124.06.2 RAM Show Date of git uncommitted files Beg)
          GetDate='
 function getDate( aFile ) {
#    if ((getline < aFile) < 0) { return "Not Found        " };  close( aFile )
     if ( ENVIRON["OS"] ~ /Windows/ ) {
#         cmd = "stat --format=\"%Y-%m-%d %H:%M\" \""      aFile "\" 2>/dev/null"
          cmd = "stat -c \"%y\" \""                        aFile "\" 2>/dev/null"
     if ((cmd | getline lastmod) <= 0) { close( cmd ); return "Not Found        " }
          split( lastmod, dt, ".")       # Remove fractional seconds
          return substr( dt[1], 1, 16 )  # Get just YYYY-MM-DD HH:MM
      } else {
          cmd = "stat -f \"%Sm\" -t \"%Y-%m-%d %H:%M\" \"" aFile "\" 2>/dev/null" }
#         cmd | getline lastmod
#    if ((cmd | getline lastmod) <= 0) { close( cmd ); return "Access Error     " }
     if ((cmd | getline lastmod) <= 0) { close( cmd ); return "Not Found        " }
                                         close( cmd ); return lastmod }
     !/`/ { d = getDate( substr( $0, 4 ) );   print d " " $0 }                                              # .(41124.06.3 RAM Remove files with "`")
#    !/`/ {      aFile = substr( $0, 4 );     print "  aFile: [" aFile "]" }                                ##.(41124.06.3)
    '                                                                                                       # .(41124.06.2 End)
#      git status --short | awk '{ print "   " $1 "  " substr( $0, 4) }'                                    ##.(41124.06.4)
    if [ "$1" == "" ]; then                                                                                 # .(41124.06.11 RAM For status)
       git status -u --short | awk "${GetDate}" | awk '{printf "%20s  %-16s  %s\n",$3,$1" "$2, substr($0,21)}' # .(41129.02.3).(41124.06.4)
#      git status --short | awk "${GetDate}"                                                                ##.(41124.06.4)
#      git status --short                                                                                   ##.(41124.06.4)
       fi                                                                                                   # .(41124.06.12)
    if [ "$1" == "commit" ]; then                                                                           # .(41124.06.13 RAM For commit)
       aAWK1='{ print " " $0 }'
       aAWK2='{ printf "%20s  %-16s  %s\n",$3,$1" "$2, substr( $0, 21 ) }'
#      git status --short | awk "${GetDate}" | awk '{ printf "%4s  %-16s  %s\n",$3,$1" "$2, substr($0,21)}' ##.(41124.06.4).(41124.06.14)
       git show --pretty="" --name-status HEAD~$2 | awk "${aAWK1}" | awk "${GetDate}" | awk "${aAWK2}"      # .(41124.06.14)
#      git show --pretty="" --name-status HEAD~$2 | awk "${aAWK1}" | awk "${GetDate}"                       ##.(41124.06.14)
#      git show --pretty="" --name-status HEAD~$2 | awk "${aAWK1}"                                          ##.(41124.06.14)
       fi                                                                                                   # .(41124.06.15)
   } # eof shoWorkingFiles                                                                                  # .(41124.06.1 End)
# ---------------------------------------------------------------------------

#====== =================================================================================================== #  ===========
#       GITR2 INIT                                                                                          # .(20430.01.3 Beg RAM Added Beg)
#====== =================================================================================================== #

#         aCmd="shoLast"
#         aCmd="init"

  if [ "${aCmd}" == "init" ]; then                                                                          # .(41103.03.5 RAM Actually write Beg)
     sayMsg  "gitR1[388]  Git Init" -1

  if [ -d ".git" ]; then
#       getRepoDir
        echo -e "\n* This project folder already contains a git repository"
        exit_wCR
        fi # eif .git exists
#  ----------------------------------------------------------------------

function initGit() { # assumes we're in folder to be initialized

         aMainBranch="master"
         aProject="$1"; aStage="$2"

      if [ "${aStage}" == "" ]; then                                                    # .(41109.02.1 RAM Allow initGit with 1 arg Beg)
         m=(${aProject//_/ }); aProject="${m[0]}"; aStage="${m[1]}"
         if [ "${aProject}" == "" ] || [ "${aStage}"   == "" ]; then
            aProject_Name="$1";
          else
            aProject_Name="${aProject}_${aStage}"; aStage="${aStage///}"; fi
        else
            aProject_Name="${aProject}_/${aStage}"                                      # .(41109.02.2 RAM Assign aProject_Name)
         fi                                                                             # .(41109.02.1 End)

         aSvr="${THE_SERVER:0:6}"; if [ "${aSvr}" == "" ]; then aSvr="{Svr}"; fi
         aOwner="$( whoami | awk '{ print $1 }' )"
         aStage2="${aStage}";         if [ "${aStage}" == "" ]; then aStage2="all"; fi
         aProject_="${aProject/_/}";  if [ "${aStage}" != "" ]; then aProject_="${aProject/_/}_"; fi
         echo "  Creating a repository, '${aProject_}${aStage}', in folder: '${aProject_Name}'."; # .(41109.02.3 RAM Was: '${aProject}_/${aStage}')

#        sayMsg "gitR[342]  Bye" 2
      if [ ! -z "$( ls -A "." )" ]; then echo "* But the folder is not empty or isn't created. Unable to create repository. ";
         exit_wCR;
         fi
         echo "  The current folder is empty.";
         sayMsg  "gitR2[347]  Creating a repository, '${aProject_}${aStage}', in folder: '${aProject_Name}'.'" -1

         git init                               | awk '{ print "  " $0 }'
         echo ""
         git checkout -b "${aMainBranch}"  2>&1 | awk '{ print "  " $0 }'

#        touch README.md  # or any file                                                 # .(41109.03.1 RAM Create initGit vars Beg)
         aREADME_md="
# Repository: ${aProject_}${aStage}
Created on $( date +'%a %b %d %Y at %T' )
Created by ${aOwner}

## Description

"
         aGitignore='
.env
node_modules
.DS_Store
yarn.lock
*.bak
*_v[0-9]*
*_t[0-9]*
'
         aLaunch_json='
{ // Use IntelliSense to learn about possible attributes.
  // Hover to view descriptions of existing attributes.
  // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
  "version": "0.2.0",
  "configurations": [
     , { "type"     : "node"
       , "name"     : "Debug Node Script"
       , "request"  : "launch"
       , "skipFiles": [ "<node_internals>/**" ]
       , "program"  : "${file}
          }
     , { "type"     : "bashdb"
       , "name"     : "Debug Bash Script"
       , "request"  : "launch"
       , "program"  : "${file}
          }
       ]
   }'
                                                                                        # .(41109.03.1 End)
                                                                                        # .(41109.04.1 RAM Add Docsify files Beg)
         aRun_Docsify='
#!/bin/bash

   docsify serve
'
         aDocsify_Index="
<!DOCTYPE html>
<html>
<head>
    <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/docsify/themes/vue.css\">
</head>
<body>
    <div id=\"app\"></div>
    <script>
        window.\$docsify = {
       // Docsify options (optional)
          hideSidebar: true,
          };
    </script>
    <script src=\"https://cdn.jsdelivr.net/npm/docsify/lib/docsify.min.js\"></script>
</body>
</html>
"
                                                                                        # .(41109.04.1 End)
         aWorkspace_code="{ \"folders\": [ { \"path\": \".\" } ] }"
                                                                                        # .(41109.03.2 RAM Add initGit dirs & files Beg)
#        sayMsg  "gitR2[393]  Adding files to repo, ${aProject}_${aStage}, in folder: ${aProject_Name}'" -1
         sayMsg  "gitR2[394]  Current folder is: '$( pwd )'" -1

#        !2_formR Tools for 8020's FRTools Apps in rm228d on Stage Prod2-Master
         aDir="!2_\${Title} for ${aOwner}'s ${aProject} Apps in ${aSvr} on Stage ${aStage2}"
         aDirC="client/c01_client-first-app/!3_${aProject} Client No. 1 App in ${aSvr} on Stage ${aStage2}"
         aDirS="server/s01_server-first-app/!3_${aProject} Server No. 1 App in ${aSvr} on Stage ${aStage2}"
         mkdir "${aDir}"
         mkdir -p "${aDirC}"
         mkdir -p "${aDirS}"
         mkdir ".vscode"
         mkdir "docs"

         echo "" >"docs/index.html";         git add "docs/index.html"
         echo "" >"${aDir}/.gitkeep";        git add "${aDir}/.gitkeep"
         echo "" >"${aDirC}/.gitkeep";       git add "${aDirC}/.gitkeep"
         echo "" >"${aDirS}/.gitkeep";       git add "${aDirS}/.gitkeep"
         echo "" >"${aDirC:0:27}/index.js";  git add "${aDirC:0:27}/index.js"
         echo "" >"${aDirS:0:27}/server.js"; git add "${aDirS:0:27}/server.js"

         echo "${aLaunch_json}"    >".vscode/launch.json"
         echo "${aGitignore}"      >".gitignore"
         echo "${aWorkspace_code}" >"${aProject_}${aStage}.code-workspace"              # .(41109.03.2 End)
         echo "${aDocsify_Index}"  >"docs/index.html"                                   # .(41109.04.2)
         echo "${aRun_Docsify}"    >"docs/run-docsify.sh"                               # .(41109.04.3)
         echo "${aREADME_md}"      >"docs/README.md"                                    # .(41109.04.4)
         echo "${aREADME_md}"      >"README.md"                                         # .(41109.03.3)

         aTS="$(date +%y%m%d)"; aTS="${aTS:1}"
         git add docs/index.html docs/run-docsify.sh docs/README.md                     # .(41104.04.5)
         git add README.md .gitignore .vscode/launch.json "${aProject_}${aStage}.code-workspace"
         git commit -m ".(${aTS}.01_Initial commit for ${aProject_}${aStage}" | awk '{ print "  " $0 }'

#        git branch --set-upstream-to=origin/${aMainBranch} ${aMainBranch}

#        gitr1 add remote origin $1
         } # eof
#  ----------------------------------------------------------------------

           echo ""
           aPath="$( pwd )"; aDir="${aPath##*/}"
        sayMsg "gitR2[535]  git init in ${aDir}" -1

        if [ "${aDir: -1}" == "_" ]; then  # in a Project_ dir

           aProject="${aDir/_/}"
           echo "  The current folder is a Project folder: '${aProject}_";

           if [ "${aArg2}" == "" ]; then
              ask4Default "Please provide a stage name. e.g. " "" "dev01-robin"         # .(41114.06.5 RAM Was: ask4Required)
              aStage="${aAnswer}"
            else
              aStage="${aArg2}"
              fi
           if [ -d "${aStage}" ]; then
              echo "* The folder, ${aStage}, currently exists"
            else
              echo "  Creating a folder: ${aProject}_/${aStage}"
              mkdir "${aStage}"
              fi
              cd "${aStage}" || exit_wCR

           initGit "${aProject}" "${aStage}"
           chkUser                                                                      # .(41114.07.2 RAM Use it here too)

           echo -e "\n  Please cd into the folder, '${aStage}'."
           exit_wCR
        fi # eif aProject_ dir
#       --------------------------------------------------------------

        if [ "${aDir/-/}"  != "${aDir}" ]; then  # in aStage dir
           aProject="$( cd .. && pwd )"; aProject="${aProject##*/}"; aProject="${aProject/_/}";
           aStage="${aDir}"

#          sayMsg "gitR2[445]  git init in ${aProject}${aStage}" 2
           initGit "${aProject}" "${aStage}"
           echo -e "\n  Please cd into the folder, '${aStage}'."
           exit_wCR
        fi # eif aDir == aStage
#       --------------------------------------------------------------

        if [ "${aArg2}" != "" ] && [ "${aArg3}" != "" ]; then                                               # .(41109.01.1 RAM Add other Project/Stage arg combinations Beg)
        sayMsg "gitR2[453]  aArg2: ${aArg2}, aArg3: ${aArg3}" -1
                               aStage="${aArg3}"; aProject="${aArg2}_"
        if [ "${aArg2%%_}"  != "${aArg2}" ]; then aProject="${aArg2}"; fi  # _ is last char in 1st argument
        if [ "${aArg2%%/}"  != "${aArg2}" ]; then aProject="${aArg2}"; fi # / is last char in 1st argument
        if [ "${aArg2%%_/}" != "${aArg2}" ]; then aProject="${aArg2}"; fi # _/ is last two chars in 1st argument

           if [  !  -d "${aProject}${aStage}" ]; then
              mkdir -p "${aProject}${aStage}";
              echo  -e "  Creating a folder, '${aProject}${aStage}'."
              fi;
#          sayMsg "gitR2[463]  git init in ${aProject}${aStage}" 2
                cd     "${aProject}${aStage}" || exit_wCR; aFolder="${aProject}${aStage}"
           initGit     "${aProject}${aStage}"
           echo -e "\n  Please cd into the folder, '${aFolder}'."
           exit_wCR
        fi # eif aProject_aStage dir
#       --------------------------------------------------------------

        if [ "${aArg3}" == "" ]; then  # Just a dir

        if [ "${aArg2/_/}"  != "${aArg2}" ]; then  # _ is in 1st argument

           m=(${aArg2//_/ }); aProject="${m[0]}"; aStage="${m[1]}"
           if [  !  -d "${aProject}_${aStage}" ]; then
              mkdir -p "${aProject}_${aStage}";
              echo  -e "  Creating a folder, '${aProject}_${aStage}'."
              fi
#          sayMsg "gitR2[480]  git init in ${aProject}_${aStage}" 2
                cd     "${aProject}_${aStage}" || exit_wCR; aFolder="${aProject}_${aStage}"
           initGit     "${aProject}_${aStage}"
           echo -e "\n  Please cd into the folder, '${aFolder}'."
           exit_wCR
           fi # eif aProject_aStage

        if [ "${aArg2///}" != "${aArg2}" ]; then  # / is in 1st argument

           m=(${aArg2//// }); aProject="${m[0]}"; aStage="${m[1]}"
           if [  !  -d "${aProject}/${aStage}" ]; then
              mkdir -p "${aProject}/${aStage}";
              echo  -e "  Creating a folder, '${aProject}/${aStage}'."
              fi
#          sayMsg "gitR2[482]  git init in ${aProject}/${aStage}" 2
                cd     "${aProject}/${aStage}" || exit_wCR; aFolder="${aProject}/${aStage}"
           initGit     "${aProject}/${aStage}"
           echo -e "\n  Please cd into the folder, '${aFolder}'."
           exit_wCR
           fi # eif aProject/aStage

        if [ "${aArg2/_/}" == "${aArg2}" ]; then  # _ is not in 1st argument

           aProject="${aArg2}"
#          sayMsg "gitR2[504]  git init in ${aProject}" 2
           if [  !  -d "${aProject}" ]; then
              mkdir    "${aProject}";
              echo -e "  Creating a folder, '${aProject}'."
              fi
                cd     "${aProject}" || exit_wCR; aFolder="${aProject}"
           initGit     "${aProject}"
           echo -e "\n  Please cd into the folder, '${aFolder}'."
           exit_wCR
           fi # eif aProject only
        fi # eif # Just a dir                                                                               # .(41109.01.1 End)

        echo -e "\n * Didn't know what folder to put .git into"                                             # .(41109.01.2 RAM If all else fails)
        exit_wCR
     fi # eoc Init                                                                                          # .(41103.03.5).(20430.01.3 End)
#    -- --- ---------------  =  ------------------------------------------------------  #  ---------------- #
#====== =================================================================================================== #  ===========
#       GITR2 CLONE                                                                                         # .(41104.05.3 RAM Move git clone up before git init)
#====== =================================================================================================== #

function getProjectStage_fromURL() {                                                                        # .(41104.01.1 Write getProjectStage_fromURL Beg)
#        sayMsg "gitR2[628]  \$1: '$1'" 1;
         aProjectStage="$( echo "$1" | awk '{ sub( /.+\//, "" ); sub( /.git/, "" ); sub( /_/, " "); print }' )"
         aProject="$( echo "${aProjectStage}" | awk '{ print $1 }' )"
         aStage="$(   echo "${aProjectStage}" | awk '{ print $2 }' )"
     if [ "${aProject}" == "anything-llm" ]; then aProject="AnyLLM"; aStage="prod1-master"; fi              # .(41104.06.1 RAM Another kludge)
         }                                                                                                  # .(41104.01.1 End)                                                                                                  #
#    -- --- ---------------  =  ------------------------------------------------------  #  ---------------- #

#        getProjectStage_fromURL "git@github-ram:robinmattern/FRTools_prod2-master.git"
#        sayMsg  "gitR1[481]  getProjectStage_fromURL: ${aProject}_${aStage}" 1
#        aArg2="git@github-ram:robinmattern/FRTools_prod2-master.git"

function getRemoteName() {                                                                                  # .(41104.01.2 RAM Write getRemoteName Beg)
     sayMsg  "gitR2[600]  aProject: '${aProject}', aStage: '${aStage}', aArg2: '${aArg2}', aArg3: '${aArg3}', aArg4: '${aArg4}'" -1

#       getRepoDir                                                                                          # .(41104.05.4)

     if [ "${aArg2}"  != "" ]; then aProject="${aArg2}"; fi;
     if [ "${aArg3}"  != "" ]; then aBranch="${aArg3}"; fi
     if [ "${aArg4}"  != "" ]; then aStage="${aArg4}"; fi
     if [ "${aArg5}"  != "" ]; then aStageDir="${aArg5}"; fi
#    if [ "${aArg6}"  != "" ]; then aAcct="${aArg6}"; fi                                                    # .(41107.02.2 RAM Add Acct, not here)
     if [ "${aArg2}"  == "" ]; then aRemoteName="$( git remote | awk '{ print; exit }' )"; fi               # .(41110.02.1 RAM There can be more than one)
#    if [ "${aArg4}"  == "" ]; then aBranch="$( git branch | awk '/\*/ { print substr($0,3) }' )"; fi       ##.(41104.04.2 RAM Was: /*/).(41104.04.3)
     if [ "${aArg3}"  == "" ]; then getBranch; fi                                                           # .(41104.04.3)
     if [ "${aProject}" == "anythingllm"  ]; then aProject="AnythingLLM"; aArg2="https://github.com/Mintplex-Labs/anything-llm.git";        fi   # .(41104.06.2 RAM Provide repo URLs)
     if [ "${aProject}" == "anyllm"       ]; then aProject="AnyLLM";      aArg2="https://github.com/robinmattern/AnyLLM_prod1-master.git";  fi
     if [ "${aProject}" == "frtools"      ]; then aProject="FRTools";     aArg2="https://github.com/robinmattern/FRTools_prod2-master.git"; fi
     if [ "${aProject}" == "aidocs"       ]; then aProject="AIDocs";      aArg2="https://github.com/robinmattern/AIDocs_demo1-master.git";  fi   # .(41118.01.1 RAM Was: AIDocs_prod1-master)
#    if [ "${aStage}" == ""               ]; then echo "* No stage given"; exit_wCR; fi                     ##.(41104.06.3)

     sayMsg  "gitR2[739]  aProject: '${aProject}', aStage: '${aStage}', aBranch: '${aBranch}', aArg2: '${aArg2}', aArg3: '${aArg3}', aArg4: '${aArg4}'" -1

     if [ "${aRemoteName}" == ""                    ]; then aRemoteName="$( echo "${aProject}" | awk '{ print tolower($0) }' )";
     sayMsg  "gitR2[621]  aRemoteName: '${aRemoteName}', aStage: '${aStage}', aBranch: '${aBranch}', aArg2: '${aArg2}', aArg3: '${aArg3}', aArg4: '${aArg4}'" -1
     if [ "${aProject}"    != "origin"              ]; then aRemoteName="$( echo "${aProject}_${aStage/-*/}" | awk '{ print tolower($0) }' )"; fi; fi

     if [ "${aRemoteName}" == "anything-llm"        ]; then aRemoteName="anythingllm"; fi                   # .(41104.06.4)
     if [ "${aRemoteName}" == "anyllm_prod1"        ]; then aRemoteName="anythingllm"; fi
     if [ "${aRemoteName}" == "anythingllm"         ]; then aStage="prod1-master"; aStageDir=""; fi         # .(41107.02.3 RAM Was: aStageDir=${aStage).(41104.06.5 RAM Just for AnythingLLM)
     sayMsg  "gitR2[746]  aRemoteName: '${aRemoteName}', aStage: '${aStage}', aBranch: '${aBranch}', aArg2: '${aArg2}', aArg3: '${aArg3}', aArg4: '${aArg4}', aArg5: '${aArg5}', aArg6: '${aArg6}'" -1

     if [ "${aRemoteName/dev/}" != "${aRemoteName}" ]; then aRemoteName="origin"; fi

     sayMsg  "gitR2[752]  aRemoteName: '${aRemoteName}', aStage: '${aStage}', aBranch: '${aBranch}', aArg2: '${aArg2}', aArg3: '${aArg3}', aArg5: '${aArg4}', '$1'" -1

     if [ "$1" == "forClone" ]; then # --------------------------------------------------------------------

     if [ "${aArg2}"      == "origin"   ]; then echo "* Need to give a remote URL"; exit_wCR; fi
     if [ "${aArg2/.git}" != "${aArg2}" ]; then aRemoteURL="${aArg2}";     aRemoteName="origin";
                                                getProjectStage_fromURL "${aRemoteURL}";
#    if [ "${aArg4}" != ""   ]; then            aStageDir="${aArg4}"; else aStageDir="${aStage}"; fi        ##.(41104.07.1 RAM Set aStageDir).(41107.02.4)
     if [ "${aArg4}" != ""   ]; then            aStageDir="${aArg4}"; else aStageDir=""; fi                 # .(41107.02.4 RAM Don't set default).(41104.07.1 RAM Set aStageDir)
     sayMsg  "gitR2[761]  aRemoteName: '${aRemoteName}', aStage: '${aStage}', aBranch: '${aBranch}', aStageDir: '${aStageDir}' aAccount: '${aAcct}" -1

                                           else aRemoteURL="https://github.com/robinmattern/${aProject}_${aStage}.git"; fi
       else # not for clone -------------------------------------------------------------------------------

     if [ "${aStage}" == ""  ]; then echo "* No stage given";                        exit_wCR; fi           # .(41104.06.6)
           bOK="1"; if [ "$( git remote -v | grep "${aRemoteName}" )" == "" ];  then bOK="0";  fi
     if [ "${bOK}" == "0"    ]; then echo "* Invalid RemoteName: '${aRemoteName}'";  exit_wCR; fi
           aRemoteURL="$( git remote -v | awk '/\(fetch\)/ { sub( / \(fetch\)/, "" ); print substr($0,8) }' )"
        fi
#    ------------------------------------------------------------------------------------------------------

     if [ "${aArg6}" != "" ]; then                                                                          # (41104.09.1 RAM Insert Acct Beg)
        aAcct="${aArg6}"
#       aAWK="{ split( \"/\", m ); m[3] = \"${aAcct}\"; print join( m ) }"; sayMsg "gitR2[470]  aAWK: '${aAWK}'" 2
#       aAWK="{ split( \$0, m, \"/\" );                       print m[1] m[2] m[3] m[4] m[5] m[6] m[7] m[8] m[9] }"; sayMsg "gitR2[471]  aAWK: '${aAWK}'" 1
#       aAWK="{ split( \$0, m, \"/\" ); s="/"; m[3] = \"${aAcct}\"; print m[1]\"/\"m[2]"/"m[3]"/"m[4]"/"m[5]"/"m[6]"/"m[7]"/"m[8]"/"m[9] }"; sayMsg "gitR2[696]  aAWK: '${aAWK}'" -1
        aAWK="{ split( \$0, m, \"/\" ); s=\"/\";              print m[1] s m[2] s m[3] s \"${aAcct}\" s m[5] s m[6] s m[7] s m[8] s m[9] }"; sayMsg "gitR2[697]  aAWK: '${aAWK}'" -1

#       aRemoteURL="$( echo "${aRemoteURL}" | awk '{ split( "/", m ); m[3] = "'"${aAcct}"'"; print m[1] m[2] m[3] m[4] m[5] m[6] m[7] m[8] m[9] }' )"
        aRemoteURL="$( echo "${aRemoteURL}" | awk "${aAWK}" | awk '{ sub( "/+$", "" ); print }' )"          # .(41118.02.1 RAM Remove trailing slashes)
#       https://github.com/robinmattern/Anythin-llm_stage.git'
        fi                                                                                                  # .(41104.09.1 End)
#    ------------------------------------------------------------------------------------------------------

        aRemoteURL="$( echo "${aRemoteURL}" | awk '{ sub( /_.git/, ".git"); print }' )"                     # .(41118.02.2 RAM Remove trailing _ from project)
        sayMsg  "gitR2[787]  aRemoteURL:  '${aRemoteURL}'" -1

     if [ "${aStage}" == ""  ]; then aStage="prod1-master"; fi                                               # .(41104.06.7)
        sayMsg  "gitR2[790]  aProject:    '${aProject}', aStage: '${aStage}', aStageDir: '${aStageDir}'"  -1
        sayMsg  "gitR2[791]  aRemoteName: '${aRemoteName}', aBranch: '${aBranch}', aRemoteURL: '${aRemoteURL}'" -1

        }  # eof cloneRemote                                                                                                 # .(41104.01.2 End)
#    -- --- ---------------  =  ------------------------------------------------------  #  ---------------- #

     if [ "${aCmd}" == "cloneRemote" ] || [ "${aCmd}" == "cloneBranch" ]; then                              # .(41103.06.10 RAM write it Beg)
        sayMsg  "gitR1[715]  Git clone" -1
        sayMsg  "gitR2[716]  \$aArg1: '$aArg1',   \$aArg2:    '$aArg2',  \$aArg3:    '$aArg3',    \$aArg4:    '$aArg4',  \$aArg5:    '$aArg5',  \$aArg6:    '$aArg6',  \$aArg7:    '$aArg7'" -1

        if [ "${aArg2/_/}" != "${aArg2}" ]; then
             if [  "${aArg5}" != "" ]; then aArg6="${aArg5}"; fi; aArg5="${aArg4}";                         # .(41118.02.3)
             aArg4="${aArg2/*_/}"; aArg2="${aArg2/_*/}"
           else aArg4="${aArg3}";                                                                           # .(41118.02.4)
           fi
        sayMsg  "gitR2[729]  \$aArg1: '$aArg1',   \$aArg2:    '$aArg2',  \$aArg3:    '$aArg3',    \$aArg4:    '$aArg4',  \$aArg5:    '$aArg5'" -1

        if [ "${aArg2}" == "" ]  || [ "${aArg2}" == "help" ]; then                                                                       # .(41110.02.2 RAM Was aArg3).(41107.02.5 Provide help beg)
#            aStage="$(   echo "${aStgDir}" | awk '{ sub( "^[_/]+", "" ); print }' )"
             echo -e "\n  Clone any of these projects, or a GitHub URL"
             echo      "     anything-llm    for   Mintplex-Labs"
             echo      "     anyllm          for   AnyLLM_prod1-master {aBranch} # Defaults to master"
             echo      "     altools         for   ALTools_prod1-master"
             echo      "     frtools         for   FRTools_prod2-master"
#            echo      "     jptools         for   JPTools_${aStage}"
             echo      "     aidocs          for   AIDocs_demo1-master {aBranch} {aStageDir} [{aAcct}]"     # .(41118.01.2)
             echo      "or, {project_stage-author} [{aBranch}] [{aStageDir}] [{aAcct}]"                     # .(41118.01.3)
             echo      "     e.g. Project '' /stage-author"                                                 # .(41118.02.1)
             echo      "          Project_stage-author branch '' account"                                   # .(41118.02.2)
             exit_wCR
             fi                                                                                             # .(41107.02.5 End)

#       getBranch # aBranch=$( git branch | awk '/\*/ { print substr($0,2)}' )                              ##.(41104.04.4)
        getRemoteName "forClone"                                                                            # .(41104.01.3)
        sayMsg  "gitR2[766]  aProject:    '${aProject}', aStage: '${aStage}', aStageDir: '${aStageDir}', aBranch: '${aBranch}', aAcct: '${aAcct}'" -1

        toStageDir=" to stage, ${aStageDir},"; if [ "${aStageDir}" == "" ]; then toStageDir=""; fi          # .(41104.07.2)
#       aCloneDir="${aProject}_/${aStageDir}"; if [ "${aStageDir}" == "" ]; then aCloneDir=""; fi           ##.(41104.07.3 RAM Add aCloneDir).(41110.02.3)
        aCloneDir="${aProject}_${aStageDir}";  if [ "${aStageDir}" == "" ]; then aCloneDir=""; fi           # .(41110.02.3 RAM Assume no /StageDir).(41104.07.3 RAM Add aCloneDir)

     if [ "${aArg3}" != ""   ] && [ "${aBranch}" != "" ]; then # for branch                                 # .(41104.06.8 RAM aArg3 means user asked for it )
        forBranch=", from ${aProject}_${aStage}${toStageDir} for branch, ${aBranch}"
#       aGIT1="git clone -b ${aBranch} --depth 1 \"${aRemoteURL}\" ${aCloneDir}"                            ##.(41104.07.4).(41029.03.1 RAM An even lighter clone with just the latest commit).(41105.01.1)
        aGIT1="git clone --single-branch --branch ${aBranch} \"${aRemoteURL}\" ${aCloneDir}"                # .(41105.01.1)
        aGIT2="git branch -u origin/${aBranch} ${aBranch}"
        sayMsg  "gitR2[777]  git clone --single-branch '$aArg3' \$aProject: '${aRemoteURL##*/}', \$aStageDir: '${aStageDir}', \$aBranch: '${aBranch}'" -1
        else
        forBranch=", from ${aProject}_${aStage}${toStageDir}"                                               # .(41104.07.5)
        aGIT1="git clone \"${aRemoteURL}\" ${aCloneDir}"                                                    # .(41104.07.6)
        sayMsg  "gitR2[781]  git clone " +                       "aProject: '${aRemoteURL##*/}', aStageDir: '${aStageDir}', aBranch: '${aBranch}'" -1
        fi

     if [ "${aCloneDir}" == "" ]; then aDir="${aRemoteURL##*/}"; aDir="${aDir/.git/}"; else aDir="${aCloneDir}"; fi # .(41119.01.1 RAM Check if clone dir is empty Beg)
        sayMsg  "gitR2[785]  aCloneDir : '${aDir}', aBranch: '${aBranch}'" -1
     if [ -d "${aDir}" ]; then echo -e "\n* The folder, '${aDir}', is not empty. Unable to clone repository.";   # .(41119.01.2)
         exit_wCR;
         fi                                                                                                 # .(41119.01.1 End)
     if [ -d ".git" ]; then echo -e "\n* The current folder is already a repository.";                      # .(41119.01.3)
         exit_wCR;
         fi                                                                                                 # .(41119.01.3 End)

     if [ "${bDoit}" != "1" ]; then
#       echo -e "\n  ${aGIT1}\n  ${aGIT2}"
        echo -e "\n  About to clone remote name, ${aRemoteName}${forBranch}:"
        echo -e   "  ${aGIT1} # Add -d to doit"                                         # .(41029.04.1)
      else
        echo -e "\n  ${aGIT1}"
        eval        "${aGIT1}" 2>&1 | awk '{ print "  " $0 }'
#       eval        "${aGIT2}"
                Sudo find . -type f -name "*.sh" -exec chmod 755 {} +                                       # .(41119.01.4

        sayMsg  "gitR2[859]  aCloneDir : '${aDir}', aBranch: '${aBranch}', aStage: '${aStage}'" -1
        cd "${aDir}"; aTS="$( date +%y%m%d )"; aTS="${aTS:1}"                                               # .(41119.01.5 RAM Move to here).(41111.02.2 RAM or commit it)

#    if [ ! -f "${aCloneDir}/*.code-workspace" ]; then                                                      ##.(41110.03.1)
     if [ ! -n "$(ls *.code-workspace 2>/dev/null)" ]; then                                                 # .(41119.01.6 RAM Was ls "${aCloneDir}/*.."").(41110.03.1 RAM Add .code-workspace file if needed after clone)
        aWorkspace_code="{ \"folders\": [ { \"path\": \".\" } ] }"                                          # .(41110.03.2)
        sayMsg  "gitR2[808]  Creating '${aProject}_${aStage}.code-workspace'" -1
        echo "${aWorkspace_code}" >"${aProject}_${aStage}.code-workspace"                                   # .(41119.01.7).(41111.02.1 RAM Don't do it for now, cuz GIT detects it).(41110.03.3)
        echo ""                                                                                             # .(41111.02.3)
        git add "${aProject}_${aStage}.code-workspace"                        2>&1| awk '{ print "  " $0 }' # .(41111.02.4)
        git commit -m ".(${aTS}.01_Add ${aProject}_${aStage}.code-workspace)" 2>&1| awk '{ print "  " $0 }' # .(41111.02.5)
#       git add "${aProject}_${aStage}.code-workspace"                        2>&1| awk '{ print "  " $0 }' ##.(41119.01.8)
#       git commit -m ".(${aTS}.01_Add ${aProject}_${aStage}.code-workspace)" 2>&1| awk '{ print "  " $0 }' ##(41119.01.9)
        fi                                                                                                  # .(41110.03.4)
        fi
        exit_wCR
        fi # eoc getRemoteName                                                                              # .(41104.05.5 End).(41103.06.10 End)
#    -- --- ---------------  =  ------------------------------------------------------  #  ---------------- #

#====== =================================================================================================== #  ===========
#       GITR2 HELP & SET GLOBALS                                                                            # .(20430.01.3 Beg RAM Added Beg)
#====== =================================================================================================== #

#         aCmd="cloneRemote"

  if [ "${aCmd}" == "" ] && [ ! -d ".git" ]; then help; fi

        aSSH="git@github-ram"                                                                               # .(41029.07.1 RAM Was git:github-ram)
        aAcct="robinmattern"
        aLocation="origin"
#       aBranch="$( git branch | awk '/\*/ { sub( /.+at /, "" ); sub( /\)$/, "" ); print }' )"              ##.(41102.02.3 RAM Move to getBranch)

     if [ ! -d ".git" ]; then
        echo -e "\n* You are not in a Git Repository"
        exit_wCR
        fi

        echo ""
        setOSvars                                                                                           # .(41103.04.2 RAM Not called per ShellCheck)
        getRepoDir  # aRepo, aRepoDir, aProject, aStage, aBranch
        chkRepo                                                                                             # .(41103.03.6 RAM User here)

  if [ "${aCmd}" == "" ]; then help; fi

        chkUser                                                                                             # .(41114.07.3)

#====== =================================================================================================== #  ===========
#       gitR Status Command                                                                                 # .(41123.02.3)
#====== =================================================================================================== #

#       sayMsg    "FRT40[852] Update Command" sp 1;

  if [ "${aCmd}" == "status" ]; then                                                                        # .(41123.02.4 RAM Add Status Command Beg)
            bFilesInWork="$( git status | awk '/working tree clean/ { b = 1 }; END { print b ? b : 0 }' )"  # .(41123.03.1 RAM Was End)
        if [ "${bFilesInWork}" != "1" ]; then
            nCnt="$(git status -u --short | wc -l)"; s="s"; if [ "${nCnt}" == "1" ]; then s=""; fi          # .(41129.02.4)
            echo -e "\n* The current branch, '${aBranch}', has ${nCnt} uncommitted file${s}."

#           git status --short | awk '{ print "   " $1 "  " substr( $0, 4) }'                               ##.(41124.06.5)
            shoWorkingFiles                                                                                 # .(41124.06.5 RAM Use it)
         else
            echo -e "\n  The current branch, '${aBranch}', has a clean working tree."
            fi
        exit_wCR  #${aLstSp}; exit
     fi # eoc Status Command                                                                                # .(41123.02.4 End)
#    -- --- ---------------  =  ------------------------------------------------------  #  ---------------- #

#====== =================================================================================================== #  ===========
#       gitR Add Commit Command                                                                             # .(41129.03.5)
#====== =================================================================================================== #

#       sayMsg    "FRT40[926] Update Command" sp 1;

  if [ "${aCmd}" == "addCommit" ]; then                                                                     # .(41129.03.6 RAM Add Add CommitCommand Beg)
                                   aCMsg="";         aCN=""
#    sayMsg  sp "FRT40[946] aArg2: '${aArg2}', aArg3: '${aArg3}', \$2: '$2', \$3: '$3'" 1;

     if [[ ${aArg2} =~ ^[0-9] ]]; then  aArg2="${aArg3}"; aArg3="$2"; fi
     if [ "${aArg2}" != "" ]; then aCMsg="${aArg2}"; fi
     if [ "${aArg3}" != "" ]; then aCMsg="${aArg3}"; aCN="${aArg2}"; fi

     if [ "${aArg3}" != "" ]; then aCMsg="${aArg2}"; aCN="${aArg3}"; fi
     if [ "${aArg4}" != "" ]; then
         echo -e "\n* Please put the commit message in quotes."
         exit_wCR
         fi
     if [ "${aCMsg}"  == "" ]; then
         echo -e "\n* Please supply a commit message."
         exit_wCR
         fi
           aTS="$( date '+%y%m%d')"; aTS="${aTS:1}"
     if [ "${#aCN}" == "1" ] || [ "${#aCN}" == "2" ]; then
           if [ "${#aCN}" == "1" ]; then aCN="0${aCN}"; fi
           aCN=".(${aTS}.${aCN}"
           fi
#      sayMsg sp "FRT40[946] aMsg: '${aCMsg}', aCN: '${aCN}'" 1;

     if [ "${aCN}"  == "" ]; then
           aNxt=$( git log --since="midnight" --oneline | awk '{ sub( /.+\.\(/, "" ); print substr($0,7,2) }' | sort | awk 'END{ print $0 + 1 }' )
       sayMsg sp "FRT40[954] aNxt: '${aNxt}'" 1;
#          if [ "${aNxt}"  == ""  ]; then aNxt="01"; fi
           if [ "${#aNxt}" == "1" ]; then aNxt="0${aNxt}"; fi
           aCN=".(${aTS}.${aNxt}"
           fi
#          aGIT1="git commit -am \"${aCN}_${aCMsg}\""
           aGIT1="git add -A"
           aGIT2="git commit -m \"${aCN}_${aCMsg}\""
     if [ "${bDoit}" != "1" ]; then
           aNum="$(git status -u --short | wc -l)"; s="s"; if [ "${aNum}" == "1" ]; then s=""; fi
           echo -e "\n* There are ${aNum// /} uncommitted file${s} that will be committed."
           echo -e "\n  ${aGIT1}"
           echo -e   "  ${aGIT2} # Add -d to doit"
         else
           echo -e "\n  ${aGIT1}"
           echo      "  ${aGIT2}"
#          eval        "${aGIT1}"
#          eval        "${aGIT2}"
           eval        "${aGIT1}" 2>&1 | awk '{ print "  " $0 }'
           eval        "${aGIT2}" 2>&1 | awk '{ print "  " $0 }'
           fi
         exit_wCR  #${aLstSp}; exit
     fi # eoc Add Commit Command                                                                            # .(41129.03.6 End)
#    -- --- ---------------  =  ------------------------------------------------------  #  ---------------- #

#====== =================================================================================================== #  ===========
#       gitR Update Command                                                                                 # .(41116.01.3)
#====== =================================================================================================== #

#       sayMsg    "FRT40[873] Update Command" sp 1;

  if [ "${aCmd}" == "update" ]; then                                                                        # .(41116.01.3 RAM Add Update Command Beg)
        sayMsg    "FRT40[876]  Update:   '${aArg1}' '${aArg2}' '${aArg3}' '${aArg4}', bDoit: '${bDoit}', bDebug: '${bDebug}', bForce: '${bForce}'" 1

            aNewBranch="${aArg2}"                                                                           # .(41123.05.1 RAM Update a different branch Beg)
#           aCurBranch="$( git branch | awk '/'"${aArg2}"'/ { sub(  "*",   "" ); print $1; exit }' )"       ##.(41123.05.11)
            aCurBranch="$( git branch | awk '/'"${aArg2}"'/ { sub( /[* ]/, "" ); print $1; exit }' )"       # .(41123.05.11 RAM Fix for MacOS)
        sayMsg    "FRT40[881]  Update:   aNewBranch: '${aNewBranch}', aCurBranch: '${aCurBranch}', bDoit: '${bDoit}', bDebug: '${bDebug}', bForce: '${bForce}'" -1
        if [ "${aNewBranch}" != "" ]; then
#           aNewBranch="$( git branch | awk '/'"${aNewBranch}"'/ { sub(  "*",   "" ); print $1; exit }' )"  ##.(41123.05.12)
            aNewBranch="$( git branch | awk '/'"${aNewBranch}"'/ { sub( /[* ]/, "" ); print $1; exit }' )"  # .(41123.05.12)
        if [ "${aNewBranch}" == "" ]; then echo -e "\n* The branch, '${aArg2}', doesn't exist."; exit_wCR; fi
           else aNewBranch="${aCurBranch}"
             fi                                                                                             # .(41123.05.1 End)
        sayMsg    "FRT40[888]  Update:   aNewBranch: '${aNewBranch}', aCurBranch: '${aCurBranch}', bDoit: '${bDoit}', bDebug: '${bDebug}', bForce: '${bForce}'" -1

#       if [ "${aNewBranch}" != "${aCurBranch}" ]; then                                                     ##.(41123.05.2)
            aRemote="$( git config --list | grep "branch\.${aNewBranch}\.remote" | awk -F= '{ print $2 }')" # .(41123.05.3)
        if [ "${aRemote}" == "" ]; then aRemote_name="origin";   fi                                         # .(41123.05.44 RAM Was "aRemote").(41123.05.4)
        if [ "${aArg3}"   != "" ]; then aRemote_name="${aArg3}"; fi                                         # .(41123.05.5 RAM Was origin if = "" )
            aRemote="$( git remote -v | awk '/'"${aRemote_name}"'/ { sub( /\.git.+$/, "" ); print; exit }' )"
        sayMsg "FRT40[895]  aRemote: '${aRemote}', aRemote_name: '${aRemote_name}'" -1
        if [ "${aRemote}" == "" ]; then echo -e "\n* The remote name, '${aRemote_name}', doesn't exist."; exit_wCR; fi
            aRemote_name="$( echo "${aRemote}" | awk '{ print $1 }' )"

#           aRepo="${aRemote/${aRemote_name}/}"; aRepo="${aRepo%%*/}"; aRepo="${aRepo/.git}"
#           aRepo="$(echo "$aRemote" | sed -n 's/.*github\/\([^.]*\).*/\1/p' )"
            aRepo="$( echo "${aRemote}" | awk '{ n = split( $2, m, "/" ); print m[ n-1 ]"/"m[ n ] }' )"     # .(41116.01.11 RAM Was: /[/:]/)
        sayMsg    "FRT40[902]  Update:   aNewBranch: '${aNewBranch}', aCurBranch: '${aCurBranch}', bDoit: '${bDoit}', bDebug: '${bDebug}', bForce: '${bForce}'" -1

#       echo -e "\n  Updating repo, '${aRemote_name}', for branch, '${aBranch}', from remote, '${aRepo}'."; # .(41116.01.12 RAM Moved to below)
#         cd    "$(  dirname $0  )"
#           aBranch="$( git symbolic-ref --short HEAD )"                                                    # .(41116.01.4)
            bFilesInWork="$( git status | awk '/working tree clean/ { b = 1 }; END { print b ? b : 0 }' )"  # .(41123.03.2)
        if [ "${bFilesInWork}" != "1" ]; then                                                               # .(41116.01.5).(41107.01.7 RAM Deal with updating dirty repo Beg)
            aVerb="will"; if [ "${bForce}" == "1" ]; then aVerb="won't"; fi
            aNum="$(git status -u --short | wc -l)"; s="s"; if [ "${aNum}" == "1" ]; then s=""; fi          # .(41129.02.5.(41116.01.21).(41123.03.3)

        sayMsg    "FRT40[1033]  Update:   aNewBranch: '${aNewBranch}', aCurBranch: '${aCurBranch}', bDoit: '${bDoit}', bDebug: '${bDebug}', bForce: '${bForce}'" -1

            echo -e "\n* The branch, '${aCurBranch}', has ${aNum// /} uncommitted file${s}, that ${aVerb} be stashed."    # .(41116.01.22).(41123.05.6).(41123.03.4)
#           git status --short | awk '{ print "  " $0 }'                                                    ##.(41124.06.6)
            shoWorkingFiles                                                                                 # .(41124.06.6 RAM Use it)
            if [ "${bForce}" == "1" ]; then echo ""; fi                                                     # .(41123.05.32 RAM Put back echo "")

            aTS=$(date +%y%m%d.%H); aTS="${aTS:1}"
#           aNum="$(git status --short | wc -l | awk '{ gsub( " ", "" ); print }' )";                       ##.(41116.01.13).(41116.01.21)
#           aStashEm="git stash -u save \".(${aTS} Stash of ${aNum} files\"\n      ";                       ##.(41116.01.14)
#           aStashEm="git stash push -u -m \".(${aTS} Stash of ${aNum} files\"\n      ";                    ##.(41116.01.14).(41123.05.7).(41116.01.23)
            aStashEm="git stash push -u -m \".(${aTS} Stash of ${aNum// /} file${s}\"";                     # .(41116.01.23).(41123.05.7 RAM Was files\n).(41116.01.14)
            if [ "${bForce}" == "1" ]; then aStashEm=""; fi                                                 # .(41116.01.6 RAM Don't stash them if bForce)
          else
            aStashEm=""
            fi # eif bNoFilesInWork                                                                         # .(41107.01.7 End)

#       sayMsg    "FRT40[1050]  aRepoDir: '${aRepoDir}', branch: '${aBranch}'" 1
#       sayMsg    "FRT40[1051]       Pwd: '$( pwd )'" 2
                
        if [ "${bDoit}" == "1" ]; then
#                        git pull
            if [ "${bForce}" != "1" ]; then ${aStashEm} | awk '{ print "  " $0 }'; fi
               if [ "${aNewBranch}" != "${aCurBranch}" ]; then                                              # .(41123.05.8)
                    git reset --hard           | awk '{ print "  " $0 }'                                    # .(41123.05.9 RAM discards working files in the current branch#)
                    git checkout ${aNewBranch} | awk '{ print "  " $0 }'; fi                                # .(41123.05.10 RAM Add awk "  " $0)
                    git fetch ${aRemote_name}  | awk '{ print "  " $0 }'                                    # .(41123.05.11)
                    git reset --hard ${aRemote_name}/${aNewBranch} | awk '{ print "  " $0 }'                # .(41123.05.12 RAM --hard not really necessary)
                   Sudo find . -type f -name "*.sh" -exec chmod 755 {} +
        aVerb="Updated"
        else
        aVerb="About to update"
#       echo -e "\n      git pull"
#       if [ "${bForce}" != "1" ]; then echo -e "\n      ${aStashEm}"; else echo ""; fi                     ##.(41123.05.13).(41123.05.33)
        if [ "${bForce}" != "1" ]; then echo -e "\n      ${aStashEm}"; fi                                   # .(41123.05.33 RAM Remove else echo "")
        if [ "${aNewBranch}" != "${aCurBranch}" ]; then                                                     # .(41123.05.14)
        echo "      git reset hard"                                                                         # .(41123.05.15)
        echo "      git checkout ${aNewBranch}"; fi                                                         # .(41123.05.16)
        echo "      git fetch ${aRemote_name}"
        echo "      git reset --hard ${aRemote_name}/${aNewBranch}  # add -d to doit"
          fi

        echo -e "\n  ${aVerb} repo, '${aRemote_name}', for branch, '${aBranch}', from remote, '${aRepo}'."; # .(41116.01.12)

        exit_wCR  #${aLstSp}; exit
     fi # eoc Update Command                                                                                # .(41116.01.3 End)
#    -- --- ---------------  =  ------------------------------------------------------  #  ---------------- #

#====== =================================================================================================== #  ===========
#       GITR2 SHOW LAST                                                                                     # .(20430.01.3 Beg RAM Added)
#====== =================================================================================================== #

  if [ "${aCmd}" == "shoLast" ]; then
       nCnt=${aArg3}; if [ "${nCnt}" == "" ]; then  nCnt=9; fi # echo "  nCnt: ${nCnt}"                     # .(41109.05.4 RAM Was: nCnt=1)
       if [ "${aArg4}" != "" ]; then nCnt=${aArg4}; nBeg=${aArg3}; else nBeg=0; fi                          # .(41123.07.6 RAM Add nBeg)
     sayMsg  "gitR[951]  aArg3: '${aArg3}', aArg4: '${aArg4}', nBeg: '${nBeg}', nCnt: '${nCnt}', " -1
#    aAWK='/^commit / { c = substr($0,8,8) }; /^Author:/ { a = substr($0,8) }; /^Date:/ { d = substr($0,6,27) }; NR == 5 { print "\n  " c $0 d"  "a }'
#    aAWK='/^commit / { c = substr($0,8,8) }; /^Author:/ { a = substr($0,8) }; /^Date:/ { d = substr($0,6,27) }; NR == 5 { m = sprintf( "\"%-50s", ($0 != "") ? substr($0,5)"\"" : "n/a\"" ); print " " c d"   "m"  "a }'
#    git show $(git rev-parse HEAD) | awk '/^commit / { c = substr($0,8,8) }; /^Author:/ { a = substr($0,8) }; /^Date:/ { print "\n" c substr($0,7,26) a }'
#    git show $(git rev-parse HEAD) | awk '/^commit / { c = substr($0,8,8) }; /^Author:/ { a = substr($0,8) }; /^Date:/ { d = substr($0,7,26) }; NR == 5 { print "\n  " c d a $0 }'
#    git show $(git rev-parse HEAD) | awk '/^commit / { c = substr($0,8,8) }; /^Author:/ { a = substr($0,8) }; /^Date:/ { d = substr($0,6,27) }; NR == 5 { print "\n  " c $0 d"  "a }'
     echo ""; i=${nBeg}; nEnd=$(( nBeg + nCnt ))                                                            # .(41123.07.7)
     while [[ $i -lt $nEnd ]]; do                                                                           # .(41123.07.8)
#      sayMsg  "gitR[959]  i: $i, nEnd: $nEnd; nCnt: '${nCnt}'" 1
       i=$((i+1)); shoCommitMsg $i                                                                          # .(41030.04.1).(41030.05.3 RAM Use showCommitMsg)
#      aCommitHash=$(git rev-parse HEAD~$i 2>/dev/null); # echo "  aCommitHash: '${aCommitHash}'"  # Get commit hash at current position
#      if [ "$?" -ne "0" ]; then echo -e "* $i.  There are no more commits (HEAD~$i)!"; exit_wCR; fi
#      echo "  $i. $( git show $(git rev-parse HEAD~$i) | awk "${aAWK}" )"  # git show $aCommitHash | awk "${aAWK}"
#      i=$((i+1));                                                                                          ##.(41030.04.1 RAM Move above)
       done
     fi
#====== =================================================================================================== #  ===========
#       GITR2 SHOW COMMIT
#====== =================================================================================================== #

  if [ "${aCmd}" == "shoCommit" ]; then                                                                     # .(41030.05.4 RAM Add shoCommit Beg)
#      nCnt=${aArg3}; if [ "${nCnt}" == "" ]; then nCnt=0; fi # echo "  nCnt: ${nCnt}"                      ##.(41123.08.4)
       nBeg=${aArg3}; if [ "${nBeg}" == "" ]; then nBeg=0; fi;                                              # .(41123.08.4)
       if [ "${aArg4}" != "" ]; then nCnt=${aArg4}; else nCnt=1; fi                                         # .(41123.08.5)
     sayMsg  "gitR[1022]  aArg3: '${aArg3}', aArg4: '${aArg4}', nBeg: '${nBeg}', nCnt: '${nCnt}', " -1

     i=${nBeg}; nEnd=$(( nBeg + nCnt ))                                                                     # .(41123.08.6)
     while [[ $i -lt $nEnd ]]; do                                                                           # .(41123.08.7)
#      echo ""; nCnt=$((nCnt+1)); shoCommitMsg ${nCnt}; nCnt=$((nCnt-1))  # echo "  shoCommitMsg ${nCnt}"
#      sayMsg  "gitR[980]  i: $i, nEnd: $nEnd; nCnt: '${nCnt}'" 1
       echo ""; i=$(( i+1 )); shoCommitMsg $i  # echo "  shoCommitMsg ${nCnt}"                              # .(41123.08.8 RAM Was: nCnt)
#      aFilter="AMDR"; aAWK='/^['${aFilter}']/ {                                        printf "      %-2s %s\n", substr($1,1,1), substr( $0, 6) }'; # echo "  aAWK: '${aAWK}'"  ##.(41109.05.5)
#      aFilter="AMDR"; aAWK='/^['${aFilter}']/ { a = substr($2,1); sub( /^ +/, "", a ); printf   "     %1s %s\n", substr($1,1,1),          a     }'; # echo "  aAWK: '${aAWK}'"  # .(41109.05.5 RAM Was: 6)
#      echo"git show --pretty=\"\" --name-status HEAD~${nCnt} | awk  ${aAWK}"
#           git show --pretty=""   --name-status HEAD~$(( i - 1 )) | awk "${aAWK}"                          # .(41124.06.7).(41123.08.9 RAM Was: nCnt)
            shoWorkingFiles commit $(( i - 1 ))                                                             # .(41124.06.6 RAM Use this instead)
       done
     fi                                                                                                     # .(41030.05.4 End)
#====== =================================================================================================== #  ===========
#       GITR2 PULL
#====== =================================================================================================== #

  if [ "${aCmd}" == "pullRemote" ]; then                                                                    # .(41103.06.11 RAM write it Beg)
     sayMsg  "gitR1[471]  Git pull" -1

        echo ""
        getBranch # aBranch=$( git branch | awk '/\*/ { print substr($0,3)}' )                              # .(41104.04.5)
        getRemoteName;                                                                                      # .(41104.01.4)

     if [ "${bForce}" != "1" ]; then                                                                        # .(41105.02.6)
#       git branch --set-upstream-to="${aRemoteName}/${aBranch}" "${aBranch}"
#       git pull "${aRemoteName}" "${aBranch}" --allow-unrelated-histories 2>&1 | awk '{ print "  " $0 }'   # .(41104.04.6 RAM Add 2>&1)
        aGIT1="git pull ${aRemoteName} ${aBranch} --allow-unrelated-histories"
        echo -e "\n  ${aGIT1}"
        eval        "${aGIT1}" 2>&1 | awk '{ print "  " $0 }'
     if [ -f .git/MERGE_HEAD ]; then   # in conflict                                                        # .(41104.02.1 RAM Check for conflicts Beg)
        aTS=$(date +%y%m%d); aTS="${aTS:3}"
        git checkout --theirs .   # for all comflicts
        git add .
        git commit -m ".(${aTS}.01_Accept all incoming changes"
        fi                                                                                                  # .(41104.02.1 End)
      else                                                                                                  # .(41105.02.7 Beg)
        aGIT2="git pull ${aRemoteName} ${aBranch} --force --allow-unrelated-histories"                      # .(41105.02.8)
        echo -e "\n  ${aGIT2}"
        eval        "${aGIT2}" 2>&1 | awk '{ print "  " $0 }'
#       eval        "${aGIT2}"
        fi                                                                                                  # .(41105.02.7 End)                                                                                             # .(41105.02.3)
        Sudo find . -type f -name "*.sh" -exec chmod 777 {} +                                               # .(41105.03.2)
     fi                                                                                                     # .(41103.06.11 End)
#====== =================================================================================================== #  ===========
#       GITR2 PUSH
#====== =================================================================================================== #

  if [ "${aCmd}" == "pushRemote" ]; then                                                                    # .(41129.06.4 RAM write pushRemote Beg)
     sayMsg  "gitR1[1153]  Git push" -1

        getBranch # aBranch=$( git branch | awk '/\*/ { print substr($0,3)}' )                              # .(41104.04.7)
        getRemoteName

        aGIT1="git push --set-upstream ${aRemoteName} ${aBranch}"                                           # .(41129.06.5 RAM Revise command if not the first time)
  if [ "${bDoit}" != "1" ]; then
#    echo -e "\n  ${aGIT1}\n  ${aGIT2}"
     echo -e "\n  ${aGIT1} # Add -d to doit"
    else
     echo -e "\n  ${aGIT1} \n"
#    eval        "${aGIT1}" 2>&1 | awk '{ print "  " $0 }'
     eval        "${aGIT1}"
     fi
     exit_wCR
     fi                                                                                                     # .(41129.06.4 End)
#====== =================================================================================================== #  ===========
#       GITR2 LIST BRANCHES
#====== =================================================================================================== #

  if [ "${aCmd}" == "listBranches" ]; then                                                                  # .(41114.04.5 RAM write listBranches)
     sayMsg  "gitR1[857]  listBranches" -1
        echo ""
        git branch -vva | awk '{ print "  " $0 }'
        exit_wCR                                                                                            # .(41116.01.16)
     fi                                                                                                     # .(41114.04.5 End)
#====== =================================================================================================== #  ===========
#       GITR2 CHECKOUT BRANCHES
#====== =================================================================================================== #

  if [ "${aCmd}" == "checkoutBranch" ]; then                                                                # .(41114.04.6 RAM write checkoutBranch)
     sayMsg  "gitR1[866]  checkoutBranch '${aArg2}'" -1

        getBranch
     if [ "$aArg2" == "" ]; then
#       echo -e "\n  The current branch is ${aBranch}."                                                     ##.(41114.05.2
        echo ""                                                                                             # .(41114.05.1
        git branch -vva | awk '{ print "  " $0 }'                                                           # .(41114.05.2 RAM Display branches if none given)
      else
            bFilesInWork="$( git status | awk '/working tree clean/ { b = 1 }; END { print b ? b : 0 }' )"  # .(41123.03.5)
        if [ "${bFilesInWork}" != "1" ]; then
            nCnt="$(git status -u --short | wc -l)"; s="s"; if [ "${nCnt}" == "1" ]; then s=""; fi          # .(41129.02.6).(41123.03.6)
            echo -e "\n* The current branch, '${aBranch}', has ${nCnt} uncommitted file${s}."               # .(41123.03.7)

#           git status --short | awk '{ print "  " $0 }'                                                    ##.(41124.06.8)
            shoWorkingFiles                                                                                 # .(41124.06.8 RAM Use it)

            ${aLstSp}; exit
            fi # eif bNoFilesInWork
        git checkout | awk '{ print "  $0" }'
        fi
        exit_wCR                                                                                            # .(41116.01.17)
     fi                                                                                                     # .(41114.04.6 End)
#====== =================================================================================================== #  ===========
#       GITR2 MAKE REMMOTE
#====== =================================================================================================== #
#    sayMsg  "gitR2[425] aCmd: '${aCmd}'" 1

  if [ "${aCmd}" == "makRemote" ]; then
  if ! command -v gh >/dev/null 2>&1; then echo "  You need to install, gh.  Please run: gitr install gh"; exit_wCR; fi

#    if [ "${aArg3}" == "" ]; then aStage="${aArg3}"; fi                                                    # .(41129.04.2 RAM Fix make rem args Beg)
     if [ "${aArg3}"  != "" ]; then aProj="${aArg3}"; fi;
     if [ "${aArg3/_/}" != "${aArg3}" ]; then aArg5=${aArg4}; aArg4=""; aStage=""; fi
     if [ "${aArg4}"  != "" ]; then aStage="${aArg4}"; fi
     if [ "${aArg5}"  != "" ]; then aAcct="${aArg5}"; fi

#    sayMsg  sp "gitR2[1208] aProj: '${aProj}', aStage: ${aStage}'" 1
     if [ "${aProj}"  == "" ]; then aProj="${aProject}"; fi                                                 # .(41129.04.3 RAM Use default)
     if [ "${aStage}" != "" ]; then aRepo="${aProj/_\//}_${aStage}"; else aRepo="${aProj}"; fi              # .(41129.04.2 End)

     aLoggedIn=$( gh auth status | awk "/${aAcct}/" )
#    sayMsg  "gitR2[1212] aRepo: '${aRepo}', aAcct: ${aAcct}', aLoggedIn: '${aLoggedIn}'" 2

  if [ "${aLoggedIn}" == "" ]; then
     aGIT1="gh auth login"
     echo -e "\n  ${aGIT1}\n"; # exit
     eval        "${aGIT1}"
     fi
#    aGIT2="gh repo create ${aProj/_\//}_${aStage} --public"                                                ##.(41129.04.4)
     aGIT2="gh repo create ${aRepo} --public"                                                               # .(41129.04.4)
     echo -e "\n  ${aGIT2} # Add -d to doit"; # exit                                    # .(41029.04.1 RAM Add doit msg)
#    echo -e   "  gitr add remote origin \"\" ${aProj}"                                                     ##.(41129.04.5 RAM aArg4=aAcct)
     echo -e   "  gitr add remote origin"                                                                   # .(41129.04.5)

 if [ "${bDoit}" == "1" ]; then
     eval        "${aGIT2}"
#    aCmd="addRemote"; aArg3="origin" aArg4="${aAcct}"; aArg5="${aProj}"                                    ##.(41129.04.6 RAM aArg4=aAcct)
     aCmd="addRemote"; aArg3="origin" aArg4=""; aArg5=""                                                    # .(41129.04.6)
     fi
#    exit_wCR

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
#    sayMsg  "gitR2[363] aCmd: '${aCmd}'" 1

  if [ "${aCmd}" == "trackBranch" ]; then
#    aName="origin"; aBranch="${aArg3}"; if [ "${aBranch}" == "" ]; then aBranch="$( git branch | awk '/\*/ { print substr($0,3) }' )"; fi  ##.(41104.04.8)
     aName="origin"; aBranch="${aArg3}"; if [ "${aBranch}" == "" ]; then getBranch; fi  # .(41104.04.9)

     aGIT1="git push origin \"HEAD:refs/heads/${aBranch}\""
     aGIT2="git fetch origin"
     aGIT3="git branch --set-upstream-to  \"${aName}/${aBranch}\"  \"${aBranch}\""
     echo -e "\n  ${aGIT1}\n  ${aGIT2}\n  ${aGIT3}"; # exit
  if [ "${bDoit}" == "1" ]; then
     eval        "${aGIT1}"
     eval        "${aGIT2}"
     eval        "${aGIT3}"
     fi
     exit_wCR
     fi
# ---------------------------------------------------------------------------

  if [ "${aCmd}" == "replaceLocal" ]; then                                              # .(41031.07.3 Write replace local command Beg)

       getBranch # aBranch="$( git branch | awk '/\*/ { print substr($0,3)}' )          # .(41104.04.10)

                                  aRemote_name="origin"; if [ "${aBranch}" == "" ]; then aBranch="master"; fi
    if [ "${aArg3}" != "" ]; then aRemote_name="$( echo "${aArg3}" | awk '{ print tolower($0) }' )"; fi
    if [ "${bDoit}" != "1" ]; then
       echo ""
       git fetch "${aRemote_name}" | awk '{ print "  " $0 }; END{ if (NR > 0) { print "" }; print "Fetch complete " NR }'
       echo      "  The ${aRemote_name} repo has been fetched. To replace it add -d to run this git command:"
       echo      "     git reset --hard ${aRemote_name}/${aBranch}"
       fi
     if [ "${bDoit}" == "1" ]; then
       git reset --hard "${aRemote_name}/${aBranch}" | awk '{ print "  " $0 }'          # .(41103.04.3)
       fi
     fi                                                                                 # .(41031.07.3 End)
# ---------------------------------------------------------------------------

  if [ "${aCmd}" == "mergeRemote" ]; then
#    aName="origin";    aBranch="master"
#    aSSH="github-ram"; aAcct='robinmattern';  aStage="${aArg3}";
     if [ "${aArg3}" != "" ]; then aRemote_name="$( echo "${aArg3}" | awk '{ print tolower($0) }' )"; fi
     if [ "${aArg4}" != "" ]; then aRemoteBranch="${aArg4}"; fi
     if [ "${aArg5}" != "" ]; then aLocalBranch="${aArg5}"; fi

#    echo "  aRemote_name: '${aRemote_name:0:7}'"
     if [ "${aRemote_name}"  == "" ]; then echo -e "\n* You must provide a remote repo name";       exit_wCR; fi

     if [ "${aRemote_name}" == "anythingllm_master" ]; then aRemote_name="anything-llm"; fi
     if [ "${aRemote_name}" == "anythingllm"        ]; then aRemote_name="anything-llm"; fi
#    if [ "${aRemote_name}" == "anything-llm"       ]; then aRemoteName="AnythingLLM_master"; fi  ##.(41123.06.x RAM Same as anythingllm)

     if [ "${aRemote_name}"     == "anyllm-altools" ]; then aRemote_name="anyllm_"; fi
     if [ "${aRemote_name}"     == "altools"        ]; then aRemote_name="anyllm_"; fi
     if [ "${aRemote_name:0:7}" == "anyllm_"        ]; then aRemoteName="AnyLLM_${aStage/-*/}";
        if [ "${aRemoteBranch}" == ""               ]; then aRemoteBranch="b241013.01_ALT"; fi
        if [ "${aLocalBranch}"  == ""               ]; then aLocalBranch="ALTools"; fi; fi
             aAWK="/${aRemoteName}/ { if (\$1 == \"${aRemoteName}\" && \$3 == \"(push)\") { print 1 } }"
#            echo "git remote -v | awk '${aAWK}'"
             bValid="$( git remote -v | awk "${aAWK}" )"
     if [ "${bValid}"       != "1" ]; then echo -e "\n* You must provide a valid remote repo name"; exit_wCR; fi

     if [ "${aRemoteBranch}" == "" ]; then echo -e "\n* You must provide a remote branch name";     exit_wCR; fi
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
     exit_wCR
     fi
# ---------------------------------------------------------------------------
#====== =================================================================================================== #  ===========
#       GITR2 ADD REMMOTE
#====== =================================================================================================== #
#    sayMsg  "gitR2[1326] aCmd: '${aCmd}'" 1

  if [ "${aCmd}" == "addRemote" ] || [ "${aCmd}" == "setRemote" ]; then                 # .(41029.05.1 RAM Add seetRemote)
#    aName="origin";    aBranch="master"
#    aSSH="github-ram"; aAcct='robinmattern';  aStage="${aArg3}";
     sayMsg  "gitR2[1337]  aArg3: '${aArg3}', aArg4: '${aArg4}', aArg5: '${aArg5}', aArg6: '${aArg6}', aStage: '${aStage}'"  -1

     if [ "${aArg3}" != "" ]; then aRemote_name="$( echo "${aArg3}" | awk '{ print tolower($0) }' )"; fi
     if [ "${aArg4}" != "" ]; then aAcct="${aArg4}"; fi
     if [ "${aArg5}" != "" ]; then aProject="${aArg5}"; fi
     if [ "${aArg6}" != "" ]; then aStage_="${aArg6}"; fi
#    if [ "${aRemoteName}" == "origin" ]; then aStage_="${aArg6}"; fi

             aRemoteURL=""                                                              # .(41103.04.4 RAM Move it to here)

     if [ "${aRemote_name}" == "" ]; then echo -e "\n* You must provide a remote repo name, i.e. origin or reponame"; exit_wCR; fi
     if [ "${aRemote_name}" == 'help' ]; then
             echo -e "\n  The arguments are Account, Project, Stage, or you can use"
             echo      "    anything-llm   for   Mintplex-Labs"
             echo      "    anyllm         for   AnyLLM_${aStage}"
             echo      "    altools        for   ALTools_${aStage}"
             echo      "    frtools        for   FRTools_${aStage}"
#            echo      "    jptools        for   JPTools_${aStage}"
             echo      "    jptools        for   AIDocs_${aStage}  {aAcct}, or"
             echo      "    [origin]   for any  {Project_Stage}"
             exit_wCR
             fi
     sayMsg  "gitR2[1359]  aRemote_name: '${aRemote_name}', aArg3: '${aArg3}', aArg4: '${aArg4}', aStage: '${aStage}'"  -1

     if [ "${aRemote_name}" == "origin" ] && [ "${aArg4}" != "" ]; then                 # .(41102.03.2 RAM Create origin project name Beg)
             aRemote_name="${aArg4}"; aArg4="${aArg5}"; # echo "    {aArg4}: '${aArg4}'"
             aRemoteName="origin"
             fi                                                                         # .(41102.03.2 End)
     sayMsg  "gitR2[1365]  aRemote_name: '${aRemote_name}', aStage: '${aStage}', aStage_: ${aStage_}'"  -1

     if [ "${aRemote_name}" == "origin" ] && [ "${aArg4}" == "" ]; then                 # .(41102.03.1 RAM Ask for Remote Name Beg)
             echo -e "\n    You must provide a Remote Name, e.g frtools, aidocs, anyllm, anyllm_dev03-robin";
             echo    "      or anything-llm, anything, anythingllm, anythingllm_master"                     # .(41129.05.2)
#            echo -e   "    or is it this: ${aProject}_${aStage}.\n"                                        # .(41129.05.3)
#            ask4Default "  or anything-llm, anything, anythingllm, anythingllm_master." "  What is it."  "${aProject}_${aStage}";  ##.(41129.05.4).(41114.06.6 RAM Was; ask4Required)
             ask4Default "  or is it the current folder: ${aProject}_${aStage}."  "Enter a name above or" "${aProject}_${aStage}";  # .(41129.05.4).(41114.06.6 RAM Was; ask4Required)
             aArg3="${aAnswer}" # aRemote_name="${aAnswer}"
             aRemote_name="${aAnswer}"; aArg3="${aAnswer}"
             aRemoteName="origin"
             fi                                                                         # .(41102.03.1 End)
     sayMsg  "gitR2[1374]  aRemote_name: '${aRemote_name}', aStage: '${aStage}', aStage_: ${aStage_}'"  -1

     if [ "${aRemote_name}" != "origin" ]; then                                         # .(41102.05.1 RAM Wierd fix, based on position)
             aRemote_name="${aArg3}";                                                   # .(41102.05.2)
             fi                                                                         # .(41102.05.3)
#            aRemoteURL=""                                                              ##.(41103.04.4)

     sayMsg  "gitR2[1381]  aRemote_name: '${aRemote_name}', aStage: '${aStage}', aStage_: ${aStage_}'"  -1
#    --------------------------------------------------------------------------------

     if [ "${aRemote_name/_/}" != "${aRemote_name}"    ]; then   # for any  {Project_Stage}"                # .(41102.03.5 RAM Write this Beg)

#            aProject="$( echo "${aRemote_name}" |  awk '{ sub( /_.+/, "" ); print }' )";   echo "    {aProject}:   '${aProject}'"
#            if [ "${aArg3}" == "origin"  ]; then aRemote_name="${aArg4}"; else aRemote_name="${aArg3}"; fi
             aProject="$( echo "${aRemote_name}" |  awk '{ sub( /_.+/, "" ); print }' )"; # echo "    \${aProject}:   '${aProject}'"
             aStage="$(   echo "${aRemote_name}" |  awk '{ sub( /.+_/, "" ); print }' )"; # echo "    \${aStage/dev}: '${aStage/dev/}'"
          if [ "${aRemoteName}" != "origin"   ]; then aRemoteName="${aProject}_${aStage/-*/}"; fi
          if [ "${aArg4}" != ""               ]; then aAcct="${aArg4}"; else aAcct="robinmattern"; fi; # echo "    {aArg4}: '${aArg4}'"
#            if [ "${aRemoteName}" == "origin" ] && [ "${aStage/dev}" != "${aStage}" ]; then
          if [ "${aStage/dev}" != "${aStage}" ]; then
             aSSH="git@github-ram"; aAcct2=":${aAcct}"; else aSSH="https://github.com"; aAcct2="/${aAcct}";  #  echo "    {aAcct2}: '${aAcct2}'"
             fi
          if [ "${aArg4}" == "" ]; then
             if [ "${aStage/rick/}"  != "${aStage}" ];  then aAcct2="/blueNSX";  aSSH="${aSSH/.ram/.rsh}";  fi
             if [ "${aStage/bruce/}" != "${aStage}" ];  then aAcct2="/8020data"; aSSH="${aSSH/.ram/.btg}";  fi;
             fi;
             aRemoteURL="${aSSH}${aAcct2}/${aProject}_${aStage}.git";  #  echo "    aRemoteURL: '${aRemoteURL}'"

        fi # eif "${aRemote_name/_/}" != "${aRemote_name}"                                                  # .(41102.03.5 End)
#    --------------------------------------------------------------------------------

#    if [ "${aRemote_name}"     == "anythingllm_master" ]; then aRemote_name="anything-llm"; fi
#    if [ "${aRemote_name}"     == "anythingllm"        ]; then aRemote_name="anything-llm"; fi
     if [ "${aRemote_name:0:8}" == "anything"           ]; then
             aSSH="https://github.com"
             aAcct="Mintplex-Labs"
             if [ "${aRemoteName}" != "origin" ]; then aRemoteName="${aRemote_name}"; fi
             aProject="anything-llm"
             aStage_=""; aStage=""
             aBranch="master"
             aRemoteURL="${aSSH}/${aAcct}/${aProject}${aStage_}.git"
        fi  # eif "${aRemote_name:0:8}" == "anything"
#       fi
#    --------------------------------------------------------------------------------
#    sayMsg  "gitR2[518]  aRemoteURL:   '${aRemoteURL}'"  -1

#    if [ "${aRemote_name}" == "anyllm"             ]; then aRemote_name="altools"; fi                      ##.(41102.03.6 RAM Replace anyllm  with setRemote1 Beg)
#    if [ "${aRemote_name:0:6}" == "anyllm"         ]; then
#    if [ "${aRemote_name}" == "anyllm_dev03-robin" ]; then
#            aSSH="git@github-ram"; else aSSH="https://github.com"; fi
#            aAcct="robinmattern"
#            aProject="AnyLLM"
#            aStage="dev03-robin"; aStage_="_${aStage}"
#            if [ "${aRemoteName}" != "origin" ]; then aRemoteName="${aProject}_${aStage/-*/}"; fi
#            aBranch="b241013.01_ALT"
#            aRemoteURL="${aSSH}${aAcct}/${aProject}${aStage_}.git"
#       fi                                                                                                  ##.(41102.03.6 End)
#    --------------------------------------------------------------------------------
#    sayMsg  "gitR2[528]  aRemoteURL:   '${aRemoteURL}'"  1

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
#            aSSH="git@github-ram"; else aSSH="https://github.com"; fi
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
#            aSSH="git@github-ram"
#            aAcct="robinmattern"
#            aBranch="master"
#            aRemoteName="origin"  # "FRTools_${aStage/-*/}"
#            aStage_="prod1-master"  # "_${aStage}"
#            aRemoteURL="${aSSH}:${aAcct}/${aProject}_${aStage_}.git"                   # .(41029.07.2 RAM Use : not /)
#       fi                                                                                                  ##.(41029.06.1 End).(41102.03.6 End)

   function  setRemote1() {                                                                                 # .(41102.03.6 RAM Write setRemote1 Beg)
#    if "${aArg3}" == "origin", then Dev stages to: git@github.[ram|rsh|btg], else all stages go to https://github.com
             aPROJ=$1; aProj="$( echo "$1" | awk '{ print tolower($0) }' )"; w=${#aProj}; w1=$((w+1)); w2=$((w+4));  # echo "  ${aRemote_name}  w w1 w3: ${w} ${w1} ${w2}"
     if [ "${aRemote_name:0:${w}}"  == "${aProj}"       ]; then                            # .(41029.06.1 RAM Add alias: frtools Beg)
     if [ "${aRemote_name}"         == "${aProj}_dev01" ]; then aRemote_name="${aProj}_dev01-robin"; fi
     if [ "${aRemote_name:0:${w2}}" == "${aProj}_dev"   ]; then
             aSSH="git@github-ram"; else aSSH="https://github.com"; fi
             aProject="${aPROJ}"
             aBranch="master"; aStage2="${aStage}"
             sayMsg  "gitR2[578]  aStage: '${aStage}', aStage_: ${aStage_}'" -1
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
             aSSH="git@github-ram"; else aSSH="https://github.com"; fi
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
     sayMsg  "gitR2[1149]  aRemoteURL:   '${aRemoteURL}'"  -1      # Provided via aliases: frtools, altools* or anyllm*

#    --------------------------------------------------------------------------------

     if [ "${aRemoteURL}" == "" ]; then                          # Provided via arguments or folder name
#    echo "  say what: aArg3: '${aArg3}', aArg4: '${aArg4}', 'aArg5: '${aArg5}'"
#    echo "  say what: aProject: '${aProject}', aStage: '${aStage}'"

#    if [ "${aArg3}" == ""  ]; then aArg3="origin"; fi                                  # .(41029.06.2 RAM Add origin)
     if [ "${aArg4}" == ":" ]; then aArg4=":robinmattern"; fi                           # .(41029.06.3 RAM Was: aAcct=)

     if [ "${aArg4}" == "" ] && [ "${aArg5}" == "" ]; then                              # .(41029.06.4 RAM If no args Beg)
             aRemoteName="${aArg3}"
             aAcct2="/${aAcct}"; if [ "${aSSH:0:3}" == "git" ]; then aAcct2=":${aAcct}"; fi                 # .(41029.07.3)
             aRemoteURL="${aSSH}${aAcct2}/${aProject}_${aStage}.git"                                        # .(41029.07.4)
#       fi                                                                              # .(41103.04.5 RAM Found missing fi)
        fi # eif ("${aArg4}" == "" and "${aArg5}" == "")                                                    # .(41029.06.4 End)
#       ---------------------------------------------------

     if [ "${aArg4}" != "" ] && [ "${aArg5}" == "" ]; then
             aAcct="${aArg4/\/*/}"
             aRemoteName="${aArg3}"
        if [ "${aArg4/\//}" != "${aArg4}" ]; then aProject="${aArg4/*\//}"; fi          # .(41103.04.6 RAM Found missing fi)

        fi # eif ("${aArg4}" != "" ] && [ "${aArg5}" == "")
#       ---------------------------------------------------

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

        fi # eif ("${aAcct}" != "" and "${aProject}" != "")
#       ---------------------------------------------------
             aRemoteName="${aArg3}"

     sayMsg  "gitR2[1192]  aRemoteName: ${aRemoteName}, aRemoteURL: ${aRemoteURL}" -1
     fi # eif no ${aRemoteURL}
#    fi # eif                                                                           # .(41103.04.7 RAM Removed)
#    -------------------------------------------------------------

#    sayMsg  "gitR2[1197]  aProject: '${aProject}';  aStage: '${aStage}',  aBranch: '${aBranch}',  aRemoteName: ${aRemoteName/origin/origin      }, aRemoteURL: ${aRemoteURL}"  -1
     sayMsg  "gitR2[1198]  '${aBranch}'  ${aRemoteName/origin/origin      }  '${aProject}_${aStage}'  '${aRemoteURL}'"  -1
#    sayMsg  "gitR2[1199]  aRemoteURL:  '${aRemoteURL}'"  -1; exit # Say it

     if [ "${aRemoteName}"   == "" ]; then
        echo -e "\n* You must provide a remote repo name, i.e. origin or reponame:";
        echo "  e.g. anything-llm, anythingllm_master anyllm_dev03-robin, anyllm-altools, altools";
        exit_wCR;
        fi
     aAcct="$( echo "${aAcct}" | awk '{ sub( /[:\/]/, "" ); print }' )"
# if [ "${aStage}" == "" ]; then
#    echo "* You must provide a Stage name."
#    exit_wCR
#    fi
#    -------------------------------------------------------------

     if [ "${aCmd}" == "setRemote" ]; then                                              # .(41029.05.2 RAM Beg)
        echo "  Setting Remote, ${aProject}, for Account, ${aAcct} and stage, ${aStage}"
        aGIT1="git remote set-url  ${aRemoteName}  ${aRemoteURL}"
   #    aGIT2="git branch --set-upstream-to  ${aProject}/${aBranch}  ${aBranch}"
     fi                                                                                 # .(41029.05.2 End)
# ---------------------------------------------------------------------------
#    sayMsg  "gitR2[749] aCmd: '${aCmd}'" 1

     if [ "${aCmd}" == "addRemote" ]; then                                              # .(41029.05.3)
        echo -e "\n  Adding a Remote, '${aProject}', for Account, '${aAcct}', and stage, '${aStage}'"       # .(41129.05.5)
#       aGIT1="git remote add  ${aProject} git@${aSSH}:${aAcct}/${aProject}_${aStage}.git"
#    if [ "${aSSH:0:3}" == "git" ]; then aAcct=":${aAcct}"; else aAcct="/${aAcct}"; fi
#       aGIT1="git remote add  ${aRemoteName}  ${aSSH}${aAcct}/${aProject}${aStage_}.git"
        aGIT1="git remote add  ${aRemoteName}  ${aRemoteURL}"
     fi                                                                                 # .(41029.05.4)
  if [ "${bDoit}" != "1" ]; then                                                        # .(41103.07.1)
#    echo -e "\n  ${aGIT1}\n  ${aGIT2}"
     echo -e "\n  ${aGIT1} # Add -d to doit"                                            # .(41029.04.3)
    else                                                                                # .(41103.07.2)
     echo -e "\n  ${aGIT1}"                                                             # .(41103.07.3 RAM Don't add -d suggestion)
     eval        "${aGIT1}" 2>&1 | awk '{ print "  " $0 }'                              # .(41103.07.4 RAM Indent response)
#    eval        "${aGIT2}"
     aCmd="shoRemote"
     fi

     fi  # ???  // eof Add or Set Remote                                                # .(41103.04.8 RAM Finally put it back )
# ---------------------------------------------------------------------------
#====== =================================================================================================== #  ===========
#       GITR2 DELETE REMMOTE
#====== =================================================================================================== #
#    sayMsg  "gitR2[711] aCmd: '${aCmd}'" 1

  if [ "${aCmd}" == "delRemote" ]; then
     aName="${aArg3}"; if [ "${aName}" == "" ]; then aName="origin"; fi
     aGIT1="git remote remove ${aName}"
  if [ "${bDoit}" != "1" ]; then                                                        # .(41103.07.5)
     echo -e "\n  ${aGIT1} # Add -d to doit"                                            # .(41029.04.4)
    else                                                                                # .(41103.07.6)
     echo -e "\n  ${aGIT1}"                                                             # .(41103.07.7 RAM Don't add -d suggestion)
     eval        "${aGIT1}" 2>&1 | awk '{ print "  " $0 }'                              # .(41103.07.8 RAM Indent response)
     aCmd="shoRemote"
     fi
     fi
# ---------------------------------------------------------------------------

  if [ "${aCmd}" == "shoRemote" ]; then
#    echo ""
     aList="$( git remote -v )"
     if [ "${aList}" != "" ]; then echo ""; echo "${aList}" | awk 'NR != 0 { print "  " $0 }'; fi
     exit_wCR
     fi
# ---------------------------------------------------------------------------

  if [ "${aCmd}" == "getCLI" ]; then
     echo ""
# if [ "${aOS}" == "windows" ]; then
#    curl -LO https://github.com/cli/cli/releases/latest/download/gh_*_windows_amd64.msi   # no workie
#    msiexec.exe /i gh_*_windows_amd64.msi
#    rm gh_*_windows_amd64.msi
     npm install -g gh
#    fi
     fi
# ---------------------------------------------------------------------------
#
# if [ "${aCmd}" == "version" ]; then                                                                       # .(20420.07.03 RAM No need Beg)
#    echo ""
#    echo "  ${aVTitle}: (${aVer}) (${aVDt})"
#    exit_wCR
#    fi                                                                                                     # .(20420.07.03 End)
# ---------------------------------------------------------------------------

  if [ "${aCmd}" == "backupLocal" ]; then
#    aStage="${aArg3}"; if [ "${aStage}" == "" ]; then aStage="dev03-robin"; fi
                        if [ "${aArg3}"  != "" ]; then aStage="${aArg3}"; fi

     aPath="${aRepos}/${aProj}._/ZIPs/${aProj/_\//}_${aStage}"
     aTS=$( date '+%y%m%d.%H%M' ); aTS=${aTS:1}
     cd "${aRepoDir}"
     getBranch # aBranch=$( git branch | awk '/\*/ { print substr($0,3)}' )             # .(41104.04.11)

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

     exit_wCR
