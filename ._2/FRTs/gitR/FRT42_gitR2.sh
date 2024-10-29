#!/bin/sh
#  gitR2 Launcher (Prod Copy)

        FRT_Scr=FRT42_gitR2_p2.06.sh

        FRT_Dir=$( realpath "$0" ); FRT_Dir=$( dirname "${FRT_Dir}" )
        FRT_Scr=$FRT_Dir/$FRT_Scr

#echo "$FRT_Scr" "$@"; exit
      "$FRT_Scr" "$@"

