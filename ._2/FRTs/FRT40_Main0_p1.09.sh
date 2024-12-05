#!/bin/bash
#*\
##=========+====================+================================================+
##RD         Main0              | FormR Tools
##RFILE    +====================+=======+===============+======+=================+
##FD   FRT10_Main0.sh           |   9479|  4/29/22 14:48|   136| v1.05.20429.1448
##FD   FRT10_Main0.sh           |  28713|  5/03/22 13:12|   536| p1.06-20503-1312
##FD   FRT10_Main0.sh           |  29813|  5/03/22 14:53|   558| p1.06-20503-1453
##FD   FRT10_Main0.sh           |  32740|  5/04/22 19:24|   967| p1.06-20504-1924
##FD   FRT10_Main0.sh           |  22585|  5/08/22 16:17|   810| p1.06-20508-1617
##FD   FRT10_Main0.sh           |  22845|  5/09/22 07:04|   813| p1.06-20509-0704
##FD   FRT10_Main0.sh           |  23513|  5/15/22 13:04|   825| p1.06-20515-1304
##FD   FRT10_Main0.sh           |  24121|  6/01/22 08:30|   830| u1.07-20601-0830
##FD   FRT10_Main0.sh           |  24278|  6/01/22 11:15|   830| u1.07-20601-1115
##FD   FRT10_Main0.sh           |  24934|  6/01/22 18:29|   838| u1.07-20601-1829
##FD   FRT10_Main0.sh           |  19714|  6/20/22 10:50|   316| u1.08-20620-1050
##FD   FRT10_Main0.sh           |  21741|  6/20/22 21:54|   351| u1.08-20620-2154
##FD   FRT10_Main0.sh           |  22602| 10/27/22 10:59|   358| u1.08-21027-1059
##FD   FRT10_Main0.sh           |  22912| 11/03/22 15:15|   361| p1.08-21103-1515
##FD   FRT10_Main0.sh           |  23981| 11/19/22 19:22|   385| p1.08-21119.1922
##FD   FRT10_Main0.sh           |  24904| 11/20/22 13:55|   392| p1.08-21120.1355
##FD   FRT10_Main0.sh           |  28576| 11/22/22 09:38|   462| p1.08-21122.0938
##FD   FRT10_Main0.sh           |  30525| 11/27/22 19:40|   483| p1.08-21127.1940
##FD   FRT10_Main0.sh           |  32372| 11/28/22 08:15|   513| p1.08-21128.0815
##FD   FRT10_Main0.sh           |  33564| 11/29/22 21:07|   519| p1.08-21129.2107
##FD   FRT10_Main0.sh           |  33368| 11/30/22 11:39|   522| p1.08-21130.1139
##FD   FRT10_Main0.sh           |  37882|  7/16/23 11:12|   577| p1.09-30716.1122
##FD   FRT10_Main0.sh           |  38186|  4/13/24 11:07|   580| p1.09`40413.1107
##FD   FRT10_Main0.sh           |  39638| 10/26/24 15:04|   595| p1.09`41026.1504
##FD   FRT10_Main0.sh           |  42008| 10/28/24 09:34|   607| p1.09`41028.0934
##FD   FRT10_Main0.sh           |  43323| 11/07/24 08:16|   632| p1.09`41107.0815
##FD   FRT10_Main0.sh           |  49033| 11/11/24 19:30|   719| p1.09`41111.1930
##FD   FRT10_Main0.sh           |  49627| 11/12/24 10:00|   726| p1.09`41112.1000
##FD   FRT10_Main0.sh           |  50055| 11/13/24 10:01|   728| p1.09`41113.1000
##FD   FRT10_Main0.sh           |  51713| 11/15/24 12:10|   745| p1.09`41115.1210
##FD   FRT10_Main0.sh           |  50875| 11/23/24 19:00|   731| p1.09`41123.1045
##FD   FRT10_Main0.sh           |  57213| 11/24/24 15:45|   825| p1.09`41124.1545
##FD   FRT10_Main0.sh           |  57987| 11/25/24  9:37|   833| p1.09`41125.0935
##FD   FRT10_Main0.sh           |  58233| 11/29/24 13:00|   835| p1.09`41129.1300
##FD   FRT10_Main0.sh           |  59165| 12/01/24 21:50|   842| p1.09`41201.2150
##FD   FRT10_Main0.sh           |  64323| 12/04/24  9:45|   904| p1.09`41204.0945
##FD   FRT10_Main0.sh           |  68641| 12/04/24 12:30|   943| p1.09`41204.1230
##FD   FRT10_Main0.sh           |  70250| 12/05/24  9:40|   957| p1.09`41205.0940

##DESC     .--------------------+-------+---------------+------+-----------------+
#            Use the commands in this script to manage FormR app resources.
#
##LIC      .--------------------+----------------------------------------------+
#            Copyright (c) 2022-2024 8020Data-FormR * Released under
#            MIT License: http://www.opensource.org/licenses/mit-license.php
##FNCS     .--------------------+----------------------------------------------+
#            sayMsg             | ["sp"] {aMsg} ({bDebug}: 1)echo  2)echo then quit, 3) echo with no indent) ["sp"]
#            help commands      | {aCmd} != "", echo {aCmd} error
#            docR commands      |                                                                           # .(21128.02.1)
#            dokR commands      |                                                                           # .(30716.01.1)
#            appR commands      |
#            gitR commands      |
#            keyS commands      |
#            proX commands      |
#            update command     |                                                                           # .(41107.01.1)
#            install command    |                                                                           # .(41111.01.1)
#            set var command    |
#                               |
##CHGS     .--------------------+----------------------------------------------+
# .(01001.01 10/01/20 RAM 10:00p| Created
# .(10706.09 10/01/20 RAM 10:00p| Windows returns an extra blank line)
# .(20416.03  4/16/22 RAM  3:30p| Get aVer and lost main2Fns
# .(20420.05  4/20/22 RAM  5:15p| Update FRT10_Main0_p1.06.sh changes
# .(20420.07  4/20/22 RAM  6:08p| Add Version command
# .(20429.02  4/29/22 RAM  2:48p| Add Keys command
# .(20429.03  4/29/22 RAM  2:48p| Add Git command
# .(20429.04  4/29/22 RAM  3:45p| Make Version Date permenant ${aVdt}
# .(20429.09  4/29/22 RAM  7:30p| aArgsNs have been converted to lowercase in getOpts
# .(20501.01  5/01/22 RAM 11:30a| Enable JPT12_Main2Fns_p1.05.sh in sub-scripts
# .(20502.06  5/02/22 RAM 12:00p| Major overhaul of JPT12_Main2Fns_p1.06.sh
# .(20508.01  5/08/22 RAM  2:50p| Put App Commands into separate script
# .(20601.01  6/01/22 RAM  8:30a| Add App List Styles and Rename Styles
# .(20601.02  6/01/22 RAM 10:15p| Never sayMsg() if bQuiet = 1
# .(20620.02  6/20/22 RAM 10:45a| Run Proxy in FRT24_Proxy1_u1.06.sh
# .(20620.05  6/20/22 RAM  6:15a| Move setting bDoit=0, bQuiet=0, bDebug=0
# .(20620.04  6/20/22 RAM  5:45p| Reworked sayMsg sp functionality
# .(21027.04 10/27/22 RAM 10:59a| Update gitr with sparse and clone
# .(21031.01 10/31/22 RAM  7:45a| Allow version _d1.09
# .(21107.02 11/07/22 RAM 12:45a| Add RSS Commands
# .(21113.05 11/13/22 RAM  5:30p| Display Version and Source in Begin
# .(21119.01 11/19/22 RAM  7:22p| Capitalize Help Menu
# .(21120.02 11/20/22 RAM  1:55p| Fix aOSv and aLstSp
# .(21120.03 11/20/22 RAM  2:55p| Set System Path for FRTools in DOS, GFW and Linux
# .(21121.03 11/21/22 RAM  4:00p| Allow for .bashrc or profile
# .(21122.01 11/22/22 RAM  9:15a| Add exit code if paths are the same
# .(21126.01 11/26/22 RAM  2:00p| Check SYSTEM path if set path was successful
# .(21126.08 11/26/22 RAM  6:11p| Add -user option to 'frt set path'
# .(21126.09 11/26/22 RAM  7:20p| Modify System/Shell names for PATH
# .(21127.07 11/27/22 RAM  7:40p| Surpress Info Path Add msg if FRT setPath
# .(21128.02 11/28/22 RAM  8:00p| Add docR Commands
# .(21129.07 11/29/22 RAM  8:50p| Fix set path not found in wrong shell
# .(21121.03 11/30/22 RAM  9:45a| Select .profile over .bashrc
# .(21121.07 11/30/22 RAM 11:45a| Change Help FRT Rir to FRT Dir
# .(21121.03 12/03/22 RAM  3:05p| Use another method to select .profile over .bashrc
# .(21203.05 12/03/22 RAM  5:45p| Deal with setPath None Found confusion
# .(21203.06 12/03/22 RAM  6:20p| Copy Uppercase bin commands in Linux
# .(21121.03 12/03/22 RAM  6:50p| Reverse method to select .profile over .bashrc
# .(30716.01  7/16/23 RAM 11:12a| Add dokr script
# .(40413.02  7/13/24 RAM 11:05a| Change RSS22-Info to RSS23_Info
# .(41026.04 10/26/24 RAM  1:50p| Fix JPT12_Main2Fns_p1.07 & dokR location
# .(41026.05 10/26/24 RAM  3:04p| Find right location of JPTs scripts
# .(41026.06 10/26/24 RAM  4:22p| Run the right scripts for gitr
# .(41027.01 10/27/24 RAM  6:43p| Fix JPT12_Main2Fns_p1.07 again, and JPTs dir
# .(41028.01 10/28/24 RAM  9:32a| Change JPT app numbers
# .(41107.01 11/07/24 RAM  8:15a| Add Update command
# .(41111.01 11/11/24 RAM  7:45a| Add Install ALTools command
# .(41111.04 11/11/24 RAM  7:30p| Copy run-anyllm to master branch
# .(41112.04 11/12/24 RAM  9:05a| Remove trailing quotes from .gitignore
# .(41112.05 11/12/24 RAM  9:05a| Remove git git from install command
# .(41112.06 11/12/24 RAM 10:00a| Add / fix Sudo
# .(41113.01 11/13/24 RAM 10:00a| Delete right .code-workspace file
# .(41107.01 11/15/24 RAM 12:10p| Deal with updating dirty repo
# .(41123.04 11/23/24 RAM 10:45a| Use gitr update
# .(41124.02 11/24/24 RAM  9:50a| Add install "" for set-frtools command
# .(41124.03 11/24/24 RAM 11:30a| Add Install AIDocs command
# .(41124.04 11/24/24 RAM 11:45a| Fix Install ALTools command
# .(41124.05 11/24/24 RAM 14:45a| Add netr command
# .(41123.04 11/24/24 RAM 15:45a| Pass -f and -doit args to gitr update
# .(41125.03 11/25/24 RAM  9:25a| Stash docker/docker-healthcheck.sh ??
# .(41125.03 11/25/24 RAM  9:35a| Don't exit
# .(41129.02 11/29/24 RAM  1:00p| Change git status -u to get all working files
# .(41201.04 12/01/24 RAM  7:30p| Add aBranch to install repos
# .(41203.04 12/01/24 RAM  4:15p| Remove ${aLstSp} after calling other scripts
# .(41203.05 12/03/24 RAM  4:45p| Display msg re invalid frt var command
# .(41203.06 12/03/24 RAM  5:10p| Add frt show/kill ports
# .(41028.01 12/03/24 RAM  5:25p| Don't call scripts with _version #s
# .(41204.01 12/04/24 RAM  9:45a| Fix working files count var ${s}
# .(41204.02 12/04/24 RAM 10:15a| Add Commit to checkout
#.(41115.02d 12/04/24 RAM 12:30p| Adjust FRT Install ALTools -u
#.(41115.02e 12/05/24 RAM  9:15a| Try a different way for FRT Update ALTools

##PRGM     +====================+===============================================+
##ID 69.600. Main0              |
##SRCE     +====================+===============================================+
#*/
#========================================================================================================== #  ===============================  #

     aVdt="Dec 5, 2024 9:40a"; aVtitle="formR Tools"                                                      # .(21113.05.8 RAM Add aVtitle for Version in Begin)
     aVer="$( echo $0 | awk '{  match( $0, /_[dpstuv][0-9]+\.[0-9]+/ ); print substr( $0, RSTART+1, RLENGTH-1) }' )"  # .(21031.01.1 RAM Add [d...).(20416.03.8 "_p2.02", or _d1.09)

     LIB="FRT"; LIB_LOG=${LIB}_LOG; LIB_USER=${LIB}_USER; Lib=${LIB}; aDir=$( dirname "${BASH_SOURCE}" );   # .(41027.01.1 RAM).(80923.01.1)

#    aFns="$( dirname "${BASH_SOURCE}"         )/FRT12_Main2Fns_p1.06.sh";     if [ ! -f "${aFns}" ]; then  ##.(21113.05.9 RAM Use FRT12_Main2Fns_p1.06_v21027.sh)
#    aFns="$( dirname "${BASH_SOURCE}"         )/JPT12_Main2Fns_p1.07.sh";     if [ ! -f "${aFns}" ]; then  ##.(41026.04.1 RAM Use copy in FRTs).(21113.05.9 RAM Use FRT12_Main2Fns_p1.06_v21027.sh).(41027.01.2)
#    aFns="$( dirname "${BASH_SOURCE}" )/../JPTs/JPT12_Main2Fns_p1.07.sh";     if [ ! -f "${aFns}" ]; then  ##.(41026.04.1).(41027.01.2)
                         aFns="${aDir/FRTs/}JPTs/JPT12_Main2Fns_p1.07.sh";     if [ ! -f "${aFns}" ]; then  # .(41027.01.2).(41026.04.1)
     echo -e "\n ** FRT40[101]  JPT Fns script, '.${aFns#*._2}', NOT FOUND\n"; exit; fi; #fi
     source "${aFns}";

# +------- +------------------ +----------------------------------------------------------- # ------------+ ------------------- # --------------+

     bDoit=0                                                                                                # .(20501.01.2 RAM !Important in Sub script).(20620.05.1 RAM Move to here)
     bQuiet=1                                                                                               # .(20501.01.3 RAM).(20601.02.2 bQuiet by default)
     bDebug=0                                                                                               # .(20501.01.4 RAM)
     bSpace=0;                                                                                              # .(20620.04.8 RAM A space hasn't been displayed, print one next; was 1)

     Begin "$@"                                                                                             # .(21113.05.18)

     setOS;                                                                                                 # .(20620.04.8 RAM A space hasn't been displayed, print one next; was 1)
     aLstSp="echo "; if [ "${aOSv/w}" != "${aOSv}" ]; then aLstSp=""; fi                                    # .(10706.09.1 RAM Windows returns an extra blank line).(21113.06.1 RAM Reverse).(21120.02.1)
#    echo "  - FRT40[115]  aOSv: ${aOSv}, ${aOS}, aLstSp: '${aLstSp}'"; ${aLstSp};  exit

#    -- --- ---------------  =  ------------------------------------------------------  #

#    aOSv=gfw1 | w10p | w08s
#    aOSv=rh62 | rh70 | uv14 | ub16

#    sayMsg    "FRT40[122]  aServer: '${aServer}', aOSv: ${aOSv}, aOS: '${aOS}', bDebug: '${bDebug}'" 1
#    sayMsg    "FRT40[123]  $\1: '$1', $\2: '$2', $\3: '$3', $\4: '$4', bQuiet: '${bQuiet}', bDebug: '${bDebug}'" 2

#====== =================================================================================================== #  ===========

# ------------------------------------------------------------------------------------
#
#       HELP Command
#
#====== =================================================================================================== #  ===========

function Help( ) {

     if [ "${aCmd}" != "Help" ] && [ "help" != "$1" ]; then return; fi
     if [ "$1" != "help" ]; then sayMsg " ** Invalid Command: '$1'" 3 "sp"; aCmd="Help"; fi

#    -- --- ---------------  =  ------------------------------------------------------  #  ---------------- #

     echo ""
#    echo "  FormR Tools ${aVer}   ($( date "+%b %-d %Y %H:%M" ))"                      ##.(20429.04.2)
     echo "  Useful FRTools  (${aVer})               (${aVdt})"                         # .(20429.04.2 RAM).(21031.03.1 RAM)
     echo "  ------------------------------------  ---------------------------------"
     echo "     FRT [Help]"                                                             # .(20620.01.1 RAM)
     echo ""                                                                            #
     echo "     FRT Path Set [-doit] [-user]        Enable formR Tools to run anywhere" # .(21120.03.1 RAM Added).(21126.08.1 RAM Added -user)
     echo "     FRT Path Set [-doit] [-user]        Enable formR Tools to run anywhere" # .(21120.03.1 RAM Added).(21126.08.1 RAM Added -user)
     echo ""                                                                            #
#    echo "     FRT keyS [ Host ] [ Help ]          Manage SSH Key files"
     echo "     FRT keyS [ Help ]                   Manage SSH Key files"
   # echo "         keyS List [ SSH Hosts ]"                                            # .(20429.02.1 RAM Beg Add)
#  # echo "         keyS Make SSH Key  {KeyOwner}  {Host} {HostUser} {Resource}"
#  # echo "         keyS Delete SSH Key {KNo} [Authorized_Keys]"
#  # echo "         keyS Copy SSH Key  {KNo}"
     echo "         keyS List SSH Hosts Keys"
#  # echo "         keyS Set  SSH Host {KNo}       {Host} {HostUser} {Resource}"
#  # echo "         keyS Test SSH Host {HostAliasName}"                                 # .(20429.02.1 End)
     echo ""
     echo "     FRT gitR [ help ]                   Manage Git Local and Remote Repos"  # .(20429.03.1 RAM Beg Add)
     echo "         gitR Init"                                                          # .(20429.03.1 RAM End)
     echo "         gitR Clone"                                                         # .(21027.04.1 RAM Add)
     echo "         gitR Pull"                                                          # .(21119.01.1 RAM Add)
     echo ""
     echo "     FRT netR [ help ]                   Manage Git Local and Remote Repos"  # .(41124.05.1 RAM Add netR Command Beg)
     echo "         netR List"                                                          # .(41124.05.2)
     echo "         netR Clone"                                                         # .(41124.05.1 End)
     echo ""
     echo "     FRT porTs show                      Manage Ports"                       # .(41203.06.1 RAM Add Ports Command)
     echo "         show ports"                                                         # .(41203.06.2)
     echo "         porT kill {Port}"                                                   # .(41203.06.3)
     echo "         kill port {Port}"                                                   # .(41203.06.4)
     echo ""
   # echo "     FRT dokR [ help ]                   Manage Docker Containers"           # .(30716.01.2 RAM Beg Add)
   # echo "         dokR [ but | build ]"                                               # .(30716.01.3)
   # echo "         dokR [ psa | ps -a ]"                                               # .(30716.01.4)
   # echo "         dokR [ im  | images ]"                                              # .(30716.01.5)
   # echo ""                                                                            # .(30716.01.6)
   # echo "     FRT proX [ Help ]                   Manage Proxy files on server"
   # echo "         proX [ List | Restart ]"
   # echo "         proX Log"
   # echo "         proX Config"
   # echo ""
   # echo "     FRT appR [ Help ]                   Manage FormR Apps"
#  # echo "         appR Set Domain {Domain}"                                           # .(20407.03.1 RAM Add)
#  # echo "         appR Set Homepage {Homepage}"                                       # .(20407.01.1 RAM Add).(20410.03.1 RAM)
#  # echo "         appR Set Port {port}"                                               # .(20407.02.1 RAM Add)
#  # echo "         appR Set Title {AppTitle}"                                          # .(20409.03.1 RAM Add)
#  # echo "         appR Set SSH_Host {SSH_LoginAlias}"                                 # .(20411.03.1 RAM Add)
   # echo "         appR List [ Files | Styles ]"
#  # echo "         appR List Files"                                                    # .(20410.02.1 RAM Add)
#  # echo "         appR List Styles"                                                   # .(20601.01.3 RAM Add)
#  # echo "         appR Rename Styles"                                                 # .(20601.01.4 RAM Add)
#  # echo "         appR Save Files"                                                    # .(20415.01.1 RAM Add)
#  # echo "         appR Save Backup"                                                   # .(204xx.xx.x RAM Add)
#  # echo "         appR Doc"                                                           # .(20415.02.1 RAM Add)
#  # echo ""
   # echo "         appR [ Help | Start | Build | Deploy ]"
#  # echo "         appR Build"
#  # echo "         appR Run Prod"
#  # echo "         appR Deploy"                                                        # .(20411.08.1 RAM Add)
   # echo ""
   # echo "         SSH [ {SSH_Loginalias} ]"                                           # .(20412.02.1 RAM Add)
   # echo ""
   # echo "     FRT DOC [ Help ]                    Manage Docsify Docs"                # .(21128.02.2 RAM Add)
   # echo "         DOC [ Start | Note | Code ]"                                        # .(21128.02.3 RAM Add)
   # echo ""
     echo "         JPT {Cmd}"                                                          # .(21107.02.1)
     echo "         JPT RSS {Cmd}"                                                      # .(21107.02.2)
     echo "             RSS Dir (RDir)"                                                 # .(21107.02.3)
     echo "             RSS DirList (DirList)"                                          # .(21107.02.4)
     echo ""                                                                                                # .(41107.01.2)
     echo "    FRT Install                          Run ./set-frtools.sh"                                   # .(41124.02.1)
     echo "        Install [ALTools] [-doit]        Install ALTools"                                        # .(41111.01.2)
     echo "                [ALTools] [-doit] [-u]   Update ALTools"                                         # .(41115.02d.30)
     echo "                [AIDocs] [-doit]         Install AIDocs"                                         # .(41111.01.3)
     echo ""
     echo "    FRT Update [-doit]                   Update [ {FRTools} ]"                                   # .(41107.01.3)
     echo ""
     echo "  Notes: Only 3 lowercase letters are needed for each command, separated by spaces"
     echo "         One or more command options follow. Help for the command is dispayed if no options are given"
     echo "         The options, debug, doit and quietly, can follow anywhere after the command"
     ${aLstSp}                                                                                              # .(10706.09.3)
     exit

     } # eof Help
#    -- --- ---------------  =  ------------------------------------------------------  #  ---------------- #

#========================================================================================================== #  ===============================  #

     setArgs "$1" "$2" "$3" "$4" "$5" "$6" "$7" "$8" "$9"

     getOpts "bdqgl" 0
     setCmds         0  # dBug: JPFns[262] and in JPFns.getCmd[270, 285]

  if [ "1" == "0" ]; then
     echo   "--- FRT40[220]  $\1: '$1', $\2: '$2', $\3: '$3', $\4: '$4',  bQuiet: '${bQuiet}', bDebug: '${bDebug}'"; echo ""

     echo   "--- FRT40[222]  Hello Robin          -- bSpace: '${bSpace}', bQuiet: '${bQuiet}', bDebug: '${bDebug}'"
     sayMsg     "FRT40[223]  Hello Robin"
     sayMsg     "FRT40[224]  Hello Robin" 1
#    sayMsg     "FRT40[225]  Hello Robin" 2

     echo   "--- FRT40[227]  sp Hello Robin       -- bSpace: '${bSpace}', bQuiet: '${bQuiet}', bDebug: '${bDebug}'"
     sayMsg  sp "FRT40[228]  sp Hello Robin"
     sayMsg  sp "FRT40[229]  sp Hello Robin" 1
#    sayMsg  sp "FRT40[230]  sp Hello Robin" 2

     echo   "--- FRT40[232]  Hello Robin sp       -- bSpace: '${bSpace}', bQuiet: '${bQuiet}', bDebug: '${bDebug}'"
     sayMsg     "FRT40[233]  Hello Robin sp" sp
     sayMsg     "FRT40[234]  Hello Robin sp" sp 1
#    sayMsg     "FRT40[235]  Hello Robin sp" sp 2

     echo   "--- FRT40[237]  sp Hello Robin sp    -- bSpace: '${bSpace}', bQuiet: '${bQuiet}', bDebug: '${bDebug}'"
     sayMsg  sp "FRT40[238]  sp Hello Robin sp" sp
     sayMsg  sp "FRT40[239]  sp Hello Robin sp" sp 1
     sayMsg  sp "FRT40[240]  sp Hello Robin sp" sp 2

     exit
     fi

#    sayMsg sp "FRT40[308]  \$1: '$1', \$2: '$2', \$3: '$3', \$4: '$4', \$5: '$5', \$6: '$6', \$7: '$8'" 1;
     sayMsg    "FRT40[309]  aCmd:  '${aCmd}', aCmd1: '${aCmd1}', aCmd2: '${aCmd2}', aCmd3: '${aCmd3}', aCmd0: '${aCmd0}', bDoit: '$bDoit', bDebug: '$bDebug', bQuiet: '$bQuiet' " -1  # .(20601.02.3 RAM Was bQuiet: '$c' ??)
#    sayMsg    "FRT40[310]  aCmd:  '${aCmd}', aCmd1: '${aCmd1}', aCmd2: '${aCmd2}', aCmd3: '${aCmd3}', aCmd0: '${aCmd0}'" -1

#    -- --- ---------------  =  ------------------------------------------------------  #  ---------------- #

    if [ "$3"     == "-du" ] || [ "$4"     == "-du" ] ; then bDoIt=1; bUpdate=1; else bUpdate=0; fi         # .(41115.02d.31)
#   if [ "$3" == "-ud" ] || [ "$4" == "-du" ] ; then bDoit=1; fi                                            ##.(41115.02d.32)
#   if [ "$3" == "-u"  ] || [ "$3" == "-du" ] || [ "$3" == "-ud" ]; then bUpdate=1; set -- "${@:1:2}" "${@:4}"; fi  ##.(41115.02d.33)
#   if [ "$4" == "-u"  ] || [ "$4" == "-du" ] || [ "$4" == "-ud" ]; then bUpdate=1; fi                      ##.(41115.02d.34)
#    sayMsg "FRT40[317]  \$1: '$1', \$2: '$2', \$3: '$3', \$4: '$4', \$5: '$5', \$6: '$6', \$7: '$8'" 1;

#    Help

#    getCmd    "he"             "Help"
     getCmd1   "doc"     ""     "DOC"     1                                                                 # .(21128.02.1)
     getCmd1   "proxy"   ""     "proX"                                                                      # .(20620.03.1 RAM).(20620.10.1 RAM was Proxy)(20622.2.5 RAM Beg Use getCmd1)

     getCmd1   "sho"     "por"  "porT"                                                                      # .(41203.06.5)
     getCmd1   "kil"     "por"  "porT"                                                                      # .(41203.06.6)
     getCmd1   "por"     ""     "porT"                                                                      # .(41203.06.7)

     getCmd1   "netr"    ""     "netR"  # 1                                                                 # .(41124.05.3)
     getCmd1   "dokr"    ""     "dokR"  # 1                                                                 # .(30716.01.7)
     getCmd1   "gitr1"   ""     "gitR1" # 1                                                                 # .(41026.06.1 RAM Add gitR1, my lastest)
     getCmd1   "gitr"    ""     "gitR2" # 1                                                                 # .(41026.06.2 RAM Add gitR2, the original).(20620.10.2 RAM was GitR)
     getCmd1   "keys"    ""     "keyS"  1                                                                   # .(20620.10.3 RAM was Keys)
     getCmd1   "appr"    "run"  "appR"                                                                      # .(20508.01.1 RAM)(20620.10.4 RAM was App)(20622.2.5 RAM End)
#    getCmd    "run"     "ap"   "appR"                                                                      # .(20508.01.2 RAM)(20620.10.5 RAM was App)
     getCmd1   "jpt"     ""     "JPT"   1                                                                   # .(21107.02.5)
     getCmd1   "rss"     ""     "JPT RSS"      1                                                            # .(21107.02.6)
     getCmd1   "rdir"    ""     "JPT RDir"     1                                                            # .(21107.02.7)
     getCmd1   "dirlist" ""     "JPT DirList"  1                                                            # .(21107.02.8)
     getCmd1   "dir"     ""     "JPT RDir"     1                                                            # .(21119.05.7)
     getCmd1   "set"     "var"  "Set Var"                                                                   # .(21120.03.2)
     getCmd1   "set"     "path" "Set Var"                                                                   # .(21120.03.2)
     getCmd1   "setpath" ""     "Set Var"   1                                                               # .(21120.03.3)
     getCmd1   "upd"     ""     "Update"    1                                                               # .(41107.01.4)
     getCmd1   "ins"     ""     "Install"   1                                                               # .(41111.01.4)
#    getCmd1   "ins"     "-df"  "Install"   1                                                               ##.(41115.02d.36)

#    -- --- ---------------  =  ------------------------------------------------------  #  ---------------- #

#    sayMsg    "FRT40[351]  aArg1: '$aArg1', aArg2: '$aArg2', aArg3: '$aArg3', aArg4: '$aArg4', aArg5: '$aArg5', aArg6: '$aArg6', aArg7: '$aArg7', aArg8: '$aArg8', aArg9: '$aArg9'" 1

#   if [ "$3"     == "-ud" ] || [ "$4"     == "-ud" ] || [ "$aArg3" == "-ud" ]; then bDoit=1; fi                                ##.(41115.02d.31)
    if [ "$3"     == "-ud" ] || [ "$4"     == "-ud" ] || [ "$bDoIt" == "1"   ]; then bDoit=1; fi                                # .(41115.02d.32)
    if [ "$aArg3" == "-ud" ] || [ "$aArg4" == "-ud" ]                         ; then bDoit=1; fi                                # .(41115.02d.33)

    if [ "$aArg4" == "-u"  ] || [ "$aArg4" == "-du" ] || [ "$aArg4" == "-ud" ]; then bUpdate=1; aArg4="";                   fi  # .(41115.02d.34)
    if [ "$aArg3" == "-u"  ] || [ "$aArg3" == "-du" ] || [ "$aArg3" == "-ud" ]; then bUpdate=1; aArg3="${aArg4}"; aArg4=""; fi  # .(41115.02d.35)

#    sayMsg    "FRT40[360]  aArg1: '$aArg1', aArg2: '$aArg2', aArg3: '$aArg3', aArg4: '$aArg4', aArg5: '$aArg5', aArg6: '$aArg6', aArg7: '$aArg7', aArg8: '$aArg8', aArg9: '$aArg9'" 1
     sayMsg sp "FRT40[361]  aCmd:  '${aCmd}', aCmd1: '${aCmd1}', aCmd2: '${aCmd2}', aCmd3: '${aCmd3}', aCmd0: '${aCmd0}', bDoit: '${bDoit}', bDebug: '${bDebug}', bQuiet: '${bQuiet}" -12

     Help ${aCmd0}

     sayMsg    "FRT40[365]  aCmd:  '${aCmd}', aArg1: '${aArg1}', aArg2: '${aArg2}', aArg3: '${aArg3}', aArg4: '${aArg4}', bDoit: '${bDoit}', bGlobal: '${bGlobal}'" -1
     sayMsg    "FRT40[366]  aCmd:  '${aCmd}', aArg1: '${aArg1}', aArg2: '${aArg2}', aArg3: '${aArg3}', bDoit: '${bDoit}', bUpdate: '${bUpdate}'" sp -1

#====== =================================================================================================== #  ===========

# ------------------------------------------------------------------------------------                      # .(21107.02.9 Beg RAM Added)
#
#>      JPT Commands
#
#====== =================================================================================================== #

#       sayMsg "FRT40[333]  JPT  Commands (${aArg2:0:3}); aCmd: '${aCmd}'" 1
#     echo "    FRT40[334]  JPT  Commands (${aArg2:0:3}); aCmd: '${aCmd}', \$@: [$@]"

     if [ "${aCmd:0:3}" == "JPT" ]; then

#       sayMsg "FRT40[291]  jpt: '${aArg1}' '${aArg2}' '${aArg3}' '${aArg4}', bDoit: '${bDoit}', bDebug: '${bDebug}', bQuiet: '${bQuiet}'" -1

#       aArgs="$( echo "$@" | tr '[:upper:]' '[:lower:]' )"                                                 #

        if [ "${aCmd}" ==  "JPT" ];         then aSubCmd=""; fi
#       if [ "${aCmd}" ==  "JPT RSS1" ];    then aSubCmd="rss"; fi                                          ##.(21119.05.1 RAM)
        if [ "${aCmd}" ==  "JPT RSS"  ];    then aSubCmd=""; fi                                             # .(21119.05.1 RAM)
        if [ "${aCmd}" ==  "JPT RDir" ];    then aSubCmd="rss rdir"; fi
        if [ "${aCmd}" ==  "JPT DirList" ]; then aSubCmd="rss dirlist"; fi
        if [ "${aCmd}" ==  "JPT RSS"  ] && [ "$#" == "1" ]; then aSubCmd="rss"; fi                          # .(21119.05.2)
#       if [ "$@" == "rss"            ];    then aSubCmd="rss"; fi                                          # .(21119.05.2)

        shift;
#       aJPT_dir="$( dirname $0 )";              echo "Before: '${aJPT_dir}'"                               # .(41026.05.1)
        aJPT_dir="$( dirname $0 )"; aJPT_dir="$( echo "${aJPT_dir}" | awk '{ sub( /FRT/,  "JPT"  ); sub( "/._2", "" ); print }' )" ##.(41026.05.2) .(41027.01.3)
        aJPT_dir="$( dirname $0 )"; aJPT_dir="$( echo "${aJPT_dir}" | awk '{ sub( /FRTs/, "JPTs" );                    print }' )" # .(41027.01.3)
#                                                echo "After:  '${aJPT_dir}/JPT00_Main0.sh'"; exit          # .(41026.05.3)

#       sayMsg     "FRT40[304]  JPT: JPT00_Main0.sh \"$@\"" 2
#       echo   "  - FRT40[305]  JPT: JPT00_Main0.sh   ${aSubCmd} \"$@\""; exit                              # .(41026.05.4)
#       echo   "  - FRT40[305]  JPT: ${aJPT_dir}/JPT00_Main0.sh ${aSubCmd} \"$@\""; exit                    # .(41026.05.5)

#       "$( dirname $0 )/../JPTs/JPT00_Main0.sh"  ${aSubCmd}  "$@"                                          ##.(41026.05.6)
#       "${aJPT_dir}/JPT00_Main0.sh"  ${aSubCmd}  "$@"                                                      # .(41026.05.6)
        "${aJPT_dir}/JPT30_Main0.sh"  ${aSubCmd}  "$@"                                                      # .(41028.01.1 RAM Was JPT00)

#       ${aLstSp};
        exit

     fi # eoc JPT Commands
#    -- --- ---------------  =  ------------------------------------------------------  #  ---------------- # .(21107.02.9 End)

#====== =================================================================================================== #  ===========

# ------------------------------------------------------------------------------------
#
#>      GITR Commands
#
#====== =================================================================================================== #

#       sayMsg "FRT40[377]  gitR Commands (${aArg2:0:3}); aCmd: '${aCmd}'" 1
#     echo "    FRT40[378]  gitR Commands (${aArg2:0:3}); aCmd: '${aCmd}', \$@: [$@]"

     if [ "${aCmd:0:4}" == "gitR" ]; then                                                                   # .(20429.03.2 RAM Add gitR Beg).(42026.01.x RAM Was just gitR)

        sayMsg "FRT40[339]  gitR:  '${aArg1}' '${aArg2}' '${aArg3}' '${aArg4}', bDoit: '${bDoit}', bDebug: '${bDebug}', bQuiet: '${bQuiet}'" -1
        aGitR_Ver="gitR1_p1.01"; if [ "${aArg1}" == "gitr2" ]; then aGitR_Ver="gitR2_p2.06"; fi             # .(41026.06.x)
#       sayMsg "FRT40[341]  gitR Script: $( dirname $0 )/gitR/FRT22_${aGitR_Ver}.sh" -1; exit               # .(41026.06.x)
        shift
# echo "$( dirname $0 )/gitR/FRT22_gitR1_p2.02.sh"  "${aArg1}" "${aArg2}" "${aArg3}" "${aArg4}"
#      "$( dirname $0 )/gitR/FRT22_gitR1_p2.02.sh"  "${aArg1}" "${aArg2}" "${aArg3}" "${aArg4}"
#      "$( dirname $0 )/gitR/FRT22_gitR1_p2.02.sh"  "$@"
# echo "$( dirname $0 )/gitR/FRT22_gitR1_d2.04.sh"  "$@"
#      "$( dirname $0 )/gitR/FRT22_gitR1_p2.04.sh"  "$@"                                                    # .(21027.04.2).(41028.01.2)
#      "$( dirname $0 )/gitR/FRT22_${aGitR_Ver}.sh" "$@"                                                    # .(41026.06.x)
#      "$( dirname $0 )/gitR/FRT42_${aGitR_Ver}.sh" "$@"                                                    # .(41028.01.2 RAM Was FRT22)
       "$( dirname $0 )/gitR/FRT42_gitR2.sh" "$@"                                                           # .(41028.01.12 RAM Was "gitR2_p2.06")

#       ${aLstSp}                                                                                           ##.(41203.04.1)
        exit
     fi # eoc gitR Commands                                                                                 # .(20429.03.2 End)
#    -- --- ---------------  =  ------------------------------------------------------  #  ---------------- #

#====== =================================================================================================== #  ===========

# ------------------------------------------------------------------------------------                      # .(41124.05.4)
#
#>      NETR Commands
#
#====== =================================================================================================== #

#       sayMsg "FRT40[407]  netR Commands ( ${aArg2} ${aArg3} ${aArg4} )" 1                                                # .(41124.05.5 RAM Add netR Beg)

     if [ "${aCmd}"     == "netR" ]; then

        sayMsg "FRT40[411]  netR: '${aArg1}' '${aArg2}' '${aArg3}' '${aArg4}', bDoit: '${bDoit}', bDebug: '${bDebug}', bQuiet: '${bQuiet}'" -1

        shift
        sayMsg "FRT40[414]  netR script: $( dirname $0 )/netR/FRT44_netR1.sh \"$1 $2 $3\"" -1;
       "$( dirname $0 )/netR/FRT44_netR1.sh"  "$1 $2 $3"

#       ${aLstSp}                                                                                           ##.(41203.04.2)
        exit
     fi # eoc netR Commands                                                                                 # .(41124.05.5 End)
#    -- --- ---------------  =  ------------------------------------------------------  #  ---------------- #
#====== =================================================================================================== #  ===========

# ------------------------------------------------------------------------------------                      # .(30716.01.8 Beg Add)
#
#>      DOKR Commands
#
#====== =================================================================================================== #

#       sayMsg "FRT40[429]  dokS Commands (${aArg1:0:3})"                                                   # .(20429.02.2 Beg RAM Added)

     if [ "${aCmd}"     == "dokR" ]; then

        sayMsg "FRT40[433]  dokR: '${aArg1}' '${aArg2}' '${aArg3}' '${aArg4}', bDoit: '${bDoit}', bDebug: '${bDebug}', bQuiet: '${bQuiet}'"
        sayMsg "FRT40[434]  dokR script: $( dirname $0 )/dokR/FRT25_dokR1.sh";                              # .(41026.04.2)

        shift
#      "$( dirname $0 )/dokR/FRT25_dokR1.sh"  "$@"                                                          ##.(41026.03.3 RAM Was FRT24).(41028.01.3)
       "$( dirname $0 )/dokR/FRT45_dokR1.sh"  "$@"                                                          # .(41028.01.3 RAM Was FRT25)

#       ${aLstSp}                                                                                           ##.(41203.04.3)
        exit
     fi # eoc keyS Commands                                                                                 # .(30716.01.8 End)
#    -- --- ---------------  =  ------------------------------------------------------  #  ---------------- #

#========================================================================================================== #  ===============================  #
# ------------------------------------------------------------------------------------
#
#>      KEYS Commands
#
#====== =================================================================================================== #

#       sayMsg "FRT40[452]  keyS Commands (${aArg1:0:3})"                                                   # .(20429.02.2 Beg RAM Added)

     if [ "${aCmd}"     == "keyS" ]; then

        sayMsg "FRT40[456]  keyS: '${aArg1}' '${aArg2}' '${aArg3}' '${aArg4}', bDoit: '${bDoit}', bDebug: '${bDebug}', bQuiet: '${bQuiet}'"

        shift
#      "$( dirname $0 )/keyS/FRT21_Keys1_p2.01.sh"  "$@"                                                    ##.(41028.01.4)
#      "$( dirname $0 )/keyS/FRT41_Keys1_p2.01.sh"  "$@"                                                    ##.(41028.01.4 RAM Was FRT21).(41028.01.14)
       "$( dirname $0 )/keyS/FRT41_Keys1.sh"  "$@"                                                          # .(41028.01.14 RAM Was FRT41_Keys1_p2.01.sh)

#       ${aLstSp}                                                                                           ##.(41203.04.4)
        exit
     fi # eoc keyS Commands                                                                                 # .(20429.02.2 End)
#    -- --- ---------------  =  ------------------------------------------------------  #  ---------------- #

#========================================================================================================== #  ===============================  #

# ------------------------------------------------------------------------------------
#
#>      APP Commands                                                                                        # .(20508.01.2 Beg RAM Put into seperate App script)
#
#====== =================================================================================================== #

#       sayMsg "FRT40[475]  appR Commands (${aArg1:0:3})"                                                   # .(20429.02.2 Beg RAM Added)

     if [ "${aCmd}"     == "appR" ]; then

        echo -e "\n* Not implemented yet\n"; exit                                                           # .(41028.01.x)

        sayMsg "FRT40[479]  appR:   '${aArg1}' '${aArg2}' '${aArg3}' '${aArg4}', bDoit: '${bDoit}', bDebug: '${bDebug}', bQuiet: '${bQuiet}'" 1

        shift
# echo "$( dirname $0 )/appR/FRT23_FRApp1_p1.06.sh"  "$@"                                                   ##.(20601.01.5)
#      "$( dirname $0 )/appR/FRT23_FRApp1_p1.06.sh"  "$@"                                                   ##.(20601.01.5)
#      "$( dirname $0 )/appR/FRT23_FRApp1_u1.07.sh"  "$@"                                                   ##.(20601.01.5 RAM Use u1.xx rather than p1.xx).(41028.01.5)
#      "$( dirname $0 )/appR/FRT47_FRApp1_u1.07.sh"  "$@"                                                   ##.(41028.01.5 RAM Was FRT23).(20601.01.5 RAM Use u1.xx rather than p1.xx).(41028.01.15)
       "$( dirname $0 )/appR/FRT47_FRApp1.sh"  "$@"                                                         # .(41028.01.15).(41028.01.5 RAM Was FRT23).(20601.01.5 RAM Use u1.xx rather than p1.xx)

#       ${aLstSp}                                                                                           ##.(41203.04.5)
        exit
     fi # eoc appR Commands                                                                                 # .(20429.02.2 End).(20508.01.2 End)
#    -- --- ---------------  =  ------------------------------------------------------  #  ---------------- #

#========================================================================================================== #  ===============================  #

# ------------------------------------------------------------------------------------
#
#>      PROXY Commands
#
#====== =================================================================================================== #

#    if [ "${1:0:3}" == "pro" ]; then                                                                       ##.(20429.02.2)
     if [ "${aCmd}"     == "proX" ]; then                                                                   # .(20429.02.2 RAM Beg Added)

        sayMsg "FRT40[503]  proX: '${aArg1}' '${aArg2}' '${aArg3}' '${aArg4}', bDoit: '${bDoit}', bDebug: '${bDebug}', bQuiet: '${bQuiet}'"

        echo -e "\n* Not implemented yet\n"; exit                                                           # .(41028.01.xx)
        shift
#      "$( dirname $0 )/proX/FRT24_Proxy_v1.06\`20620-1041.sh"  "$@"
#      "$( dirname $0 )/proX/FRT24_Proxy1_v1.07\`20620-1052.sh"  "$@"
#      "$( dirname $0 )/proX/FRT24_Proxy1_u1.07.sh"  "$@"                                                   ##.(41028.01.6)
#      "$( dirname $0 )/proX/FRT48_Proxy1_u1.07.sh"  "$@"                                                   ##.(41028.01.6 RAM Was FRT24).(41028.01.16)
       "$( dirname $0 )/proX/FRT48_Proxy1.sh"  "$@"                                                         # .(41028.01.16.(41028.01.6 RAM Was FRT24)

#       ${aLstSp}                                                                                           ##.(41203.04.6)
        exit
     fi # eoc proX Commands                                                                                 # .(20620.02.2 RAM End)
#    -- --- ---------------  =  ------------------------------------------------------  #  ---------------- #

#========================================================================================================== #  ===============================  #

# ------------------------------------------------------------------------------------
#
#>      PORT Commands                                                                                       # .(41203.06.8)
#
#====== =================================================================================================== #

#       sayMsg    "FRT40[554]  ${aCmd} Command" sp 1;

     if [ "${aCmd}" == "porT" ]; then                                                                       # .(41203.06.9 RAM Write ports command Beg)

#       sayMsg "FRT40[558]  proX: aArg1: '${aArg1}', aArg2: '${aArg2}', aArg3: '${aArg3}', aArg4: '${aArg4}', bDoit: '${bDoit}', bDebug: '${bDebug}', bQuiet: '${bQuiet}'" sp 1

        if [ "${aArg1:0:3}" == "sho" ]; then aCmd="show ports ${aArg2}"; fi
        if [ "${aArg1:0:3}" == "por" ]; then if [ "${aArg2:0:3}" == "kil" ]; then aCmd="kill port ${aArg3}"; else aCmd="show ports ${aArg3}"; fi; fi
        if [ "${aArg1:0:3}" == "kil" ]; then if [ "${aArg2:0:3}" == "por" ]; then aArg2="${aArg3}"; fi
                                             aCmd="kill port ${aArg2}"; fi
#       echo "    ${aCmd}"
        eval "JPT ${aCmd}"
#       echo -e "\n* Not implemented yet\n"; exit

#       ${aLstSp}
        exit
     fi # eoc porT Commands                                                                                 # .(41203.06.9 RAM End)
#    -- --- ---------------  =  ------------------------------------------------------  #  ---------------- #

#====== =================================================================================================== #  ===========

# ------------------------------------------------------------------------------------
#
#>      SET VAR PATH Command                                                                                # .(20102.01.2 Beg RAM Added Command)
#
#====== =================================================================================================== #

#       sayMsg    "FRT40[580]  ${aCmd} Command" sp 1;

  if [ "${aCmd}" == "Set Var" ]; then

# --------------------------------------------------------------------

#               aInfoScr="._2/JPTs/RSS/Info/RSS22_Info.sh"; bOK=0                                           ##.(21122.02.1 RAM Fix backsplashed).(40413.02.1)
#               aInfoScr="._2/JPTs/RSS/Info/RSS23_Info.sh"; bOK=0                                           # .(40413.02.1 RAM Change version)
                aInfoScr="._2/JPTs/RSS/Info/RSS23_Info.sh"; bOK=0                                           # .(41028.01.7 RAM Stayed the same)

  if [ "${aArg2}" == "path" ]; then
#       sayMsg    "FRT40[448]  SetVar" 1

     if [ -f "${aInfoScr}" ] && [ -d ".git" ]; then bOK=1; fi
     if [ "${bOK}" == "0" ]; then
        echo -e "  * You must be in the FRTools Repo folder. \n"; exit
        fi
        aPath1="$( pwd )/._2/bin";

        if [ "$3" == "-user" ] || [ "$4" == "-user"      ]; then aUser="-user"; fi                          # .(21126.08.2 RAM Blank if not passed)
        aShell="-bash";        if [ "${aOSv:0:1}" == "w" ]; then aShell="-sys"; fi                          # .(21129.07.2)
#                              if [ "${aOSv:0:1}" != "w" ]; then aUser="-bash"; fi                          # .(21203.05.1 RAM Can't be -user or -sys in Unix or GitBash ?? )

     if [ "${bDoit}" == "0" ] ; then

#       aBashrc=".bashrc";  if [ ! -f     "~/${aBashrc}" ]; then aBashrc="profile";  fi                      ##.(21121.03.9)
#       aBashrc=".bashrc";  if [ ! -f -a  "~/${aBashrc}" ]; then aBashrc="profile";  fi                      ##.(21121.03.9  RAM Use alternate hidden profile file).(21121.03.11)
#       aBashrc=".profile"; if [ ! -f -a  "~/${aBashrc}" ]; then aBashrc=".bashrc";  fi                      ##.(21121.03.11 RAM Use .profile if it exists).(21121.03.21)
#       aBashrc=".profile"; if [   -f -a   ~/.bashrc     ]; then aBashrc=".bashrc";  fi                      ##.(21121.03.21 RAM Good Grief).(21121.03.31)
        aBashrc=".bashrc";  if [   -f "$HOME/.profile"   ]; then aBashrc=".profile"; fi                      # .(21121.03.1 RAM More Good Grief).(41111.05.1 RAM -a is for AND, not all)

#       aWhere="the ~/${aBashrc} file"; if [ "${aOSv:0:1}" == "w" ]; then aWhere="the Windows System"; fi   ##.(21121.03.10).(21126.09.1)
        aWhere="${aOS} Shell"; if [ "${aOSv:0:1}" == "w" ]; then aWhere="Windows System Environment"; fi    # .(21121.03.10).(21126.09.1)
        if [ "${aUser}" == "-user" ]; then aWhere="Windows User Environment"; aShell="-user"; fi            # .(21126.08.11).(21129.07.2)

        echo -e "\n    The Path to FRTools will be set in the ${aWhere} with: RSS Info Path Add \"{Path}\" ${aUser}"

                    "${aInfoScr}" path add "${aPath1}" "${aUser}"                                           # .(21126.08.3)

        if [ "$?" != "1" ]; then echo -e "\n    Add -doit to the command line to add the path to FRTools."; fi

        bOK=1; ${aLstSp}; exit                                                                              # .(41203.05.1
        fi # eif not bDoit
#       --------------------------------------------------------

     if [ "${bDoit}" == "1" ] ; then

#          echo       "${aInfoScr}" path add -doit "${aPath1}" "aUser: '${aUser}'"; #  exit                 #
    export bQuiet=1;  "${aInfoScr}" path add -doit "${aPath1}" "${aUser}"                                   # .(21126.08.4).(21127.07.03)

           if [ "$?" == "1" ]; then ${aLstSp}; exit; fi                                                     # .(21122.01.5 if no change to path)

#          aPath2="$( "${aInfoScr}" path show "\._2"         )"                                             ##.(21126.01.1)
#          aPath2="$( "${aInfoScr}" path show "FRTools" -sys )"                                             ##.(21126.01.1 RAM Need to check SYSTEM paths).(21129.07.3)
#          aPath2="$( "${aInfoScr}" path show "FRTools" "${aShell}" )" | awk 'NR == 2'                      # .(21129.07.3 RAM Need to check $aShell paths)
           aPath2="$( "${aInfoScr}" path show "FRTools" "${aShell}" )"                                      # .(21129.07.3 RAM Need to check $aShell paths)
#          echo " aOSv: '${aOSv}' '${aOSv/w}', aShell; '${aShell}' aPath2: '${aPath2}'";                    # Includes leaning CR
   if [ "${aPath2}" != "" ]; then
   if [ "${aPath1}" == "${aPath2:4}" ]; then exit; fi                                                       # .(21129.07.4 RAM Tif no change to path ?? see .(21122.01.5 above)

#          echo " ls -1 \"${aPath1/bin/CMDs}\""
#                 ls -1 "${aPath1/bin/CMDs}"
#          echo " aOSv: '${aOSv}' '${aOSv/w}', aShell; '${aShell}' aPath2: '${aPath2:6:1}'";
#          echo "cp -p \"${aPath1/bin/CMDs}/\"*"  \"${aPath1}/\""; exit

        if [ "${aOSv/w}" == "${aOSv}" ]; then  # Unix                                                       # .(21203.06.1 RAM Beg Copy Uppercase bin files in Linux)
#          echo "--- let's copy CMDs for aUser: '${aUser}' and or '${aShell}', aOSv: '${aOSv}'";

                 cp  -p "${aPath1/bin/CMDs}/"*  "${aPath1}/"  >/dev/null                                    # .(21203.06.2 RAM "${aPath1/bin/CMDs}/*" no workie)
           fi                                                                                               # .(21203.06.1 RAM End)
        if [ "${aPath2:6:1}" == "*" ]; then aPath2="        ${aPath1}"; fi                                  # .(21203.05.2)

#          aToDo="restart this session"; if [ "${aOSv:0:1}" == "w" ]; then aToDo="login again"; fi          ##.(21126.09.2).(21126.09.5)
           aToDo="login again";          if [ "${aOSv:0:1}" == "g" ]; then aToDo="restart this session"; fi # .(21126.09.5)
                 if [ "${aOSv/w}" != "${aOSv}" ]; then  echo ""; fi # Windows                               # .(21203.06.3 RAM Why??)
                 echo "    The Path to FRTools has been set to:"; echo "              '${aPath2:8}'."
                 echo ""
                 echo "  * Please ${aToDo} for the Path to take effect."                                    # .(21126.09.3)
      else
        echo -e     "\n    The Path to FRTools has not been set."
        fi
        bOk=1: ${aLstSp}; exit                                                                              # .(41203.05.2).(21127.08.1)
        fi # eif bDoit

     fi # eoc set path
#       --------------------------------------------------------

        sayMsg    "FRT40[609]  set var path ${aArg2} '${aArg3}' '${aArg4}'" sp -1;

  if [ "${aArg2}" == "path" ]; then                                                                         # .(21120.03.6 RAM Beg ?? Why here s.b. rss info var set aVar aVal)
       "${aInfoScr}" vars set -doit "${aArg3}" "${aArg4}"
        bOk=1: ${aLstSp}; exit                                                                              # .(41203.05.3)

     fi # eoc set var
#       --------------------------------------------------------

     if [ "${bOK}" != "1" ]; then                                                                           # .(41203.05.4)
        echo -e "* The only valid command is: frt var path. (And I don't know if it works)"                 # .(41203.05.5)
        ${aLstSp}; exit                                                                                     # .(41203.05.6)
        fi
     fi # eoc set                                                                                           # .(20102.01.2 RAM End)
#    -- --- ---------------  =  ------------------------------------------------------  #  ---------------- #

#====== =================================================================================================== #  ===========

# ------------------------------------------------------------------------------------
#
#>      UPDATE Command                                                                                      # .(41107.01.5 RAM Beg Add Update Command Beg)
#
#====== =================================================================================================== #

#       sayMsg   "FRT40[625]  Update Command" 1;

  if [ "${aCmd}" == "Update" ]; then

        sayMsg    "FRT40[628]  Update:   '${aArg1}' '${aArg2}' '${aArg3}' '${aArg4}', bDoit: '${bDoit}', bDebug: '${bDebug}', bQuiet: '${bQuiet}'" -1
        aProject_dir="$( dirname $0 )"; aProject_dir="${aProject_dir%%/._2*}"                               # .(41123.04.1)
        cd "${aProject_dir}"                                                                                # .(41123.04.3 RAM Was $(dirname $0)).(41123.04.2 RAM Use correct repo dir)
#       echo "pwd: $( pwd )"; exit
        aBranch="$( git symbolic-ref --short HEAD )"                                                        # .(41107.01.6)
  if [ "${bDoit}" != "1" ]; then                                                                            # .(41123.04.11 RAM Account for bDoit Beg)
        aArgs="$( echo "${aBranch} $2 $3 $4 $5 -doit" | awk '{ gsub( / +/, " " ); print }' )"
        echo -e "\n  About to update FRT in ${aProject_dir}."; # exit
        echo "      gitR update ${aArgs}"
        gitr update ${aBranch} $2 $3 $4 $5
      else
        echo -e "\n  Updating FRT in ${aProject_dir}."; # exit                                              # .(41123.04.11 RAM Move to here End)
        sayMsg "FRT40[635]  gitR \" ${aBranch} $2 $3 $4 $5\"" -1;
        gitr update ${aBranch} $2 $3 $4 $5                                                                  # .(41123.04.12).(41123.04.4 RAM Use gitr update)
        fi                                                                                                  # .(41123.04.13)

#       ${aLstSp}                                                                                           ##.(41203.04.7)
        exit
     fi # eoc Update Command                                                                                # .(41107.01.5 End)
#    -- --- ---------------  =  ------------------------------------------------------  #  ---------------- #

#====== =================================================================================================== #  ===========
#>      INSTALL Command                                                                                     # .(41111.01.5 RAM Add Install Command beg)
#====== =================================================================================================== #

        sayMsg    "FRT40[741]  Install Command" -1;

  if [ "${aCmd}" == "Install" ]; then

function Sudo() {
#       echo "   sudo[1] \${OS:0:7}: '${OS:0:7}'"
        if [[ "${OS:0:7}" != "Windows" ]]; then if [ "${USERNAME}" != "root" ]; then sudo "$@"; fi; fi
#                sudo "$@"; echo "sudo[2]  sudo \"$@\""; fi; fi                         ##.(41113.01.1)
        }
#       ---------------------------------------------------------------------
function copyFile() {                                                                   # .(41111.04.1 RAM Write copyFile Beg)
        git checkout "$3"                                        >/dev/null 2>&1        # Switch to master branch
        git checkout "$1" -- "$2"                                >/dev/null 2>&1        # Get file from ALTools branch
        Sudo chmod 775 "$2"; aTS="$( date +%y%m%d )"; aTS="${aTS:1}"                    # .(41113.01.2).(41112.06.1)
        git add "$2"                                             >/dev/null 2>&1        # Add and commit in master
        git commit -m ".(${aTS}.03_Add file, $2, from $1 branch" >/dev/null 2>&1        # Commit it
        git checkout "$1"                                        >/dev/null 2>&1        # Switch back to ALTools
        echo -e "\n  Copied file $2 to branch $1"                                       # .(41112.06.2)
        }                                                                               # .(41111.04.1 End)
#       copyFile "ALTools" "run-anyllm.sh" "master"
#       ---------------------------------------------------------------------

        sayMsg    "FRT40[764]  Install: aArg2: '${aArg2}', aArg3: '${aArg3}', bDoit: '${bDoit}', bDebug: '${bDebug}', bUpdate: '${bUpdate}'" -1

#       ---------------------------------------------------------------------
#       if [ "${aArg1}" == "install" ]; then                                                                # .(41124.02.2)

        if [ "$aArg2" == "help"    ]; then aArgs="help"; else aArgs=""; fi                                  # .(41124.02.3 RAM Add install that runs set-frtools.sh Beg)
        if [ "$aArg2" == "show"    ]; then aArgs="show"; fi
        if [ "$aArg2" == "doit"    ]; then aArgs="doit"; fi
        if [ "$aArg2" == "scripts" ]; then aArgs="scripts ${aArg3}"; fi
        if [ "$aArg2" == "profile" ]; then aArgs="profile ${aArg3}"; fi
        if [ "$aArg2" == "wipe" ]; then aArgs="wipe ${aArg3}"; fi
        if [ "${aArg2}" == "" ] || [ "${aArgs}" != "" ]; then
#       echo -e "\n* Please provide repo to install, e.g. ALTools or AIDocs."                               # .(41124.02.4)
        aDir="$( dirname $0 )"; cd "${aDir%%/._2*}";
        ./set-frtools.sh "${aArgs}"
        if [ "${aArgs}" == "" ]; then
        if [ "${OS:0:7}" == "Windows" ]; then echo ""; fi ;
        echo "  You can also install a repo, e.g. ALTools or AIDocs."; ${aLstSp}; fi
        exit
        fi #  ${aArg2}" == ""                                                                               # .(41124.02.3 End)
#       ---------------------------------------------------------------------

        if [ "${aArg2}" == "aidocs" ]; then                                                                 # .(41124.03.1 RAM Add install aidocs Beg)

            aBranch=""; if [ "${aArg3}" != "" ]; then aBranch=" ${aArg3}"; fi                               # .(41201.04.1 RAM Clarity)
        if [ "${bDoit}" != 1 ]; then
            echo -e "\n  About to install AIDocs"
            echo "    gitr clone aidocs no-stage${aBranch} -d"                                              # .(41201.04.2 RAM Add aBranch)
            ${aLstSp}; exit
            fi
            echo -e "\n  Installing AIDocs"
            gitr clone aidocs no-stage ${aBranch} -d                                                        # .(41201.04.3)
            if [ "${OS:0:7}" != "Windows" ]; then sudo find . -type f -name "*.sh" -exec chmod 755 {} +; fi # .(41201.04.4)
#           ${aLstSp}; exit
            exit
        fi # eif install aidocs                                                         # .(41124.03.1 End)

#       ---------------------------------------------------------------------

        if [ "${aArg2}" == "altools" ]; then

#          aBranch=""; if [ "${aArg3}" != "" ]; then aBranch=" ${aArg3}"; fi                                ##.(41201.04.5 RAM Clarity)

#       sayMsg    "FRT40[807]  Install: aArg2: '${aArg2}', aArg3: '${aArg3}', bDoit: '${bDoit}', bUpdate: '${bUpdate}'" 1  # .(41115.02d.37 RAM Do Update ALTools)

#                                     aProjectStage="AnyLLM_prod1-master"
                                      aProjectStage="AnyLLM"                                                # .(41201.03.5 )
        if [ "${aArg3}" != "" ]; then aProjectStage="${aArg3}"; fi
                                      aProjectStage="${aProjectStage//anyllm/AnyLLM}"                       # .(41115.02d.38 RAM Change to Uppercase)
#                                else aProjectStage="$( pwd )"; aProjectStage="${aProjectStage##/}"; fi
        if [ -d "../${aProjectStage}" ]; then cd ../${aProjectStage}; fi
        if [ -d    "${aProjectStage}" ]; then cd    ${aProjectStage}; fi
#                                     aProjectStage="$( pwd )"; aProjectStage="${aProjectStage##/}"; fi
                                      aDir="$( pwd )"; aDir="${aDir##*/}"; aDir="${aDir//anyllm/AnyLLM}"    # .(41115.02d.38 RAM Change aDir to Uppercase)
#       sayMsg    "FRT40[818]  aProjectStage: '${aProjectStage}' aDir: '${aDir}'" 1
#       sayMsg    "FRT40[819]  aProjectStage: '${aProjectStage/${aDir}/}' aDir: '${aDir}'" 1
#       sayMsg    "FRT40[820]  install altools aProjectStage: '${aProjectStage}', bDoit: '${bDoit}', bUpdate: '${bUpdate}'" 1

#       if [ "${aDir}" != "${aProjectStage}" ]; then
        if [ "${aProjectStage/${aDir}/}" == "${aProjectStage}" ]; then                                      # .(41115.02d.39 RAM Lowest sub-folder only)
            echo -e "\n* The folder for ${aProjectStage}, does not exist. Can't install ALTools."           # .(41124.04.1)
            ${aLstSp}; exit
            fi # aDir != aProjectStage

            aBranch=$( git branch | grep "altools" )                                                        # .(41124.04.2 RAM Check if ALTools exists Beg)
        if [ "${aBranch}" != "" ] && [ "${bUpdate}" != "1" ]; then                                          # .(41115.02e.1 RAM Add bUpdate != 1)
            echo -e "\n* The branch, 'altools', for ${aProjectStage} already exists. Use frt update altools."
            ${aLstSp}; exit
            fi # aBranch altools exists                                                                     # .(41124.04.2 End)

            aVerb="Install"; if [ "${bUpdate}" == "1" ]; then aVerb="Update"; fi                            # .(41115.02d.40)
         if [ "${bDoit}" != 1 ]; then
            aTS="$( date +%y%m%d )"; aTS="${aTS:1}";
            echo -e "\n  About to ${aVerb} ALTools with these commands. Add -d to doit\n"                   # .(41115.02d.41)

          if [ "${bUpdate}" == "1" ]; then                                                                  # .(41115.02e.2)
                                             echo "    git fetch ALTools_prod1"                             # .(41115.02e.3)
                                             echo "    git reset --hard ALTools_prod1/ALTools"              # .(41115.02e.4)
            else                                                                                            # .(41115.02e.5)
            if [ "${bUpdate}" != "1" ]; then echo "    gitr remote add ALTools_prod1-robin -d";          fi # .(41115.02d.42)
                                             echo "    git fetch ALTools_prod1"
                                             echo "    git checkout -b altools"
                                             echo "    git checkout ALTools_prod1/ALTools -- ."
#                                            echo "    git commit -m \".(${aTS}.02_Added ALTools files\""   ##.(41115.02d.43)
              fi                                                                                            ##.(41115.02e.6)
                                             echo "    gitr add commit -m \"${aVerb} ALTools files\"";   fi # .(41115.02d.44)
                                             echo "    copyFile \"ALTools\" \"run-anyllm.sh\" \"master\""
            if [ "${bUpdate}" != "1" ]; then echo "    ./set-anyllm.sh doit" ;                           fi # .(41115.02d.45)
            if [ "${bUpdate}" != "1" ]; then echo -e "\n  The command, anyllm, will also be installed."; fi # .(41115.02d.46)
            ${aLstSp}; exit
            fi # bDoit == 0
#           -------------------------------------------------------------------------------------

         if [ "${bDoit}" != 1 ]; then

            echo -e "\n  ${aVerb}ing ALTools in ${aProjectStage}."                                          # .(41115.02d.47)
       # 1. Make sure you're starting clean
            git checkout master                                  >/dev/null 2>&1;                           # get into Anything-LLM's master branch

                bNoFilesInWork="$( git status -u --short | awk '/working tree clean/ { print "1" }' )"      # .(41129.02.1) # should show clean working tree
        if [ "${bNoFilesInWork}" != "1" ]; then
#           echo -e "\n* The branch 'master', in ${aProjectStage}, has uncommitted files."                  # .(41125.03.1 RAM Stash em Beg)
            aNum="$(git status -u --short | wc -l)"; s="s"; if [ "${aNum// /}" == "1" ]; then s=""; fi      # .(41204.01.1).(41129.02.2 RAM Get all working files)
            echo -e "\n* The branch, 'master', has ${aNum// /} uncommitted file${s}, that are being stashed."
#           shoWorkingFiles
            aTS=$(date +%y%m%d.%H); aTS="${aTS:1}"
            git stash push -u -m ".(${aTS} Stash of ${aNum// /} file${s}";                                  # .(41125.03.1 End )
            ${aLstSp}; # exit                                                                               # .(41125.03.2 RAM Don't Exit )
            fi # eif bNoFilesInWork

#               bNoRemoteName="$( git remote | awk '/anyllm_prod1/  { a=1 }; END { print a ? a : "0" }' )"  # should have remote allm_prod1
                bNoRemoteName="$( git remote | awk '/ALTools_prod1/ { a=1 }; END { print a ? a : "0" }' )"  # should have remote ALTools_prod1
        if [ "${bNoRemoteName}" == "0" ]; then
            gitr remote add ALTools_prod1-robin -d                                                          # add it if not there
            fi # eif bNoRemoteName == 0

       # 2. Create your branch with your 22 files
            echo -e "\ngit fetch ALTools_prod1";                                                            # .(41112.04.1 )
            git fetch ALTools_prod1                          2>&1 | awk '{ print "  " $0 }'                 # create your branch

          if [ "${bUpdate}" == "1" ]; then                                                                  # .(41115.02e.7)

            echo -e "\ngit reset --hard ALTools_prod1/ALTools"; aTS="$( date +%y%m%d )"; aTS="${aTS:1}"     # .(41115.02e.8)
            git reset --hard ALTools_prod1/ALTools                                                          # .(41115.02e.9)
            else                                                                                            # .(41115.02e.10)
            echo -e "\ngit checkout -b altools"; aTS="$( date +%y%m%d )"; aTS="${aTS:1}"
            git checkout -b altools                          2>&1 | awk '{ print "  " $0 }'                 # create your branch

            echo -e "\ncheckout ALTools_prod1/ALTools -- .";
            git checkout ALTools_prod1/ALTools -- .          2>&1 | awk '{ print "  " $0 }'                 # get your 22 files
            fi                                                                                              ##.(41115.02e.11)

            rm  ALTools_prod1-robin.code-workspace                                      # .(41113.01.3 RAM Was: AnyLLM_; Erase corrent VSCode workspace file )

#           echo -e "\ncommit -m \"${aTS}.02_Added ALTools files\"";                                        ##.(41115.02d.48)
#           git commit -m ".(${aTS}.02_Added ALTools files" 2>&1 | awk '{ print "  " $0 }'                  ##.(41115.02d.48 RAM Commit them)
            gitr add commit -m "${aVerb} ALTools files";   fi                                               # .(41115.02d.48)

            copyFile "ALTools" "run-anyllm.sh" "master"                                 # .(41111.04.2 RAM Use it to copy anyllm command to master so that it is always available)

       # 3. Run set-anyllm.sh
            if [ "${bUpdate}" != "1" ]; then                                                                # .(41115.02d.49)
            Sudo chmod 755 *.sh
            echo -e   "\n./set-anyllm.sh";                                              # .(41113.01.4 RAM Remove leading spaces)
                          ./set-anyllm.sh doit
            echo -e   "\nanyllm help";                                                  # .(41113.01.5)
                           anyllm
            fi                                                                                              # .(41115.02d.50)
       # 4. Now you can switch between branches:
#           git checkout master       # original 768 Anything-LLM files
#           git checkout ALTools     # 768 files plus your 22 changes

        ${aLstSp}; exit;
        fi # eif install altools

        echo -e "\n* Please provide a valid repo to install, e.g. ALTools or AIDocs."                       # .(41124.04.3)

        ${aLstSp}; exit
     fi # eoc Install Command                                                                               # .(41111.01.5 End)
#    -- --- ---------------  =  ------------------------------------------------------  #  ---------------- #

#====== =================================================================================================== #  ===========

# ------------------------------------------------------------------------------------
#
#>      NEXT COMMAND                                                                                        # .(20102.01.2 Beg RAM Added Command)
#
#====== =================================================================================================== #

        sayMsg    "FRT40[698]  Next Command" sp;

  if [ "${aCmd}" == "Next Command" ]; then

        sayMsg    "FRT40[702]  Next Command" 1

     ${aLstSp}
     fi # eoc Next Command                                                                                  # .(20102.01.2 End)
#    -- --- ---------------  =  ------------------------------------------------------  #  ---------------- #

#====== =================================================================================================== #  ===========

# ------------------------------------------------------------------------------------
#
#       END
#
#========================================================================================================== #  ===============================  #
#*\
##SRCE     +====================+===============================================+
##RFILE    +====================+=======+===================+======+=============+
#*/
