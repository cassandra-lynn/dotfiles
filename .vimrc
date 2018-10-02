" .vimrc
"
" syntax highlighting stuff
    set t_Co=256
    filetype plugin on
    syntax on
" linebreak stuff
    set linebreak
    set breakindent
" set mouse to be useful in X11
    set mouse=a
" set tab key
    set tabstop=4       " Number of spaces that a <Tab> in the file counts for.
    set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
    set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
    set smarttab        " When on, a <Tab> in front of a line inserts blanks according
                        " to 'shiftwidth'. 'tabstop' is used in other places. A <BS> 
                        " will delete a 'shiftwidth' worth of space at the start of 
                        " the line.
" miscellaneous useful things
    set nocompatible
    set number          " Show line numbers.
    set showmatch       " When a bracket is inserted, briefly jump to the match.
    set ruler           " Show the line and column number of the cursor.
    set cursorline      " Puts a line under the line the cursor is on.
    set wildmode=longest,list,full
    set wildmenu
" searching options
    set hlsearch        " Highlight all matches of a search pattern
    set incsearch       " While typing a search command, immediately show matches
    set ignorecase      " Ignore case in search patterns
    set smartcase       " Override ignorecase if search contains uppercase chars
" backup/swap/etc
    set backupdir=~/.vim/backup//
    set directory=~/.vim/swap//
    set undodir=~/.vim/undo//
" colors!
    colorscheme seattle
    let &colorcolumn=81 " highlight 81st column
    "let &cursorcolumn=80 " Vertical column highlighting the cursor
    "highlight ColorColumn cterm=none ctermbg=236
    "highlight CursorLine cterm=none ctermbg=15
    "highlight CursorLineNR cterm=none ctermfg=red
    "highlight LineNr ctermfg=black
    "highlight StatusLine ctermfg=237 ctermbg=252 cterm=none
    "highlight StatusLineNC ctermfg=252 ctermbg=237 cterm=bold
    "highlight Special cterm=none ctermfg=10
    "highlight Identifier cterm=bold ctermfg=12
