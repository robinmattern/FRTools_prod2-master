#!/bin/bash
#  JPTools Launch Script on rm212p-w10p

#       JPT_Scr="JPT10_Main0_p1.05.sh"                                ##.(41026.02.3 RAM)
        JPT_Scr=JPT30_Main0_p1.06.sh                                  # .(41210.02.10).(41026.02.3 RAM)

#       JPT_Dir=$( realpath "$0" ); JPT_Dir=$( dirname "${JPT_Dir}" ) ##.(41210.02.10)
        JPT_Dir="$( cd "$( dirname "$0" )" && pwd )"                  # .(41210.02.10)

      "$JPT_Dir/$JPT_Scr" "$@"                                        # .(41210.02.10)


