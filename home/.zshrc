#
# Executes commands at the start of an interactive session.
#

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

# Modify zsh PATH
export PATH=$HOME/local/bin:$PATH

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

function chpwd() {
  rename_window
}

function rename_window() {
  SITE=$(pwd | awk '{match($0, "www/([^/]*)", site)}END{print site[1]}')
  FOLDER=$(pwd | awk '{match($0, "/([^/]*)/?$", folder)}END{print folder[1]}')

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
