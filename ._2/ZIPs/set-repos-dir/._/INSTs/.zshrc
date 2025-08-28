# Created by Install FRTools on 50406.1631

  alias ll="ls -la"

  alias cd-repos="cd /Users/Shared/Repos"
  alias cd-formr="cd /Users/Shared/Repos/formR_"
  alias cd-frtools="cd /Users/Shared/Repos/FRTools"
  alias cd-aidocs="cd  /Users/Shared/Repos/AIDocs"
  alias cd-aitestr="cd /Users/Shared/Repos/AIDocs_testR"
  alias cd-anyllm="cd  /Users/Shared/Repos/AnyLLM"

  export NVS_HOME="$HOME/.nvs"
[ -s "$NVS_HOME/nvs.sh" ] && . "$NVS_HOME/nvs.sh"

  export PATH="/Users/Shared/._0/bin:$PATH"
  export THE_SERVER="fr010p-os15_Mac-Prod1 (127.0.0.1)"
  export EDITOR=nano

function git_branch_name() {
  branch=$( git symbolic-ref HEAD 2>/dev/null | awk 'BEGIN{ FS="/" } { print $NF }' )
  if [[ $branch == "" ]]; then
    echo '#'
  else
    echo ' ('$branch')#'
  fi
  }

# PROMPT_SUBST=true   # bash style
# set -o PROMPT_SUBST # another bash style
  setopt prompt_subst # zsh style
  PROMPT='%n@%m %1~$(git_branch_name) '

# Add timestamps and user to history
  setopt EXTENDED_HISTORY   # Save timestamps
  setopt INC_APPEND_HISTORY # Append immediately

  alias history='fc -l -t "%F %T" 100'  #_ Format lines with timestamps

