#!/bin/sh
#  gitR2 Launcher (Prod Copy)

        FRT_Scr=FRT22_gitR2_p2.06.sh

        FRT_Dir=$( realpath "$0" ); FRT_Dir=$( dirname "${FRT_Dir}" )
        FRT_Scr=$FRT_Dir/$FRT_Scr

      "$FRT_Scr" "$@"

