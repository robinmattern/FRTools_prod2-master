#!/bin/sh
#  Run-DockR Launch Script on rm212p-w10p

#  aCmd="$( dirname $0)/FRT24_run-dockr_p1.01.sh"            # 40515.1028
#  aCmd="$( dirname $0)/FRT24_run-dockr_p1.02.sh"            # 40515.1430
#  aCmd="$( dirname $0)/._2/dokR/FRT24_run-dockr_p1.02.sh"   # 41026.1343
#  aCmd="$( dirname $0)/._2/dokR/FRT24_run-docker_p1.02.sh"  # 41026.1356 ???
   aCmd="$( dirname $0)/dokR/FRT24_run-docker_p1.02.sh"  # 41026.1356 ???

 "${aCmd}" "$@"

