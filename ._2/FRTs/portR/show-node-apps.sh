#!/bin/bash

if [ "$1" == "ps"    ]; then  kill-node-apps ps;    fi
if [ "$1" == "ports" ]; then  kill-node-apps ports; fi
if [ "$1" == ""      ]; then  kill-node-apps show | awk 'NR < 4'; fi
if [ "$1" == ""      ]; then  kill-node-apps show | awk 'NR > 3' | sort -k2 -u | awk 'NR > 1' ; echo ""; fi

