#!/bin/sh
#  gitR1 Launcher (Prod Version)

        FRT_Scr=FRT44_netR1_p1.01.sh                                  # .(41210.02.8)

#       FRT_Dir=$( realpath "$0" ); FRT_Dir=$( dirname "${FRT_Dir}" ) ##.(41210.02.8)
        FRT_Dir="$( cd "$( dirname "$0" )" && pwd )"                  # .(41210.02.8)

      "$FRT_Dir/$FRT_Scr" "$@"                                        # .(41210.02.8)

