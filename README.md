dotfiles
========

dotfiles for linux environments.
2014 [Ben Hoffman](http://github.com/rexmondo).

### Contents
+ [sorin-ionescu/prezto](https://github.com/sorin-ionescu/prezto) — awesome zsh config
+ [gmarik/Vundle.vim](https://github.com/gmarik/Vundle.vim.git) — Vim plugin manager
+ tmux config
+ [tmux-plugins/tpm](http://github.com/tmux-plugins/tpm) - tmux plugin manager
+ Lots of Vim plugins:
  + [pangloss/vim-javascript](http://github.com/pangloss/vim-javascript) - javascript syntax highlighting
  + [mxw/vim-jsx](http://github.com/mxw/vim-jsx) - jsx syntax highlighting for vim
  + [othree/javascript-libraries-syntax.vim](http://github.com/othree/javascript-libraries-syntax.vim) - more javascript syntax stuff
  + [lepture/vim-jinja](http://github.com/lepture/vim-jinja) - jinja syntax highlighting
  + [chriskempson/base16-vim](http://github.com/chriskempson/base16-vim) - color schemes for vim
  + [NLKNguyen/papercolor-theme](http://github.com/NLKNguyen/papercolor-theme) - 256 color vim theme based on material design
  + [editorconfig/editorconfig-vim](http://github.com/editorconfig/editorconfig-vim) - editorconfig plugin for vim
  + [MarcWeber/vim-addon-mw-utils](http://github.com/MarcWeber/vim-addon-mw-utils) - vim utilities
  + [scrooloose/syntastic](http://github.com/scrooloose/syntastic) — syntax checking plugins
  + [mattn/emmet-vim](http://github.com/mattn/emmet-vim) — Emmet for Vim
  + [tpope/vim-fugitive](http://github.com/tpope/vim-fugitive) — Git wrapper for Vim
  + [jiangmiao/auto-pairs](http://github.com/jiangmiao/auto-pairs) — Auto bracket pairing
  + [garbas/vim-snipmate](http://github.com/garbas/vim-snipmate) — Snippets in Vim 
  + [MarcWeber/vim-addon-mw-utils](http://github.com/MarcWeber/vim-addon-mw-utils) — Interpret file by function and cache automatically
  + [tomtom/tlib_vim](http://github.com/tomtom/tlib_vim) — Vim utility functions
  + [honza/vim-snippets](http://github.com/honza/vim-snippets) — Tonnes of community-contributed snippets
  + [tpope/vim-haml](http://github.com/tpope/vim-haml) — Runtime for Haml, Scss and Sass
  + [bling/vim-airline](http://github.com/bling/vim-airline) — Pretty status/tabline
  + [scrooloose/nerdcommenter](http://github.com/scrooloose/nerdcommenter) — Quote, "Vim plugin for intensely orgasmic commenting"
  + [Vim plugin for Drupal](https://www.drupal.org/project/vimrc) — See project page; lots of stuff!
  + [rking/ag.vim](http://github.com/rking/ag.vim) - fast ack replacement used by ctrl-space
  + [szw/vim-ctrlspace](http://github.com/szw/vim-ctrlspace) - vim tab and buffer manager

### Installation

1. `$ brew install zsh` (OSX with Homebrew) or `sudo apt-get install zsh` (debian)
1. `$ brew install tmux` (OSX with Homebrew) or `sudo apt-get install tmux` (debian)
1. ``$ chsh -s `which zsh` `` to change shell to zsh
1. `$ git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick`
1. `$ $HOME/.homesick/repos/homeshick/bin/homeshick clone git@github.com:rexmondo/dotfiles.git`
1. `$ brew install the_silver_searcher` (OSX with homebrew) or `sudo apt-get install silversearcher-ag` (debian) 
1. Start `vim`. Do `:PluginInstall`.
1. ctrl-A I to install tmux plugins.
1. ???
1. Profit.
      
