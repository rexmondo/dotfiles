" Pathogen call
  execute pathogen#infect() 

" Syntax Highlighting, colors, and other display settings
  syntax on
  colorscheme gruvbox
  set background=dark
  set t_Co=256
  set number

" key fixes
  set backspace=indent,eol,start

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
    set tabstop=2 softtabstop=2 shiftwidth=2 expandtab " Indent size
