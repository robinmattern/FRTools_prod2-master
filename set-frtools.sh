#!/bin/bash
#!/bin/bash
#*\
##=========+====================+================================================+
##RD         set-frtools        | JScriptWare Power Tools
##RFILE    +====================+=======+=================+======+===============+
##FD         set-frtools.sh     |   9479| 10/30/24 20:45|   136| v1.05`41030.2045
##FD         set-frtools.sh     |  15476| 10/30/24 21:05|   331| v1.05`41030.2105
##FD         set-frtools.sh     |  17992| 10/30/24 23:52|   355| v1.05`41030.2352
##FD         set-frtools.sh     |  18548| 10/31/24  7:15|   360| v1.05`41031.0615
##FD         set-frtools.sh     |  18894| 11/04/24 12:28|   366| v1.05`41104.1225
##FD         set-frtools.sh     |  19928| 11/24/24 14:45|   377| v1.05`41124.1445
##FD         set-frtools.sh     |  20155| 12/04/24  9:09|   380| v1.05`41204.0909
##FD         set-frtools.sh     |  20708| 12/08/24 23:50|   388| v1.05`41208.2350
##FD         set-frtools.sh     |  25171| 12/11/24  7:21|   446| v1.05`41211.0720
##FD         set-frtools.sh     |  26049| 12/11/24  8:41|   453| v1.05`41211.0840
##FD         set-frtools.sh     |  27656| 12/25/24 12:20|   471| v1.05`41225.1220
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
#            showEm             |
#            clnHouse           |
#            makScript          |
#            setBashrc          |
#            setTHE_SERVER      |
#            cpyToBin           |
#            cpyScript          |
#            setOSvars          |
#            exit_withCR        |
#            Sudo               |
#                               |
##CHGS     .--------------------+-------+-------------------+------+-----------+
# .(41023.01 10/23/24 RAM  2:43p|
# .(41024.01 10/24/24 RAM 10:43a|
# .(41030.01 10/30/24 RAM  8:45p| Fix MacOS's issue with function abc( ) { ... }
# .(41030.02 10/30/24 RAM  9:05p| Add this header
# .(41030.03 10/30/24 RAM  9:45p| Add doit to wipe command
# .(41030.07 10/30/24 RAM 10:05p| Add THE_SERVER to .bashrc file
# .(41030.06 10/30/24 RAM 11:52p| Fix doit and THE_SERVER for profile
# .(41031.02 10/31/24 RAM  6:15a| Add set-frtools command doit
# .(41104.03 11/04/24 RAM 12:25p| Set premissions for all scripts
# .(41123.01 11/23/24 RAM  8:10a| Change setopt for MacOS
# .(41120.02 11/23/24 RAM  9:15a| Ignore file permissions for this repo
# .(41120.02 11/23/24 RAM  9:45a| Must be in FRTools repo
# .(41124.01 11/24/24 RAM  9:25a| Allow -d and -doit
# .(41124.05 11/24/24 RAM 14:45a| Add netr command
# .(41203.08 12/04/24 RAM  9:07a| Shorten ${aBashrc}) in it exists msg
# .(41208.02 12/08/24 RAM  4:55p| Set different ${aBashrc}) in darwin20
#.(41208.02b 12/08/24 RAM 11:50p| Who is right re setopt for MacOS
#.(41208.02c 12/11/24 RAM  7:20a| Update finding .bashrc on unix
# .(41211.02 12/11/24 RAM  8:40a| Fix wierdness copying script files
#.(41208.02d 12/25/24 RAM 10:50a| Reverse priority for .bash_profile
# .(41225.01 12/25/24 RAM 10:59a| Set aTS to include Y for year
# .(41225.02 12/25/24 RAM 12:20p| Fix SetTHE_SERVER

##PRGM     +====================+===============================================+
##ID 69.600. Main0              |
##SRCE     +====================+===============================================+
#*/
#========================================================================================================== #  ===============================  #

  aVer="v1.05\`41124.1445"
  aVer="v1.05\`41204.0909"
  aVer="v1.05\`41208.1655"
  aVer="v1.05\`41208.2350"
  aVer="v1.05\`41211.0720"
  aVer="v1.05\`41211.0840"
  aVer="v1.05\`41225.1220"

  echo ""

# ---------------------------------------------------------------------------

function help() {
  echo "  Run ./set-frtools.sh commands: (${aVer}, OS: ${aOS})"
  echo "    help            This help"
  echo "    show            ${aBashrc} and script files"
  echo "    doit            Do scripts and profile"                                                         # .(41031.02.1)
  echo "    scripts [doit]  Copy FRTools scripts"
  echo "    profile [doit]  Update ${aBashrc} file"
  echo "    wipe    [doit]  Erase all setup changes"                                                        # .(41030.03.1)
  echo ""
  }
# -----------------------------------------------------------

function setOSvars() {
     aTS=$( date '+%y%m%d.%H%M' ); aTS=${aTS:1}                                                             # .(41225.01.1 RAM Was ${aTS:2})
#    aBashrc="$HOME/.bashrc"                                                                                ##.(41208.02c.1)
     if [ -f "$HOME/.bashrc"       ]; then aBashrc="$HOME/.bashrc"; fi                                      # .(41208.02b.1).(41208.02c.2)
     if [ -f "$HOME/.bash_profile" ]; then aBashrc="$HOME/.bash_profile"; fi                                # .(41208.02b.2).(41208.02c.1)
     aBinDir="/home/._0/bin"                                                                                # .(41211.02.1 RAM Was /Home/._0/bin)
     aOS="linux"
  if [[ "${OS:0:7}" == "Windows" ]]; then
     aOS="windows";
     aBinDir="/C/Home/._0/bin"
     fi
  if [[ "${OSTYPE:0:6}" == "darwin" ]]; then
     if [ -f "$HOME/.bashrc"       ]; then aBashrc="$HOME/.bashrc"; fi                                      # .(41208.02b.3).(41208.02.2)
     if [ -f "$HOME/.bash_profile" ]; then aBashrc="$HOME/.bash_profile"; fi                                # .(41208.02b.4).(41208.02.1)
     if [ -f "$HOME/.zshrc"        ]; then aBashrc="$HOME/.zshrc"; fi                                       # .(41208.02.3)
     bZSHver="0"; if [[ "${OSTYPE:6:2}" > 21 ]]; then bZSHver="1"; fi                                       # .(41208.02b.1)
#    echo "  bZSHver: '${bZSHver}', OSTYPE:6:2: '${OSTYPE:6:2}'"; exit
     aBinDir="/Users/Shared/._0/bin"
     aOS="darwin"
     fi
     }
# -----------------------------------------------------------

function Sudo() {
  if [[ "${aOS}" != "windows" ]]; then if [ "${USERNAME}" != "root" ]; then sudo "$@"; fi; fi
     }
# -----------------------------------------------------------

function exit_withCR() {
  if [[ "${aOS}" != "windows" ]]; then echo ""; fi
     }
# -----------------------------------------------------------

                                      aCmd="help";    bDoWipe="0";    bDoProfile="0";   bDoScripts="0";  bShoProfile="0";                # .(41208.02b.2)
#  if [[ "$1" == ""          ]]; then aCmd="help";    fi
   if [[ "${1:0:3}" == "hel" ]]; then aCmd="help";    fi
   if [[ "${1:0:3}" == "sho" ]]; then aCmd="showEm";  fi
   if [[ "${1:0:2}" == "-d"  ]]; then aCmd="doit";                    bDoProfile="1";   bDoScripts="1";  fi # .(41124.01.1)
   if [[ "${1:0:3}" == "doi" ]]; then aCmd="doit";                    bDoProfile="1";   bDoScripts="1";  fi # .(41031.02.2 Add doit command)
   if [[ "${1:0:3}" == "wip" ]]; then aCmd="wipeIt";  if [[    "$2" == "doit"  ]]; then bDoWipe="1"; fi; fi # .(41030.03.2 Add doit option)
   if [[ "${1:0:3}" == "pro" ]]; then aCmd="profile"; if [[ "${!#}" == "doit"  ]]; then bDoProfile="1";  fi; fi
#  if [[ "${1:0:3}" == "pro" ]]; then aCmd="profile"; if [[ "${!#}" == "show"  ]]; then bDoProfile="0";  bShoProfile="1"; fi; fi         ##.(41208.02b.3)
   if [[ "${1:0:3}" == "pro" ]]; then aCmd="profile"; if [[    "$2" == "show"  ]]; then bDoProfile="0";  bShoProfile="1"; shift; fi; fi  # .(41208.02b.3)
   if [[ "${1:0:3}" == "pro" ]]; then aCmd="profile"; if [[    "$2" == "again" ]]; then bDoProfile="1";  bShoProfile="1"; shift; fi; fi  # .(41208.02b.4)
   if [[ "${1:0:3}" == "scr" ]]; then aCmd="copyEm";  if [[    "$2" == "doit"  ]]; then bDoScripts="1";  fi; fi

# ---------------------------------------------------------------------------

function showEm() {

  echo "   aBinDir: '${aBinDir}'"
  if [ -f "${aBinDir}/frt" ]; then ls -l "${aBinDir}" | awk 'NR > 1 { print "    " $0 }'; fi
  echo ""

  echo "  .Bashrc: '${aBashrc}' contents:"
  echo "  ------------------------------------------------"
  if [ -f "${aBashrc}" ]; then cat  "${aBashrc}" | awk '{ print "    " $0 }'; fi
  echo "  ------------------------------------------------"; echo ""

  echo "  \$PATH (bin folders only):"
  echo "${PATH}" | awk '{ gsub( /:/, "\n" );  print }' | awk '/[.]*bin$/ { print "    " $0 }'
  }
# -----------------------------------------------------------

function clnHouse() {

  if [[  "${bDoWipe}" == "0" ]]; then                                                                       # .(41030.03.3 Beg)
   echo "  About to delete the JPTs scripts from ${aBinDir}"; return
   else
     PATH="${PATH/${aBinDir}:}"

  if [[ -f "${aBinDir}"/frt ]]; then
   echo "  Deleting wiping the JPTs scripts from ${aBinDir}"                                                # .(41030.03.3 End)
     rm   "${aBinDir}"/*;
#    rm   "${aBinDir}"/gitr*;
   else
   echo "  Nothing to delete from ${aBinDir}";
     fi

     cp -p "${aBashrc}" "${aBashrc}_v${aTS}"
     cat   "${aBashrc}" | awk '/._0/ { exit }; NF > 0 { print }' >"${aBashrc}_@tmp"
     mv    "${aBashrc}_@tmp" "${aBashrc}"

   echo "  Wipe of \$PATH and ${aBashrc} file complete";
     fi
  }
# -----------------------------------------------------------

function setBashrc() {

     setTHE_SERVER "$1"; echo -e "  THE_SERVER is: ${THE_SERVER}\n"; # exit             # .(41030.07.1)

# if [ "${PATH/._0/}" != "${PATH}" ]; then

     inRC=$( cat "${aBashrc}" | awk '/\._0/ { print 1 }' );                             # .(41208.05.1 RAM Added /\._0/)
  if [[ "${inRC}" == "1" ]]; then

     echo "* The path, '${aBinDir}', is already in the User's ${aBashrc/$HOME/~} file." # .(41203.08.1 RAM Shorten ${aBashrc})
     fi                                                                                                     # .(41208.02b.5)
#    echo  "  inRC: '${inRC}', bDoProfile: '${bDoProfile}', bShoProfile: '${bShoProfile}'"; # exit

  if [[ "${inRC}" == "" ]] || [[ "${bShoProfile}" == "1" ]]; then # Recreate "${aBashrc}"                   # .(41208.02b.6)
#  else  # Recreate "${aBashrc}"                                                                            # .(41208.02b.7)

     if [ "${bDoProfile}" == "0" ]; then cat     "${aBashrc}" | awk '/._0/ { exit }; NF > 0 { print }' >"${aBashrc}_@tmp"
                                         aBashrc="${aBashrc}_@tmp"; fi
     if [ "${bDoProfile}" == "0" ]; then aWill_add="Will add"; else aWill_add="Adding"; fi
     if [ "${bDoProfile}" == "1" ]; then cp -p   "${aBashrc}" "${aBashrc}_v${aTS}"; fi

     echo "  ${aWill_add} path, '${aBinDir}', to User's PATH in '${aBashrc/_@tmp/}'."; # exit
#    echo "  BASH_VERSION: '${BASH_VERSION}', ZSH_VERSION: '${ZSH_VERSION}'"; exit

     echo ""                                                >>"${aBashrc}"
#    echo "export PATH=\"/Users/Shared/._0/bin:\$PATH\""    >>"${aBashrc}"
     echo "export PATH=\"${aBinDir}:\$PATH\""               >>"${aBashrc}"
     echo "export THE_SERVER=\"${THE_SERVER}\""             >>"${aBashrc}"              # .(41030.07.2)
     echo ""                                                >>"${aBashrc}"

  if [ "${aOS}" != "windows" ]; then

     echo "function git_branch_name() {"                                                               >>"${aBashrc}"
     echo "  branch=\$( git symbolic-ref HEAD 2>/dev/null | awk 'BEGIN{ FS=\"/\" } { print \$NF }' )"  >>"${aBashrc}"
     echo "  if [[ \$branch == \"\" ]]; then"                                                          >>"${aBashrc}"
     echo "    echo '#'"                                    >>"${aBashrc}"
     echo "  else"                                          >>"${aBashrc}"
     echo "    echo ' ('\$branch')#'"                       >>"${aBashrc}"
     echo "  fi"                                            >>"${aBashrc}"
     echo "  }"                                             >>"${aBashrc}"
     echo ""                                                >>"${aBashrc}"

     echo -e "\n  BASH_VERSION: '${BASH_VERSION}', ZSH_VERSION: '${ZSH_VERSION}', bZSHver: '${bZSHver}'\n";

# if [ "${aOS}" != "darwin" ]; then                                                     ##.(41030.06.1 Beg).(41030.06b.1)
  if [ -n "${BASH_VERSION}" ] && [ "${bZSHver}" == "0" ]; then                          # .(41208.02b.8).(41030.06b.1)
     echo "  PROMPT_SUBST=true   # bash style"              >>"${aBashrc}"              # .(41123.01b.1 RAM Set Prompt correctly)
     echo "# setopt prompt_subst # zsh style"               >>"${aBashrc}"              # .(41123.01b.2)
     echo "# set -o PROMPT_SUBST # another bash style"      >>"${aBashrc}"              # .(41123.01b.3).(41123.01 RAM Change setopt for MacOS)
     fi
  if [ -n "${BASH_VERSION}" ] && [ "${bZSHver}" == "1" ]; then                          # .(41208.02b.9).(41030.06b.1)
     echo "# PROMPT_SUBST=true   # bash style"              >>"${aBashrc}"              # .(41123.01b.1 RAM Set Prompt correctly)
     echo "# setopt prompt_subst # zsh style"               >>"${aBashrc}"              # .(41123.01b.2)
     echo "  set -o PROMPT_SUBST # another bash style"      >>"${aBashrc}"              # .(41123.01b.3).(41123.01 RAM Change setopt for MacOS)
     fi
# if [ "${aOS}" == "darwin" ]; then
  if [ -n "${ZSH_VERSION}"  ]; then                                                     ##.(41030.06.1 Beg).(41030.06b.2)
     echo "# PROMPT_SUBST=true   # bash style"              >>"${aBashrc}"              # .(41030.06b.2).(41123.01b.1)
     echo "  setopt prompt_subst # zsh style"               >>"${aBashrc}"              # .(41123.01b.2)
     echo "# set -o PROMPT_SUBST # another bash style"      >>"${aBashrc}"              # .(41123.01b.3).(41123.01 RAM Change setopt for MacOS)
     fi                                                                                 # .(41030.06.1 End)

     echo "  PROMPT='%n@%m %1~\$(git_branch_name) '"        >>"${aBashrc}"
     echo ""                                                >>"${aBashrc}"
     fi # eif windows prompt handled by git bash

     echo "# Add timestamps and user to history"            >>"${aBashrc}"
  if [ -n "${BASH_VERSION}" ]; then    # for older Macs
     echo "  export HISTTIMEFORMAT=\"%F %T \$(whoami) \""   >>"${aBashrc}"
     echo "  PROMPT_COMMAND=\"history -a; $PROMPT_COMMAND\"">>"${aBashrc}"
                                       # Only for non-macOS Bash (Git Bash, Ubuntu)
     if [ "${aOS}" != "darwin" ]; then
     echo "  shopt -s histappend"                           >>"${aBashrc}"
     fi; fi
  if [ -n "$ZSH_VERSION" ]; then       # For Zsh (newer macOS)
     echo "  setopt EXTENDED_HISTORY   # Save timestamps"   >>"${aBashrc}"
     echo "  setopt INC_APPEND_HISTORY # Append immediately">>"${aBashrc}"
     echo "  alias history="fc -il 1"  # Format output"     >>"${aBashrc}"
     fi

#    echo "  export HISTTIMEFORMAT=\"%F %T \$(whoami) \""   >>"${aBashrc}"
#    echo ""                                                >>"${aBashrc}"
#    echo "# Write history after every command"             >>"${aBashrc}"
#    echo "  PROMPT_COMMAND=\"history -a; $PROMPT_COMMAND\"">>"${aBashrc}"

# if [ "${aOS}" != "darwin" ]; then
#    echo ""                                                >>"${aBashrc}"
#    echo "# Append to history file, don't overwrite it"    >>"${aBashrc}"
#    echo "  shopt -s histappend"                           >>"${aBashrc}"
#    fi
# if [ "${aOS}" == "darwin" ]; then
#    echo ""                                                >>"${aBashrc}"
#    echo "alias history=\"fc -il 1\""                      >>"${aBashrc}"
#    fi

#    echo -e "  Executing: source \"${aBashrc}\"\n"
# if [ "${bDoProfile}" == "1" ]; then     source "${aBashrc}" "" 2>/dev/null;  fi       # .(41030.06.2 RAM setopt gets an error in MacOS when run here, but not during login)

#  else

     echo -e "  .Bashrc: '${aBashrc}' contents:"                                        # .(41030.06.3 Beg)
     echo      "  ------------------------------------------------"
     if [[ -f "${aBashrc}" ]]; then cat "${aBashrc}" | awk '{ print "    " $0 }'; fi
     echo -e "\n  ------------------------------------------------";

  if [ "${bDoProfile}" == "0" ]; then
     if [[ -f "${aBashrc}" ]]; then rm  "${aBashrc}"; fi
   else
     echo -e "\n  User Profile updated:  \"${aBashrc}\""
#    echo -e   "  Try to execute: source \"${aBashrc}\""    # it gets installed in this shell, but not after exiting
#    source "${aBashrc}" ""
     fi                                                                                 # .(41030.06.3 End)
     fi  # eif Recreate "${aBashrc}"

  }  # eof setBashrc
# -----------------------------------------------------------

function setTHE_SERVER() {                                                              # .(41030.07.3 RAM Write setTHE_SERVER Beg)

#    OS=Windows_NT
#     OSTYPE=msys
#       MSYSTEM=MINGW64
#     wmic os get caption

#   THE_SERVER='rm219d_os11-MacMini-Dev01   rm220d.local
#   THE_SERVER='Robins-Mac-mini.local       rm231d-os14_
#   THE_SERVER='sc212d-w10p_Windows-Prod1 (127.0.0.1)'      rm228d-w11p    RM228D-W11P

  if [ "${aOS}" == "windows" ]; then aIP="$( ipconfig | awk '/IPv4/  { a = substr($0,40) }; END { print a }' )"; fi
  if [ "${aOS}" == "darwin"  ]; then aIP="$( ifconfig | awk '/inet / { a = $2 }; END { print a }' )"; fi                    # .(41225.02.1)
  if [ "${aOS}" == "linux"   ]; then aIP="$( ip a | awk '/inet / { a = $2 }; END { sub( /\/.*/, "", a); print a }' )"; fi   # .(41225.02.2 RAM Only works in Latest yersions of Ubuntu)

  if [ "${aOS}" == "darwin"  ]; then aOSN="os${OSTYPE:6:2}"; fi
  if [ "${aOS}" == "windows" ]; then aOSN="w$( wmic os get caption | awk 'NR == 2 { print $3 tolower( substr($4,1,1)) }' )"; fi  # .(41225.02.3)
  if [ "${aOS}" == "msys"    ]; then aOSN="w$( wmic os get caption | awk 'NR == 2 { print $3 tolower( substr($4,1,1)) }' )"; fi  # .(41225.02.4)
# if [ "${aOS}" == "linux"   ]; then aOSN="ub$( cat /etc/issue | awk '{ print $3 substr($4,1,1) }' )"; fi  ##.(41225.02.5)
  if [ "${aOS}" == "linux"   ]; then aOSN="ub$( cat /etc/issue | awk '{ print substr($2,1,2) }'    )"; fi  # .(41225.02.5)

#      echo "  THE_SERVER: ${THE_SERVER}"
#      echo "  aIP: ${aIP}"

       aSvr="$1";  aSvr="$( echo "${aSvr/doit/}" | sed 's/ *$//' )"                     # .(41030.06.4 RAM Add /doit/)
#                           echo "  aSvr: '${aSvr}' (${#aSvr})'"
  if [ "${aSvr}" != ""    ]; then

  if [ "${#aSvr}" == "11" ]; then aSvr="${aSvr}_${HOSTNAME/.local/}"; fi
#                            echo "  aSvr: '${aSvr%% }'"
#                            echo "  aSvr: '$( echo "${aSvr}" | sed 's/ *$//' )'"
#    THE_SERVER="${aSvr%% } (${aIP})"
     THE_SERVER="$( echo "${aSvr}" | sed 's/ *$//' ) (${aIP})"
     fi
  if [ "${THE_SERVER}" != "" ]; then return; fi

  if [ "${aSvr}" == "" ]; then
     aName="${HOSTNAME/.local/}";
     nPos=6; if [ "${aOSN}" == "${aName:7:4}" ]; then nPos=7; fi                        # .(41225.02.6)
     echo "  aOSN: ${aOSN}, aName: ${aName:${nPos}:4}"                                  # .(41225.02.7)
  if [ "${aOSN}" == "${aName:${nPos}:4}" ]; then                                        # .(41225.02.8)
     aSvr="${aName:0:$(( nPos + 4 ))}_Web-Server (${aIP})"                              # .(41225.02.9 RAM Special name)
   else
     aSvr="xx000-${aOSN}_${aName} (${aIP})"                                             # .(41225.02.10)
     fi                                                                                 # .(41225.02.11)
     THE_SERVER="${aSvr}"
     fi
  }                                                                                     # .(41030.07.3 End)
# -----------------------------------------------------------

function cpyToBin() {
# return

     aJPTs_JDir="${aBinDir}"; # if [ "${aOS}" == "darwin" ]; then aJPTs_JDir="/Users/Shared/._0/bin"; fi    # .(41211.02.2 RAM aBinDir is this on mac)

#    echo ""
#    echo " aJPTs_JDir: ${aJPTs_JDir}";
#    echo " aJPTs_GitR: ${aJPTs_GitR}";
#    echo " alias gitr: ${aJPTs_JDir}/gitr.sh";
#    echo " copying run-anyllm.sh and gitr to: \"${aJPTs_JDir}\""; echo ""

 if [   -d "${aJPTs_JDir}"   ]; then                                                     echo "  Wont create BinDir: it exists in \"${aJPTs_JDir}\""; fi
 if [ ! -d "${aJPTs_JDir}"   ]; then
 if [ "${bDoScripts}" == "0" ]; then                                                     echo "  Will create BinDir: doesnt exist \"${aJPTs_JDir}\""; else
 if [ "${aOS}" == "windows"  ]; then      mkdir -p  "${aJPTs_JDir}";
                                else Sudo mkdir -p  "${aJPTs_JDir}"; fi;                 echo "  Created BinDir:  it didn't exist \"${aJPTs_JDir}\""
                                     Sudo chmod 777 "${aJPTs_JDir}"; fi;
        fi;
#   echo  "  cpyScript \"${aAnyLLMscr}\" \"anyllm\""

#   aJPTs_GitR="${aRepo_Dir}/._2/JPTs/gitr.sh"
#   aAnyLLMscr="${aRepo_Dir}/run-anyllm.sh"

#   cpyScript "anyllm  " "${aRepo_Dir}/run-anyllm.sh"
#   cpyScript "gitr    " "${aRepo_Dir}/._2/JPTs/gitr.sh"

    cpyScript "jpt     " "${aRepo_Dir}/._2/JPTs/JPT30_Main0.sh"
    cpyScript "rss     " "${aRepo_Dir}/._2/JPTs/RSS/RSS01_Main1.sh"                     # .(41029.03.1 RAM Was: fileList/RSS21_FileList.sh)
    cpyScript "rss2    " "${aRepo_Dir}/._2/JPTs/RSS/RSS02_Main1.sh"                     # .(41029.03.2 RAM Added)
    cpyScript "rdir    " "${aRepo_Dir}/._2/JPTs/RSS/fileList/RSS21_FileList.sh"         # .(41029.03.3 RAM Added)
    cpyScript "dirlist " "${aRepo_Dir}/._2/JPTs/RSS/dirList/RSS22_DirList.sh"
    cpyScript "info    " "${aRepo_Dir}/._2/JPTs/RSS/infoR/RSS23_Info.sh"
#   cpyScript "killport" "${aRepo_Dir}/._2/JPTs/JPT34_killPort_p1.01.sh"

    cpyScript "frt     " "${aRepo_Dir}/._2/FRTs/FRT40_Main0.sh"
    cpyScript "keys    " "${aRepo_Dir}/._2/FRTs/keyS/FRT41_keyS1.sh"
    cpyScript "gitr    " "${aRepo_Dir}/._2/FRTs/gitR/FRT42_gitR2.sh"                    #.(41103.02.1 RAM Was: gitR1)
    cpyScript "gitr1   " "${aRepo_Dir}/._2/FRTs/gitR/FRT42_gitR1.sh"
    cpyScript "gitr2   " "${aRepo_Dir}/._2/FRTs/gitR/FRT42_gitR2.sh"
#   cpyScript "gitclone" "${aRepo_Dir}/._2/FRTs/gitR/FRT43_gitR_clone_p1.04.sh"
    cpyScript "netr    " "${aRepo_Dir}/._2/FRTs/netR/FRT44_netR1.sh"                    #.(41124.05.6 RAM Add netR)
    cpyScript "dokr    " "${aRepo_Dir}/._2/FRTs/dokR/FRT45_dokR1.sh"
    cpyScript "docr    " "${aRepo_Dir}/._2/FRTs/FRT46_docR0.sh"
#   cpyScript "dokrun  " "${aRepo_Dir}/._2/FRTs/gitR/FRT44_run-docker_p1.02.sh"
#   cpyScript "killport" "${aRepo_Dir}/._2/FRTs/RSS/portR/killPort"
#   cpyScript "appr    " "${aRepo_Dir}/._2/FRTs/appR/FRT47_FRApp1_u1.07.sh
#   cpyScript "prox    " "${aRepo_Dir}/._2/FRTs/proX/FRT48_Proxy1_u1.07.sh

#   "E:\VMs\RAM3-Dev03\rm231\Users\Shared\Repos\FRTools_\prod1-master\._2\FRTs\gitR\FRT22_gitR1_p1.01.sh"
#   "/e/VMs/RAM3-Dev03/rm231/Users/Shared/Repos/FRTools_/prod1-master/._2/JPTs/gitr.sh"
#   "E:\VMs\RAM3-Dev03\rm231\Users\Shared\Repos\FRTools_\prod1-master\._2\JPTs\RSS\dirList\RSS22_DirList.sh"

# if [   -f  "${aJPTs_GitR}" ]; then cp     -p "${aJPTs_GitR}" "${aJPTs_JDir}/";                 echo "  Copied:  ${aJPTs_GitR}"; fi
# if [   -f  "${aJPTs_GitR}" ]; then makScript "${aJPTs_GitR}" "${aJPTs_JDir}" "gitr";           echo "  Created: ${aJPTs_GitR}";
#                                    Sudo chmod 777 "${aJPTs_GitR}"; fi

# if [   -f  "${aAnyLLMscr}" ]; then mkScript "${aAnyLLMscr}" "${aJPTs_JDir}" "anyllm";  echo "  Created: ${aJPTs_JDir}/anyllm";
#                                    Sudo chmod 777 "${aAnyLLMscr}"; fi

# alias gitr="${aJPTs_JDir}/gitr";      echo "  Done: created alias gitr   = ${aJPTs_JDir}/gitr"
# alias anyllm="${aJPTs_JDir}/anyllm";  echo "  Done: created alias anyllm = ${aJPTs_JDir}/anyllm"

   cd "${aRepo_Dir}"                                                                    # .(41120.02.3 RAM Need to be in FRTools repo)
   git config core.fileMode false                                                       # .(41120.02.2 RAM Ignore file permissions in this repo)
  Sudo find . -type f -name "*.sh" -exec chmod 755 {} \;                                # .(41104.03.1 RAM Set premissions for all scripts)
  echo ""
  }
# ---------------------------------------------------------------------------

function cpyScript() {

  aJPTs_Script="$2"; aName1="$1"; aName="${aName1// /}"   # echo "  cp -p \"${aJPTs_Script}\" to \"${aJPTs_JDir}/${aName}\""
#                                                  echo "  copying script: \"${aJPTs_Script}\" to \"${aJPTs_JDir}/${aName}\""

  if [ ! -f "${aJPTs_Script}" ]; then                                                           echo "* Script not found:  \"${aJPTs_Script}\""; return; fi                       # .(41211.02.3 RAM Can't create it in aBinDir if not found in FRTools)

  if [ "${bDoScripts}" == "0" ]; then                                                           echo "  Will create script: ${aJPTs_JDir}/${aName1} for \"${aJPTs_Script}\""; return; fi

  if [ "${bDoScripts}" == "1" ]; then                                                                                                                                             # .(41211.02.4 RAM Add if bDoScripts for clarity)
# if [   -f "${aJPTs_Script}" ]; then cp     -p  "${aJPTs_Script}" "${aJPTs_JDir}/";            echo "  Copied  script for: ${aName1}  in \"${aJPTs_Script}\""; fi                ##.(41211.02.5 RAM It's not copied, rather  ..)
  if [   -f "${aJPTs_Script}" ]; then makScript  "${aJPTs_Script}" "${aJPTs_JDir}" "${aName}";  echo "  Created script in: ${aJPTs_JDir}/${aName1}  for \"${aJPTs_Script}\""; fi  # .(41211.02.6 RAM It's created it in aBinDir)
#                                Sudo chmod  777 "${aJPTs_Script}";                     ##.(41104.03.1 RAM No need to set permission for each script
       fi # eif bDoScripts
  }
# ---------------------------------------------------------------------------

function  makScript() {
# echo "  making script in $2/$3"; # exit
# echo "    aAnyLLMscr:  $2/$3"
  echo "#!/bin/bash"   >"$2/$3"
  echo "  $1 \"\$@\"" >>"$2/$3"
  chmod 777 "$2/$3"
  }
# -----------------------------------------------------------

  aRepo_Dir="$(pwd)"
  cd ..
  aProj_Dir="$(pwd)"

  setOSvars;          # echo "  OS: ${aOS}"
  setTHE_SERVER "$2";   echo "  THE_SERVER: ${THE_SERVER}"; exit

  if [[ "${aCmd}" == "help"    ]]; then help; fi
  if [[ "${aCmd}" == "doit"    ]]; then cpyToBin; setBashrc; fi                                             # .(41031.02.3)
  if [[ "${aCmd}" == "showEm"  ]]; then showEm; fi
  if [[ "${aCmd}" == "wipeIt"  ]]; then clnHouse; fi
  if [[ "${aCmd}" == "profile" ]]; then setBashrc "$2 $3 $4"; fi                        # .(41030.07.4)
# if [[ "${aCmd}" == "profile" ]]; then setBashrc; fi                                   # .(41030.07.5)
  if [[ "${aCmd}" == "copyEm"  ]]; then cpyToBin; fi

# ---------------------------------------------------------------------------

  cd "${aRepo_Dir}"

# if [ -z "$(command -v frt 2>/dev/null)" ]; then
  if [ -z "$(which frt)" ]; then
     echo -e "* You need to run, source ${aBashrc}, or login again."
   else
     echo -e "  FRTools are installed."
     fi

  exit_withCR


