#!/bin/bash

  aCommitFile="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/commit.no"
  aTS=$( date '+%y%m%d' ); aTS="${aTS:1}" 

  if [ ! -f "${aCommitFile}" ]; then echo "${aTS}.00" >"${aCommitFile}" ; fi 
  aCommitNo=$( cat "${aCommitFile}" )

  aDay="${aCommitNo:0:5}";    if [ "${aDay}" != "${aTS}" ]; then aCommitNo="${aTS}.00"; fi
  nCommitNo=${aCommitNo:6:2}; if [ "${nCommitNo:0:1}" == "0" ]; then nCommitNo=${nCommitNo:1}; fi
  nCommitNo=$(printf "%02d" $(( nCommitNo + 1 )))
# nCommitNo=$(printf "%02d" $(( 10#$CommitNo + 1 )))
# nCommitNo=${aTS}.$(printf "%02d" $(( ${CommitNo#0} + 1 )))
  aCommitNo="${aTS}.${nCommitNo}"
  echo "${aCommitNo}" >"${aCommitFile}" 

  if git diff --cached --quiet; then aAdd="git add . && "; else aAdd=""; fi
# if [ "$2" == "robin" ]; then aAuthor=""; else aAuthor="--author \"Agent Q <agent@amazon.com>\""; fi 
  if [ "$2" != "" ]; then aAuthor="$( git config list | awk '/user.name/ { print substr($0,11); exit }' )"; 
                     else aAuthor="Amazon Q <agent@amazon.com>"; fi 

  echo ""
  aMsg=".(${aCommitNo}_${1}" 
  echo " ${aAdd} git commit -m \"${aMsg}\"  ${aAuthor}"; echo ""

if [ "${aAdd}" != "" ]; then git add .; fi   
if [ -n "$aAuthor" ]; then
    git commit -m "${aMsg}" --author "${aAuthor}"
else
    git commit -m "${aMsg}"
fi


   if [ "${OS:0:3}" != "Win" ]; then echo ""; fi 
