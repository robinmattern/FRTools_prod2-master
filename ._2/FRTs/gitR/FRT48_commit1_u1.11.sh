#!/bin/bash
#*\
##=========+====================+================================================+
##RD         Commit            | GitR Tools
##RFILE    +====================+=======+===============+======+=================+
##FD   FRT48_Commit.sh          |       |  9/08/25  8:15|      | p1.02`50908.0815

##DESC     .--------------------+-------+---------------+------+-----------------+
#            Easy commit 
#
##LIC      .--------------------+----------------------------------------------+
#            Copyright (c) 2022-2025 JScriptware * Released under
#            MIT License: http://www.opensource.org/licenses/mit-license.php
##FNCS     .--------------------+----------------------------------------------+
#            commit             | 
##CHGS     .--------------------+----------------------------------------------+
#.(50908.01   9/08/25 RAM  8:15a| Add commit
#.(50909.01   9/09/25 RAM  7:40a| Add Help
#.(50912.01   9/12/25 RAM  6:50p| Add -num 2nd arg
#.(50917.01   9/17/25 RAM  7:40a| Also check for .git
#.(50918.01   9/18/25 RAM 11:00a| Must include email
#.(50920.01   9/20/25 RAM  9:06a| Add commit list

##PRGM     +====================+===============================================+
##ID 69.600. Main0              |
##SRCE     +====================+===============================================+
#*/
#========================================================================================================== #  ===============================  #


  if [ "$1" == "help" ] || [  "${1:0:2}" == "-h" ] || [  "$1" == "" ]; then                                           # .(50909.01.1 RAM Add help Beg)
     echo -e "\n  Usage: commit \"Commit Message\" [author]";
     echo -e "";
     echo -e "       runs: git commit [-add .] -m \".({commit.no}_Commit Message\" [--author \"user.name\"]";
     echo -e "             commits all changed files, or just staged files, if any"
     echo -e "    Options:"
     echo -e "     author:'me' (git user.name) is optional. Default is 'Amazon Q'";
     echo -e "        set: sets next {CommitNo} or {YMMDD}.{CommitNo}"
     echo -e "       show: show commit.no saved in ./docs/commit.no"
     echo -e "       list: list current commits, or -local, -remote, -both, -wworking, -staged {nCnt}"
     echo -e "         -k: keep commit.no. -k must be before message"
     echo -e "         -n: use  commit.no. -n YMMDD.NN must be before message"
     if [ "${OS:0:3}" != "Win" ]; then echo ""; fi
     exit
     fi                                                                                                               # .(50909.01.1 End)
        
  if [ ! -d ".git" ] || [ ! -d "docs" ]; then                                                                         # .(50917.01.1 RAM Also check for .git).(50917.01.1 RAM Add check Beg)
     echo -e "\n* You must be in the repo's root dir to use commit."
     if [ "${OS:0:3}" != "Win" ]; then echo ""; fi  
     exit; fi                                                                                                         # .(50917.01.1 End)

#    aCommitFile="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/commit.no"
     aCommitFile="$( pwd )/docs/commit.no"; # echo "  aCommitFile: ${aCommitFile}"

  if [ "$1" == "show" ]; then
     echo -e "\n  Last commit.no: '.($( cat "${aCommitFile}" )'";
     if [ "${OS:0:3}" != "Win" ]; then echo ""; fi
     exit
     fi
  if [ "$1" == "list" ]; then                                                                                         # .(50920.01.1 RAM Add commit list Beg)
     if [ "$2" == ""           ]; then gitr list commit; fi 
     if [ "${2:0:2}" == "-l"   ]; then gitr list commit $3; fi 
     if [ "${2:0:2}" == "-r"   ]; then gitr list commit $3 remote; fi 
     if [ "${2:0:2}" == "-b"   ]; then gitr list commit $3 both; fi 
     if [ "${2:0:2}" == "-w"   ]; then gitr list workin $3; fi 
     if [ "${2:0:2}" == "-s"   ]; then gitr list staged $3; fi 
     if [ "${OS:0:3}" != "Win" ]; then echo ""; fi
     exit
     fi                                                                                                               # .(50920.01.1 End)

     aTS=$( date '+%y%m%d' ); aTS="${aTS:1}"

  if [ ! -f "${aCommitFile}" ]; then echo "${aTS}.00" >"${aCommitFile}" ; fi
     aCommitNo=$( cat "${aCommitFile}" )

     nKeepNo=0; if [ "${2:0:2}" == "-n" ]; then nKeepNo=$3; set -- "$1" "${@:4}"; fi                                  # .(50912.01.1 RAM Add -num 2nd arg)
                if [ "${1:0:2}" == "-n" ]; then nKeepNo=$2; shift; shift; fi                                          # .(50912.01.2 RAM Add -num as 1st arg)
 #        echo -e "\n1.  \$1: '$1', \$2: '$2', nKeepNo: '$nKeepNo'"; # exit 

  if [ "${nKeepNo}" != "0" ];  then aCommitNo=${nKeepNo};                                                             # .(50912.01.3)
#    echo -e "\n  Use  commit.no: '.(${aCommitNo}' -- ${nKeepNo}";
   else

     bKeeper=0; if [ "${2:0:2}" == "-k" ]; then bKeeper=1; set -- "$1" "${@:3}"; fi                                   # .(50908.01c.1 RAM Add -keep as 2nd arg)
                if [ "${1:0:2}" == "-k" ]; then bKeeper=1; shift; fi                                                  # .(50908.01.2  RAM Add -keep as 1st arg)
  if [ "${bKeeper}" == "1" ] && [ "${aCommitNo}" != "" ]; then
     aTS="${aCommitNo:0:5}"; nCommitNo=${aCommitNo:6:2}; aCommitNo="${aTS}.$(( nCommitNo - 1 ))"                      # .(50908.01.3 RAM Keep day and n)
     fi; # echo "${aTS}             # .(50908.01.3 RAM Add bKeeper)

     aDay="${aCommitNo:0:5}";    if [ "${aDay}" != "${aTS}" ] && [ "${bKeeper}" != "1" ]; then aCommitNo="${aTS}.00"; fi # .(50908.01.4)
#    echo -e "2.  \$1: '$1', \$2: '$2', nKeepNo: '$nKeepNo'"; # exit 

  if [ "$1" == "set" ]; then
     n=$2; if [ "${n:5:1}" == "." ]; then aTS=${n:0:5}; n=${n:6:2}; fi
     if [ "${bKeeper}" == "1" ]; then n=$(( n + 1 )); fi                                                              # .(50909.01b.1 RAM Add set -k )
     n=$(( "0${n}" - 2 )); if [ "${n}" == "-2" ]; then n=-1; fi;
     aCommitNo="${aTS}.$( printf "%02d" ${n} )";
     fi
     nCommitNo=${aCommitNo:6:2}; if [ "${nCommitNo:0:1}" == "0" ]; then nCommitNo=${nCommitNo:1}; fi
     nCommitNo=$(printf "%02d" $(( nCommitNo + 1 )))
#    nCommitNo=$(printf "%02d" $(( 10#$CommitNo + 1 )))
#    nCommitNo=${aTS}.$(printf "%02d" $(( ${CommitNo#0} + 1 )))
     aCommitNo="${aTS}.${nCommitNo}"

#    echo -e "\n  Save commit.no: '.(${aCommitNo}"; exit
     echo "${aCommitNo}" >"${aCommitFile}"

  if [ "$1" == "set" ]; then
     echo -e "\n  Last commit.no: '.($( cat "${aCommitFile}" )'";                                                     # .(50909.01.6 RAM Display what's set)
     if [ "${OS:0:3}" != "Win" ]; then echo ""; fi                                                                    # .(50909.01.7)
     exit; fi
     fi # eof nKeepNo

  if git diff --cached --quiet; then aAdd="git add . && "; else aAdd=""; fi
#    echo -e "3.  \$1: '$1', \$2: '$2', aAuthor: '${aAuthor}'"; # exit 

# if [ "$2" == "robin"]; then aAuthor=""; else aAuthor="--author \"Agent Q <agent@amazon.com>\""; fi
# if [ "$2" != "" ]; then aAuthor="$( git config list | awk '/user.name/ { print substr($0,11); exit }' )";           ##.(50918.01.1 RAM Must include email)
  if [ "$2" != "" ]; then aAuthor="$( git config list | awk '/user.name/ && !/Amazon/ { n=substr($0,11) }; /user.email/ { m=substr($0,12) }; END { print n " <" m ">" }' )" # .(50918.1b.1 RAM Add !/Amazon/).(50918.01.1)
                     else aAuthor="Amazon Q <agent@amazon.com>"; fi
#    echo -e "4.  \$1: '$1', \$2: '$2', aAuthor: '${aAuthor}'"; # exit 

  if [ "$1" == "" ]; then
     echo -e "\n* Enter a commit \"message\".\n"
     if [ "${OS:0:3}" != "Win" ]; then echo ""; fi
     exit
     fi

     echo ""
     aMsg=".(${aCommitNo}_${1}"
     echo " ${aAdd} git commit -m \"${aMsg}\"  --author ${aAuthor}"; echo ""; # exit

if [ "${aAdd}" != "" ]; then git add .; fi
if [ -n "$aAuthor" ]; then
          git commit -m  "${aMsg}"  --author "${aAuthor}"
  else
          git commit -m  "${aMsg}"
   fi

   if [ "${OS:0:3}" != "Win" ]; then echo ""; fi
