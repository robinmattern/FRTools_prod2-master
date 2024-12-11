#!/bin/sh
#  gitR1 Launcher (Prod Version)

        FRT_Scr=FRT42_gitR1_p2.07.sh                                  # .(41210.02.3)

#       FRT_Dir=$( realpath "$0" ); FRT_Dir=$( dirname "${FRT_Dir}" ) ##.(41210.02.3)
        FRT_Dir="$( cd "$( dirname "$0" )" && pwd )"                  # .(41210.02.3)

      "$FRT_Dir/$FRT_Scr" "$@"                                        # .(41210.02.3)

