#!/bin/bash

if [ ! -d "$HOME/.nvs" ]; then 

  export NVS_HOME="$HOME/.nvs"
  git clone https://github.com/jasongin/nvs "$NVS_HOME"
  source "$NVS_HOME/nvs.sh" install
  echo ""
  echo "  To use a different version of node, run:"
  echo ""
  echo "     nvs add 20.19; nvs link 20.19; nvs use"
  echo ""

else 

  echo -e "\n* You need to delete $HOME/.nvs, first.\n"
  fi 