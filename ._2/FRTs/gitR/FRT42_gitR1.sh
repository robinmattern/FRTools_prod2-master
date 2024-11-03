#!/bin/sh
#  gitR1 Launcher (Prod Version)

        FRT_Scr=FRT42_gitR1_p2.07.sh

        FRT_Dir=$( realpath "$0" ); FRT_Dir=$( dirname "${FRT_Dir}" )
        FRT_Scr=$FRT_Dir/$FRT_Scr

      "$FRT_Scr" "$@"

