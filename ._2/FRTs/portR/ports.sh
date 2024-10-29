#!/bin/bash

   if [ "$1" == "show"  ]; then aShow="ports"; else aShow=""; fi
   if [ "$1" == "pids"  ]; then aShow=$1; fi
   if [ "$1" == "ps"    ]; then aShow=$1; fi
   if [ "$1" == "kill"  ]; then aShow=$1; fi
   if [ "$2" != ""      ]; then nKill=$2; else nKill=""; fi

   if [ "$1" == ""      ] || [ "$1" == "help" ]; then

   echo ""
   echo "  Syntax: "
   echo "    ports show        Show PID, IPAddress and Port"
   echo "    ports pids        Show PID, PORT and PS output"
   echo "    ports ps          Show all NodeJS processes"
   echo "    ports kill {Port} Kill Port"
   echo ""
   exit
   fi
#  -------------------------------------------------------------------------

if [ "${aShow}" == "ps" ]; then
   echo ""
   echo "         PID      CPU    RAM   Time   Command"
   echo "       ------ -------- ------  -----  -----------------------------------------------------------------------"
   ps aux | awk '/node_*/ { sub( /--ignore .+ /, "--ignore ... "); sub( /bin\/.+\//, "bin/..../" ); printf "      %7d %8d %6d  %-5s  %s\n", $2, $5, $6, $9, substr($0,68); }' | sort -k1n
   echo ""
   exit
   fi
#  -------------------------------------------------------------------------

    declare -a mPIDs
echo "hello"
    if [ "${OS:0:7}" == "Windows" ]; then
    netstat -ano    2>&1 | awk '/node_*/ { printf "  %8d %-20s %-20s\n", $5, $2, "" }' | sort -u  >@tmp
      else
    netstat -anotup 2>&1 | awk '/node_*/ { printf "  %8d %-20s %-20s\n", $7, $4, "" }' | sort -u  >@tmp
        fi
cat @tmp
    IFS=$'\n' read -d '' -r -a mPIDs < @tmp

#   netstat -anotup Local Address           Foreign Address
#   Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name

# --------------------------------------------------------------------------

    i=1

#   ---------------------------------------------------------------

    echo ""
    if [ "${aShow}" == "ports" ]; then

    echo "  PORT   PID  IP Address"
    echo " ------ ----- --------------"
    fi

    if [ "${aShow}" == "pids"  ]; then
    aUnline=" ------ ----- -------- ------  -----  -----------------------------------------------------------------------"
    echo -e "  PORT   PID      CPU    RAM   Time   Command\n${aUnline}.."

    fi
#   ---------------------------------------------------------------

for line in "${mPIDs[@]}"; do  echo " aLine: ${aLine}"

    nPID=$(  echo "$line"   | awk '{ printf "%8d\n", $1 }' ); aPID="${nPID// /}"

    aIP=$(   echo "${line}" | awk '{ sub( /:.+/, "", $2); print $2 }' )
    nPort=$( echo "${line}" | awk '{ sub( /.+:/, "", $2); printf "%5d", $2 }' )  # .(40419.02.1 Added printf)

    if [ "${nPort}" == "" ]; then nPort="${aIP}"; aIP=""; fi

#   -------------------------------------------------------

    if [ "${nPID}" != "" ]; then

#        ---------------------------------------

      if [ "${aShow}" == "ports" ]; then

         echo "${nPID} ~${aIP}~ ${nPort}" | awk '{ gsub( /~/, "", $2 ); printf "  %5d %5d %-15s\n", $3, $1, $2 }'

         bEcho=1
         fi
#        ---------------------------------------

      if [ "${aShow}" == "pids" ]; then

         aPS=$( ps aux | awk '/'${aPID}'/ { sub( /--ignore .+ /, "--ignore ... "); printf       "%8d %6d  %-5s  %s\n",     $5, $6, $9, substr( $0, 68 ); ; exit }' )
         aPS=$( echo "${aPS}" | awk '{  sub( /bin\/.+\//, "bin/..../" ); sub( /--enable.+/, "...."); print }' )

         echo "  ${nPort} ${nPID:3} ${aPS}"

         bEcho=1
         fi
#        ---------------------------------------

#     if [ "$1" == "${nPort}"   ] || [ "$1" == "all" ]; then bKill=1; else bKill=0; fi
#     if [ "$2" == "doit"       ] && [ "${bKill}" == "1" ]; then
      if [ "${aShow}" == "kill" ] && [ "${nPort}" == "${nKill}" ]; then

         echo "  Killing PID: ${nPID}, PORT: ${nPort}"
#        kill -n 9 ${nPID}
         bEcho=1
         fi
#        ---------------------------------------
      fi
#     -----------------------------------------------------
    done
#   ---------------------------------------------------------------

#   if [ -f "@tmp"         ]; then rm @tmp; fi
    if [ "${bEcho}" == "1" ]; then echo ""; fi

# --------------------------------------------------------------------------

