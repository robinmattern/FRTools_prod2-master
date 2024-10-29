#!/bin/bash
#*\
##=========+====================+================================================+
##RD         RSS Launcher       | Robin's Shell Scripts Command Launcher
##RFILE    +====================+=======+===================+======+=============+
##FD    RSS1-Main1.sh           |  11798|  3/15/19 10:30:00a|   178| v1.8.90315.01
##DESC     .--------------------+-------+-------------------+------+------------+
#
#
##LIC      .--------------------+----------------------------------------------+
#            Copyright (c) 2018 SicommNet-JSW * Released under
#            MIT License: http://www.opensource.org/licenses/mit-license.php
##FNCS     .--------------------+-------+-------------------+------+-----------+
#
##CHGS     .--------------------+-------+-------------------+------+-----------+
# .(80920.02  9/16/18 RAM  3:26p| Change filename structure
# .(80923.01  9/23/18 RAM  8:50p| Change JPT to RSS
# .(80923.03  9/23/18 RAM  9:50a| Change FileList version to v1.5.80923
# .(81007.01 10/07/18 RAM  2:00a| Add DirList
# .(81007.02 10/07/18 RAM  2:00a| Hardcode Main2Fns_v{YMMDD}.sh
# .(81014.01 10/07/18 RAM  9:30a| Modified aVnTS to be aVTS2 and aVTS2
# .(81216.01 12/16/18 RAM  8:45p| Add rss net
# .(90315.01  3/15/19 RAM 10:30a| Add rss zip
# .(90315.02  3/15/19 RAM 10:30a| Use 1.5.90315 of RSS1-Main2Fns.sh
# .(90315.03  3/15/19 RAM 11:15a| Enabled rss dirlist and use latest vesion
# .(90315.04  3/15/19 RAM 13:15a| Allow bQuiet and bTest to be set by calling script
# .(90622.01  6/22/19 RAM  1:45p| Change Help Title
# .(91221.01 12/21/19 RAM 11:30p| Change Lib to be RSS1 or RSS2
# .(00421.01  4/21/20 RAM 11:15a| Cleanup
# .(00421.02  4/21/20 RAM 11:15a| Add Job and Process cmds
# .(00425.02  4/25/20 RAM  3:05a| Add setTime

##PRGM     +====================+===============================================+
##ID 69.600. Main               |
##SRCE     +====================+===============================================+
#*/
#    LIB="RSS"; LIB_LOG=${LIB}_LOG; LIB_USER=${LIB}_USER; Lib=${LIB}                                      # .(80923.01.1 RAM)
     LIB="RSS"; LIB_LOG=${LIB}_LOG; LIB_USER=${LIB}_USER; Lib=${LIB}2                                     # .(91221.01.1 RAM)

     aFldr=$( echo $0 | awk '{ gsub( /[//\\][^//\\]*$/, ""    ); print }' ); # aFldr=${aFldr}/../${Lib}s  # .(81002.07.1 RAM Override path)

#    aVnTS=$( echo $0 | awk '{ gsub( /.+[-_]v|\.[^.]+$/,   "" ); print }' );   aVnTS="1.5.80925"          ##.(81002.07.2 RAM Hardcode version, v1.3.80916.2301).(81014.01.1)
     aVTS1=$( echo $0 | awk '{ gsub( /.+[-_]v|\.[^.]+$/,   "" ); print }' );   aVTS2="1.5.90315" #=$aVTS1 # .(90315.02.1 RAM)

#    aFns=${aFldr}/${Lib}1-Main2Fns_v${aVnTS}.sh;  source "${aFns}"; # echo "# aFns: ${aFns}";            ##.(80920.02.1 RAM Require "${LIB}-main2Fns.sh").(81014.01.1
#    aFns=${aFldr}/${Lib}1-Main2Fns_v${aVTS2}.sh;  source "${aFns}"; # echo "# aFns: ${aFns}";            # .(81014.01.1 RAM)
     aFns=${aFldr}/${Lib}-Main2Fns_v${aVTS2}.sh;   source "${aFns}"; # echo "# aFns: ${aFns}";            # .(91221.01.2 RAM)

# +------- +------------------ +----------------------------------------------------------- # ------------+ ------------------- # --------------+

          aCmd=; bTest=0; bQuiet=1

  if [ "$1"      == "-test"   ]; then                         bTest=1;           shift;     fi
  if [ "$1"      == "-noisy"  ]; then                         bTest=1; bQuiet=0; shift;     fi
  if [ "$1"      == "-debug"  ]; then                         bTest=1; bQuiet=0; shift;     fi
  if [ "$1"      == "source"  ]; then if [ "$2" != "" ]; then bTest=1;           shift; fi; fi
  if [ "$1"      != ""        ]; then aCmd=$1;        fi
  if [ "${aCmd}" == ""        ]; then aCmd=help;      fi

  if [ "${aCmd}" == "dir"     ]; then if [ "$2" == "list" ]; then aCmd="dirlist"; shift; shift; fi; fi
  if [ "${aCmd}" == "dl"      ]; then aCmd="dirlist"; shift; fi
  if [ "${aCmd}" == "du"      ]; then aCmd="dirlist"; shift; fi
  if [ "${aCmd}" == "dirlist" ]; then aCmd="dirlist"; shift; fi                             # .(90315.03.1 RAM Add rss dirlist)

#    aOSv=gfw1 | w10p | w08s
#    aOSv=rh62 | rh70 | uv14 | ub16

     setOS

     Begin "$@"

# ----------------------------------------------------------------------------------------------------

function Help() {

     echo ""
     echo "  Robin's Shell Script Tools            v${aVTS1}"                                               # .(90622.01.1 RAM Added "Tools")
     echo "  ------------------------------------  ---------------------------------"
     echo "    $LIB Dir      {Dir} {FileSearch}     List or Find files"
     echo "    $LIB Dir List {Dir} {Lv} {Typ}       List Directory Counts (see: dirlist -help)"
     echo "    $LIB Net                             Set Up Network"
     echo "    $LIB Info                            Set and Show Info"
     echo "    $LIB [Cron|Jobs]                     Show crontab jobs"                              # .(00421.02.5)
     echo "    $LIB [Cron|Jobs] edit                Edit crontab jobs"                              # .(00421.02.6)
     echo "    $LIB Processes [-n top]              Show top -n processes sorted by memory usage"   # .(00421.02.4 RAM Move from SCN)
     echo "    $LIB makSH                           Make a Shell script"
     echo "    $LIB setTime                         Set Time to NTP Sync"                           # .(00425.02.1)
     echo "    $LIB Zip      {Dir}                  Archive a directory into ../_/ZIPs"
     echo "    $LIB source   {Cmd}                  Check command file locations"
     echo "    $LIB version  {Cmd}                  Show $LIB version or source script"
     echo "    $LIB -test    {Cmd}                  Test $LIB {Cmd}"
     echo "    $LIB -debug   {Cmd}                  Debug $LIB"
     echo ""
     exit
     }
  if [ "${aCmd}"  == "help" ]; then Help;    fi

#+-------- +-- 21. RSS filelist -- +--------------------------------------------------------------- # ----------+

  if [ "${aCmd}" == "dir" ]; then
                               LIB_FileList=FileList/${LIB}21-FileList
     Run  0x ""                         rdir-v1.3.80119          #                 {Drv1}/Home/_0/bin/rdir-v1.3.80119
     Run  1c "home/SCN2"     ${LIB_FileList}.sh                  #  {Drv1}/home/robin/_1/RSSs/fileList/RSS21-fileList.sh    # .(81020.05.1 RAM Beg Use Default Version)
     Run  1r "home/Robin"    ${LIB_FileList}.sh                  #  {Drv1}/home/robin/_1/RSSs/fileList/RSS21-fileList.sh
     Run  1d "home/SCN2"     ${LIB_FileList}.sh                  #  {Drv1}/home/SCN2/_1/RSSs/fileList/RSS21-fileList.sh
     Run  1d "home/Robin"    ${LIB_FileList}.sh                  #  {Drv1}/home/robin/_1/RSSs/fileList/RSS21-fileList.sh
     Run  1m "U06/SCN2"      ${LIB_FileList}.sh                  #  {Drv2}/U06/SCN2/_1/RSSs/fileList/RSS21-fileList.sh
     Run  1n "U06/SCN2"      ${LIB_FileList}.sh                  #  {Drv2}/U06/SCN2/_1/RSSs/fileList/RSS21-fileList.sh      # .(90315.03.2 RAM)
     Run  7  "robin"         ${LIB_FileList}.sh                  #       {VOL1}/robin/_1/RSSs/fileList/RSS21-fileList.sh
     Run  8  "SCN2"          ${LIB_FileList}.sh                  #       {VOL2}/SCN2/_1/RSSs/fileList/JPT21-fileList.sh
     Run  9x "home"          ${LIB_FileList}.sh                  #       {VOL2}/home/_0/RSSs/fileList/RSS21-fileList.sh     # .(81020.05.1 RAM End Use Default Version)

#    Run  0x ""                         rdir-v1.3.80119          #                 {Drv1}/Home/_0/bin/rdir-v1.3.80119
##   Run  1c "home/SCN2"     ${LIB_FileList}_v1.5.80923.sh       #  {Drv1}/home/robin/_1/RSSs/fileList/RSS21-fileList_v1.4.80916.sh  ##.(81020.05.1)
#    Run  1c "home/SCN2"     ${LIB_FileList}.sh                  #  {Drv1}/home/robin/_1/RSSs/fileList/RSS21-fileList.sh             # .(81020.05.1)
#    Run  1r "home/Robin"    ${LIB_FileList}_v1.4r.80916.sh      #  {Drv1}/home/robin/_1/RSSs/fileList/RSS21-fileList_v1.4r.80916.sh
#    Run  1d "home/SCN2"     ${LIB_FileList}_v1.5.80923.sh       #  {Drv1}/home/SCN2/_1/RSSs/fileList/RSS21-fileList_v1.5.80923.sh   # .(80923.03.2)
#    Run  1d "home/Robin"    ${LIB_FileList}_v1.5.80923.sh       #  {Drv1}/home/robin/_1/RSSs/fileList/RSS21-fileList_v1.5.80923.sh  # .(80923.03.1)
#    Run  1m "U06/SCN2"      ${LIB_FileList}_v1.5.80923.sh       #  {Drv2}/U06/SCN2/_1/RSSs/fileList/RSS21-fileList_v1.5.80923.sh    # .(80923.03.1)
#    Run  7  "robin"         ${LIB_FileList}_v1.4.80916.sh       #       {VOL1}/robin/_1/RSSs/fileList/RSS21-fileList_v1.4.80916.sh
##   Run  8  "robin"         ${LIB_FileList}_v1.4.80916.sh       #       {VOL2}/robin/_1/RSSs/fileList/RSS21-fileList_v1.4.80916.sh  ##.(80923.03.3)
#    Run  8  "SCN2"          ${LIB_FileList}.sh                  #       {VOL2}/SCN2/_1/RSSs/fileList/JPT21-fileList_v1.5.80923.sh   # .(80923.03.3)
#    Run  9x "home"          ${LIB_FileList}_v1.4.80916.sh       #       {VOL2}/home/_0/RSSs/fileList/RSS21-fileList_v1.4.80916.sh

#    Run  0  ""                bin/rdir                          #                 {Drv1}/Home/_0/bin/rdir
#    Run  0  ""                bin/rdir-v1.3.80119               #                 {Drv1}/Home/_0/bin/rdir-v1.3.80119
#    Run  1  "home/robin"       RSS_Dir.sh                       #          {Drv1}/home/robin/_1/RSSs/RSS_Dir.sh
#    Run  1  "home/robin"      bin/rdir-v1.4.80730.sh            #      {Drv1}/home/robin/_1/JSHs/bin/rdir-v1.4.80730.sh
#    Run  1r "home/robin"      RSS21_fileList-v1.4r.80916.sh     #  {Drv1}/home/robin/_1/RSSs/RSS21_fileList-v1.4r.80916.sh
#    Run  1d "home/JSW"        RSS_FileList-v1.4.80916.sh        #  {Drv1}/home/JSW/_1/RSSs/RSS_FileList-v1.4.80916.sh
#    Run  7  "robin"           RSS_FileList-v1.4.80916.sh        #       {VOL1}/robin/_1/RSSs/RSS_FileList-v1.4.80916.sh
#    Run  7  "home/robin"      bin/rdir-v1.4.80730.sh            #      {VOL1}/home/robin/_1/JSHs/bin/rdir-v1.4.80730.sh
     fi
#+-------- +-- 22. RSS dirlist --- +--------------------------------------------------------------- # ----------+

  if [ "${aCmd}" == "dirlist" ]; then
                                        LIB_DirList=DirList/${LIB}22-DirList
     Run  0  ""                       ${LIB_DirList}.sh                                             # .(90515.03.3 RAM Added .sh)
     Run  1c "home/SCN2"              ${LIB_DirList}_v1.2.81007.sh                                  # .(90315.03.4 RAM Shouldn't they all go to latest version)
     Run  1d "home/SCN2"              ${LIB_DirList}_v1.2.81007.sh
     Run  1r "home/Robin"             ${LIB_DirList}_v1.2.81007.sh
     Run  1m "U06/SCN2"               ${LIB_DirList}.sh
     Run  1n "U06/SCN2"               ${LIB_DirList}.sh                                             # .(90315.03.5 RAM)
     Run  7  "robin"                  ${LIB_DirList}_v1.2.81007.sh
     Run  8  "SCN2"                   ${LIB_DirList}.sh
     Run  9  "home"                   ${LIB_DirList}_v1.2.81007.sh
     fi
#+-------- +-- 23. RSS info ------ +--------------------------------------------------------------- # ----------+

  if [ "${aCmd:0:3}" == "inf" ]; then
                                        LIB_Info1=Info/${LIB}22-Info                                 # .(00421.01.2 RAM Was: LIB_Info)
                                        LIB_Info2=Info/${LIB}23-Info                                 # .(00421.01.23 RAM Was: ${LIB}22)
     Run  1c "home/SCN2"              ${LIB_Info1}_v0.7.80923.sh
     Run  1d "home/SCN2"              ${LIB_Info1}_v0.7.80923.sh
     Run  1m "U06/SCN2"               ${LIB_Info1}_v0.7.80923.sh
     Run  1n "U06/SCN2"               ${LIB_Info1}_v0.7.80923.sh                                     # .(90315.03.6 RAM)
#    Run  8  "SCN2"                   ${LIB_Info1}_v0.7.80923.sh
     Run  8  "SCN2"                   ${LIB_Info2}_v0.8.sh
#    Run  8  "SCN2"                   ${LIB_Info2}.sh
     fi
#+-------- +-- 24. RSS net ------- +--------------------------------------------------------------- # ----------+

# if [ "${aCmd:0:2}" == "ne"  ]; then  Run  1  "home/robin"  "Config/rh70/bin/rnet-v80914.sh"; fi
  if [ "${aCmd:0:3}" == "net" ]; then                                                               # .(81216.01.1 BEG RAM Added net)
                                      LIB_Net=Net/${LIB}24-Net
     Run  1  "home/robin"            "Config/rh70/bin/rnet-v80914.sh";
     Run  1m "U06/SCN2"               ${LIB_Net}_v0.8.81216.sh
     Run  1n "U06/SCN2"               ${LIB_Net}_v0.8.81216.sh                                      # .(90315.03.7 RAM)
     Run  8  "SCN2"                   ${LIB_Net}_v0.8.81216.sh                                      # .(81216.01.1 END RAM)
     fi
#+-------- +-- 25. RSS zip ------- +--------------------------------------------------------------- # ----------+

  if [ "${aCmd:0:3}" == "zip" ]; then                                                               # .(90315.01.2 BEG RAM)
                                        LIB_ZIP=ZIP/${LIB}25-makZIP1
     Run  1d "home/SCN2"              ${LIB_ZIP}_v0.1.90316.sh
     Run  1n "U06/SCN2"               ${LIB_ZIP}_v0.1.90316.sh
     Run  8  "SCN2"                   ${LIB_ZIP}_v0.1.sh
     Run  8  "SCN2"                   ${LIB_ZIP}.sh
     fi                                                                                             # .(90315.01.2 END)
#+-------- +-- 26. RSS job  ------ +--------------------------------------------------------------- # ----------+

  if [ "${aCmd:0:3}" == "job" ]; then                                                               # .(00421.02.7 Beg RAM)
                                                          aArgs="job ${aArgs}"                      # .(00421.03.1 RAM Critical)
                                        LIB_Jobs=Info/${LIB}26-Jobs1
     Run  1d "home/SCN2"              ${LIB_Jobs}_v0.1.sh
     Run  1n "U06/SCN2"               ${LIB_Jobs}_v0.1.sh
#    Run  8  "SCN2"                   ${LIB_Jobs}_v0.1.sh "job $@"                                  # .(00421.03.1 RAM No workie)
     Run  8  "SCN2"                   ${LIB_Jobs}_v0.1.sh
#    Run  8  "SCN2"                   ${LIB_Jobs}_v0.1.sh
     fi
#+-------- +-- 27. RSS processes - +--------------------------------------------------------------- # ----------+

  if [ "${aCmd:0:3}" == "pro" ]; then
                                                          aArgs="pro ${aArgs}"                      # .(00421.03.2)
                                        LIB_Jobs=Info/${LIB}26-Jobs1
     Run  1d "home/SCN2"              ${LIB_Jobs}_v0.1.sh
     Run  1n "U06/SCN2"               ${LIB_Jobs}_v0.1.sh
     Run  8  "SCN2"                   ${LIB_Jobs}_v0.1.sh
#    Run  8  "SCN2"                   ${LIB_Jobs}_v0.1.sh
     fi                                                                                             # .(00421.02.7 End)
#+-------- +-- 28. RSS misc ------ +--------------------------------------------------------------- # ----------+

  if [ "${aCmd:0:2}" == "sh"  ]; then  Run  1  "home/robin" "Config/rh70/bin/rsho.sh"; fi
  if [ "${aCmd:0:2}" == "ma"  ]; then  Run  1  "home/robin" "bin/makSH.sh"; fi
  if [ "${aCmd:0:2}" == "mt"  ]; then  Run  1n "U06/SCN2"   "MT/${LIB}22-MT1.sh"; fi                # .(90315.01.1 RAM)
  if [ "${aCmd:0:2}" == "se"  ]; then  Run  8  "SCN2"       "Info/${LIB}28-Time1_v1.0.sh"; fi       ##.(00425.02.2 RAM)
# if [ "${aCmd:0:2}" == "se"  ]; then "/nfs/u06/SCN2/_1/RSSs/Info/${LIB}28-Time1_v1.0.sh"; fi       # .(00425.02.2 RAM)

#+-------- +-- xx. RSS edit ------ +--------------------------------------------------------------- # ----------+

# if [ "${aCmd:0:3}" == "edi" ]; then                                                               ##.(00421.01.1 Beg RAM Where is it?)
#                                       LIB_Edit=${LIB}xx-EditFile
#    Run  0  ""                       ${LIB_Edit}
#    Run  1  "home/robin"             ${LIB_Edit}.njs
#    Run  1  "WEBs/SCN2"              ${LIB_Edit}_v80912.njs
#    Run  2  "WEBs/SCN2/BASEC3"       ${LIB_Edit}_v80808.njs
#    Run  3  "WEBs/SCN2/BASEC3/Buyer" ${LIB_Edit}_v80808.njs
#    Run  7  "robin"                  ${LIB_Edit}_v80912.njs
#    Run  8  "SCN2"                   ${LIB_Edit}_v80912.njs
#    Run  9  "home"                   ${LIB_Edit}
#    fi                                                                                             ##.(00421.01.1 End)

#+-------- +-- 26. RSS edit ------ +--------------------------------------------------------------- # ----------+

#*\
##SRCE     +====================+===============================================+
##RFILE    +====================+=======+===================+======+=============+
#*/
