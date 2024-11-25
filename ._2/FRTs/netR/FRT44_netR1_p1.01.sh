#!/bin/bash
#*\
##=========+====================+================================================+
##RD         netR1              | FormR Network tools
##RFILE    +====================+=======+===============+======+=================+
##FD   FRT44_netR1.sh           |  12756| 11/22/24 16:27|   325| p1.01`41122.1625
##FD   FRT44_netR1.sh           |  13021| 11/22/24 17:04|   379| p1.01`41122.1704
##FD   FRT44_netR1.sh           |  15466| 11/25/24  8:31|   382| p1.01`41125.0830

##DESC     .--------------------+-------+---------------+------+-----------------+
#            Use the commands in this script to manage Network resources.
#
##LIC      .--------------------+----------------------------------------------+
#            Copyright (c) 2022-2024 8020Data-FormR * Released under
#            MIT License: http://www.opensource.org/licenses/mit-license.php
##FNCS     .--------------------+----------------------------------------------+
#            exit_wCR           |
#            setOSvars          |
#            listIPs_Windows    |
#            listIPs_Linux      |
#            wifi_off           | Turn WiFi off
#            wifi_on            | Turn WiFi on
#            disable_internet   | Disable internet
#            enable_internet    | Enable internet
#            netCmds            |
#                               |
##CHGS     .--------------------+----------------------------------------------+
# .(41122.01 11/22/24 RAM 14:25p| Created
# .(41122.02 11/22/24 RAM 17:04p| Wrote listIPs_Linux
# .(41125.01 11/25/24 RAM  8:30p| Add file header info

##PRGM     +====================+===============================================+
##ID 69.600. Main0              |
##SRCE     +====================+===============================================+
#*/
#========================================================================================================== #  ===============================  #

     aVer="1.01`41125.0830"

function exit_wCR() {
#   echo "  aOS: '${aOS}'"
  if [[ "${aOS}" != "windows" ]]; then echo ""; fi
     exit
     }
# -----------------------------------------------------------

function setOSvars() {
     aTS=$( date '+%y%m%d.%H%M' ); aTS=${aTS:2}
     aBashrc="$HOME/.bashrc"
     aBinDir="/Home/._0/bin"
     aOS="linux"
  if [[ "${OS:0:7}" == "Windows" ]]; then
     aOS="windows";
     aBinDir="/C/Home/._0/bin"
     fi
  if [[ "${OSTYPE:0:6}" == "darwin" ]]; then
     aBashrc="$HOME/.zshrc"
     aBinDir="/Users/Shared/._0/bin"
     aOS="darwin"
     fi
     }
# -----------------------------------------------------------

function listIPs_Windows() {

      netsh interface ipv4 show interfaces | awk 'NR > 3' >temp_interfaces.txt

while IFS= read -r line; do
      idx=$( echo "$line" | awk '{ print $1 ? $1 : "" }'); # echo "idx: '${idx}', name: '${name}'"
      name=$(echo "$line" | awk '{ print substr( $0, 44) }' )
#     name1="\"$( echo "$name"  | awk '{ gsub( /[*()]/, "" ); print }')\""
   if [ "${name}" != "" ]; then

aAWKpgm='
BEGIN { b = 0 }
               { gsub( /[*()]/, ""); if ($0 ~ inf) { b = 1 }; if (NF == 0) { b = 0 } };
        b == 1 {
#                print NR " " NF " " n " " $0;  n = index( $0, "IP Address" )
#                if (0 < n) {                  aIP = substr($0, 43);     print NR " " NF " IP Address: " aIP; }
                 if ($0 ~ /IP Address/)      { aIP = substr($0, 43); } # print NR " " NF " IP Address: " aIP; next }
                 if ($0 ~ /Default Gateway/) { aGW = substr($0, 43); } # print NR " " NF " Gateway: " aGW; next }
                 }
 #      b == 0 { print "  " aIP " '"${name}"'"; exit }
        END { printf "%5d  %-15s  %-15s  %s\n", '"${idx}"', aIP, aGW, "'"${name}"'" }
'
#     netsh interface ip show address | awk -v inf="\"${name}\"" 'BEGIN{b=0} { gsub( /[*()]/, ""); if ($0 ~ inf) { b = 1 }; if (NF == 0) { b = 0 } }; b == 1 { print NR " " NF " " $0; }'
      netsh interface ip show address | awk -v inf="\"${name}\"" "${aAWKpgm}"
      fi
   done <temp_interfaces.txt
   rm temp_interfaces.txt

   } # eof listIP_Windows
# ----------------------------------------------------------------------

function listIPs_Linux() {                                                              # .(41122.02 RAM Write listIPs_Linux Beg)
aAWKpgm='
BEGIN { b = 0 }
    /Error:/ { aIP = "n/a"; aGateway="n/a" }
#   /IPv6/        { next }
    /^IP address:/ { aIP = $3 }
    /^Router:/     { aGateway = $2 }
END   {  printf "  %7s  %-15s  %-15s %s\n", substr( aLine, 3, 7 ), aIP, aGateway, substr( aLine, 10 ) }
'
      networksetup -listallhardwareports | grep  -A 2 "Hardware Port" | awk '/Hardware/ { a = substr( $0, 16) }; /Device/ { printf "  %-7s %s\n", $2, a }' >temp_interfaces.txt
#     cat temp_interfaces.txt
#   15  192.168.1.228    192.168.1.1      Ethernet
#  ---  ---------------  ---------------  --------------------------------

while IFS= read -r aLine; do
      aInf=${aLine:2:7}; aInf=${aInf/ /}; # echo "  aInf: '${aLine:10}'"; echo "-------------------------"
#     ifconfig ${aInf} # | awk '/^[a-z]/ { inf=$1; sub( /:/, "", inf ) }; /inet /  { printf "  %-5s %-15s %s\n", inf, $2, $6 }'
      networksetup -getinfo "${aLine:10}" | awk -v aLine="${aLine}" "${aAWKpgm}"
   done <temp_interfaces.txt
   rm temp_interfaces.txt

   } # eof listIP_Unix                                                                  # .(41122.02 End)
# ----------------------------------------------------------------------

# networksetup -listallhardwareports | grep -A 1 "Wi-Fi"

# system_profiler SPAirPortDataType | grep "Interface Name"  # lots of gory details

wifi_interface() {
    if [ "$1" != "" ]; then echo "$1"; fi
    aInf1="$( networksetup -listallhardwareports | grep -A 1 "Wi-Fi" | awk '/Device:/ { print $2 }' )"
    echo "${aInf1}"
    }

wifi_off() {  # Function to turn WiFi off
    aInterface="$( wifi_interface $1 )";
#   echo "wifi_off[1]  networksetup -setairportpower ${aInterface} off"
    sudo networksetup -setairportpower ${aInterface} off
    echo "  WiFi interface ${aInterface} turned off"
#   echo "* You don't really want to turn the Wifi off, do you?"
    }

wifi_on() { # Function to turn WiFi on
    aInterface="$( wifi_interface $1 )";
#   echo "wifi_on[1]  networksetup -setairportpower ${aInterface}  on"
    sudo networksetup -setairportpower ${aInterface} on
    echo "  WiFi interface ${aInterface} turned on"
    }

check_wifi() { # Check current WiFi status
#   echo "check_wifi[1]  networksetup -setairportpower en1"
#	   Wi-Fi Power (en1): On
#   echo "check_wifi[1]  networksetup -setairportpower en0"
#      en0 is not a Wi-Fi interface.
#	** Error: Error obtaining wireless information.

    aInterface="$( wifi_interface $1 )";
    status=$(networksetup -getairportpower ${aInterface} |  awk '{ print $4} ' )
    echo $status
    }

toggle_wifi() { # Toggle based on current status
    current_status=$( check_wifi $1 )
    echo "  Current WiFi status is ${current_status}"
if [ "$current_status" = "On" ]; then
    wifi_off $1
  else
    wifi_on $1
    fi
    }
 # ----------------------------------------------------------------------

get_gateway() {
    netstat -nr | grep default | awk '{print $2}' | head -1
    }

has_default_route() {
    netstat -nr | grep -q "^default"
    }

check_internet() {
    status=$(route -n get default);
    if [ "${status}" == "" ]; then status="off"; else status="on"; fi
    echo $status
    }

disable_internet() {  # Function to disable internet
    sudo route delete default $gateway
    echo "Internet access disabled"
	}

enable_internet() { # Function to enable internet
    gateway="$(get_gateway)"
    echo "  route add default '$gateway'"
    if [ -z "$gateway" ]; then
        echo "No gateway found. Using default gateway 10.0.0.1"
        gateway="10.0.0.1"
    fi
    sudo route add default $gateway
    echo "Internet access restored"
    }

toggle_internet() { # Toggle based on current status

#	gateway=$(netstat -nr | grep default | awk '{print $2}' | head -1)  # Get default gateway
    gateway=$(get_gateway)
    echo "  gateway: '$gateway'"

# if route -n get default >/dev/null 2>&1; then  # Check if default route exists
# if [ -n "$gateway" ]; then  # Check if default route exists
if has_default_route; then    # Check if default route exists
    disable_internet
  else
    enable_internet
	fi
	}
 # ----------------------------------------------------------------------

 function netCmds() {

  if [ "${1:0:3}" == "hel" ] || [ "$1" == "" ]; then
#       echo ""
        echo "  Network commands"
        echo "    netr list                List current and available IPs and Interfaces"
        echo "    netr set {IP} [{Inf}]    Set private IP Address {IP} to Ethernet Interface {Inf}"
        echo "    netr keep alive {secs}   Set SSH Server Keep Alive interval"
        echo "    netr test {Inf}          Ping Network Interface {Inf}"
        echo "    netr toggle wifi [{Inf}] Turn Wifi on and Off for Interface {Inf}"
        echo "    netr check  wifi [{Inf}] Check status of WiFi"
        echo "    netr toggle internet     Turn Internet on and Off"
        echo "    netr check  internet     Check status of Internet"
        echo "    netr sleep {mins}        Set Desktop sleep parameters, 0 == never"
        exit_wCR
     fi # // eof aCmd Help
#    -----------------------------------------------------

  if [ "${1:0:3}" == "lis" ]; then

     if [ "${aOS}" == "windows" ]; then
        echo "  Inf    IP Address        Gateway       Device Name"
        echo "  ---  ---------------  ---------------  --------------------------------"
        listIPs_Windows
       else
        echo "  Inf        IP Address        Gateway       Device Name"
        echo "  -------  ---------------  ---------------  --------------------------------"
        listIPs_Linux | sort
        fi
        exit_wCR

     fi # // eof aCmd Show
#    -----------------------------------------------------

  if [ "${1:0:3}" == "kee" ]; then

        if [ "$2" == "alive"  ]; then nSecs=$3; else nSecs=$2; fi
        if [ "${nSecs}" == "" ]; then
            echo "* Please provide the number of seconds.";
            nSecs="$( sudo sshd -T | awk '/clientaliveinterval/ { print $2 }' )"
            echo "  It is now set to ${nSecs} seconds.";
            exit_wCR;
            fi
        sudo awk -v nSecs="${nSecs}" '!/^ClientAliveInterval/ || NR==1 { print } NR==1 { print "ClientAliveInterval " nSecs }' /etc/ssh/sshd_config >/tmp/sshd_config && sudo mv /tmp/sshd_config /etc/ssh/sshd_config
#       sudo awk                     '!/^ClientAliveInterval/ || NR==1 { print } NR==1 { print "ClientAliveInterval 30"     }' /etc/ssh/sshd_config >/tmp/sshd_config && sudo mv /tmp/sshd_config /etc/ssh/sshd_config
        sudo launchctl unload /System/Library/LaunchDaemons/ssh.plist
        sudo launchctl load   /System/Library/LaunchDaemons/ssh.plist
        echo "  SSH Keep Alive interval set to ${nSecs} seconds."
        exit_wCR

     fi # eoc Keep Alive
#    -----------------------------------------------------

  if [ "${1:0:3}" == "sle" ]; then

                nMins=$2
        if [ "${nMins}" == "" ]; then
            echo "* Please provide the number of minutes to sleep, or 0 for never.";
            echo -e "\n  Here are the current Power Management settings.";
            pmset -g | awk '!/(Sleep On|Currently|System-)/ { print "    " $0 }' | sort
            exit_wCR;
            fi
        sudo pmset displaysleep ${nMins}
        echo "  Display Sleep interval set to ${nMins} minutes."
        exit_wCR

     fi # eoc Sleep
#    -----------------------------------------------------


  if [ "${1:0:3}" == "set" ]; then

  if [ "$3" != "" ]; then aInf_name="$3"; else   # Get the Ethernet interface name

#       aInf="$( networksetup -listallhardwareports | awk '/Ethernet/ { getline; print $2; exit }' )"
      # Find interface that matches both Ethernet and has a MAC address
#       ethernet_service="$( networksetup -listallhardwareports | awk '
#            /Hardware Port: Ethernet/,/Ethernet Address:/ { if ($0 ~ /Device: en/) {print $2 } } ')"
#       echo "Interface name: ${ethernet_service}"

        eth_services="$( networksetup -listallnetworkservices | grep "^Ethernet$" )"  # List all exact "Ethernet" matches
        eth_count=$( echo "${eth_services}" | grep -c "^" )

 if [ "$eth_count" -gt 1 ]; then
        echo "* Found multiple Ethernet services:"
        echo "${eth_services}" | awk '{ print "    " $0 }'
        echo "  Please specify which one to configure"
        exit_wCR
   elif [ "$eth_count" -eq 0 ]; then
        echo "* No Ethernet service found"
        exit_wCR
   else
#       echo "Found single Ethernet service: $eth_services"
        aInf_name="${eth_services}"
        echo "  Ethernet Interface name is ${aInf_name}"; echo ""; # exit
#       echo "  Ethernet interface is: ${aInf}";          echo ""; # exit
        fi

#       sudo networksetup -removenetworkservice "Ethernet"
#       sleep 2

#       sudo networksetup -createnetworkservice "Ethernet" en0  # Create new service
#       sleep 2

        echo "    sudo networksetup -setmanual \"${aInf_name}\" \"$2\" \"255.255.255.0\" \"0.0.0.0\""  # Set manual IP configuration with no gateway
                  sudo networksetup -setmanual  "${aInf_name}"   "$2"   "255.255.255.0"   "0.0.0.0"    # Set manual IP configuration with no gateway
        sleep 5

        echo -e "\n  New settings:"  # Verify settings
        networksetup -getinfo "${aInf_name}" | awk '{ print "    " $0 }'
        exit_wCR
        fi

     fi # set IP Address for Ethernet cable
#    -----------------------------------------------------

        aCmd=${1:0:3}
        aInf=$2
  if [ "${2:0:3}" == "wif" ]; then aCmd="${aCmd}Wif"; aInf=$3; fi
  if [ "${2:0:3}" == "int" ]; then aCmd="${aCmd}Int"; aInf=""; fi

#       echo "  aCmd: ${aCmd} ${aInf}"; # exit

# if [ "${aCmd:3:3}" == "Wif" ] && [ "${aInf}" == "" ]; then
#       echo -e "\n* You must provide an Interface Name, e.g. en0."
#       exit_wCR
#       fi

  if [ "${aCmd:3:3}" == "" ]; then
        echo -e "\n* You must provide wifi or internet"
        exit_wCR
        fi
        # // eif aCmd check arg 2
#    -----------------------------------------------------

#       echo "  aCmd: ${aCmd} ${aInf}"; # exit

#    -----------------------------------------------------

  if [ "${aCmd}" == "togWif" ]; then
        toggle_wifi ${aInf}
        exit_wCR
     fi # // eof aCmd toggle WiFi
#    -----------------------------------------------------

  if [ "${aCmd}" == "cheWif" ]; then
#       echo  "  cheWif[1] \${aInf}: '${aInf}'";  # exit
        aInterface="$( wifi_interface ${aInf} )"; # echo "  aInterface: '${aInterface}'"; exit
        echo -e "  Wifi Interface ${aInterface} is $( check_wifi ${aInf} )"
        exit_wCR
     fi # // eof aCmd check WiFi
#    -----------------------------------------------------

  if [ "${aCmd}" == "togInt" ]; then
        toggle_internet
        exit_wCR
     fi # // eof aCmd toggle Internet
#    -----------------------------------------------------

  if [ "${aCmd}" == "cheInt" ]; then
        echo -e "\n  Internet is $(check_internet $2)"
        exit_wCR
     fi # // eof aCmd check Internet
#    -----------------------------------------------------
   } # eof netCmds
# ---------------------------------------------------------------------------

     echo ""
     setOSvars
     netCmds $1 $2 $3
