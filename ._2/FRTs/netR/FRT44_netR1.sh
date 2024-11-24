#!/bin/sh
#  gitR1 Launcher (Prod Version)

        FRT_Scr=FRT44_netR1_p1.01.sh

        FRT_Dir=$( realpath "$0" ); FRT_Dir=$( dirname "${FRT_Dir}" )
        FRT_Scr=$FRT_Dir/$FRT_Scr

      "$FRT_Scr" "$@"

