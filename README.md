dotfiles
========

dotfiles for linux environments.
2014 [Ben Hoffman](http://github.com/rexmondo).

### Contents
+ [sorin-ionescu/prezto](https://github.com/sorin-ionescu/prezto) — awesome zsh config
+ [gmarik/Vundle.vim](https://github.com/gmarik/Vundle.vim.git) — Vim plugin manager
+ tmux config
+ Lots of Vim plugins:
      + [scrooloose/syntastic](http://github.com/scrooloose/syntastic) — syntax checking plugins
      + [mattn/emmet-vim](http://github.com/mattn/emmet-vim) — Emmet for Vim
      + [tpope/vim-fugitive](http://github.com/tpope/vim-fugitive) — Git wrapper for Vim
      + [scrooloose/nerdtree](http://github.com/scrooloose/nerdtree) — Pretty filesystem tree panes
      + [jiangmiao/auto-pairs](http://github.com/jiangmiao/auto-pairs) — Auto bracket pairing
      + [garbas/vim-snipmate](http://github.com/garbas/vim-snipmate) — Snippets in Vim 
      + [MarcWeber/vim-addon-mw-utils](http://github.com/MarcWeber/vim-addon-mw-utils) — Interpret file by function and cache automatically
      + [tomtom/tlib_vim](http://github.com/tomtom/tlib_vim) — Vim utility functions
      + [honza/vim-snippets](http://github.com/honza/vim-snippets) — Tonnes of community-contributed snippets
      + [tpope/vim-haml](http://github.com/tpope/vim-haml) — Runtime for Haml, Scss and Sass
      + [bling/vim-airline](http://github.com/bling/vim-airline) — Pretty status/tabline
      + [scrooloose/nerdcommenter](http://github.com/scrooloose/nerdcommenter) — Quote, "Vim plugin for intensely orgasmic commenting"
      + [Vim plugin for Drupal](https://www.drupal.org/project/vimrc) — See project page; lots of stuff!
+ And probably lots else!

### Installation

1. `$ git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick`
1. `cd $HOME/.homesick/repos/homeshick && git checkout 6b53454a60eeeed9329e0c648a5bc4984615e733`
1. Add `$HOME/.homesick/repos/homeshick/bin/homeshick` to your `$PATH`. 
      If using Homebrew: `ln -s $HOME/.homesick/repos/homeshick/bin/homeshick /usr/local/bin/`
1. `homeshick clone git@github.com:rexmondo/dotfiles.git && homeshick link dotfiles`
1. Start `vim`. Do `:PluginInstall`.
1. ???
1. Profit.
      
