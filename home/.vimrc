" Syntax Highlighting and colors
  syntax on
  colorscheme solarized
  set t_Co=256
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
