# .bash_profile

# Get the aliases and functions
# test -f ~/.profile && . ~/.profile  # This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
  test -f ~/.bashrc  && . ~/.bashrc

# User specific environment and startup programs

  export THE_SERVER="sc177d-ub14_iCAT17-Dev03 (10.211.160.177)";

if [ -d /home/_0/bin ]; then
  export PATH=$PATH:/home/_0/bin
  export PATH=$PATH:./node_modules/.bin
  export PATH=$PATH:../node_modules/.bin
  fi

  export ENV=$HOME/.bashrc
  export USERNAME="root"

if [ "${OS}" == "" ]; then OS=$( cat /etc/issue | awk '/Red Hat/ { print $1" "$2" "$5 }; /Ubuntu/ { print $1" "$2 }' ); fi

if [ "${OS:0:3}" == "Ubu" ]; then
  alias ll='ls -lLa   --time-style long-iso --color'   # ubuntu
  alias lt='ls -lLart --time-style long-iso --color'
  alias lz='ls -lLarS --time-style long-iso --color'
  fi

if [ "${OS:0:3}" == "Red" ]; then
  alias ll='ls -lLa   --full-time --color=auto'        # redhat 6.2
  alias lt='ls -lLart --full-time --color=auto'
  alias lz='ls -lLarS --full-time --color=auto'
  fi

if [ "${OS:0:3}" == "Win" ]; then
  alias ll='ls -lLa   --time-style long-iso --color=tty'
  alias lt='ls -lLart --time-style long-iso --color=tty'
  alias lz='ls -lLarS --time-style long-iso --color=tty'
  fi

if [ "${OS:0:3}" == "" ]; then
  alias ll='ls -lLa   --color'
  alias lt='ls -lLart --color'
  alias lz='ls -lLarS --color'
  fi

if [ "${OS:0:3}" != "Win" ]; then mesg n; fi

  if [ -f ~/.nvs/nvs.sh ]; then source ~/.nvs/nvs.sh; fi # Node version switcher .(30322.01.1 RAM)

if [ -d "/home/app/oracle/product/8.0.5" ]; then      # Oracle Client for BASEC Server

  export ORACLE_HOME=/home/app/oracle/product/8.0.5;

  export LD_LIBRARY_PATH=$ORACLE_HOME/lib:/usr/netscape/server4/bin/https/lib;
  export NLS_LANG=american;
  export ORACLE_BASE=/home/app/oracle;
  export ORACLE_SID=TEST;
  export ORACLE_TERM=386;
  export ORA_NLS33=$ORACLE_HOME/ocommon/nls/admin/data;
  export CLASSPATH=/home/jdk1.2.2;

  export PATH=$PATH:/sbin:$ORACLE_HOME/bin:/home/jdk1.2.2/bin;
  fi

if [ -d "/opt/oracle/instantclient" ]; then          # Oracle Client for PHP/Node Server

  export LD_LIBRARY_PATH="/opt/oracle/instantclient"
  export TNS_ADMIN="/opt/oracle/instantclient"
  export ORACLE_BASE="/opt/oracle/instantclient"

  export ORACLE_HOME=$ORACLE_BASE
  fi
