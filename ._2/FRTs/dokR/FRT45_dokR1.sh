#!/bin/sh
#  dokR Launcher (Prod Copy)

        FRT_Scr=FRT45_dokR1_p1.02.sh                                  # .(41210.02.2)
     
#       FRT_Dir=$( realpath "$0" ); FRT_Dir=$( dirname "${FRT_Dir}" ) ##.(41210.02.2)
        FRT_Dir="$( cd "$( dirname "$0" )" && pwd )"                  # .(41210.02.2)
     
      "$FRT_Dir/$FRT_Scr" "$@"                                        # .(41210.02.2)

