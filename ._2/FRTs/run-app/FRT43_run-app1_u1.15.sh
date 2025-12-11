#!/bin/bash

  nPrj=49  # Can't be greater than 64   # .(51013.05.1 a Default Project Number)
# nUseThisClientPort="55301"            # .(51013.05.1 Use Normal Client Port for SecureAccess)
# nUseThisStage=3                       # .(51017.05.1 Ok force it the Stage)
# nStg=3

# aRootDir="$( dirname "$(realpath "$0")" )"                                            ##.(51108.07.1 RAM set aRootDir)
# aRootDir="$( git rev-parse --show-toplevel)"                                          ##.(51108.07.1 RAM set aRootDir)
  aRootDir="$( git rev-parse --show-toplevel 2>/dev/null || pwd)"                       # .(51108.07.1 RAM set aRootDir)
  aStage="$(basename "${aRootDir}")"

  nVer=1.15.1211
# ---------------------------------------------------

# if [ "$1" == "source" ]; then echo -e  "\n  ${0} (v${nVer})"; if [ "${OS:0:3}" != "Win" ]; then echo ""; fi; exit; fi
  if [ "$1" == "source" ]; then
  if [ -f "${aRootDir}/run-app.sh" ]; then  echo -e  "\n  ${aRootDir}/$(basename $0) (v${nVer})";
                                      else  echo -e  "\n  $0 (v${nVer})"; fi;
     if [ "${OS:0:3}" != "Win" ]; then echo ""; fi;
     exit; fi

  function Help() {
     echo -e "\n  Run Client and/or Server App(s) for Project ${nPrj}  (v${nVer})"
     echo -e   "  Usage: run-app [c|s|a]{nStg}{nApp} [-[s|d|q|b]]"
     echo -e   ""
     echo -e   "    c|s|a = c)Client, s)Server, or a)both"
     echo -e   "    nStg  = Stage: 1)Prod1, 2)Test2, 3)Dev03, 4-9)Dev0[4-9]"
     echo -e   "    nApp  = [0-9][0-9]: client#/c#%, server#/s#%, or both/a#%"
     echo -e   "     -s   = Set _config.js files if -d = Doit"
     echo -e   "     -b   = Debug, -q = Quietly"
     echo -e   ""
     echo -e   "  Example: run-app a02  # runs both Client and Server App No. 02"
     echo -e   "     Runs: Server API on Port 51252 and Client App on Port 51202"
     if [ "${OS:0:3}" != "Win" ]; then echo ""; fi
     }
# -------------------------------------------------------------------------------------------------------

# Initialize flags
bQuiet=0; bDebug=0; bSave=0; bDoit=0

# Parse flags and remove them from arguments
args=()
for arg in "$@"; do
    if [[ "$arg" =~ ^-[qsdb]+$ ]]; then
       [[ "$arg" =~ q ]] && bQuiet=1
       [[ "$arg" =~ s ]] && bSave=1
       [[ "$arg" =~ d ]] && bDoit=1
       [[ "$arg" =~ b ]] && bDebug=1
  elif [[ "$arg" == "-quiet" ]]; then bQuiet=1; aQuiet="--quiet"
  elif [[ "$arg" == "-save" || "$arg" == "-set" ]]; then bSave=1
  elif [[ "$arg" == "-doit"  ]]; then bDoit=1
  elif [[ "$arg" == "-debug" ]]; then bDebug=1
  else     args+=("$arg")
  fi
done
set -- "${args[@]}"

# ---------------------------------------------------

# aQuiet=""; if [ "$2" == "-q" ]; then aQuiet="--quiet "; set -- "$1" "${@:3}"; fi
#            if [ "$3" == "-q" ]; then aQuiet="--quiet "; fi

# echo "   aQuiet: '${aQuiet}', bSave: '${bSave}', bDoit: '${bDoit}', bDebug: '${bDebug}', aArgs:" "$@"; # exit
           bFirst=1
  if [ "$1" == "" ]; then Help; exit; fi
  if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then Help; exit; fi

     if [ "${bSave}"  == "1" ]; then aArgs=""
     if [ "${bQuiet}" == "1" ]; then aArgs="${aArgs}-q "; fi
     if [ "${bDoit}"  == "1" ]; then aArgs="${aArgs}-d "; fi
     if [ "${bDebug}" == "1" ]; then aArgs="${aArgs}-b "; fi
# echo "   node setFVARS.mjs ${aArgs}" "$@"
#          node "${aRootdir}/._2/FRTs/run-app/setFVARS.mjs" ${aArgs}  "$@"
           node "$( dirname $0 )/setFVARS.mjs" ${aArgs}  "$@"
           bFirst=0
  echo -e "----------------------------------------------------------------------"
     if [ "${bDoit}"  != "1"   ]; then
     if [ "${OS:0:3}" != "Win" ]; then echo ""; fi; exit; fi; # else
#    echo -e "\n-----------------------------------------------------------------------"
     fi
# ---------------------------------------------------

function sayMsg() {
          aCR="\n"
          aMsg="$1"; if [ "${aMsg:0:2}" != "|n" ]; then aCR=""; else aMsg="${aMsg:2}"; fi
    if [ "${bQuiet}"   == "1" ]; then return; fi
    if [ "${aMsg}"     == ""  ]; then aCR="\n"; echo ""; return; fi
    if [ "${bFirst}"   == "1" ]; then bFirst=0; echo -e "----------------------------------------------------------------------\n"; fi
    if [ "${aMsg:0:1}" == "-" ]; then              aMsg="----------------------------------------------------------------------"; fi
    if [ "${aMsg:0:1}" == "%" ]; then aMsg="??${aMsg:1}"; fi
    if [ "${aMsg:0:1}" == "=" ]; then aMsg="?${aMsg:1}"; fi
    if [ "${aMsg:0:1}" == "x" ]; then aMsg="?${aMsg:1}"; fi
    if [ "${aMsg:0:1}" == "X" ]; then aMsg="?${aMsg:1}"; fi
    if [ "${aMsg:0:1}" == "!" ]; then aMsg="?? ${aMsg:1}"; fi
    if [ "${aMsg:0:1}" == " " ]; then aMsg="  ${aMsg:1}"; fi
    echo -e "${aCR}${aMsg}";
    }
# ----------------------------------------------------------------------------------------------------------------------------------

         sayMsg "";

function checkFW() {
    bOK="$( sudo ufw status | awk '/'$1'/ { print 1 }; END { print 0 }' )"
    if [ "${bOK}" == "0" ]; then sudo ufw allow $1/tcp > /dev/null 2>&1;
#                                sudo ufw delete allow 54332/tcp
    sayMsg  "! Opened firewall for port: $1"
    fi
    }
# ---------------------------------------------------

# Function to kill process on a specific port
function chkPort() {
    local port=$1
    sayMsg  "  Checking port $port..."

    if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
        # Windows (Git Bash)
        local pid
        pid=$(netstat -ano | findstr ":$port" | awk '{print $5}' | head -1)
        if [ "$pid" != "0" ] && [ ! -z "$pid" ]; then
          sayMsg "! Killing windows process $pid for port $port"
#         taskkill /PID $pid /F > /dev/null 2>&1
          MSYS2_ARG_CONV_EXCL="/PID;/F" /c/Windows/System32/taskkill.exe /PID $pid /F 2>&1 | awk '{ print "  " $0 }'
        fi
    else
        # Linux/macOS
        local pid
        pid=$(lsof -ti:$port)
        if [ "$pid" != "0" ] && [ ! -z "$pid" ]; then
          sayMsg "! Killing linux process $pid for port $port"
          kill -9 $pid 2>&1 > /dev/null 2>&1 | awk '{ print "  " $0 }'
        fi
#       checkFW $port
    fi
}
# ---------------------------------------------------

function setPort() { # $1 = 3201, 3251 or 64361: Proj#: 3,64; Stage#: 1)Prod, 2)Test, 3)Dev3, 4-9)Dev4-9; Client#/Server#: 0-4/5-9; App#: 1-9
#   Runs 1st for getName with "c##"
    csn=${1:1:1}     # Client#/Server#
    ano=${1:2:1}     # App#
    pno="${2:0:2}"; if [ "${#2}" == "5" ]; then pno="${2:0:3}"; fi  # Proj#
    nsp=5;       if [ "${1:0:1}" == "c" ]; then nsp=0; fi
    nPort="${pno}$(( nsp + csn ))${ano}";
    aApp="${1:0:1}${csn}${ano}"

#   echo -e "\n  setPort[1] ${1} prj: ${prj}, nsp: ${nsp}, csn: ${csn}, ano: ${ano} == nPort: ${nPort}, aApp: ${aApp}\n"; exit
    aServer="server${csn}"; if [ "${csn}" == "0" ]; then aServer="server"; fi
    aClient="client${csn}"; if [ "${csn}" == "0" ]; then aClient="client"; fi
#   echo "--nPort: ${nPort}"; # exit
    }
# ---------------------------------------------------

function getFVARS() {                                                                   # .(51210.01.1 RAM Write getFVARS)
    mFVARS=""
if [   -f $"_config.yaml" ]; then
    mFVARS=$( cat _config.yaml );
    fi
if [   -f $"_config.yaml.js" ]; then
#    aAWKscr='
#/FVARS =/ { print "FVARS: "; next }
#          { if (match( $0, /"([^"]+)":[ ]*"([^"]+)"/, arr ) ) {
#                printf "  %-20s \"%s\"\n", arr[1]":", arr[2] }
#            }'
#   mFVARS="$( cat _config.yaml.js | awk "${aAWKscr}" )";                               # .(51210.01b.1 RAM Doesn't work in MacOS Old BSD awk)
    mFVARS="$( cat _config.yaml.js | sed -e 's/^ *"\([^"]*\)": *"\([^"]*\)"/  \1: "\2"/' )"
    mFVARS="$( echo "${mFVARS}" | awk '/FVARS =/ { print "FVARS: "; next }; /{/ { next }; { gsub( /,/, "" ); printf "  %-20s %s\n", $1, $2 }' )"
    fi
if [ "${mFVARS}" == "" ]; then
    sayMsg   "! Missing _config.yaml.js file, using defaults."
    return
    fi
    echo "${mFVARS}"  # it's in aRootDir
    }                                                                                   # .(51210.01.1 End)
# ---------------------------------------------------

function getFVar( ) {                                                                   # .(51016.02.1 RAM Write getFVar Beg)
#        aAWKpgm="/^[,{SP}\"]*${1}[{SP}\"]*:/ { sub( /^[,{SP}\"]*${1}[{SP}\"]*:/, \"\" ); sub( /.+={SP}*/, \"\" ); a=\$0; }; END { print a }"
#        aAWKpgm="${aAWKpgm//{SP\}/ }"
#        aVar="$( cat "${aRootDir}/_config.js" | awk "${aAWKpgm}" | tr -d "'" | tr -d '"' )"   # .(51016.02.2).(51013.05.7)
#        aVar="$( echo "${aVar}" | awk '{ a = substr( $0, 1, 66 ); sub( / +$/, "", a ); sub( /^ +/, "", a ); print a; }' )"
         aVar="$( findVar "$1")"; aVar="${aVar/*:/}"; aVar="${aVar// /}"
         echo "${aVar}"
         }                                                                              # .(51016.02.1 End)
# ---------------------------------------------------

function findVar() {                                                                    # .(51111.03.1 RAM Add findVar Beg)
    aVAR="$( echo "${1}" | tr '[a-z]' '[A-Z]' )"; aVAL=""
    while IFS= read -r aLine; do
#   echo "Given: '${aLine}'"
    aVal="${aLine:20}";   aVal="${aVal// /}";  aVal="${aVal//\"/}"
    aVar="${aLine:2:${#aVAR}}";
#   echo "Looking for: '${aVAR}' in '${aVar}' <- '${aVal}'"
    if [ "${aVAR}" ==  "${aVar}" ]; then aVAL="${aVal}"; break; fi
    done <<< "${mFVARS}"
#   if [ "${aVAL}" != "" ]; then echo "-- found: ${aVAR}: ${aVAL}"; fi
    if [ "${aVAL}" != "" ]; then echo "--${aVAR}: ${aVAL}"; else echo ""; fi
#   if [ "${aVAL}" != "" ]; then echo "${aVAL}"; fi
    }                                                                                   # .(51111.03.1 End)
# ---------------------------------------------------

function getPrjNo() {
          nPRJ=${nPrj}; nPrj="$( findVar 'PROJECT_NO')"; nPrj="${nPrj/*:/}"              # .(51111.03.2 RAM Use findVar)
     if [ "${nPrj}" == "" ]; then nPrj="${nPRJ}";
          sayMsg "! Missing PROJECT_NO, using ${nPrj}."; # exit
          fi
#         echo    "--found: PROJECT_NO. nPrj: ${nPrj} '${aPRJ}'"; # exit
    }
# ---------------------------------------------------

function getStgNo() {
         aSTG="$(findVar 'PROJECT_STAGE')"; aStg="${aSTG/*:/}"                          # .(51111.03.3 RAM Use findVar)
         aStg="$( echo "${aStg}" | tr '[A-Z]' '[a-z]' )"
 if [ "${aStg}" == "" ]; then
         aStg="${aStage}"
         fi;                          nStg=4
if [[ "${aStg}" =~ ^prod ]]; then nStg=1; fi
if [[ "${aStg}" =~ ^test ]]; then nStg=2; fi
if [[ "${aStg}" =~ ^dev ]];  then nStg=3; fi
#        echo "-- found: PROJECT_STAGE. nStg: ${nStg}) '${aSTG}' (${aStage})"; # exit
    }
# ---------------------------------------------------

function getAppName() {
   aAppName="Unknown"; setPort "$1" "$2"; aFldr="docs"
if [ "${1:0:1}" == "c" ]; then aFldr="${aClient}"; fi
if [ "${1:0:1}" == "s" ]; then aFldr="${aServer}"; fi

# Handle specific app names for docs-viewer apps
#if [ "${aApp}" == "s01" ]; then aAppName="s01_docs-viewer-api"; fi
#if [ "${aApp}" == "s02" ]; then aAppName="s02_docs-viewer-api"; fi
#if [ "${aApp}" == "c01" ]; then aAppName="c01_docs-viewer-app"; fi
#if [ "${aApp}" == "c02" ]; then aAppName="c02_docs-viewer-app"; fi

if [ -d "${aFldr}" ] && [ "${aAppName}" == "Unknown" ]; then
   aAppName=$(  find "./${aFldr}" -maxdepth 3 -type d -name "${aApp}_*" | awk '{ sub( /.+\//, ""   ); print; exit }' )   # .(51119.01.1 RAM Was maxdepth=1)
   fi
   }
# ---------------------------------------------------

function chkEnvFile( ) {                                                                # .(50915.02.1 RAM Write chkEnvFile Beg)
         aServerDir="$1"                                                                # .(50915.02b.1)
         aENV_FILE="$( getFVar "ENV_FILE" | tr 'A-Z' 'a-z' )";                          # .(51108.06.1 Beg)

  if [ ! -f "${aServer}/${aServerDir}/.env" ] || [ "${bDoit}" == "1" ]; then
          sayMsg ""
       if [ "${aENV_FILE}" == "" ]; then
          sayMsg "! Missing ENV_FILE, using 'Local'";         aENV_FILE="local"; fi
       if [    "${aENV_FILE/.env/}" == "${aENV_FILE}" ]; then aENV_FILE="${aServer}/${aServerDir}/.env-$( echo ${aENV_FILE} | tr 'A-Z' 'a-z' )"; fi  # .(50915.02b.2 RAM .env not in ENV_FILE)
       if [    "${aENV_FILE/.env/}" != "${aENV_FILE}" ]; then aENV_FILE="${aServer}/${aServerDir}/$(      echo ${aENV_FILE} | tr 'A-Z' 'a-z' )"; fi  # .(50915.02b.3 RAM .env in ENV_FILE)
       if [ -f "${aENV_FILE}" ]; then
          sayMsg "  Copying \"${aENV_FILE}\" to \"${aServer}/${aServerDir}/.env\""
          cp "${aENV_FILE}" "${aServer}/${aServerDir}/.env"                             # .(51108.06.2 RAM Copy .env-xxx to .env)
       else
          sayMsg "! Missing ENV_FILE: \"${aENV_FILE}\". Can't copy to \"${aServer}/${aServerDir}/.env\"."
          fi;
      fi
   }                                                                                    # .(50915.02.1 End)
# ---------------------------------------------------

function chkApp( ) {                                                                    # .(51204.01.1 RAM Write chkApp Beg)
    local aApp="$1"
    local aType="${aApp:0:1}"  # First character: c, s, or a
    local nClient="${aApp:1:1}"  # Second digit (client/server number)
    local nApp="${aApp:2:1}"     # Third digit (app number)

    # 1. Validate argument format: must be [csa][0-9]{2}
    if [[ ! "$aApp" =~ ^[csa][0-9]{2}$ ]]; then
        sayMsg "x Invalid app format: '$aApp'. Must be c##, s##, or a## where ## is [0-9]{2}"
        exit 1
    fi

    # 2. Check folder existence based on type

    # Check client folder if type is 'c' or 'a'
    if [[ "$aType" == "c" ]] || [[ "$aType" == "a" ]]; then
        local aClientFolder=""
        if [ "$nClient" == "0" ]; then
            aClientFolder="client"
        else
            aClientFolder="client${nClient}"
        fi

        # Find matching folder with at least 10 characters in name
        local aFound
        aFound=$(find "./${aClientFolder}" -maxdepth 1 -type d -name "c${nClient}${nApp}_*" 2>/dev/null | head -1)
        if [ -n "$aFound" ] && [ ${#aFound} -ge $((${#aClientFolder} + 12)) ]; then
            : # Client folder found
        else
            sayMsg "x Client folder not found: ./${aClientFolder}/c${nClient}${nApp}_* (min 10 chars after _)"
            exit 1
        fi
    fi

    # Check server folder if type is 's' or 'a'
    if [[ "$aType" == "s" ]] || [[ "$aType" == "a" ]]; then
        local aServerFolder=""
        if [ "$nClient" == "0" ]; then
            aServerFolder="server"
        else
            aServerFolder="server${nClient}"
        fi

        # Find matching folder with at least 10 characters in name
        local aFound
        aFound=$(find "./${aServerFolder}" -maxdepth 1 -type d -name "s${nClient}${nApp}_*" 2>/dev/null | head -1)
        if [ -n "$aFound" ] && [ ${#aFound} -ge $((${#aServerFolder} + 12)) ]; then
            : # Server folder found
        else
            sayMsg "x Server folder not found: ./${aServerFolder}/s${nClient}${nApp}_* (min 10 chars after _)"
            exit 1
        fi
    fi

    # Return success if we got here
    return 0
   }                                                                                    # .(51204.01.1 End)
# ---------------------------------------------------

function setServerAPI_URL() {                                                           # .(51108.07.2 RAM Server only).(50911.04.1 RAM Write function Beg)
         cd "${aRootDir}" || return
         aServerDir=$1
         }                                                                              # .(50911.04.1 End)
# ---------------------------------------------------

function setClientAPI_URL() {                                                           # .(50911.04.1 RAM Write function Beg)
         cd "${aRootDir}" || return
         }                                                                              # .(50911.04.1 End)
# ---------------------------------------------------
# -------------------------------------------------------------------------------------------------

function runServer() {
#                        echo "\n  runServer( '$1', '$2' )"
    sayMsg ""
    setPort "$1" "$2"  # Sets aServer, aApp and nPort
    chkPort ${nPort}   # Kill any existing processes on our ports
    getAppName $1 $2;  # echo "  Server Port: ${nPort} for ${aAppName}";# exit; return
#   echo -e "\n  runServer[1] Client nPort: ${nPort} for ${aAppName}";                  # .(50113.05.3 RAM ??? To get the client folder)

#   Install dependencies if needed
 if [ "$(command -v nodemon)" == "" ]; then npm install -g nodemon >/dev/null 2>&1; fi

    bDoit="0"; if [ "${3:0:2}" == "-d" ]; then bDoit="1"; fi
 if [ ! -d "${aServer}/node_modules"   ]; then bDoit="1"; fi

 if [ "${bDoit}" == "1" ] && [ ! -f "${aServer}/package.json" ]; then
    sayMsg "|n! Missing ./${aServer}/package.json. Can't install node_modules!\n"
    fi
 if [ "${bDoit}" == "1" ] && [ -f "${aServer}/package.json" ]; then

    sayMsg "|n  Installing ${aServer} dependencies..."
    cd ${aServer} || return
    npm install
    echo -e "\n-----------------------------------------------------------------------"
    cd .. || return
    fi
 #   ----------------------------------------------------------------

    sayMsg "|n  Starting ${aServer}, ${aAppName}, on port ${nPort} ..."
#   cd ${aServer}/${aApp}_*
    cd ${aServer}/${aAppName} || return
#   node server.mjs &

    aExt='mjs'; if [ -f "server.js" ]; then aExt='js'; fi
    sayMsg   "  node --trace-deprecation ${aQuiet}\"server.${aExt}\""; echo ""

        node --trace-deprecation ${aQuiet} server.${aExt} &
        SERVER_PID=$!

#   sayMsg   "% Server is running at: http://localhost:${nPort}/api\n"
#   if [ "${aQuiet}" == "" ]; then echo ""; fi
    cd ../.. || return
    }
# ---------------------------------------------------

function runClient() {

    sayMsg ""
    setPort "$1" "$2"  # Sets aClient, aApp and nPort
    chkPort ${nPort}   # Kill any existing processes on our ports
    getAppName $1 $2;  # echo -e "  Client Port: ${nPort} for ${aAppName}"; return
#   echo "  runClient[2] \$2: '$2', nPort: '${nPort}', aServerName: '${aServerName}'"

#   Install dependencies if needed
 if [ "$(command -v live-server)" == "" ]; then npm install -g live-server >/dev/null 2>&1; fi

    bDoit="0"; if [ "${3:0:2}" == "-d" ]; then bDoit="1"; fi
 if [ ! -d "${aClient}/node_modules"   ]; then bDoit="1"; fi
 if [ "${bDoit}" == "1" ] && [ -f "${aClient}/package.json" ]; then

    sayMsg "|n  Installing ${aClient} dependencies..."
    cd ${aClient} || return
    npm install
    sayMsg "-----------------------------------------------------------------------"
    cd .. || return
    fi
 #   ----------------------------------------------------------------

    sayMsg "|n  Starting ${aClient}, ${aAppName}, on port ${nPort} ..."

#   cd ${aClient}/${aApp}_*
    cd ${aClient}/${aAppName} || return
#   npx http-server@latest -p ${nPort} -s &
#   python -m SimpleHTTPServer
#   npx -q serve -p ${nPort} -s &

#            live-server ${aQuiet} --port=${nPort} --host=0.0.0.0 --open=${aClient}/${aAppName} --watch=${aClient}/${aAppName},${aServer}/${aServerName} &   ##.(50926.05.2).(51112.0x.x)
             live-server ${aQuiet} --port=${nPort} --watch=.,../../${aServer}/${aServerName} &
             CLIENT_PID=$!

    sayMsg "|n% Client is running at: http://localhost:${nPort}"
    cd ../.. || return
    }
# --------------------------------------------------------------------
# -------------------------------------------------------------------------------------------

function main( ) {

#   chkApp  "$1"                                                                        ##.(51204.02.1 RAM Check if c## or s## or both app folderes exist).(51204.02b.1 RAM But don't use it)
    getFVARS                                                                            # .(51210.01.2 RAM Use it)

#   ------------------------------------------------------------------

    getPrjNo; getStgNo;

    nPort="${nPrj}${nStg}##"
    getAppName "s${1:1:2}" ${nPort}; aServerName=${aAppName}
 #  echo "  Starting ${aAppName}"; exit

    chkEnvFile ${aServerName}                                                           # .(50915.02b.4 RAM Add sServerName).(50915.02.2 RAM Use chkEnvFile)

    bFirst=1
#   sayMsg "-----------------------------------------------------------------------"

 if [ "${1:0:1}" == "s" ] || [ "${1:0:1}" == "a" ]; then
    setServerAPI_URL "${aServerName}"
    runServer "s${1:1:2}" ${nPort} $2
    sleep 6  # Wait for server to start
    sayMsg "|n-----------------------------------------------------------------------"

    fi
 if [ "${1:0:1}" == "c" ] || [ "${1:0:1}" == "a" ]; then
#   setClientAPI_URL
    runClient "c${1:1:2}" ${nPort}                                                      # .(50911.04.4)
    sayMsg "|n-----------------------------------------------------------------------"
    fi
# ---------------------------------------------------

    sayMsg "|n  Press Ctrl+C to stop one or both processes\n"
#   if [ "${OS:0:3}" != "Win" ]; then echo ""; fi;
     }
# -------------------------------------------------------------------------------------------------------
# Process all arguments - handle space-separated, comma-separated, or quoted formats

all_args="$*"
all_args="${all_args//,/ }"  # Replace commas with spaces

for arg in $all_args; do
    if [[ "$arg" =~ ^[asc][0-9]{2}$ ]]; then
#       echo "Processing: $arg"
        main "$arg"
    fi
done
# -------------------------------------------------------------------------------------------------------

#   Wait for user interrupt
    trap 'kill $SERVER_PID $CLIENT_PID; exit' INT
    wait
