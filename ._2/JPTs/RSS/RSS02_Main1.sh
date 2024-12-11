#!/bin/sh
#   RSS Launcher (Prod Copy)

#       RSS_Scr=RSS1-Main1_v1.5.80923-0800.sh
#       RSS_Scr=RSS1-Main1_v1.5.80925.sh
#       RSS_Scr=RSS1-Main1_v1.6.81007.sh
#       RSS_Scr=RSS01_Main1_p1.06.sh
#       RSS_Scr=RSS01_Main1_p1.07.sh
#       RSS_Scr=RSS1-Main1_v1.7.81216.sh                              ##.(00421.02.15 RAM)
#       RSS_Scr=RSS1-Main1_v1.8.91221.sh
#       RSS_Scr=RSS2-Main1_v2.0.sh                                    # .(00421.02.15 RAM Use RSS2-Main1)
        RSS_Scr=RSS02_Main1_p2.01.sh                                  # .(41210.02.11).(41029.01.1 RAM Rename from above)

#       RSS_Dir=$( dirname "$0" )
#       RSS_Dir=$( realpath "$0" ); RSS_Dir=$( dirname "${JPT_Dir}" ) ##.(41210.02.11)
        RSS_Dir="$( cd "$( dirname "$0" )" && pwd )"                  # .(41210.02.11)

#echo "RSS_Scr=$RSS_Dir/$RSS_Scr" "$@"; exit 
      "$RSS_Dir/$RSS_Scr" "$@"                                        # .(41210.02.11)

