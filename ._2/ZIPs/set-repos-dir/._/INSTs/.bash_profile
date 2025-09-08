# Created by Install FRTools on 50907.0936

  alias ll="ls -la"

  alias cd-repos="cd /C/Home/Repos"
  alias cd-formr="cd /C/Home/Repos/formR_"
  alias cd-frtools="cd /C/Home/Repos/FRTools"
  alias cd-aidocs="cd  /C/Home/Repos/AIDocs_demo1"
  alias cd-aitestr="cd /C/Home/Repos/AIDocs_testR"
  alias cd-anyllm="cd  /C/Home/Repos/AnyLLM"
  alias cd-list="echo ''; alias | awk '{ sub( /alias /, \"\"); print }' | awk -F= '/cd-/ && !/list/ { printf \"  %-15s %s\n\", \$1, \$2 }'; echo ''"

  export NVS_HOME="$HOME/.nvs"
[ -s "$NVS_HOME/nvs.sh" ] && . "$NVS_HOME/nvs.sh"

  export PATH="/C/Home/._0/bin:$PATH"
  export THE_SERVER="rm011p-w11p_Windows-Prod1 (127.0.0.1)"
  export EDITOR=nano

precmd() {
  BRANCH_NAME=$(git symbolic-ref HEAD 2>/dev/null | awk 'BEGIN{ FS="/" } { print $NF }' )
  }
  PROMPT_SUBST=true   # bash style
# set -o PROMPT_SUBST # another bash style
# setopt prompt_subst # zsh style
  PROMPT=$'%n@%m %~ ${BRANCH_NAME}\n# '
# PROMPT=$'%1~/ ${BRANCH_NAME}# '

# Add timestamps and user to history
# setopt EXTENDED_HISTORY   # Save timestamps
# setopt INC_APPEND_HISTORY # Append immediately
  export PROMPT_COMMAND='history -a'

# alias history='fc -l -t "%F %T" 100'  #_ Format lines with timestamps
  export HISTTIMEFORMAT='%F %T '

  echo " in Server: $THE_SERVER [$HOME/.bash_profile v50907.0936]"
