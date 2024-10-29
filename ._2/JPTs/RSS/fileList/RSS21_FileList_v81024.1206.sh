#!/bin/sh
#   RSS File Lister on sc172d-ub14 (local) 

#       RSS_Scr=_1/RSSs/FileList/RSS21-FileList.sh
#       RSS_Scr=_1/RSSs/FileList/RSS21-FileList_v1.5.81005.sh
        RSS_Scr="rss dir"

        RSS_Dir=
#       RSS_Dir=/C/Home/Robin/        # rm112-w10p
#       RSS_Dir=/C/VOLs/U06/Robin/    # rm112-w10p
#       RSS_Dir=/C/Home/SCN2/         # rm112-w10p
#       RSS_Dir=/D/Home/SCN2/         # sc163-w08s
#       RSS_Dir=/home/robin/          # sc154-rh62, sc153-ub14, etc
#       RSS_Dir=/nfs/u06/SCN2/        # sc154-rh62, sc153-ub14 -- sc152:/NFS
#       RSS_Dir=/M/U06/SCN2/          # sc163-w08s             -- sc152:/NFS

if [ "$RSS_LOG" != "" ]; then echo "" >>"$RSS_LOG"; fi
if [ "$RSS_LOG" != "" ]; then echo "$( date '+%Y%m%d-%H%M%S%z')  ${SCN_SERVER:0:11} ${RSS_USER:0:8}  RSS[0]            ${RSS_Dir}${RSS_Scr} " "$@" >>"$RSS_LOG"; fi

#echo "${RSS_Dir}${RSS_Scr}" "$@"
      "${RSS_Dir}"${RSS_Scr} "$@"
