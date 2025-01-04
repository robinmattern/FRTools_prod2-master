#!/bin/sh
#  keyS Launcher (Prod Copy)

#       FRT_Scr=FRT26_keyS1_p2.01.sh
#       FRT_Scr=FRT41_keyS2_p2.01.sh                                  ##.(41210.02.7).(41229.02.1)
        FRT_Scr=FRT41_KeyS2_u2.01.sh                                  # .(41229.02.1 RAM Was _keys1).(41210.02.7)

#       FRT_Dir=$( realpath "$0" ); FRT_Dir=$( dirname "${FRT_Dir}" ) ##.(41210.02.7)
        FRT_Dir="$( cd "$( dirname "$0" )" && pwd )"                  # .(41210.02.7)

      "$FRT_Dir/$FRT_Scr" "$@"                                        # .(41210.02.7)

