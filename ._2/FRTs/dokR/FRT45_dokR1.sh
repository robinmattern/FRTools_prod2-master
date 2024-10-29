#!/bin/sh
#  dokR Launcher (Prod Copy)

        FRT_Scr=FRT45_dokR1_p1.02.sh

        FRT_Dir=$( realpath "$0" ); FRT_Dir=$( dirname "${FRT_Dir}" )
        FRT1_Main1=$FRT_Dir/$FRT_Scr

      "$FRT1_Main1" "$@"

