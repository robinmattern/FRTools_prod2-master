#!/bin/bash

#  ---------------------------------------------------------------------------------------

function echo_exit() {
   if [ "${OSTYPE:0:6}" == "darwin" ]; then echo ""; fi
   exit
   }

   AWK="awk"; if [ "${OSTYPE:0:6}" == "darwin" ]; then AWK="gawk"; fi

   aErr=$( docker info 2>&1 | awk '/ERROR|error/ { print 1; exit };' )
   if [ "${aErr}" == "1" ]; then echo -e "\n* The Docker Engine is not running.  Use Docker Desktop to start it."; echo_exit; fi

   echo ""
   CONTAINER_NAME="${DOCKR_IMAGE_NAME}"; # echo ": ${CONTAINER_NAME/\//.}" | tr "[:upper:]" "[:lower:]"; exit
   CONTAINER_ID="$(docker ps -a  2>&1 |  awk '/'$( echo ${CONTAINER_NAME/\//.}  | tr "[:upper:]" "[:lower:]" )'/ { print $1; exit }' )"
   CONTAINER_ID="${CONTAINER_ID/CONTAINER/}"  # Make it MT if not found


#  ----------------------------------------------------------------------------

# if [ "${1:0:3}" == "hel" ] || [ "${1:0:3}" == "--h" ]; then
  if [ "$1" == "" ]; then
                                        aCONTAINER_NAME="${CONTAINER_NAME} "
   if [ "${CONTAINER_ID}" == "" ]; then aCONTAINER_NAME=""; CONTAINER_ID="not known"; fi

#  echo "  Given container for image: ${aCONTAINER_NAME}(${CONTAINER_ID})"
   echo "  Use any of these dockr commands:"
   echo ""
   echo "    list        List all running and suspended containers"
   echo "    stats       Display container usage ala 'top'"
   echo "    images      List all pulled images from Docker Hub or Quay.io"
   echo "    running     or containers, same as list, but only for running containers"
   echo "    ports       List running ports"
   echo "    ports kill {PORT}"
   echo ""
   echo "  For the current image, or new image: {IMAGE_NAME}"
   echo "    init {IMAGE_NAME}   Create run-docker.sh in current folder for {IMAGE_NAME}"
   echo "    pull {IMAGE_NAME}   Pull the Docker image {IMAGE_NAME}"
   echo "    pull                Pull the current Docker image ${DOCKR_IMAGE_NAME}"
   echo "    update              Pull the latest Docker image $( echo "${DOCKR_IMAGE_NAME}" | awk '{ sub( /:.+$/, "" ); print }' ):latest"
   echo "    image inspect|show  Return JSON properties or show a few for the current image"
   echo ""
#  echo "  For this image: ${aCONTAINER_NAME}(${CONTAINER_ID})"
   echo "  For this container (${CONTAINER_ID}) for this image: ${aCONTAINER_NAME}"
   echo "    start -v Run the ${aCONTAINER_NAME}container, after removing it"
   echo "    restart  Same as above. Options, show or -v, show run command script"
   echo "    suspend  Stop the running ${aCONTAINER_NAME}container"
   echo "    resume   Start the suspended ${aCONTAINER_NAME}container"
   echo "    stop     Stop, then remove the ${aCONTAINER_NAME}container"
   echo "    login    Login into the ${aCONTAINER_NAME}container (ala SSH)"
   echo "    mounts   List all mounts for the ${aCONTAINER_NAME}container"
   echo "    labels   List Docker labels for the ${aCONTAINER_NAME}container"
   echo "    inspect  Return JSON properties file for the ${aCONTAINER_NAME}container"
   echo "    show     Show various properties of the ${aCONTAINER_NAME}container"
   echo "    logs     Display latest log entries for ${aCONTAINER_NAME}container"
   echo_exit
   fi
#  ----------------------------------------------------------------------------

if [ "${1:0:3}" == "ini" ]; then
if [ "$2" == "" ]; then
   echo "* Please provide an image name."
 else
#  echo "  cp -p ${FRT_Dir}/FRT24_run-docker.sh run-docker.sh"
#  cat "${FRT_Dir}/FRT24_run-docker.sh" | awk '{ sub( /{IMAGE_NAME}/, "'$2'" ); print }' >run-docker.sh
   awk '{ sub( /{IMAGE_NAME}/, "'$2'" ); print }' "${FRT_Dir}/FRT24_run-docker.sh" >run-docker.sh

   chmod 755 run-docker.sh
   echo "  Created script, run.docker.sh, for image: $2."
   fi
   echo_exit
   fi
#  ----------------------------------------------------------------------------

if [ "${1:0:4}" == "stat" ]; then

   docker stats
   echo_exit
   fi
#  ----------------------------------------------------------------------------

function prtItem( ) {
   echo awk '{ '$2'; printf "  %-38s : %s\n", "'$3'", a }'
   echo "cat \"@inspect.json\" | jq '.[0].$1'"
         cat  "@inspect.json"  | jq '.[0].$1'

#  cat "@inspect.json" | jq '.[0].$1' | awk '{ '$2'; printf "  %-38s : %s\n", "'$3'", a }'
   }
#  -------------------------------------------------------------

if [ "${1:0:3}" == "ima" ]; then
if [ "${2:0:3}" == "sho" ]; then

   docker image inspect "$( echo ${DOCKR_IMAGE_NAME} | tr "[:upper:]" "[:lower:]" )" >@inspect.json

#  prtItem "Created"                                                   'gsub( /["]/, "" ); sub( /T/, " " ); a = substr( $0, 1, 19 )' "CREATED_AT"
#  prtItem "Config.Labels.org.opencontainers.image.created"            'gsub( /["]/, "" ); sub( /T/, " " ); a = substr( $0, 1, 19 )' "CREATED_AT"
   cat "@inspect.json" | jq '.[0].Id'               | awk            '{ gsub( /["]/, "" );                  printf "  %-38s : %s\n", "IMAGE ID",      substr( $0,  8, 12 ) }'
   cat "@inspect.json" | jq '.[0].Config.Labels'    | awk '/revision/ { gsub( /["]/, "" );                  printf "  %-38s : %s\n", "COMMIT ID",     substr( $0, 38, 15 ) }'
   cat "@inspect.json" | jq '.[0].RepoTags[0]'      | awk            '{ gsub( /["]/, "" );                  printf "  %-38s : %s\n", "IMAGE_NAME:TAG",        $0           }'
   cat "@inspect.json" | jq '.[0].Config.Labels'    | awk '/title/    { gsub( /["]/, "" ); sub( /,/, ""  ); printf "  %-38s : %s\n", "TITLE",         substr( $0, 35     ) }'
   cat "@inspect.json" | jq '.[0].Created'          | awk            '{ gsub( /["]/, "" ); sub( /T/, " " ); printf "  %-38s : %s\n", "CREATED_AT",    substr( $0,  1, 19 ) }'
#  cat "@inspect.json" | jq '.[0].Config.Labels'    | awk '/created/  { gsub( /["]/, "" ); sub( /T/, " " ); printf "  %-38s : %s\n", "UPDATED_AT",    substr( $0, 37, 19 ) }'
   cat "@inspect.json" | jq '.[0].Config.Labels'    | awk '/version/  { gsub( /["]/, "" ); sub( /,/, ""  ); printf "  %-38s : %s\n", "VERSION",       substr( $0, 37     ) }'
   cat "@inspect.json" | jq '.[0].RootFS.Layers | length' | awk      '{                                     printf "  %-38s : %s\n", "LAYERS",                $0           }'
   cat "@inspect.json" | jq '.[0].Size'                   | awk      '{ gsub( /["]/, "" );                  printf "  %-38s : %s\n", "SIZE",                  $0           }'

   if [ -f "@inspect.json" ]; then rm "@inspect.json"; fi
   echo_exit
   fi
#  -------------------------------------------------------------

if [ "${2:0:3}" == "ins" ]; then

   docker image inspect "$( echo ${DOCKR_IMAGE_NAME} | tr "[:upper:]" "[:lower:]" )"
 else
   docker image ls -a | awk '/failed/ {next}; { print "  " $0 }'
   fi

   echo_exit
   fi
#  ----------------------------------------------------------------------------
                                                             aCmd=""
if [ "${1:0:3}" == "lis"  ];                            then aCmd="list"; fi
if [ "${1:0:4}" == "runn" ] || [ "${1:0:3}" == "con" ]; then aCmd="list"; fi
if [ "${aCmd}"  == "list" ]; then
if [ "${1:0:4}" == "runn" ]; then all=""; else all="-a"; fi

aAWKscr='
BEGIN { aFmt = "  %12s  %-20s  %-35s  %s\n" }

   /failed/    { next }

   /CONTAINER/ { nPos1 = index( $0, "CONTAINER" )
                 nPos2 = index( $0, "IMAGE"   ) + 0
                 nPos3 = index( $0, "COMMAND" ); nLen2 = nPos3 - nPos2
                 nPos4 = index( $0, "STATUS"  ) + 0;
                 nPos5 = index( $0, "PORTS"   );   nLen4 = nPos5 - nPos4
                 nPos6 = index( $0, "NAMES"   ) + 0

#                printf aFmt,  nPos1","12,     nPos6,                  nPos2","nLen2,                        nPos4","nLen4
                 printf aFmt, "CONTAINER ID", "NAME",                 "IMAGE",                               "STATUS"
                 printf aFmt, "------------", "--------------------", "-----------------------------------", "----------------------------------------"
                 next
                 }
              {  aName   = substr( $0, nPos6        ); sub( /^ +/, "", aName   ); if (length( aName  ) > 20) { aName  = substr( aName,  1, 17 )"..." }
                 aStatus = substr( $0, nPos4, nLen4 ); sub( /^ +/, "", aStatus );
                 aImage  = substr( $0, nPos2, nLen2 ); sub( / +$/, "", aImage  ); if (length( aImage ) > 35) { aImage = substr( aImage, 1, 32 )"..." }
                 printf aFmt, $1, aName, aImage,  aStatus
                 }
'
   docker ps ${all} | awk "${aAWKscr}"

   echo_exit
   fi
#  ----------------------------------------------------------------------------

if [ ! -f "run-docker.sh" ]; then
   echo "* You must be in a folder that contains a run-docker.sh script."
   echo_exit
   fi
#  ----------------------------------------------------------------------------

if [ "${1:0:3}" == "sto" ] || [ "${1:0:3}" == "sta" ]; then
if [ "${2:0:3}" != "sho" ]; then

if [ "$2" != "" ] && [ "$2" != "-v" ]; then

        DOCKR_IMAGE_NAME="$( docker ps -a | awk '/'$( echo $2 )'/ { print $2; exit }' )"
        CONTAINER_ID="$(     docker ps -a | awk '/'$( echo $2 )'/ { print $1; exit }' )"
if [ "${CONTAINER_ID}" == "" ]; then

   echo "* Container ID, $2, not found."
   echo_exit
   fi; fi;
#  ---------------------------------------------------------------

if [ "${CONTAINER_ID}" != "" ]; then

   docker stop ${CONTAINER_ID} >/dev/null
   docker rm   ${CONTAINER_ID} >/dev/null

   echo "  Removed Container ${CONTAINER_ID} (${DOCKR_IMAGE_NAME})"

if [ "${1:0:3}" == "sto" ]; then echo_exit; else bRemoved=1; fi
   fi; fi; fi
#  ----------------------------------------------------------------------------

function dockr_start() {

   export STORAGE_LOCATION="${DOCKR_STORAGE_LOCATION}"

if [ ! -d "${STORAGE_LOCATION}" ]; then mkdir -p "${STORAGE_LOCATION}"; fi

if [ "${OS:0:7}" == "Windows"   ]; then

   STORAGE_LOCATION="${STORAGE_LOCATION/\/E/E:}"
   STORAGE_LOCATION="${STORAGE_LOCATION//\//\\\\}"

   aRun_Cmd=$(echo "${DOCKR_RUN_COMMAND}" | sed "s|\$env:STORAGE_LOCATION|${STORAGE_LOCATION}|g")
   echo "${aRun_Cmd}" >"run-docker.ps1"

if [ "${1:0:2}" == "-v" ]; then
   echo "${aRun_Cmd}" | awk '{ print "  "$0 }'; echo ""
   echo "powershell -ExecutionPolicy Bypass -file run.docker.ps1"             | awk '{ print "  "$0 }'
   powershell -ExecutionPolicy Bypass "${aRun_Cmd}" -file run-docker.ps1 2>&1 | awk '{ print "  "$0 }'
#  powershell -ExecutionPolicy Bypass "${aRun_Cmd}"    2>&1 | awk '{ print "  "$0 }'; echo ""
   if [ "$?" != "0" ]; then echo_exit; else echo ""; fi
 else
#  powershell -ExecutionPolicy Bypass "${aRunCmd}" >/dev/null
   powershell -ExecutionPolicy Bypass "${aRun_Cmd}" -file run-docker.ps1 2>&1 >/dev/null
   fi
#  if [ "$?" != "0" ]; then echo_exit; fi

 else
    aRun_Cmd=$(echo "${DOCKR_RUN_COMMAND:8}" | sed "s|\${STORAGE_LOCATION}|${STORAGE_LOCATION}|g")

if [ "${1:0:2}" == "-v" ]; then
if [ "${bRemoved}" == "1" ]; then echo ""; fi

   echo "docker ${aRun_Cmd}" | awk '{ print "  "$0 }'; echo ""
   eval "docker ${aRun_Cmd}" | awk '{ print "  "$0 }';
 else
   eval "docker ${aRun_Cmd}" >/dev/null
   fi
#  ---------------------------------------------------------------
   fi # not Windows

   if [ "$?" != "0" ]; then echo_exit; fi

   CONTAINER_ID="$(docker ps -a | awk '/'$( echo ${CONTAINER_NAME/\//\\/} | tr "[:upper:]" "[:lower:]" )'/ { print $1; exit }' )"
   echo "  Started Container ${CONTAINER_ID} (${DOCKR_IMAGE_NAME})"
   echo_exit
   }
#  ---------------------------------------------------------------

if [ "${1:0:3}" == "sta" ] || [ "${1:0:4}" == "rest" ]; then
if [ "${2:0:3}" == "sho" ]; then

if [ "${OS:0:7}" != "Windows"   ]; then
   aRun_Cmd=$(echo "${DOCKR_RUN_COMMAND:8}" | sed "s|\${STORAGE_LOCATION}|${DOCKR_STORAGE_LOCATION}|g")    # Unix
 else
   aRun_Cmd=$(echo "${DOCKR_RUN_COMMAND:8}" | sed "s|\$env:STORAGE_LOCATION|${DOCKR_STORAGE_LOCATION}|g")  # Windows
   fi

   echo -e "  This command will be run:\n docker ${aRun_Cmd}" | awk '/This com/ { print; next }; { print "    " $0 }'; echo_exit
   fi

   dockr_start $2
   fi
#  ----------------------------------------------------------------------------

if [ "${1:0:3}" == "upd" ]; then
if [ "${CONTAINER_ID}" != "" ]; then

   docker stop ${CONTAINER_ID} >/dev/null
   docker rm   ${CONTAINER_ID} >/dev/null

   echo "  Removed Container ${CONTAINER_ID} (${DOCKR_IMAGE_NAME})"
   bRemoved=1
   fi;
#  ---------------------------------------------------------------

   aNewImage="$( echo "${DOCKR_IMAGE_NAME}" | awk '{ sub( /:.+$/, "" ); print }' ):latest"
   ${AWK} -i inplace '{ sub( /NAME=".+"/, "NAME=\"'${aNewImage}'\"" ); print }'  run-docker.sh
   DOCKR_IMAGE_NAME="${aNewImage}"

   echo "  docker pull \"$( echo ${DOCKR_IMAGE_NAME} | tr "[:upper:]" "[:lower:]" )\""; echo ""
           docker pull  "$( echo ${DOCKR_IMAGE_NAME} | tr "[:upper:]" "[:lower:]" )"

   echo ""
   dockr_start "" # not "-v"

   echo_exit
   fi
#  ----------------------------------------------------------------------------

if [ "${1:0:3}" == "pul" ]; then
if [ "${2:0:3}" != ""    ]; then

   ${AWK} -i inplace '{ sub( /NAME=".+"/, "NAME=\"'$2'\"" ); print }' run-docker.sh
   DOCKR_IMAGE_NAME=$2
   fi
   echo "  docker pull \"$( echo ${DOCKR_IMAGE_NAME} | tr "[:upper:]" "[:lower:]" )\""; echo ""
           docker pull  "$( echo ${DOCKR_IMAGE_NAME} | tr "[:upper:]" "[:lower:]" )"
   echo_exit
   fi
#  ----------------------------------------------------------------------------

if [ "$2" != "" ] && [ "${1:0:3}" != "log" ]; then

        DOCKR_IMAGE_NAME="$( docker ps -a | awk '/'$( echo $2 )'/ { print $2; exit }' )"
        CONTAINER_ID="$(     docker ps -a | awk '/'$( echo $2 )'/ { print $1; exit }' )"
if [ "${CONTAINER_ID}" == "" ]; then

   echo "* Container ID, $2, not found."
   echo_exit
   fi; fi
#  ---------------------------------------------------------------

if [ "${CONTAINER_ID}" == "" ]; then
   echo "* There is no running container for ${DOCKR_IMAGE_NAME}."
   echo_exit
   fi
#  ----------------------------------------------------------------------------

if [ "${1:0:3}" == "sus" ]; then

#  echo "  docker stop "${DOCKR_IMAGE_NAME} (${CONTAINER_ID})"; echo ""
           docker stop "${CONTAINER_ID}" >/dev/null
   echo "  Stopped Container ${CONTAINER_ID} (${DOCKR_IMAGE_NAME})"
   echo_exit
   fi
#  ----------------------------------------------------------------------------

if [ "${1:0:3}" == "res" ]; then  # Resume, not re-run

           docker start "${CONTAINER_ID}" >/dev/null
   echo "  Re-started Container ${CONTAINER_ID} (${DOCKR_IMAGE_NAME})"
   echo_exit
   fi
#  ----------------------------------------------------------------------------

if [ "${1:0:5}" == "login" ]; then

   docker exec -it ${CONTAINER_ID} bash
   echo_exit
   fi
#  ----------------------------------------------------------------------------

if [ "${1:0:3}" == "log" ]; then
if [ "$2" != "" ]; then nLines="-n $2"; else nLines="-f"; fi

#  echo "  docker logs ${nLines} -t ${CONTAINER_ID}"; echo ""
           docker logs ${nLines} -t ${CONTAINER_ID}
   echo -e " -- or you can do this to save the entire log:\n"
#  echo "  dockr log 20 ${CONTAINER_ID}     | sed -r 's/\\[[0-9;]*m//g' >log.txt 2>&1";
   echo "  dockr log 5000 ${CONTAINER_ID} 2>&1 | sed -r 's/\\[[0-9;]*m//g' >log.txt"

   echo_exit
   fi
#  ----------------------------------------------------------------------------

if [ "${1:0:3}" == "ins" ]; then
if [ "${2:0:3}" == "ima" ]; then

   docker image inspect ${DOCKR_IMAGE_NAME}  # Not used
 else
   docker inspect ${CONTAINER_ID}
   fi
   echo_exit
   fi
#  ----------------------------------------------------------------------------

if [ "${1:0:3}" == "sho" ];  then
if ! which jq >/dev/null 2>&1; then echo "* The required command jq is not installed.\n  Try brew install jq, or apt install jq."; echo_exit; fi

   docker inspect ${CONTAINER_ID} >@inspect.json

   aPort1="$( cat "@inspect.json" | jq '.[0].Config.ExposedPorts'     | awk '/:/ { p = substr( $0, 4 ); sub( /".+/,  "", p ); print p }' )"
   aPort2="$( cat "@inspect.json" | jq '.[0].HostConfig.PortBindings' | awk '/Ip/ { ip=substr($0,17) }; /Port/ { p = substr($0, 20); sub( /"/, "", p); p = ip p; sub( /,/, ":", p); print p }' )"
#  echo "-- aPort1: '${aPort1}', aPort2: '${aPort2}'"; echo_exit

   cat "@inspect.json" | jq '.[0].Id'              | awk '{                                     printf "  %-38s : %s\n", "ID",         substr( $0, 2, 12 ) }'
   cat "@inspect.json" | jq '.[0].Created'         | awk '{ gsub( /["]/, "" ); sub( /T/, " " ); printf "  %-38s : %s\n", "CREATED_AT", substr( $0, 1, 19 ) }'
   cat "@inspect.json" | jq '.[0].State.StartedAt' | awk '{ gsub( /["]/, "" ); sub( /T/, " " ); printf "  %-38s : %s\n", "STARTED_AT", substr( $0, 1, 19 ) }'
   cat "@inspect.json" | jq '.[0].Name'            | awk '{ gsub( /["]/, "" );                  printf "  %-38s : %s\n", "CONTAINER_NAME", substr( $0, 2 ) }'
   echo "${DOCKR_IMAGE_NAME}"                      | awk '{                                     printf "  %-38s : %s\n", "IMAGE_NAME:TAG", $0 }'
   echo $( pwd )                                   | awk '{                                     printf "  %-38s : %s\n", "DOCKER_FOLDER",          $0 }'
   echo "${DOCKR_STORAGE_LOCATION}"                | awk '{                                     printf "  %-38s : %s\n", "HOST_STORAGE_LOCATION",  $0 }'
   cat "@inspect.json" | jq '.[0].Config.Env'      | awk '/=/ { gsub( /[",]/, "" ); sub( /PATH/, "INTERNAL_PATH" ); split( $0, m, "=" ); h = m[3] ? ":"m[3] : ""; t = m[4] ? ":"m[4] : ""; h = m[2] h t; h = (length(h) < 135) ? h : substr( h, 1, 131 )"..."; printf "%-40s : %s\n", m[1], h }'
   echo "${aPort1}"                                | awk '{                                     printf "  %-38s : %s\n", "INTERNAL_PORT",  $0 }'
   echo "${aPort2}"                                | awk '{                                     printf "  %-38s : %s\n", "HOST_IP:PORT",   $0 }'
   cat "@inspect.json" | jq '.[0].State.Status'    | awk '{ gsub( /["]/, "" );                  printf "  %-38s : %s\n", "STATUS", $0 }'

   if [ -f "@inspect.json" ]; then rm "@inspect.json"; fi
   echo_exit
   fi
#  ----------------------------------------------------------------------------

if [ "${1:0:3}" == "lab" ]; then

   docker inspect ${CONTAINER_ID} | jq '.[0].Config.Labels' | awk '/:/ { gsub( /[",]/, "" ); split( $0, m, ":" ); h = m[3] ? ":"m[3] : ""; t = m[4] ? ":"m[4] : ""; printf "%-40s : %s\n", m[1], m[2] h t }'
#  docker inspect ${CONTAINER_ID} | jq '.[0].Config.Labels' | awk '/:/ { gsub( /[",]/, "" ); print }'
   echo_exit
   fi
#  ----------------------------------------------------------------------------

if [ "${1:0:3}" == "mou" ]; then

#  docker inspect ${CONTAINER_ID} | awk '/"Source"/ { print }'; echo ""
#  docker inspect ${CONTAINER_ID} | awk '/"Source"/ { sub( /^.+:/, "  \"" );   gsub( /\\\\/, "/" );     sub( /,$/, "" ); print }'
#  docker inspect ${CONTAINER_ID} | awk '/"Source"/ { if ($0 ~ "var") { next }; sub( /^.+:/, "  \"" ); gsub( /\\\\/, "/" ); sub( /,$/, "" ); print }'
#  docker inspect ${CONTAINER_ID} | awk '/"Source"/ { sub( /^.+:/, "  \"" );    sub( /^  " /, "  ");   gsub( /\\\\/, "/" ); sub( /,$/, "" ); print }'
#  docker inspect ${CONTAINER_ID} | awk '/"Source"/ { sub( /^.+Source": /, "  " ); gsub( /\\\\/, "/" ); sub( /,$/, "" ); print }' | sort -r
   docker inspect ${CONTAINER_ID} | jq '.[0].HostConfig.Binds' | ${AWK} '/:/ { gsub( /[",]/, "" ); gsub( /\\\\/, "/" ); a = gensub( /([A-Z]):/, "/\\1", "g" ); split( a, m, ":" ); printf "%-60s : %s\n", m[1], m[2] }'
#  docker inspect ${CONTAINER_ID} | jq '.[0].HostConfig.Binds' | ${AWK} '/:/ { gsub( /[",]/, "" ); gsub( /\\\\/, "/" ); a = gensub( /([A-Z]):/, "/\\1", "g" ); print a }'
   echo_exit
   fi
#  ----------------------------------------------------------------------------

#  echo ""

#  ---------------------------------------------------------------------------------------
#  This AnythingLLM Docker run command not only starts the docker container,
#  it also creates a folder outside of the container to hold the
#  SQLite database and .env file.

if [ "${1:0:3}" == "hel" ] || [ "${1:0:3}" == "--h" ]; then

   if [ "${OS:0:7}" == "Windows" ]; then aShell="PowerShell"; else aShell="Bash"; fi

   echo -e "  Use run-docker.sh commands: start, suspend, resume, stop, inspect, login, mounts, logs"
   echo -e "                               list, running, images, show, stats, logs\n"
   echo -e "Here is the original ${aShell} command to create a new Docker container for ${DOCKR_IMAGE_NAME}:"

   echo -e "${DOCKR_RUN_COMMAND1}${DOCKR_RUN_COMMAND}" | awk '/DOCKR/ { print; next }; { print "    " $0 }';
   echo -e "\nIt creates a folder, ${DOCKR_STORAGE_LOCATION},"
   echo -e "  that perserves data outside of the Docker container.";
   echo_exit

fi

