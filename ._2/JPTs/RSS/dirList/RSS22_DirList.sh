#!/bin/sh
#  RSS Dir Lister (Prod Copy)

#       RSS_Scr=RSS22-DirList_v1.2.81007.sh
#       RSS_Scr=RSS22-DirList_v1.2.90315.sh
#       RSS_Scr=RSS22-DirList_v1.3.21027.sh
#       RSS_Scr=RSS22-DirList_p1.04.sh
#       RSS_Scr=RSS22-DirList_p1.05.sh  # 40520.1002
#       RSS_Scr=RSS22_DirList_p1.05.sh  # 41026.1535
        RSS_Scr=RSS22_DirList_u1.05.sh  # 41225.1030

        RSS_Dir=$( dirname "$0" )
        RSS22_DirList=$RSS_Dir/$RSS_Scr

#echo "D:\Home\Robin\._1\RSSs\DirList\RSS22_DirList_p1.04.sh"
#echo "$RSS22_DirList" "$@"
      "$RSS22_DirList" "$@"

