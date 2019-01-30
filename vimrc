try
  source $REAL_HOME/.vimrc
catch /E484/
endtry
syntax on

set ts=2
set encoding=utf8
set fileencoding=utf8
set termencoding=utf8
set ruler
set hlsearch        " highlight searches

" Some nice setup stuff
set nocompatible    " We’re running Vim, not Vi!
filetype on         " Enable filetype detection
filetype indent on  " Enable filetype-specific indenting
filetype plugin on  " Enable filetype-specific plugins
set history=1000    " keep 1000 lines of command line history
set showcmd         " display incomplete commands
set title           " show title in console title bar
set ttyfast         " smoother changes
set scrolloff=3     " keep 3 lines when scrolling
set ls=2          " allways show status line
" set laststatus=2  " always display the status line

let base16colorspace=256
