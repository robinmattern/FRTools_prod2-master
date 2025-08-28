#!/bin/bash

  nPrj=3
  nStg=2
  nPort="${nPrj}${nStg}##"

# Function to kill process on a specific port
function chkPort() {
    local port=$1
    echo -e "\n  Checking port $port..."
    
    if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
        # Windows (Git Bash)
        local pid=$(netstat -ano | findstr ":$port" | awk '{print $5}' | head -1)
        if [ ! -z "$pid" ]; then
            echo "  Killing windows process $pid for port $port"
#           taskkill /PID $pid /F > /dev/null 2>&1
            MSYS2_ARG_CONV_EXCL="/PID;/F" /c/Windows/System32/taskkill.exe /PID $pid /F | awk '{ print "  " $0 }'
        fi
    else
        # Linux/macOS
        local pid=$(lsof -ti:$port)
        if [ ! -z "$pid" ]; then
            echo "  Killing linux process $pid for port $port"
            kill -9 $pid > /dev/null 2>&1
        fi
    fi
}
# ---------------------------------------------------

function setPort() { # $1 = 3201, 3251 or 64361: Proj#: 3,64; Stage#: 1)Prod, 2)Test, 3)Dev3, 4-9)Dev4-9; Client#/Server#: 0-4/5-9; App#: 1-9    
    csn=${1:1:1}     # Client#/Server#
    ano=${1:2:1}     # App# 
    pno="${2:0:2}"; if [ "${#2}" == "5" ]; then pno="${2:0:3}"; fi  # Proj# 
    nsp=5;       if [ "${1:0:1}" == "c" ]; then nsp=0; fi 
    nPort="${pno}$(( nsp + csn ))${ano}";
    aApp="${1:0:1}${csn}${ano}"
    aServer="server${csn}"; if [ "${csn}" == "0" ]; then aServer="server"; fi 
    aClient="client${csn}"; if [ "${csn}" == "0" ]; then aClient="client"; fi 
#   echo "--nPort: ${nPort}"
    }
# ---------------------------------------------------

function getAppName() {
   aAppName="Unknown"; setPort "$1" "$2"; aFldr="docs" 
if [ "${1:0:1}" == "c" ]; then aFldr="${aClient}"; fi 
if [ "${1:0:1}" == "s" ]; then aFldr="${aServer}"; fi 
if [ -d "${aFldr}" ]; then 
#  echo "-- \$( find "./${aFldr}" -maxdepth 1 -type d -name "${aApp}_*"                  | awk '{ sub( /.+\//, \"\" ); print; exit }' )"
#  aAppName=$(  find "./${aFldr}" -maxdepth 1 -type d -name "${aApp}_*" > /dev/null 2>&1 | awk '{ sub( /.+\//, ""   ); print; exit }' )
   aAppName=$(  find "./${aFldr}" -maxdepth 1 -type d -name "${aApp}_*"                  | awk '{ sub( /.+\//, ""   ); print; exit }' ) 
   fi 
#  echo "-- aAppName: ${aAppName}" 
   }
# ---------------------------------------------------

function runServer() {
    setPort "$1" "$2"  # Sets aServer, aApp and nPort 
    chkPort ${nPort}   # Kill any existing processes on our ports
    getAppName $1 $2;  # echo "--nPort: ${nPort} for ${aAppName}"
    echo ""

# Install dependencies if needed
    bDoit="0"; if [ "${3:0:2}" == "-d" ]; then  
if [ ! -d "${aClient}/node_modules" ] && [ -f "${aClient}/package.json" ]; then bDoit="1"; fi; fi     
if [ "${bDoit}" == "1" ]; then
    echo "  Installing ${aServer} dependencies..."
    cd ${aServer}
    npm install
    cd ..
    fi
    echo -e "  Starting server, ${aAppName}, on port ${nPort} ..."
#   cd ${aServer}/${aApp}_*
    cd ${aServer}/${aAppName}
    node server.mjs &
    SERVER_PID=$!
    echo "  Server is running at: http://localhost:${nPort}/api"
    cd ../..
    }
# ---------------------------------------------------

function runClient() {
    setPort "$1" "$2"  # Sets aClient, aApp and nPort 
    chkPort ${nPort}   # Kill any existing processes on our ports
    getAppName $1 $2;  # echo "--nPort: ${nPort} for ${aAppName}"
    echo ""

# Install dependencies if needed
    bDoit="0"; if [ "${3:0:2}" == "-d" ]; then  
if [ ! -d "${aClient}/node_modules" ] && [ -f "${aClient}/package.json" ]; then bDoit="1"; fi; fi     
if [ "${bDoit}" == "1" ]; then
    echo "  Installing ${aClient} dependencies..."
    cd ${aClient}
    npm install
    cd ..
    fi
    echo "  Starting client, ${aAppName}, on port ${nPort} ..."
#   cd ${aClient}/${aApp}_*
    cd ${aClient}/${aAppName}
    npx http-server -p ${nPort} -s &
    CLIENT_PID=$!
    echo "  Client is running at: http://localhost:${nPort}"
    cd ../..
    }
# -------------------------------------------------

#  getAppName $1 
#  echo "  Starting ${aAppName}"; # exit 

if [ "${1:0:1}" == "s" ] || [ "${1:0:1}" == "a" ]; then
   runServer "s${1:1:2}" ${nPort} $2
   sleep 2  # Wait for server to start
   fi 
if [ "${1:0:1}" == "c" ] || [ "${1:0:1}" == "a" ]; then
   runClient "c${1:1:2}" ${nPort} $2
   fi 
# ---------------------------------------------------

echo -e "\n  Press Ctrl+C to stop one or both services"

# Wait for user interrupt
trap "kill $SERVER_PID $CLIENT_PID; exit" INT
wait