#!/bin/sh
#  FRTools Launch Script on rm212p-w10p

#       FRT_Scr="FRT40_frt_u1.01\`20404.sh"
#       FRT_Scr="FRT40_frt_u1.02\`20405-1739.sh"
#       FRT_Scr=FRT40_frt_u1.03.sh
#       FRT_Scr=FRT40_frt_p1.04.sh
#       FRT_Scr=FRT40_frt_p1.06.sh
#       FRT_Scr=FRT40_Main0_p1.06.sh
#       FRT_Scr=FRT40_Main0_u1.07.sh
#       FRT_Scr=FRT40_Main0_p1.08.sh
        FRT_Scr=FRT40_Main0_p1.09.sh        #.(30716.01 RAM)          # .(41210.02.1)
#       FRT_Scr=._2/FRT40_Main0_p1.09.sh    #.(41026.02.1 RAM)
 
#       FRT_Dir=$( realpath "$0" ); FRT_Dir=$( dirname ${FRT_Dir} )   ##.(41210.02.1)
        FRT_Dir="$( cd "$( dirname "$0" )" && pwd )"                  # .(41210.02.1)

#echo "$FRT_Dir/$FRT_Scr" "$@"; exit
      "$FRT_Dir/$FRT_Scr" "$@"                                        # .(41210.02.1)

