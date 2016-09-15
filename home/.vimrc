" required for vundle (!!!LEAVE BEFORE!!!)
  set nocompatible " no more vi compatibility
  set hidden " needed for ctrlspace
  filetype off

" set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()

" call all vundle plugins here
  Plugin 'chriskempson/base16-vim'
  Plugin 'scrooloose/syntastic'
  Plugin 'othree/javascript-libraries-syntax.vim'
  Plugin 'mattn/emmet-vim'
  Plugin 'tpope/vim-fugitive'
  Plugin 'jiangmiao/auto-pairs'
  Plugin 'garbas/vim-snipmate'
  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'
  Plugin 'honza/vim-snippets'
  Plugin 'tpope/vim-haml'
  Plugin 'bling/vim-airline'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'http://git.drupal.org/project/vimrc.git'
  Plugin 'NLKNguyen/papercolor-theme'
  Plugin 'lepture/vim-jinja'
  Plugin 'editorconfig/editorconfig-vim'
  Plugin 'tpope/vim-surround'
  Plugin 'mxw/vim-jsx'
  Plugin 'Shougo/neocomplete.vim'
  Plugin 'Shougo/neosnippet'
  Plugin 'Shougo/neosnippet-snippets'
  Plugin 'pangloss/vim-javascript'
  Plugin 'gavocanov/vim-js-indent'
  Plugin 'pmsorhaindo/syntastic-local-eslint.vim'
  Plugin 'lambdatoast/elm.vim'
  Plugin 'elixir-lang/vim-elixir'
  Plugin 'raichoo/purescript-vim'
  Plugin 'isRuslan/vim-es6'
  Plugin 'junegunn/seoul256.vim'

" end vundle stuff
  call vundle#end()
  filetype plugin indent on

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

" make proper background on 256 color terminals
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif
