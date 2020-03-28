#
# Executes commands at the start of an interactive session.

# Ensure our custom themes will be found
fpath=( ~/.zpreztothemes "${fpath[@]}"  )

source /etc/profile 2> /dev/null

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Alias homesick/homeshick and set up folders
source $HOME/.homesick/repos/homeshick/homeshick.sh
alias homesick=homeshick
export DOTFILES="$HOME/.homesick/repos/dotfiles"

# Remap applications
alias ll="ls -al"
alias vi=vim
alias nano=vim

# Set everything to use vim
export VISUAL=vim
export EDITOR=vim
export GIT_EDITOR=vim

# ssh wrapper that rename current tmux window to the hostname of the
# remote host.
ssh() {
    # Do nothing if we are not inside tmux or ssh is called without arguments
    if [[ $# == 0 || -z $TMUX ]]; then
        command ssh $@
        return
    fi
    # The hostname is the last parameter (i.e. ${(P)#})
    local remote=${(P)#}
    local old_name="$(tmux display-message -p '#W')"
    local renamed=0
    # Save the current name
    if [[ $remote != -* ]]; then
        renamed=1
        tmux rename-window $remote
    fi
    command ssh $@
    if [[ $renamed == 1 ]]; then
        tmux rename-window "$old_name"
    fi
}

# vimgrep opens vim buffers on a git grep with a search
vimgrep () {
  if [ -z "$1" ]; then
    echo "Please provide an string to search for";
    return 1
  fi

  if [ -z "$2" ]; then
    DIR=".";
  else
    DIR="$2";
  fi

  FILES=$(git grep --name-only "$1" "$DIR" | tr "\n" " ");

  if [ -z "$FILES" ]; then
    echo "No files found";
    return $?;
  fi

  eval vim -c "/$1" $FILES;
}

# Modify zsh PATH
export PATH=$HOME/local/bin:/usr/local/bin:$PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/sbt/bin" # Add sbt bin to path
export PATH="$PATH:$HOME/.local/bin" # Add local bin to path
export PATH="/home/ben/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

function chpwd() {
  rename_window
}

function rename_window() {
  SITE=$(pwd | awk 'match($0, "www/([^/]*)") { print substr($0, RSTART + 4, RLENGTH - 4)  }')
  FOLDER=$(pwd | awk 'match($0, "/([^/]*)/?$") { print substr($0, RSTART + 1, RLENGTH)  }')

  # If we're not in a site right now, don't change the title
  if [ -z "$SITE" ]; then
    return
  fi

  # If we're in a subfolder, add that to the site
  if [[ "$SITE" != "$FOLDER" ]]; then
    SITE="$SITE - $FOLDER"
  fi

  tmux rename-window $SITE

}

export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# bind keys for history substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# powrlevel9k theme configs
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs node_version)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="$ "
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_NODE_VERSION_BACKGROUND="022"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
