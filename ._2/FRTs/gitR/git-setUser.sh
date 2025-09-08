#!/bin/bash 
    bDoit="0";  if [ "${1:0:2}" = "-d" ]; then bDoit="1"; shift; fi
                if [ "${2:0:2}" = "-d" ]; then bDoit="1"; shift; fi
                if [ "${3:0:2}" = "-d" ]; then bDoit="1"; fi

    aName="";  if [ "$1" != "" ]; then aName="$1";  bDoit=1; fi
    aEmail=""; if [ "$2" != "" ]; then aEmail="$2"; bDoit=1; fi

    bSP=1
if ! git config user.name >/dev/null || ! git config user.email >/dev/null; then bDoit="1"; 
    echo ""; bSP=0
    echo "Git user not configured. Please set:"
    fi 

if [ "${bDoit}" == "1" ]; then 
    if [ "${bSP}" == "1"   ]; then echo ""; bSP="0"; fi
    if [ "${aName}"  == "" ]; then read -p "  Name: "  aName;  bSP="1"; fi 
    if [ "${aEmail}" == "" ]; then read -p "  Email: " aEmail; bSP="1"; fi 

    if [ "${aName}" == "" ] || [ "${aEmail}" == "" ]; then 
        echo ""; echo "* Aborted - name or email not set"; 
        if [ "${OS:0:3}" != "Win"   ]; then echo ""; fi
        exit 1; 
        fi
    if [ "${bSP}" == "1"   ]; then echo ""; bSP="0"; fi
    echo "  git config user.name  ${aName}"
    echo "  git config user.email ${aEmail}"
    
    git config user.name  "${aName}"
    git config user.email "${aEmail}"
    if [ "${OS:0:3}" != "Win"   ]; then echo ""; fi
    fi 
