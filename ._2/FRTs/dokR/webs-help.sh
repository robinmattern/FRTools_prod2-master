#!/bin/bash

function Help() {
     echo ""
     echo "  Run any of these commands:"
     echo ""
     echo "    webs nginx restart              systemctl restart nginx"
     echo "    webs nginx check                nginx -t"
     echo ""
#    echo "    webs [sho]log {App} [access]    tail [ -n 100 | -f ] /var/log/nginx/{App}-access.log"
#    echo "    webs [sho]log {App}  error      tail [ -n 100 | -f ] /var/log/nginx/{App}-error.log"
#    echo "    webs [sho]log {App}  dir        cd /var/log/nginx/{App}*"
     echo "    webs [c]log [ng] {App} [access] tail [ -f | -n 100 ] /var/log/nginx/{App}-access.log"
     echo "    webs [c]log [ng] {App}  error   tail [ -f | -n 100 ] /var/log/nginx/{App}-error.log"
     echo "    webs [c]log [ng] {App}  dir     cd /var/log/nginx/{App}*"
     echo ""
     echo "    webs show                       Show PID, PORT and PS output"
     echo "    webs ports                      Show PID, IPAddress and Port"
     echo "    webs ps                         Show all NodeJS processes"
     echo "    webs kill {Port}|all [doit]     Kill NodeJS apps running with a port"
     echo ""
     echo "    webs start   {App} [dev|prod]   PM2 start {App}"
     echo "    webs restart {App}              PM2 restart {App}"
     echo "    webs stop    {App}              PM2 delete {App}"
     echo "    webs config  {App}              PM2 show {App}"
     echo "    webs list                       PM2 list"
     echo "    webs version {App}"
     echo ""
     echo "  where {App} runs:"
     echo "    both             demo1 and anyllm"
     echo "    demo1     or  1  /webs/aidocs_/demo1-master/client1/c16_aidocs-review-app"
     echo "    anyllm    or  7  /webs/anyllm collector, frontend, server"
     echo "    aidocs    or 10  /webs/aidocs_/demo1-master/client1/c16_aidocs-review-app"
     echo "    robin1    or 21  /webs/aidocs_/prod1-robin/client1/c16_aidocs-review-app"
     echo "    robin2    or 22  /webs/aidocs_/test2-robin/client1/c16_aidocs-review-app"
     echo "    robin3    or 23  /webs/aidocs_/dev03-robin/client1/c16_aidocs-review-app"
#    echo "    nextjs    or 30  /webs/aidocs_/dev01-robin/nextjs2"
     echo "    rick      or 51  /webs/aidocs_/fork1-rick/client1/c16_aidocs-review-app"
     echo "    bruce     or 61  /webs/aidocs_/fork1-bruce/client1/c16_aidocs-review-app"
     echo "    suzee     or 41  /webs/aidocs_/fork1-suzee/client1/c16_aidocs-review-app"
     echo "    anyllm    or 70  /webs/anyllm collector, frontend, server"
     echo "    collector or 74  /webs/anyllm collector"
     echo "    frontend  or 75  /webs/anyllm frontend"
     echo "    server    of 76  /webs/anyllm server"
     echo ""
     }

if [ "$1" == "" ]; then
     echo ""
     echo "  Run any of these commands:"
     echo ""
     echo "    restart-nginx"
     echo "    restart-nginx check"
               kill-node-apps
               run-node-apps;                              bRam=1
    fi
# -------------------------------------------------------------------------------

                                 aCmd="";                   bRam=0
if [ "$1" == "help"      ]; then Help;                      bRam=1; fi

if [ "$1" == "nginx"     ]; then                            bRam=1;

if [ "$2" == ""          ]; then restart-nginx;                     fi
if [ "$2" == "restart"   ]; then restart-nginx;                     fi
if [ "$2" == "check"     ]; then restart-nginx check;               fi; fi

if [ "$1" == "check"     ]; then restart-nginx check;       bRam=1; fi

if [ "$1" == "show"      ]; then                            bRam=1;
if [ "$2" != ""          ]; then run-node-apps show  $2;
                            else kill-node-apps show;               fi; fi
if [ "${1:0:3}" == "ver" ]; then aCmd=version;              bRam=1; fi

if [ "$1" == "ps"        ]; then kill-node-apps ps;         bRam=1; fi
if [ "$1" == "ports"     ]; then kill-node-apps ports;      bRam=1; fi
if [ "$1" == "kill"      ]; then kill-node-apps $2 $3;      bRam=1; fi

if [ "$1" == "list"      ]; then run-node-apps list;        bRam=1; fi
if [ "$1" == "start"     ]; then run-node-apps start $2 $3; bRam=1; fi
if [ "$1" == "restart"   ]; then run-node-apps restart  $2; bRam=1; fi
if [ "$1" == "stop"      ]; then run-node-apps stop     $2; bRam=1; fi
if [ "$1" == "config"    ]; then run-node-apps show     $2; bRam=1; fi

#f [ "$1" == "shlog"     ]; then aCmd=shlog;                bRam=1; fi             ##.(40507.02.1)
#f [ "$1" == "sholog"    ]; then aCmd=shlog;                bRam=1; fi             ##.(40507.02.1)

if [ "$1" == "shlog"     ]; then aCmd=log;                  bSho=0; fi             # .(40507.02.1 RAM Beg Add pm2 logs)
if [ "$1" == "sholog"    ]; then aCmd=log;                  bSho=0; fi
if [ "$1" == "clog"      ]; then aCmd=log;                  bSho=0; fi             # .(40507.02.1 RAM Beg Add pm2 logs)
if [ "$1" == "colog"     ]; then aCmd=log;                  bSho=0; fi
if [ "${1:0:3}" == "log" ]; then aCmd=log;                  bSho=1; fi

if [ "$aCmd"    == "log" ]; then                            bRam=1;
if [ "$2" == ""          ]; then aCmd=ngx_log;                      fi
if [ "${2:0:2}" == "ng"  ]; then aCmd=ngx_log; shift;               fi
if [ "${2:0:2}" == "pm"  ]; then aCmd=pm2_log; shift;               fi; fi         # .(40507.02.1 RAM End)
if [ "$aCmd"    == "log" ]; then aCmd=ngx_log;                      fi

#  echo "  aCmd: ${aCmd}, bSho: ${bSho}, \$2: '$2', \$3: '$3'"; exit

if [ "${bRam}" != "1"    ]; then Help; exit; fi
if [ "${aCmd}" == ""     ]; then exit; fi

# -------------------------------------------------------------------------------

function setLog1( ) {
                                      aAppDir="_";       aStg=""
    if [ "$1" == "anyllm"     ]; then aAppDir="anyllm";  aStg="";                     fi # aStg="fr244p_anyllm";        fi # "";
    if [ "$1" == "aidocs"     ]; then aAppDir="aidocs";  aStg="";                     fi # aStg="fr244p_aidocs";        fi # "demo1-master";
    if [ "$1" == "demo1"      ]; then aAppDir="aidocs";  aStg="";                     fi # aStg="fr244p_aidocs";        fi # "demo1-master";
    if [ "$1" == "rick"       ]; then aAppDir="aidocs";  aStg="fr244p_aidocs-rick";   fi # aStg="fr244p_aidocs-rick";   fi # "fork1-rick";
    if [ "$1" == "bruce"      ]; then aAppDir="aidocs";  aStg="bruce";                fi # aStg="fr244p_aidocs-bruce";  fi # "fork1-bruce";
    if [ "$1" == "suzee"      ]; then aAppDir="aidocs";  aStg="suzee";                fi # aStg="fr244p_aidocs-suzee";  fi # "fork1-suzee";
    if [ "$1" == "robin"      ]; then aAppDir="aidocs";  aStg="robin";                fi # aStg="fr244p_aidocs-robin";  fi # "dev03-robin";
    if [ "$1" == ""           ]; then aAppDir="aidocs";  aStg="";                     fi # aStg="fr244p_aidocs";        fi # "demo1-master";
    if [ "$1" == "root"       ]; then aAppDir="";        aStg="";                     fi

    echo "setLog1( '$1' ) ==>  aAppDir: '${aAppDir}', aStg: '${aStg}'";  # exit
    if [ "${aAppDir}" == "_"  ]; then echo -e "\n* Nginx Log Not Found for App: '$2'\n  Valid Apps are: ${aValidApps}\n"; exit; fi
    }
# -------------------------------------------------------------------------------

function setLog2( ) {
    if [ "$2" == "1"          ]; then a=""; else s="Server"; fi
                                      aAppDir="_";                aStg=""
    if [ "$1" == "anyllm"     ]; then aAppDir="AnythingLLM";      aStg="${s}";         aRepoDir="/webs/anyllm"; fi
    if [ "$1" == "frontend"   ]; then aAppDir="AnythingLLM";      aStg="Frontend";     aRepoDir="/webs/anyllm"; fi
    if [ "$1" == "collector"  ]; then aAppDir="AnythingLLM";      aStg="Collector";    aRepoDir="/webs/anyllm"; fi
    if [ "$1" == "server"     ]; then aAppDir="AnythingLLM";      aStg="Server";       aRepoDir="/webs/anyllm"; fi
    if [ "$1" == "aidocs"     ]; then aAppDir="AI-Docs-Review--"; aStg="demo1-master"; aRepoDir="/webs/aidocs_/demo1-master"; fi
    if [ "$1" == "demo1"      ]; then aAppDir="AI-Docs-Review--"; aStg="demo1-master"; aRepoDir="/webs/aidocs_/demo1-master"; fi
    if [ "$1" == "rick"       ]; then aAppDir="AI-Docs-Review--"; aStg="fork1-rick";   aRepoDir="/webs/aidocs_/fork1-rick"; fi
    if [ "$1" == "bruce"      ]; then aAppDir="AI-Docs-Review--"; aStg="fork1-bruce";  aRepoDir="/webs/aidocs_/fork1-bruce"; fi
    if [ "$1" == "suzee"      ]; then aAppDir="AI-Docs-Review--"; aStg="fork1-suzee";  aRepoDir="/webs/aidocs_/fork1-suzee"; fi
    if [ "$1" == "robin"      ]; then aAppDir="AI-Docs-Review--"; aStg="dev03-robin";  aRepoDir="/webs/aidocs_/dev03-robin"; fi
    if [ "$1" == ""           ]; then aAppDir="AI-Docs-Review--"; aStg="demo1-master"; aRepoDir="/webs/aidocs_/demo1-master"; fi

    echo "setLog2( '$1' ) ==>  aAppDir: '${aAppDir}', aStg: '${aStg}'";  # exit

#   if [ "${aAppDir}" == ""   ]; then echo -e "\n* Log App Not Found: '$1'\n"; exit; fi
    if [ "${aAppDir}" == "_"  ] && [ "${1/_/}" != "$1" ]; then aRepoDir="/webs/$1"; return; fi
    if [ "${aAppDir}" == "_"  ]; then echo -e "\n* PM2 Log Not Found for App: '$2'\n  Valid Apps are: ${aValidApps}\n"; exit; fi
    }
# -------------------------------------------------------------------------------

function chkLogFile( ) {
#  echo "  chkLogFile( '$1.log' )";
         aNum="-1";
         aLogFile="$1.log"
#     if [ ! -f "${1}${aNum}.log" ]; then
#               echo "ls -1tr $1*";
#                     ls -ltr --time-style=full-iso ${1}${aNum}*;
#        aLogFile="$( ls -1tr $1* 2>&1 | awk 'END { print }' )";
         aLogFile="$( ls -ltr --time-style=full-iso $1* 2>&1 | awk 'END { print }' )";
 if [ "${aLogFile/cannot/}" != "${aLogFile}" ]; then echo -e "\n* Can't find a log file for: $1.\n"; exit; fi
         aLogDate="$( echo "${aLogFile}" | awk '{ print substr( $6" "$7, 1, 16 ) }' )"; aLogDate="(${aLogDate})"
         aLogFile="$( echo "${aLogFile}" | awk '{ sub( /.+-[0-9]{4} /, ""); print $0 }' )"
#        fi
#        echo "        Found '${aLogFile}' ${aLogDate}"
#        exit
    }
# -------------------------------------------------------------------------------

function LogIt( ) {

    aAwkAcc='{ ip=$1; sub( /"Moz.*/, ""); sub( /.*- -/, ""); sub( /"http:\/\/.+aidocs-review.com/, ""); printf "%15s %s\n", ip, $0 }'
    aAwkErr='{ ip=$0; sub( /.+client:/, "", ip ); sub( /, server:.+/, "", ip ); sub( /\[error].+: \*/, "" ); sub( /host:.+$/, "" ); sub( /client:.+, request/, "" ); printf "%15s %s\n", ip, $0 }'
 if [ "${aCmd}" == "pm2_log"  ]; then
    aAwkAcc='{ print }'
    aAwkErr='{ print }'
    fi
#   echo "LogIt( '$1', '$2', '$3' )";  # exit

    if [ "$1" == "dir"        ]; then                 echo "   rdir -r 1 -s 2 \"$2\" \"$3\""; fi
    if [ "$1" == "dir"        ]; then    /webs/FRTools/._2/bin/rdir -r 1 -s 2 \"$2\" \"$3\"; echo ""; exit; fi  # .(40507.02.5 RAM Add -r 2)

#   if [ "${aCmd}" == "shlog" ]; then     xTail="tail -n 25 "; else xTail="tail -f "; fi
    if [ "${bSho}" == "1"     ]; then     xTail="tail -n 25 "; else xTail="tail -f "; fi

#                      echo "";  echo " ${xTail} $2$1.log | awk ..."; # exit
#                                echo "-------------------------------------------------------------------------------"
#   if [ "$1" == "access"     ]; then   ${xTail} $2access.log | awk "${aAwkAcc}"; fi
#   if [ "$1" == "error"      ]; then   ${xTail} $2error.log  | awk "${aAwkErr}"; fi;
#   if [ "$1" == "out"        ]; then   ${xTail} $2out.log    | awk "${aAwkErr}"; fi;

    chkLogFile "$2$1"; # exit

                       echo "";  echo "  ${xTail} ${aLogFile} ${aLogDate} | awk ..."; # exit
                                 echo "-------------------------------------------------------------------------------------------------------------"
    if [ "$1" == "access"     ]; then   ${xTail} ${aLogFile} | awk "${aAwkAcc}"; fi
    if [ "$1" == "error"      ]; then   ${xTail} ${aLogFile} | awk "${aAwkErr}"; fi;
    if [ "$1" == "out"        ]; then   ${xTail} ${aLogFile} | awk "${aAwkAcc}"; fi;
                        echo ""; echo "-------------------------------------------------------------------------------------------------------------"
                                 echo "  ${xTail} ${aLogFile} ${aLogDate} | awk ..."; # exit
    }
# -------------------------------------------------------------------------------

 if [ "${aCmd:0:3}" = "ver"   ]; then # echo "hello: aCmd: ${aCmd}"
    setLog2 $2;                       # echo "  aRepoDir: ${aRepoDir}"; exit
#   if [ "${aRepoDir}" == "" ]; then aRepoDir="/webs/$2"; fi
    if [ ! -d "${aRepoDir}/.git" ]; then echo -e "* Not a valid Git Repository, ${aRepoDir}.\n"; exit; fi
    cd "${aRepoDir}"; echo ""
    git show $(git rev-parse HEAD) | awk '/commit/ { c = substr($0,8,6) }; /Author/ { a = substr($0,7) }; /Date/ { print c substr($0,7,26) a }'
    echo ""
    exit
    fi
# -------------------------------------------------------------------------------

#if [ "${aCmd/log//}" != "{$aCmd}" ]; then                                       ##.(40507.02.3)
 if [ "${aCmd}" == "ngx_log"       ]; then                                       # .(40507.02.3 RAM Was: "${aCmd/log//}" != "{$aCmd}")

                                      aValidApps="anyllm, aidocs, demo1, rick, bruce, suzee, robin"

    if [ "$3" == ""           ]; then aLog="access"; else aLog=$3; fi; bRam=0

#   if [ "$3" == "dir"        ]; then             LogIt  "dir"    "/var/log/nginx/$2" ".log"; fi
#   if [ "$2" == "dir"        ]; then             LogIt  "dir"    "/var/log/nginx/$3" ".log"; fi
    if [ "$3" == "dir"        ]; then setLog1 $2; LogIt  "dir"    "/var/log/nginx/${aAppDir}" "${aStg}*.log"; fi
    if [ "$2" == "dir"        ]; then setLog1 $3; LogIt  "dir"    "/var/log/nginx/${aAppDir}" "${aStg}*.log"; fi

    if [ "$2" == ""           ]; then LogIt "${aLog}" "/var/log/nginx/"; bRam=1; fi
    if [ "$2" == "access"     ]; then LogIt  "access" "/var/log/nginx/"; bRam=1; fi
    if [ "$2" == "error"      ]; then LogIt   "error" "/var/log/nginx/"; bRam=1; fi

    if [ "$2" == "anyllm"     ]; then LogIt "${aLog}" "/var/log/nginx/anyllm/fr244p_anyllm-"; bRam=1; fi
    if [ "$2" == "aidocs"     ]; then LogIt "${aLog}" "/var/log/nginx/aidocs/fr244p_aidocs-"; bRam=1; fi
    if [ "$2" == "demo1"      ]; then LogIt "${aLog}" "/var/log/nginx/aidocs/fr244p_aidocs-"; bRam=1; fi
    if [ "$2" == "rick"       ]; then LogIt "${aLog}" "/var/log/nginx/aidocs/fr244p_aidocs-"; bRam=1; fi
    if [ "$2" == "root"       ]; then LogIt "${aLog}" "/var/log/nginx/";                      bRam=1; fi

    if [ "$2" == "anyllm"     ]; then LogIt "${aLog}" "/var/log/nginx/anyllm/fr244p_anyllm-"; bRam=1; fi

    if [ "${bRam}" != "1"     ]; then echo -e "\n* NGinx Log Not Found for App: '$2'\n  Valid Apps are: ${aValidApps}\n"; exit; fi
                                      echo ""; exit;
    fi
# -------------------------------------------------------------------------------

 if [ "${aCmd}" == "pm2_log"  ]; then                                       # .(40507.02.4 RAM Add pm2 logs)

                                      aValidApps="aidocs, demo1, rick, bruce, suzee, robin\n  and anyllm, frontend, collector, server"

    if [ "$3" == ""           ]; then aLog="access"; else aLog=$3; fi

    if [ "$3" == "dir"        ]; then setLog2 $2 1; LogIt  "dir"  "/root/.pm2/logs" "${aAppDir}-${aStg}*.log"; exit; fi
    if [ "$2" == "dir"        ]; then setLog2 $3 1; LogIt  "dir"  "/root/.pm2/logs" "${aAppDir}-${aStg}*.log"; exit; fi

#   if [ "$2" == ""           ]; then LogIt "${aLog}" "/root/.pm2/logs/??"; fi
#   if [ "$2" == "access"     ]; then LogIt  "access" "/root/.pm2/logs/??"; fi
#   if [ "$2" == "error"      ]; then LogIt   "error" "/root/.pm2/logs/??"; fi

    if [ "$aLog" == "access"  ]; then aLog="out"; fi

                                      setLog2 $2;   LogIt "${aLog}" "/root/.pm2/logs/${aAppDir}-${aStg}-";

#   if [ "$2" == "anyllm"     ]; then LogIt "${aLog}" "/root/.pm2/logs/${aAppDir}-${aStg}-"; fi
#   if [ "$2" == "frontend"   ]; then LogIt "${aLog}" "/root/.pm2/logs/${aAppDir}-${aStg}-"; fi
#   if [ "$2" == "collector"  ]; then LogIt "${aLog}" "/root/.pm2/logs/${aAppDir}-${aStg}-"; fi
#   if [ "$2" == "server"     ]; then LogIt "${aLog}" "/root/.pm2/logs/${aAppDir}-${aStg}-"; fi

#   if [ "$2" == "aidocs"     ]; then LogIt "${aLog}" "/root/.pm2/logs/${aAppDir}-${aStg}-"; fi
#   if [ "$2" == "demo1"      ]; then LogIt "${aLog}" "/root/.pm2/logs/AI-Docs-Review---demo1-master-"; fi
#   if [ "$2" == "rick"       ]; then LogIt "${aLog}" "/root/.pm2/logs/AI-Docs-Review---fork1-rick-";  fi
#   if [ "$2" == "bruce"      ]; then LogIt "${aLog}" "/root/.pm2/logs/AI-Docs-Review---fork1-bruce-"; fi
#   if [ "$2" == "suzee"      ]; then LogIt "${aLog}" "/root/.pm2/logs/AI-Docs-Review---fork1-suzee-"; fi
#   if [ "$2" == "robin"      ]; then LogIt "${aLog}" "/root/.pm2/logs/AI-Docs-Review---dev03-robin-"; fi

    echo ""
    fi
# -------------------------------------------------------------------------------


