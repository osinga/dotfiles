""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins                                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'Xuyuanp/nerdtree-git-plugin'      " Git plugin for NERDTree
Plug 'airblade/vim-gitgutter'           " Show git status in gutter
Plug 'ap/vim-css-color'                 " Color keyword highlighting
Plug 'bling/vim-airline'                " Status line
Plug 'christoomey/vim-tmux-navigator'   " Navigate between Vim/tmux
Plug 'jiangmiao/auto-pairs'             " Auto close brackets etc.
Plug 'joshdick/onedark.vim'             " One Dark theme
Plug 'junegunn/fzf', { 'do': './install --all' }    " Fuzzy finder
Plug 'junegunn/fzf.vim'                 " Fuzzy file finder
Plug 'junegunn/gv.vim'                  " Git commit browser
Plug 'junegunn/vim-easy-align'          " Align text
Plug 'metakirby5/codi.vim'              " Interactive scratchpad
Plug 'neoclide/coc.nvim', { 'branch': 'release' }   " Intellisense
Plug 'scrooloose/nerdcommenter'         " Easy commenting
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }  " File explorer
Plug 'sheerun/vim-polyglot'             " Collection of syntaxes
Plug 'tmux-plugins/vim-tmux-focus-events'   " Restore focus lost/gained
Plug 'tpope/vim-fugitive'               " Git plugin
Plug 'tpope/vim-repeat'                 " Repeat plugin mappings
Plug 'tpope/vim-rhubarb'                " GitHub plugin for vim-fugitive
Plug 'tpope/vim-surround'               " Surround with everything
Plug 'tpope/vim-unimpaired'             " Complementary mappings
Plug 'vim-airline/vim-airline-themes'   " Themes for Airline

call plug#end()



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configurations                                                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Styling
if (has('gui_running'))
    set guifont=Iosevka\ Term\ Light:h14
end

let g:onedark_termcolors = 16

colorscheme onedark                     " Set the color scheme to One Dark

" Airline
let g:airline#extensions#coc#enabled = 1    " Show Coc errors
let g:airline_skip_empty_sections = 1       " Do not show empty sections
let g:airline_theme = 'onedark'             " Set the Airline theme to One Dark

" Coc
let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-eslint',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-tsserver',
    \ ]

" GitGutter
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_modified_removed = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_removed_first_line = '∙'

" NERDCommenter
let g:NERDSpaceDelims = 1               " Add a space after comment delimiters

" NERDTree
let NERDTreeIgnore = ['\.DS_Store$']    " Files to hide
let NERDTreeShowHidden = 1              " Show hidden files

" Tabline
let g:airline#extensions#tabline#buffer_idx_mode = 1    " Show buffers
let g:airline#extensions#tabline#enabled = 1            " Enable the tabline

" Accessibility
set clipboard=unnamed               " Use the macOS clipboard
set mouse=a                         " Allow the use of the mouse

" Backup
set backupdir=~/.vim/backup//       " Where to store backup files
set directory=~/.vim/swap//         " Where to store swap files
set undodir=~/.vim/undo//           " Where to store undo files
set undofile

" Buffers
set autoread                        " Automatically refresh unedited changed files
set hidden                          " Hide buffers instead of unloading

" Command line
set wildmenu                        " Enable command line completion
set wildmode=longest,full           " 1 longest common string, 2 next full match

" Folding
set foldmethod=indent               " Fold based on indentation
set nofoldenable                    " Open folds by default

" Insert
set showmatch                       " Briefly show matching bracket on insert
set textwidth=120                   " Wrap inserted text longer than 120 characters

" Lines
set number                          " Show line numbers
set relativenumber                  " Use relative numbers
set scrolloff=3                     " Always keep 3 lines above/below the curser
set signcolumn=yes                  " Always show the sign column

" Performance
set lazyredraw                      " No redrawing during macros/registers
set notimeout                       " Do not time out mappings
set synmaxcol=800                   " Don't highlight lines after column 800
set ttimeout                        " Do time out key codes
set ttimeoutlen=10                  " Wait 10 ms for a mapping to complete
set ttyfast                         " Indicate a fast terminal connection

" Search
set hlsearch                        " Highlight all matches for previous search
set ignorecase                      " Ignore case in search patterns
set incsearch                       " Show live search results while typing
set smartcase                       " Don't ignore case if pattern has uppercase

" Splits
set splitbelow                      " Open horizontal splits on the bottom
set splitright                      " Open vertical splits on the right

" Status line
set laststatus=2                    " Always show the statusline
set noshowmode                      " Hide the default mode indicator
set showcmd                         " Show (partial) commands in statusline

" Tabs
set expandtab                       " Use spaces when tab is inserted
set shiftwidth=4                    " Use 4 spaces for auto (auto)indent
set softtabstop=4                   " Use 4 spaces for <BS> in insert mode
set tabstop=4                       " Use 4 spaces for tabs



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Save when losing focus
autocmd FocusLost * :silent! wall

" Show cursor line in active window only
augroup CursorLine
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" Show fzf Files results with a preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Show fzf Ag results with a preview window
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview(), <bang>0)



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings                                                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use space as the leader through '\' so it still shows for 'showcmd'
let mapleader = '\'
nmap <space> \

" Airline
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" NERDTree
nnoremap <silent> <leader>k :NERDTreeToggle<cr>

" fzf
nnoremap <silent> <leader>a :Ag<cr>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>f :Files<cr>
nnoremap <silent> <leader>g :BCommits<cr>

" Confirm completion
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Hide search results
nnoremap <silent> <leader>n :noh<cr>

" Move between split panes
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" Navigate code
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)

" Navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Navigate to broken lines
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
noremap gj j
noremap gk k

" Rename symbol
nmap <leader>rn <Plug>(coc-rename)

" Reselect last inserted text
nnoremap gp `[v`]

" Resize split panes
nnoremap [h :resize -5<cr>
nnoremap ]h :resize +5<cr>
nnoremap [w :vertical resize -5<cr>
nnoremap ]w :vertical resize +5<cr>

" Show documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Start EasyAlign in normal mode and visual mode
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" Trigger completion and navigate
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Write
nnoremap <leader>w :w<cr>
