#!/bin/bash

    Project="IODD"
    Stage="prod-master"
    GitHub_Acct="brucetroutman-gmail"
    GitHub_Cert="{none}"
    GitHub_SSH="no"

#   RepoDir="${Project}_${Stage}"     # 1 {Project}_gitr_config.sh
    RepoDir="${Project}_/${Stage}"    # 2 {Project}_gitr_stg-config.sh
#   RepoDir="${Project}"              # 3 {Project}_gitr-config.sh
#   RepoDir="${Project}/${Stage}"     # 4 {Project}_gitr-stg-config.sh

    WebsDir="/c/WEBs/8020/VMs/et218t/webs/nodeapps"

    Apps+=( "/_way-back/" )
    Apps+=( "/README.md" )
    Apps+=( "/code-workspace" )

    Sparse="false"
#   ------------------------------------------------

    export aProject="${Project}"
    export aStage="${Stage}"
    export aRepo="${Project}COM_${Stage}"
    export aRepoDir="${RepoDir}"
    export aWebsDir="${WebsDir}"
    export aGitHub_Cert="${GitHub_Cert}"
    export aGitHub_Acct="${GitHub_Acct}"
    export aGitHub_SSH="${GitHub_SSH}"
    export bAll=$( echo "${Sparse}" | awk '{ print ($0 == "true") ? 1 : 0 }' )
    export Apps

