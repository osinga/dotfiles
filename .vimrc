set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()



""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""

Plugin 'VundleVim/Vundle.vim'               " Plugin manager
Plugin 'scrooloose/nerdtree'                " File explorer
Plugin 'Xuyuanp/nerdtree-git-plugin'        " Git plugin for NERDTree
Plugin 'tpope/vim-fugitive'                 " Git plugin
Plugin 'bling/vim-airline'                  " Status line
Plugin 'vim-airline/vim-airline-themes'     " Themes for Airline
Plugin 'ctrlpvim/ctrlp.vim'                 " Fuzzy file finder
Plugin 'christoomey/vim-tmux-navigator'     " Navigate between Vim/tmux
Plugin 'tpope/vim-obsession'                " Remember Vim state
Plugin 'tmux-plugins/vim-tmux-focus-events' " Restore focus lost/gained
Plugin 'joshdick/onedark.vim'               " One Dark theme
Plugin 'jiangmiao/auto-pairs'               " Auto close brackets etc.
Plugin 'sheerun/vim-polyglot'               " Collection of sytaxes
Plugin 'posva/vim-vue'                      " Vue syntax
Plugin 'mattn/emmet-vim'                    " Emmet
Plugin 'scrooloose/nerdcommenter'           " Easy commenting
Plugin 'airblade/vim-gitgutter'             " Show git status in gutter
Plugin 'ntpeters/vim-better-whitespace'     " Show trailing whitespace
Plugin 'tpope/vim-surround'                 " Surround with everything
Plugin 'tpope/vim-repeat'                   " Repeat plugin mappings
Plugin 'valloric/youcompleteme'             " Code completion
Plugin 'tpope/vim-unimpaired'               " Complementary mappings
Plugin 'mtth/scratch.vim'                   " Scratch window

call vundle#end()



""""""""""""""""""""""""""""""""""""
" Configurations
""""""""""""""""""""""""""""""""""""

filetype plugin indent on

" Theme
syntax enable                       " Enable syntax highlighting
colorscheme onedark                 " Set the syntax to One Dark
let g:airline_theme = 'onedark'     " Set the Airline theme to One Dark
let g:airline_powerline_fonts = 1   " Enable Airline Powerline fonts

" Tabline
let g:airline#extensions#tabline#enabled = 1            " Enable the tabline
let g:airline#extensions#tabline#buffer_idx_mode = 1    " Show buffers

" Statusline
set noshowmode                      " Hide the default mode indicator"
set showcmd                         " Show (partial) commands in statusline
set laststatus=2                    " Always show the statusline

" Line numbers
set number                          " Show line numbers
set relativenumber                  " Use relative numbers

set scrolloff=3                     " Always keep 3 lines above/below the curser

" Search
set ignorecase                      " Ignore case in search patterns
set smartcase                       " Don't ignore case if pattern has uppercase
set incsearch                       " Show live search results while typing
set hlsearch                        " Highlight all matches for previous search

set showmatch                       " Briefly show matching bracket on insert

" Tabs
set tabstop=4                       " Use 4 spaces for tabs
set shiftwidth=4                    " Use 4 spaces for auto (auto)indent
set softtabstop=4                   " Use 4 spaces for <BS> in insert mode
set expandtab                       " Use spaces when tab is inserted

" Buffers
set hidden                          " Hide buffers instead of unloading
set autoread                        " Automatically refresh unedited changed files

" Splits
set splitright                      " Open vertical splits on the right
set splitbelow                      " Open horizontal splits on the bottom

" Folding
set foldmethod=indent               " Fold based on indentation
set foldenable                      " Close folds by default

" Command-line
set wildmenu                        " Enable command-line completion"
set wildmode=longest,full           " 1 longest common string, 2 next full match

" Ctrlp
let g:ctrlp_custom_ignore = '\v[\/](node_modules|vendor|target|dist)|(\.(swp|ico|git|svn))$'

" NERDTree
let NERDTreeShowHidden = 1          " Show hidden files in NERDTree
let NERDTreeIgnore = ['\.DS_Store$']    " Hide certain files in NERDTree

" Accessibility
set clipboard=unnamed               " Use the macOS clipboard
set mouse=a                         " Allow the use of the mouse for scrolling

" Performance
set notimeout                       " Do not time out mappings
set ttimeout                        " Do time out key codes
set ttimeoutlen=10                  " Wait 10 ms for a mapping to complete
set ttyfast                         " Indicate a fast terminal connection
set lazyredraw                      " No redrawing during macros/registers
set synmaxcol=800                   " Don't highlight lines after column 800

" Backup
set backupdir=~/.vim/backup//       " Where to store backup files
set directory=~/.vim/swap//         " Where to store swap files
set undodir=~/.vim/undo//           " Where to store undo files



""""""""""""""""""""""""""""""""""""
" Autocommands
""""""""""""""""""""""""""""""""""""

autocmd FocusLost * :silent! wall   " Save when losing focus

augroup CursorLine                  " Show cursor line in active window only
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

autocmd BufWritePre * StripWhitespace   " Remove trailing whitespace on save



""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""

" Use space as the leader through '\' so it still shows for 'showcmd'
let mapleader = '\'
nmap <space> \

" Open ~/.vimrc in a vertically split window, and source it
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Open ~/.tmux.conf in a vertically split window, and source it
nnoremap <leader>et :vsplit ~/.tmux.conf<cr>
nnoremap <leader>st :!tmux source-file ~/.tmux.conf<cr><cr>

" Tab line mappings from Airline
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

" Use ctrl-[hjkl] to move between split panes
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" If no count is given, allow to navigate to line breaks with j and k
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
noremap gj j
noremap gk k

" use [ (-) and ] (+) to resize w(idth) and h(eight)
nnoremap [w :vertical resize -5<cr>
nnoremap ]w :vertical resize +5<cr>
nnoremap [h :resize -5<cr>
nnoremap ]h :resize +5<cr>

" Faster write/quit
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

" Toggle NERDTree
nnoremap <leader>k :NERDTreeToggle<cr>

" Hide search results
nnoremap <leader>n :noh<cr>

" Reselect last inserted text
nnoremap gp `[v`]
