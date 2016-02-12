#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Source NVM if it is installed in profile.d
if [ -e /etc/profile.d/nvm.sh  ]; then
  source /etc/profile.d/nvm.sh
fi

ESLINT_GLOBAL=$(which eslint);
eslint() {
  NPM_BIN=$(npm bin);
  if [ -e "$NPM_BIN/eslint"  ]; then
    eval "$NPM_BIN/eslint" "$@";
  else
    eval $ESLINT_GLOBAL "$@";
  fi
}

