#!/bin/sh
#  gitR Launcher (Prod Copy)

        FRT_Scr=FRT42_gitR1_p1.01.sh

        FRT_Dir=$( realpath "$0" ); FRT_Dir=$( dirname "${FRT_Dir}" )
        FRT_Scr=$FRT_Dir/$FRT_Scr

      "$FRT_Scr" "$@"

