#!/bin/bash


if [ "${BASH_SOURCE[0]}" == "${0}" ]; then echo -e "\n* Please run: source set-env.sh"; exit; fi

  VENV_DIR=.venv
  VENV_DIR=python_modules

  GIT_BRANCH=" ($( git branch 2>&1 | awk '/^\*/ { print $2 }' ))"
# GIT_BRANCH=$(__git_ps1)   # a special function created by git
# GIT_BRANCH=$1

# echo "GIT_BRANCH: ${GIT_BRANCH}"; # exit

if [ ! -d "${VENV_DIR}" ]; then
  echo -e "\n* Not in a Python project folder";
  else

  echo ""
# echo -e "\n  CD $(pwd)\n"; # exit

if [ "$1" == "deactivate" ]; then

# ${VENV_DIR}/Scripts/deactivate.bat
  if [ "$( command -v deactivate )" != "" ]; then deactivate; fi

  export VIRTUAL_ENV=""
  export PROJECT_NAME=
  export PS1="\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[32m\]\u@\h \[\033[35m\]$MSYSTEM \[\033[33m\]\w\[\033[36m\]${GIT_BRANCH}\[\033[0m\]\n$ "

  else

  source ${VENV_DIR}/Scripts/activate
# export VIRTUAL_ENV=""
  export PROJECT_NAME=$(basename "$PWD")
  export PS1="\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[32m\]\u@\h \[\033[35m\]$MSYSTEM \[\033[33m\]\w\[\033[36m\]${GIT_BRANCH}\[\033[0m\] (${PROJECT_NAME}/${VENV_DIR})\n# "
  fi

  echo "    \$VIRTUAL_ENV: ${VIRTUAL_ENV}"
# which python | awk '{ print "                " $0 }'

  fi
# echo ""
