set nocompatible " no more vi compatibility

" attempt to download vim-plug automatically
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Initialize plugin manager
  call plug#begin('~/.vim/bundle')

" install plugins
  Plug 'chriskempson/base16-vim'
  Plug 'scrooloose/syntastic'
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'mattn/emmet-vim'
  Plug 'tpope/vim-fugitive'
  Plug 'jiangmiao/auto-pairs'
  Plug 'garbas/vim-snipmate'
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'
  Plug 'honza/vim-snippets'
  Plug 'tpope/vim-haml'
  Plug 'bling/vim-airline'
  Plug 'scrooloose/nerdcommenter'
  Plug 'http://git.drupal.org/project/vimrc.git'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'lepture/vim-jinja'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'tpope/vim-surround'
  Plug 'pangloss/vim-javascript' | Plug 'mxw/vim-jsx'
  Plug 'gavocanov/vim-js-indent'
  Plug 'pmsorhaindo/syntastic-local-eslint.vim'
  Plug 'lambdatoast/elm.vim'
  Plug 'elixir-lang/vim-elixir'
  Plug 'raichoo/purescript-vim'
  Plug 'isRuslan/vim-es6'
  Plug 'junegunn/seoul256.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'elzr/vim-json'
  Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

" end plug
  call plug#end()

" Always edit in utf-8
  set encoding=utf-8

" make sure modifiable is always on
  set modifiable

" better split directions
  set splitbelow
  set splitright

" Syntax Highlighting, colors, and other display settings
  syntax on
  let g:seoul256_background = 236
  colorscheme seoul256
  set background=dark
  set t_Co=256

" line number stuff
  set number
  set relativenumber

" key fixes
  set backspace=indent,eol,start

" Get off my lawn
  nnoremap <Left> :echoe "Use h"<CR>
  nnoremap <Right> :echoe "Use l"<CR>
  nnoremap <Up> :echoe "Use k"<CR>
  nnoremap <Down> :echoe "Use j"<CR>

" Quicker window movement
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-h> <C-w>h
  nnoremap <C-l> <C-w>l

" Language Overrides
  if has("autocmd")
  " Drupal *.module and *.install files.
    augroup module
      autocmd BufRead,BufNewFile *.module  set filetype=php
      autocmd BufRead,BufNewFile *.install set filetype=php
      autocmd BufRead,BufNewFile *.test    set filetype=php
      autocmd BufRead,BufNewFile *.inc     set filetype=php
      autocmd BufRead,BufNewFile *.profile set filetype=php
      autocmd BufRead,BufNewFile *.view    set filetype=php
    augroup END
  endif

" Key (re)mapping
  " Leaders
  :nmap \l :setlocal number!<CR> " \l for lines
  :nmap \L :setlocal relativenumber!<CR> " \L for relative lines
  :nmap \o :set paste!<CR> " \o to toggle paste-mode

  " Indent Guides
  let g:indent_guides_guide_size = 1
  let g:indent_guides_start_level = 2
  let g:indent_guides_enable_on_vim_startup = 1
  set autoindent   " Match level
  set cindent      " Indent braces
  set tabstop=2  shiftwidth=2 expandtab " Indent size

" paste mode for insert bound to <F4>
  set pastetoggle=<F4>

" syntastic syntax checking on open
  let g:syntastic_check_on_open=1

" Search
  set incsearch " Search should highlight as you type
  set hlsearch " Highlight all search results
  nnoremap <leader><space> :nohlsearch<cr>

" powerline/airline
  let g:airline_powerline_fonts = 1
  set laststatus=2

" wrapping is stupid
  set nowrap

" Search for selected text, forwards or backwards.
" Press * to search forwards for selected text, or # to search backwards.
  vnoremap <silent> * :<C-U>
    \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
    \gvy/<C-R><C-R>=substitute(
    \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
    \gV:call setreg('"', old_reg, old_regtype)<CR>
  vnoremap <silent> # :<C-U>
    \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
    \gvy?<C-R><C-R>=substitute(
    \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
    \gV:call setreg('"', old_reg, old_regtype)<CR>

" Airline fix
  " fix ttimeoutlen for exiting insert mode with airline
  set ttimeoutlen=50

" Environment
  " Save our swap and history files to ~/.vimdata, to keep the working dir clean
    set directory=~/.vimdata// " // at the end sets the filename to full path, to ensure uniqueness
    set undodir=~/.vimdata
    set undofile " Save our undo history to a file when writing a file - Saves to undodir
    set backupcopy=yes " Make Vim play nicely with Webpack

" Watch ~/.vimrc and reload on change
augroup watchvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" syntastic settings for the php code sniffer
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_php_checkers=['phpcs']
let g:syntastic_php_phpcs_args="--standard=Drupal --extensions=php,module,inc,install,test,profile,theme"

" Angular specific settings
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

" toggle centering
:nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>

" tern keys
let g:tern_map_keys=1

" make proper background on 256 color terminals
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif
