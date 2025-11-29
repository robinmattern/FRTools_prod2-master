#!/bin/sh
#  formR run-app Launch Script

        FRT_Scr=run-app/FRT43_run-app1_u1.15.sh

        FRT_Dir="$( cd "$( dirname "$0" )" && pwd )"

  if [ "$1" != "noChk" ]; then
  if [ -f "run-app.sh" ]; then FRT_Dir="."; FRT_Scr="run-app.sh"; fi
     else shift; fi

#echo "$FRT_Dir/$FRT_Scr" "$@"; exit
      "$FRT_Dir/$FRT_Scr" "$@"

