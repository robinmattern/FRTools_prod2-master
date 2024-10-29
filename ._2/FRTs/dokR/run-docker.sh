#!/bin/bash

#  External folder for anythingllm data

   export DOCKR_STORAGE_LOCATION="/E/Repos/Robin/AnyLLM_/docker-master/data"
#  export DOCKR_STORAGE_LOCATION="$HOME/Repos/AnyLLM_/docker-master/data"
#  export DOCKR_STORAGE_LOCATION="/webs/anyllm_/docker-master/data"           # Ubuntu

   export DOCKR_IMAGE_NAME="Mintplexlabs/AnythingLLM:latest"

#  ---------------------------------------------------------------------------------------

if [ "${OS:0:7}" == "Windows" ]; then

   DOCKR_RUN_COMMAND='
docker run -d -p 3001:3001 `
  --cap-add SYS_ADMIN `
  -v "$env:STORAGE_LOCATION:/app/server/storage" `
  -v "$env:STORAGE_LOCATION\.env:/app/server/.env" `
  -e STORAGE_DIR="/app/server/storage" `
     '$( echo ${DOCKR_IMAGE_NAME} | tr '[:upper:]' '[:lower:]' );

   DOCKR_RUN_COMMAND1='
$env:STORAGE_LOCATION="'${DOCKR_STORAGE_LOCATION}'"; `
  If (!(Test-Path  $env:STORAGE_LOCATION))       { New-Item  $env:STORAGE_LOCATION -ItemType Directory }; `
  If (!(Test-Path "$env:STORAGE_LOCATION\.env")) { New-Item "$env:STORAGE_LOCATION\.env" }; `'

 else

   DOCKR_RUN_COMMAND='
docker run -d -p 3005:3001 \
 --cap-add SYS_ADMIN \
 -v "${STORAGE_LOCATION}:/app/server/storage" \
 -v "${STORAGE_LOCATION}/.env:/app/server/.env" \
 -e STORAGE_DIR="/app/server/storage" \
    '$( echo ${DOCKR_IMAGE_NAME} | tr '[:upper:]' '[:lower:]' );

   DOCKR_RUN_COMMAND1='
export STORAGE_LOCATION="'${DOCKR_STORAGE_LOCATION}'" && \
 mkdir -p $STORAGE_LOCATION && \
 touch   "$STORAGE_LOCATION/.env" && \'

# -v ${STORAGE_LOCATION}:/app/server/storage \
# -v ${STORAGE_LOCATION}/.env:/app/server/.env \

  fi

  export  DOCKR_RUN_COMMAND
  export  DOCKR_RUN_COMMAND1
# echo "${DOCKR_RUN_COMMAND}${DOCKR_RUN_COMMAND1}"; echo ""

#  ---------------------------------------------------------------------------------------

  echo "## ${FRT_RUN_DOCKR}  $@ (${DOCKR_IMAGE_NAME})"
           ${FRT_RUN_DOCKR} "$@"



