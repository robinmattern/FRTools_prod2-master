#!/bin/bash

   if [ "$1" == "show"  ]; then aShow=$1; else aShow=""; fi
   if [ "$1" == "ports" ]; then aShow=$1; fi
   if [ "$1" == "ps"    ]; then aShow=$1; fi
   if [ "$1" == ""      ] || [ "$1" == "help" ]; then

   echo ""
   echo "  For all running NodeJS apps ..."
   echo "    show-node-apps                    Show PID, PORT and PS output"
   echo "    show-node-apps ports              Show PID, IPAddress and Port"
   echo "    show-node-apps ps                 Show all NodeJS processes"
   echo "    kill-node-apps show               Show PID, PORT and PS output"
   echo "    kill-node-apps {Port}|all [doit]  Kill NodeJS apps running with a port"
#  echo ""
   exit
   fi

#           netstat -anotup 2>&1 | awk '/node/ { printf "  %8d %-20s %-20s\n", $7, $4, "" }' | sort -u; exit

#  mPIDS=$( ps -aux  | awk /node/ )
#  mPIDs=$( pm2 list | awk '/fork/{ sub( /.+fork/, "" ); print $2 }' )
#  mPIDs=$( netstat -anotup 2>&1 | awk '/node/ { printf "  %8d %-20s %-20s\n", $7, $4, "" }' | sort -u )
#  mPIDs=$( netstat -anotup      | awk '/node/ { printf "  %8d %-20s %-20s\n", $7, $4, "" }' | sort -u )
#  mPIDs=$( netstat -anotup 2>&1 | awk '/node/' )
#  mPIDs=$( netstat -anotup | grep 'node' | cut -d' ' -f7 )
#           netstat -anotup 2>&1 | tr -cd '\11\12\13\14\32-\177' >@tmp
#           netstat -anotup 2>&1 | awk '/node/ { printf "  %8d %-20s %-20s\n", $7, $4, "" }' | sort -u  >@tmp
#           cat @tmp
#  mPIDs=$( cat @tmp )
#  mPIDs=$( netstat -anotup  )
#  mPIDS=$( ps -aux         | awk '/node/' )
#  exit

# --------------------------------------------------------------------------

if [ "${aShow}" == "ps" ]; then
   echo ""
   echo "         PID      CPU    RAM   Time   Command"
   echo "       ------ -------- ------  -----  -----------------------------------------------------------------------"
#  ps aux | awk '/node_*/ { sub( /--ignore .+ /, "--ignore ... "); print "  " substr( $0, 18 ); }'
#  ps aux | awk '/node_*/ { sub( /--ignore .+ /, "--ignore ... "); print; }'
   ps aux | awk '/node_*/ { sub( /--ignore .+ /, "--ignore ... "); sub( /bin\/.+\//, "bin/..../" ); printf "      %7d %8d %6d  %-5s  %s\n", $2, $5, $6, $9, substr($0,68); }' | sort -k1n
   echo ""
   exit
   fi
# --------------------------------------------------------------------------

  declare -a mPIDs

# while IFS="\n" read -r line; do
#   mPIDs+="${line}"
#   done < <( netstat -anotup 2>&1 | tr -cd '\11\12\13\14\32-\177' )
#   done < <( netstat -anotup      | awk '/node/ { printf "  %8d %-20s %-20s\n", $7, $4, "" }' | sort -u )

            netstat -anotup 2>&1 | awk '/node_*/ { printf "  %8d %-20s %-20s\n", $7, $4, "" }' | sort -u  >@tmp

# IFS=$'\n' read -d '' -r -a mPIDs < <( netstat -anotup  | awk '/node/ { printf "  %8d %-20s %-20s\n", $7, $4, "" }' | sort -u )
  IFS=$'\n' read -d '' -r -a mPIDs < @tmp

# --------------------------------------------------------------------------

#if [ "${aShow}" == "ports" ]; then
#   cat @tmp
#   exit
#   fi
# --------------------------------------------------------------------------

#       mPIDs="$( cat @tmp )"
# echo "mPIDS: ${mPIDs}"; exit

# --------------------------------------------------------------------------
  i=1
# for line in  ${mPIDs}; do $((i++)); echo "$i: $line"; done
# for line in "${mPIDs}"; do echo "$((i++)): ${line}"; done
# for line in  ${mPIDs[@]}; do echo "$line"; done
# for line in "${mPIDs[@]}"; do echo "$line"; done; exit # workie
# exit

#   ---------------------------------------------------------------
    echo ""
    if [ "${aShow}" == "ports" ]; then

#   echo "     PID      IP Address      Port"
#   echo "    -------  --------------  -----"
    echo "  PORT   PID  IP Address"
    echo " ------ ----- --------------"
    fi

    if [ "${aShow}" == "show" ]; then
    aUnline=" ------ ----- -------- ------  -----  -----------------------------------------------------------------------"
    echo -e "  PORT   PID      CPU    RAM   Time  Command\n${aUnline}.."

    fi

# while read -r line; do
  for line in "${mPIDs[@]}"; do

#   echo "line: $((i++)) ${line}"

#   nPID=$( echo "$line" | awk '/trace-warnings|vite.js/ { print $2 }' )
#   nPID=${line:3:7}
    nPID=$( echo "$line" | awk '{ printf "%8d\n", $1 }' ); aPID="${nPID// /}"

    aIP=$(   echo "${line}" | awk '{ sub( /:.+/, "", $2); print $2 }' )
    nPort=$( echo "${line}" | awk '{ sub( /.+:/, "", $2); printf "%5d", $2 }' )  # .(40419.02.1 Added printf)

#   echo -e "\n  $((i++)) Running PID: ${nPID}, PORT: '${nPort}', IP: '${aIP}' '"
    if [ "${nPort}" == "" ]; then nPort="${aIP}"; aIP=""; fi
#   echo "  $((i++)) Running PID: ${nPID}, PORT: '${nPort}', IP: '${aIP}' '"

#     -----------------------------------------------------

    if [ "${nPID}" != "" ]; then

#        ---------------------------------------

      if [ "${aShow}" == "ports" ]; then
#        echo "${nPID} ~${aIP}~ ${nPort}" | awk '{ gsub( /~/, "", $2 ); printf "    %7d  %-15s %s\n", $1, $2, $3 }'
         echo "${nPID} ~${aIP}~ ${nPort}" | awk '{ gsub( /~/, "", $2 ); printf "  %5d %5d %-15s\n", $3, $1, $2 }'
         bEcho=1
         fi
#        ---------------------------------------

      if [ "${aShow}" == "show" ]; then

#        echo "$line"  | awk '{ sub( /--ignore .+ /, "--ignore ... "); print }' # Process each line here
#        echo  ps aux  . awk '/'${aPID}'/ { sub( /--ignore .+ /, "--ignore ... "); print substr( $0, 18 ) }'
#        aPS=$( ps aux | awk '/'${aPID}'/ { sub( /--ignore .+ /, "--ignore ... "); print substr( $0, 18 ); exit }' )
#        aPS=$( ps aux | awk '/'${aPID}'/ { sub( /--ignore .+ /, "--ignore ... "); printf "  %7d %8d %6d  %-5s  %s\n", $2, $5, $6, $9, substr( $0, 68 ); ; exit }' )
         aPS=$( ps aux | awk '/'${aPID}'/ { sub( /--ignore .+ /, "--ignore ... "); printf       "%8d %6d  %-5s  %s\n",     $5, $6, $9, substr( $0, 68 ); ; exit }' )
#        aPS=$( ps aux | awk '/'${aPID}'/ { sub( /--ignore .+ /, "--ignore ... "); gsub( /0ee08df0cf4527e40edc9aa28f4b5bd38bbff2b2/, "..." ); sub( /--enable.+/, "...."); printf "%8d %6d  %-5s  %s\n", $5, $6, $9, substr( $0, 68 ); ; exit }' )
#        aPS=$( echo "${aPS}" | awk '{ gsub( /0ee08df0cf4527e40edc9aa28f4b5bd38bbff2b2/, "..." ); sub( /--enable.+/, "...."); print }' )
         aPS=$( echo "${aPS}" | awk '{  sub( /bin\/.+\//, "bin/..../" ); sub( /--enable.+/, "...."); print }' )
#                                   '{  sub( /bin\/.+\//, "bin/..../" ); print }'


#        echo "  $((i++)) Running PID: ${nPID}, PORT: ${nPort// /}, PS: ${aPS}"

#        echo "  ${nPort// /} ${nPID:3} ${aPS}"
         echo "  ${nPort} ${nPID:3} ${aPS}"

#        echo "  Running PID: ${nPID}, PORT: ${nPort}"
         bEcho=1
         fi
#        ---------------------------------------

      if [ "$1" == "${nPort}" ] || [ "$1" == "all" ]; then bKill=1; else bKill=0; fi
#        echo "  ${2} checking PID: ${nPID}, PORT: ${nPort}, bKill: '${bKill}'"
      if [ "$2" == "doit" ] && [ "${bKill}" == "1" ]; then
         echo "  Killing PID: ${nPID}, PORT: ${nPort}"
         kill -n 9 ${nPID}
         bEcho=1
         fi
#        ---------------------------------------
      fi
#     -----------------------------------------------------
    done
#   done <<< "$mPIDs"
#   ---------------------------------------------------------------

    if [ -f "@tmp" ]; then rm @tmp; fi
    if [ "${bEcho}" == "1" ]; then echo ""; fi

# --------------------------------------------------------------------------

