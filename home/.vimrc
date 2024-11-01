" Basic settings
set nocompatible              " Disable Vi compatibility
filetype off                  " Disable filetype detection for now
syntax on                     " Enable syntax highlighting
set number                    " Show line numbers
set relativenumber            " Show relative line numbers
set showcmd                   " Display incomplete commands in the status line
set showmode                  " Show the current mode (insert, normal, etc.)
set cmdheight=1               " Command bar height
set ruler                     " Show cursor position

" Search
set incsearch                 " Show search results while typing
set hlsearch                  " Highlight search results
set ignorecase                " Ignore case in searches...
set smartcase                 " ...unless you use capital letters

" Indentation
set tabstop=4                 " Set width for a tab character (use spaces)
set shiftwidth=4              " Indentation width
set expandtab                 " Use spaces instead of tabs
set smarttab                  " Insert correct number of spaces on tab
set autoindent                " Auto-indent the next line
set smartindent               " Automatically insert indents in code
set backspace=indent,eol,start " Make backspace work like most editors

" Text editing
set wrap                      " Enable text wrapping
set linebreak                 " Wrap lines at convenient points
set clipboard+=unnamedplus     " Use system clipboard for copy/paste
set mouse=a                   " Enable mouse usage

" Status bar and UI
set laststatus=2              " Always show the status line
set showtabline=2             " Always show tabline, even with one tab
set wildmenu                  " Show autocomplete menu for commands
set lazyredraw                " Redraw screen only when necessary for better performance
set scrolloff=8               " Keep at least 8 lines visible above/below cursor
set sidescrolloff=8           " Keep at least 8 columns visible to the left/right of cursor

" Files and backup
set undofile                  " Enable persistent undo
set backup                    " Enable backups
set backupdir=~/.vim/backups  " Set directory for backups
set directory=~/.vim/swaps    " Set directory for swap files
set updatetime=300            " Reduce time Vim waits before writing swap file

" Splits
set splitbelow                " Horizontal splits open below current window
set splitright                " Vertical splits open to the right

" Filetype and plugins
filetype plugin indent on     " Enable filetype-specific plugins and indentation

" Mappings
imap jj <Esc>
