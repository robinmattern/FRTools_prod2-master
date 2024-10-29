#!/bin/bash

  aCmd=restart; if [ "$1" != ""     ]; then aCmd="$1";   fi
                if [ "$1" == ""     ]; then aCmd="help"; fi
                if [ "$1" == "help" ]; then aCmd="help"; fi
                if [ "$1" == "list" ]; then aCmd="list"; fi
  aApp=both;    if [ "$2" != ""     ]; then aApp="$2";   fi

# aStg="$3";    if [ "$3" == ""     ]; then aStg="dev";  fi
  aStg="dev";   if [ "$3" == "prod" ]; then aStg="prod"; fi

# ---------------------------------------------------------------------------

  if [ "${aApp}" == "help"      ]; then aApp1="help";   fi
  if [ "${aApp}" == "both"      ]; then aApp1="demo1";  aApp4="anyllm"; nAppNo=7; fi
  if [ "${aApp}" == "aidocs"    ]; then aApp1="demo1";  nAppNo=1;  fi
  if [ "${aApp}" == "demo1"     ]; then aApp1="demo1";  nAppNo=1;  fi
  if [ "${aApp}" == "test2"     ]; then aApp1="test2";  nAppNo=12; fi
  if [ "${aApp}" == "robin"     ]; then aApp2="robin1"; nAppNo=2;  fi
  if [ "${aApp}" == "robin1"    ]; then aApp2="robin1"; nAppNo=21; fi
  if [ "${aApp}" == "robin2"    ]; then aApp2="robin2"; nAppNo=22; fi
  if [ "${aApp}" == "robin3"    ]; then aApp2="robin3"; nAppNo=23; fi
  if [ "${aApp}" == "nextjs"    ]; then aApp3="nextjs"; nAppNo=3;  fi
  if [ "${aApp}" == "suzee"     ]; then aApp4="suzee1"; nAppNo=41; fi
  if [ "${aApp}" == "rick"      ]; then aApp5="rick1";  nAppNo=51; fi
  if [ "${aApp}" == "bruce"     ]; then aApp6="bruce1"; nAppNo=61; fi
# if [ "${aApp}" == "collector" ]; then aApp4="anyllm"; nAppNo=74; fi
# if [ "${aApp}" == "frontend"  ]; then aApp4="anyllm"; nAppNo=75; fi
# if [ "${aApp}" == "server"    ]; then aApp4="anyllm"; nAppNo=76; fi
# if [ "${aApp}" == "anyllm"    ]; then aApp4="anyllm"; nAppNo=7;  fi
  if [ "${aApp}" == "collector" ]; then aApp7="anyllm"; nAppNo=74; fi
  if [ "${aApp}" == "frontend"  ]; then aApp7="anyllm"; nAppNo=75; fi
  if [ "${aApp}" == "server"    ]; then aApp7="anyllm"; nAppNo=76; fi
  if [ "${aApp}" == "anyllm"    ]; then aApp7="anyllm"; nAppNo=7;  fi

  if [ "$2" == "1"  ]; then nAppNo=1;  aApp1="demo1";  fi
# if [ "$2" == "1"  ]; then nAppNo=1;  aApp1="prod1";  fi
  if [ "$2" == "2"  ]; then nAppNo=12; aApp2="test2";  fi
  if [ "$2" == "3"  ]; then nAppNo=3;  aApp3="nextjs"; fi
  if [ "$2" == "4"  ]; then nAppNo=41; aApp4="suzee1"; fi
  if [ "$2" == "5"  ]; then nAppNo=51; aApp5="rick1";  fi
  if [ "$2" == "6"  ]; then nAppNo=61; aApp6="bruce1"; fi
# if [ "$2" == "4"  ]; then nAppNo=4;  aApp4="anyllm"; fi
# if [ "$2" == "5"  ]; then nAppNo=5;  aApp4="anyllm"; fi
# if [ "$2" == "6"  ]; then nAppNo=6;  aApp4="anyllm"; fi
  if [ "$2" == "7"  ]; then nAppNo=7;  aApp7="anyllm"; fi

  if [ "$2" == "10" ]; then nAppNo=1;  aApp1="demo1";  fi
  if [ "$2" == "11" ]; then nAppNo=1;  aApp1="demo1";  fi
# if [ "$2" == "11" ]; then nAppNo=1;  aApp1="prod1";  fi
  if [ "$2" == "12" ]; then nAppNo=12; aApp1="test2";  fi
  if [ "$2" == "21" ]; then nAppNo=21; aApp2="robin1"; fi
  if [ "$2" == "22" ]; then nAppNo=22; aApp2="robin2"; fi
  if [ "$2" == "23" ]; then nAppNo=23; aApp2="robin3"; fi
  if [ "$2" == "30" ]; then nAppNo=3;  aApp3="nextjs"; fi
  if [ "$2" == "41" ]; then nAppNo=41; aApp4="suzee1"; fi
  if [ "$2" == "51" ]; then nAppNo=51; aApp5="rick1";  fi
  if [ "$2" == "61" ]; then nAppNo=61; aApp6="bruce1"; fi
  if [ "$2" == "74" ]; then nAppNo=74; aApp7="anyllm"; fi
  if [ "$2" == "75" ]; then nAppNo=75; aApp7="anyllm"; fi
  if [ "$2" == "76" ]; then nAppNo=76; aApp7="anyllm"; fi
  if [ "$2" == "70" ]; then nAppNo=7;  aApp7="anyllm"; fi

# ---------------------------------------------------------------------------

#   echo "[1] aCmd: '${aCmd}', aApp: '${aApp}', nAppNo: ${nAppNo}, aApp1: '${aApp1}'; aApp2: '${aApp2}'; aApp3: '${aApp3}'; aApp4: '${aApp4}', aStg: ${aStg}"; # exit
#   echo "[1] aCmd: '${aCmd}', aApp: '${aApp}', nAppNo: ${nAppNo}, aApp1: '${aApp1}'; aApp2: '${aApp2}'; aApp4: '${aApp4}'; aApp5: '${aApp5}', aApp6: '${aApp6}', aApp7: '${aApp7}', aStg: ${aStg}"; # exit

  if [ "${nAppNo}" != ""        ]; then bOK1=1; fi
  if [ "${aCmd}"   == "start"   ]; then bOK2=1; fi
  if [ "${aCmd}"   == "restart" ]; then bOK2=1; fi
  if [ "${aCmd}"   == "stop"    ]; then bOK2=1; fi
  if [ "${aCmd}"   == "show"    ]; then bOK2=1; fi
  if [ "${aCmd}"   == "list"    ]; then bOK2=1; fi

  if [ "${aCmd}"   != "list" ]; then

     aErrMsg=""
  if [ "${bOK2}" != "1" ] ; then bOK=0
     aErrMsg="\n* Please enter the correct command: start, restart, stop, show, list"
     fi

  if [ "${bOK1}" != "1" ] || [ "$2" == "" ]; then bOK=0
#    aErrMsg="${aErrMsg:2}"
     aErrMsg="${aErrMsg}\n* Please enter the correct app name/number: 1)demo 2)robin, 4)rick,\n"
     aErrMsg="${aErrMsg}    74)collector, 75)frontend, 76)server, 7)anyllm, or both."
     fi

  if [ "${aErrMsg}" != "" ]; then echo -e "\n${aErrMsg:2}"; fi
     fi

# ---------------------------------------------------------------------------

  if [ "${aCmd}" == "help" ] || [ "${bOK}" == "0" ]; then
     echo ""
     echo "  Run any of the following for PM2:"
     echo "    run-node-apps start   {App} [dev|prod]"
     echo "    run-node-apps restart {App}"
     echo "    run-node-apps stop    {App}"
     echo "    run-node-apps show    {App}"
     echo "    run-node-apps list"
     echo ""
     echo "  where {App} runs in: "
     echo "    both             demo1 and anyllm"
     echo "    demo1     or  1  /webs/aidocs_/demo1-master/client1/c16_aidocs-review-app"
     echo "    anyllm    or  7  /webs/anyllm collector, frontend and server"
     echo "    aidocs    or 10  /webs/aidocs_/demo1-master/client1/c16_aidocs-review-app"
     echo "    robin1    or 21  /webs/aidocs_/prod1-robin/client1/c16_aidocs-review-app"
     echo "    robin2    or 22  /webs/aidocs_/test2-robin/client1/c16_aidocs-review-app"
     echo "    robin3    or 23  /webs/aidocs_/dev03-robin/client1/c16_aidocs-review-app"
#    echo "    nextjs    or 30  /webs/aidocs_/dev01-robin/nextjs2"
     echo "    rick      or 51  /webs/aidocs_/fork1-rick/client1/c16_aidocs-review-app"
     echo "    bruce     or 61  /webs/aidocs_/fork1-bruce/client1/c16_aidocs-review-app"
     echo "    suzee     or 41  /webs/aidocs_/fork1-suzee/client1/c16_aidocs-review-app"
     echo "    anyllm    or 70  /webs/anyllm collector, frontend and server"
     echo "    collector or 74  /webs/anyllm collector"
     echo "    frontend  or 75  /webs/anyllm frontend"
     echo "    server    of 76  /webs/anyllm server"
     echo ""
     exit
     fi
# ---------------------------------------------------------------------------

  function PM2() {
     if [ "$4" == "" ] || [ "$4" == "$3" ]; then
       echo ""
       echo "  pm2 $1 '$2'"
       echo "-----------------------------------------------------------------"
               pm2 $1 "$2"
       fi
     }
# ---------------------------------------------------------------------------

  if [ "${aCmd}" == "list" ]; then
     pm2 list
     exit
     fi
# ---------------------------------------------------------------------------

#    echo "[2] aCmd: '${aCmd}', aApp: '${aApp}', nAppNo: ${nAppNo}, aApp1: '${aApp1}'; aApp2: '${aApp2}'; aApp3: '${aApp3}'; aApp4: '${aApp4}', aStg: ${aStg}"; exit
#    echo "[2] aCmd: '${aCmd}', aApp: '${aApp}', nAppNo: ${nAppNo}, aApp1: '${aApp1}'; aApp2: '${aApp2}'; aApp4: '${aApp4}'; aApp5: '${aApp5}', aApp6: '${aApp6}', aApp7: '${aApp7}', aStg: ${aStg}"; # exit

function deleteIfRunning( ) {
                                                                    aAppName=""
     if [ "${aApp1}" == "demo1"  ] || [ "${nAppNo}" == "1"  ]; then aAppName="AI Docs Review - demo1-master"; fi
     if [ "${aApp1}" == "test2"  ] || [ "${nAppNo}" == "12" ]; then aAppName="AI Docs Review - test2-master"; fi

#    if [ "${aApp2}" == "robin1" ] || [ "${nAppNo}" == "2"  ]; then aAppName="AI Docs Review - dev01-robin";  fi
	 if [ "${aApp2}" == "robin"  ] || [ "${nAppNo}" == "2"  ]; then aAppName="AI Docs Review - demo1-robin";  fi
	 if [ "${aApp2}" == "robin"  ] || [ "${nAppNo}" == "21" ]; then aAppName="AI Docs Review - prod1-robin";  fi
	 if [ "${aApp2}" == "robin"  ] || [ "${nAppNo}" == "22" ]; then aAppName="AI Docs Review - text2-robin";  fi
	 if [ "${aApp2}" == "robin"  ] || [ "${nAppNo}" == "23" ]; then aAppName="AI Docs Review - dev01-robin";  fi

	 if [ "${aApp3}" == "nextjs" ] || [ "${nAppNo}" == "3"  ]; then aAppName="AI Docs Review - dev01-nextjs"; fi

	 if [ "${aApp4}" == "suzee1" ] || [ "${nAppNo}" == "41" ]; then aAppName="AI Docs Review - forked-suzee"; fi
	 if [ "${aApp5}" == "rick1"  ] || [ "${nAppNo}" == "51" ]; then aAppName="AI Docs Review - forked-rick";  fi
	 if [ "${aApp6}" == "bruce1" ] || [ "${nAppNo}" == "61" ]; then aAppName="AI Docs Review - forked-bruce";  fi

#    if [ "${aApp4}" == "anyllm" ] && [ "${nAppNo}" == "4"  ]; then aAppName="AnythingLLM Collector"        ; fi
#	 if [ "${aApp4}" == "anyllm" ] && [ "${nAppNo}" == "5"  ]; then aAppName="AnythingLLM Frontend"         ; fi
#	 if [ "${aApp4}" == "anyllm" ] && [ "${nAppNo}" == "6"  ]; then aAppName="AnythingLLM Server"           ; fi
	 if [ "${aApp7}" == "anyllm" ] && [ "${nAppNo}" == "74" ]; then aAppName="AnythingLLM Collector"        ; fi
	 if [ "${aApp7}" == "anyllm" ] && [ "${nAppNo}" == "75" ]; then aAppName="AnythingLLM Frontend"         ; fi
	 if [ "${aApp7}" == "anyllm" ] && [ "${nAppNo}" == "76" ]; then aAppName="AnythingLLM Server"           ; fi
	 if [ "${aApp7}" == "anyllm" ] && [ "${nAppNo}" == "7"  ]; then aAppName="AnythingLLM"                  ; fi

#    echo "[3] aCmd: '${aCmd}', aApp: '${aApp}', nAppNo: ${nAppNo}, aApp1: '${aApp1}'; aApp2: '${aApp2}'; aApp3: '${aApp3}'; aApp4: '${aApp4}', aStg: ${aStg}"; # exit
#    echo "[3] aCmd: '${aCmd}', aApp: '${aApp}', nAppNo: ${nAppNo}, aApp1: '${aApp1}'; aApp2: '${aApp2}'; aApp4: '${aApp4}'; aApp5: '${aApp5}', aApp6: '${aApp6}', aApp7: '${aApp7}', aStg: ${aStg}"; # exit

#    bDelete=$( pm2 status | awk '/'"${aAppName}"'/ { print 1 }' )
#    echo "bDelete: ${bDelete}, aAppName: '${aAppName}'"; exit
     nPM2AppNo="$( pm2 id "${aAppName}" | awk '{ gsub( /[\[\] ]/, ""); print }' )"

     if [ "${aAppName}" == "AnythingLLM" ]; then nPM2AppNo="-7"; fi
#    echo "[4] nPM2AppNo: '${nPM2AppNo}', aAppName: '${aAppName}'";

#    if [ "${nPM2AppNo}" != ""   ]; then echo "  pm2 delete ${nPM2AppNo}  # \"${aAppName}\""; fi

     if [ "${nPM2AppNo}" == "-7" ]; then PM2  delete  "AnythingLLM Collector";
                                         PM2  delete  "AnythingLLM Frontend";
                                         PM2  delete  "AnythingLLM Server";
        return; fi

     if [ "${nPM2AppNo}" != ""  ]; then  pm2  delete  "${nPM2AppNo}" >/dev/null; fi
     }
# ---------------------------------------------------------------------------

  if [ "${aCmd}" == "start" ]; then

     echo ""
     deleteIfRunning

#    echo "[5] aCmd: '${aCmd}', aApp: '${aApp}', nAppNo: ${nAppNo}, aApp1: '${aApp1}'; aApp2: '${aApp2}'; aApp3: '${aApp3}'; aApp4: '${aApp4}', aStg: ${aStg}, aAppName: '${aAppName}'"; echo ""; # exit
#    echo "[5] aCmd: '${aCmd}', aApp: '${aApp}', nAppNo: ${nAppNo}, aApp1: '${aApp1}'; aApp2: '${aApp2}'; aApp4: '${aApp4}'; aApp5: '${aApp5}', aApp6: '${aApp6}', aApp7: '${aApp7}', aStg: ${aStg}"; # exit

     if [ "${aAppName}" == "" ]; then exit; fi
     echo "  pm2 start '${aAppName}'"
     echo "-----------------------------------------------------------------"

     if [ "${aApp1}" == "demo1"  ] || [ "${nAppNo}" == "1"  ]; then cd /webs/aidocs_/demo1-master; pm2 start AIDocs_demo1-master.pm2-config.json; fi
     if [ "${aApp1}" == "test2"  ] || [ "${nAppNo}" == "12" ]; then cd /webs/aidocs_/test2-master; pm2 start AIDocs_test2-master.pm2-config.json; fi

     if [ "${aApp2}" == "robin"  ] || [ "${nAppNo}" == "2"  ]; then cd /webs/aidocs_/prod1-robin;  pm2 start AIDocs_prod1-robin.pm2-config.json;  fi
     if [ "${aApp2}" == "robin1" ] || [ "${nAppNo}" == "21" ]; then cd /webs/aidocs_/prod1-robin;  pm2 start AIDocs_prod1-robin.pm2-config.json;  fi
     if [ "${aApp2}" == "robin2" ] || [ "${nAppNo}" == "22" ]; then cd /webs/aidocs_/test2-robin;  pm2 start AIDocs_test2-robin.pm2-config.json;  fi
     if [ "${aApp2}" == "robin3" ] || [ "${nAppNo}" == "23" ]; then cd /webs/aidocs_/dev03-robin;  pm2 start AIDocs_dev03-robin.pm2-config.json;  fi

     if [ "${aApp3}" == "nextjs" ] || [ "${nAppNo}" == "3"  ]; then cd /webs/aidocs_/dev01-nextjs; pm2 start AIDocs_dev01-nextjspm2-config..json; fi

     if [ "${aApp4}" == "suzee"  ] || [ "${nAppNo}" == "41" ]; then cd /webs/aidocs_/fork1-suzee;  pm2 start AIDocs_fork1-suzee.pm2-config.json;  fi
     if [ "${aApp5}" == "rick"   ] || [ "${nAppNo}" == "51" ]; then cd /webs/aidocs_/fork1-rick;   pm2 start AIDocs_fork1-rick.pm2-config.json;   fi
     if [ "${aApp6}" == "bruce"  ] || [ "${nAppNo}" == "61" ]; then cd /webs/aidocs_/fork1-bruce;  pm2 start AIDocs_fork1-bruce.pm2-config.json;  fi

#    if [ "${aApp4}" == "anyllm" ] && [ "${nAppNo}" == "4"  ]; then cd /webs/anyllm/;              pm2 start collector-${aStg}.json;   fi
#    if [ "${aApp4}" == "anyllm" ] && [ "${nAppNo}" == "5"  ]; then cd /webs/anyllm/;              pm2 start frontend-${aStg}.json;    fi
#    if [ "${aApp4}" == "anyllm" ] && [ "${nAppNo}" == "6"  ]; then cd /webs/anyllm/;              pm2 start server-${aStg}.json;      fi
#    if [ "${aApp4}" == "anyllm" ] && [ "${nAppNo}" == "7"  ]; then cd /webs/anyllm/;              pm2 start AnythingLLM-${aStg}.json; fi
     if [ "${aApp7}" == "anyllm" ] && [ "${nAppNo}" == "74" ]; then cd /webs/anyllm/;              pm2 start collector-${aStg}.json;   fi
     if [ "${aApp7}" == "anyllm" ] && [ "${nAppNo}" == "75" ]; then cd /webs/anyllm/;              pm2 start frontend-${aStg}.json;    fi
     if [ "${aApp7}" == "anyllm" ] && [ "${nAppNo}" == "76" ]; then cd /webs/anyllm/;              pm2 start server-${aStg}.json;      fi
     if [ "${aApp7}" == "anyllm" ] && [ "${nAppNo}" == "7"  ]; then cd /webs/anyllm/;              pm2 start AnythingLLM-${aStg}.json; fi
     echo ""
     exit
     fi
# ---------------------------------------------------------------------------

     if [ "${aApp1}" == "demo1"  ]; then
        kill-node-apps 8080 doit >>/dev/null 2>&1
        fi

     if [ "${aCmd}"  == "stop"   ]; then aCmd="delete"; fi

     if [ "${aApp1}" == "demo1"  ] || [ "${nAppNo}" == "1"  ]; then     PM2 ${aCmd} "AI Docs Review - demo1-master" 1  1;  fi

     if [ "${aApp2}" == "robin"  ] || [ "${nAppNo}" == "2"  ]; then     PM2 ${aCmd} "AI Docs Review - demo1-robin"  2  2;  fi
     if [ "${aApp2}" == "robin1" ] || [ "${nAppNo}" == "21" ]; then     PM2 ${aCmd} "AI Docs Review - prod1-robin"  21 21; fi
     if [ "${aApp2}" == "robin2" ] || [ "${nAppNo}" == "22" ]; then     PM2 ${aCmd} "AI Docs Review - test2-robin"  22 22; fi
     if [ "${aApp2}" == "robin3" ] || [ "${nAppNo}" == "23" ]; then     PM2 ${aCmd} "AI Docs Review - dev03-robin"  23 23; fi

     if [ "${aApp3}" == "nextjs" ] || [ "${nAppNo}" == "3"  ]; then     PM2 ${aCmd} "AI Docs Review - dev01-nextjs" 3  3;  fi

     if [ "${aApp4}" == "suzee1" ] || [ "${nAppNo}" == "41" ]; then     PM2 ${aCmd} "AI Docs Review - fork1-suzee"  4  4;  fi
     if [ "${aApp5}" == "rick1"  ] || [ "${nAppNo}" == "51" ]; then     PM2 ${aCmd} "AI Docs Review - fork1-rick"   5  5;  fi
     if [ "${aApp6}" == "bruce1" ] || [ "${nAppNo}" == "61" ]; then     PM2 ${aCmd} "AI Docs Review - fork1-bruce"  6  6;  fi

#    if [ "${aApp4}" == "anyllm" ] && [ "${nAppNo}" == "4"  ]; then     PM2 ${aCmd} "AnythingLLM Collector"         4  4;  fi
#    if [ "${aApp4}" == "anyllm" ] && [ "${nAppNo}" == "5"  ]; then     PM2 ${aCmd} "AnythingLLM Frontend"          5  5;  fi
#    if [ "${aApp4}" == "anyllm" ] && [ "${nAppNo}" == "6"  ]; then     PM2 ${aCmd} "AnythingLLM Server"            6  6;  fi
#    if [ "${aApp4}" == "anyllm" ] && [ "${nAppNo}" == "7"  ]; then     PM2 ${aCmd} "AnythingLLM Collector"         4  4;
#                                                                       PM2 ${aCmd} "AnythingLLM Frontend"          5  5;
#                                                                       PM2 ${aCmd} "AnythingLLM Server"            6  6;  fi

     if [ "${aApp7}" == "anyllm" ] && [ "${nAppNo}" == "74" ]; then     PM2 ${aCmd} "AnythingLLM Collector"         74 74; fi
     if [ "${aApp7}" == "anyllm" ] && [ "${nAppNo}" == "75" ]; then     PM2 ${aCmd} "AnythingLLM Frontend"          75 75; fi
     if [ "${aApp7}" == "anyllm" ] && [ "${nAppNo}" == "76" ]; then     PM2 ${aCmd} "AnythingLLM Server"            76 76; fi
     if [ "${aApp7}" == "anyllm" ] && [ "${nAppNo}" == "7"  ]; then     PM2 ${aCmd} "AnythingLLM Collector"         74 74;
                                                                        PM2 ${aCmd} "AnythingLLM Frontend"          75 75;
                                                                        PM2 ${aCmd} "AnythingLLM Server"            76 76; fi


     echo ""
# ---------------------------------------------------------------------------
