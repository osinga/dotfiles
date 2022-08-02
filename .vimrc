source $VIMRUNTIME/defaults.vim         " Load sensible defaults



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins                                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug '/opt/homebrew/opt/fzf'            " Fuzzy finder
Plug 'airblade/vim-gitgutter'           " Show git status in gutter
Plug 'christoomey/vim-tmux-navigator'   " Navigate between Vim/tmux
Plug 'jiangmiao/auto-pairs'             " Auto close brackets etc.
Plug 'joshdick/onedark.vim'             " One Dark theme
Plug 'junegunn/fzf.vim'                 " Fuzzy finder
Plug 'junegunn/goyo.vim'                " Distraction-free writing
Plug 'junegunn/vim-easy-align'          " Align text
Plug 'lervag/wiki.vim'                  " Personal wiki
Plug 'neoclide/coc.nvim', { 'branch': 'release' }   " Intellisense
Plug 'sheerun/vim-polyglot'             " Collection of syntaxes
Plug 'tpope/vim-commentary'             " Comment stuff out
Plug 'tpope/vim-fugitive'               " Git plugin
Plug 'tpope/vim-repeat'                 " Repeat plugin mappings
Plug 'tpope/vim-surround'               " Surround with everything
Plug 'tpope/vim-unimpaired'             " Complementary mappings
Plug 'vim-airline/vim-airline'          " Status line

call plug#end()



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configurations                                                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Styling
let &t_EI = "\<Esc>[2 q"                " Normal mode cursor
let &t_SI = "\<Esc>[6 q"                " Insert mode cursor
let &t_SR = "\<Esc>[4 q"                " Replace mode cursor

let &fillchars ..= ',eob: '             " Hide end-of-buffer lines (~)

let g:onedark_termcolors = 16           " Use terminal's native 16 colors
let g:onedark_terminal_italics = 1      " Enable italics

augroup OneDark
    autocmd!
    autocmd ColorScheme * call onedark#extend_highlight('CursorLine', { 'bg': { 'cterm16': 8 } })
    autocmd ColorScheme * call onedark#extend_highlight('Normal', { 'fg': { 'cterm16': 15 } })
    autocmd ColorScheme * call onedark#extend_highlight('Visual', { 'bg': { 'cterm16': 7 } })
augroup END

colorscheme onedark                     " Set the color scheme to One Dark

" Airline
let g:airline_section_b = ''            " Hide the git information
let g:airline_section_y = ''            " Hide the file encoding

" Coc
let g:coc_global_extensions = [
\   'coc-css',
\   'coc-eslint',
\   'coc-json',
\   'coc-tsserver',
\ ]

" GitGutter
let g:gitgutter_close_preview_on_escape = 1 " Close the popup window with escape
let g:gitgutter_preview_win_floating = 1    " Use popup window for hunk previews
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_modified_removed = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_removed_above_and_below = '∙'
let g:gitgutter_sign_removed_first_line = '∙'

" Wiki
let g:wiki_filetypes = ['md']
let g:wiki_index_name = 'README'
let g:wiki_link_extension = '.md'
let g:wiki_link_target_type = 'md'
let g:wiki_map_create_page = 'WikiCreatePage'
let g:wiki_map_text_to_link = 'WikiTextToLink'
let g:wiki_root = '~/Documents/10-19 Personal/11 Wiki'

let s:note_date_format = '%Y%m%d%H%M'

function WikiCreatePage(name)
    return strftime(s:note_date_format)
endfunction

function WikiTextToLink(text)
    return [strftime(s:note_date_format), a:text]
endfunction

" netrw
let g:netrw_banner = 0
let g:netrw_list_hide= '.DS_Store'
let g:netrw_liststyle = 3

" tmux-navigator
let g:tmux_navigator_disable_when_zoomed = 1

" Accessibility
set clipboard=unnamed               " Use the macOS clipboard

" Backup
set backupdir=~/.vim/backup//       " Where to store backup files
set directory=~/.vim/swap//         " Where to store swap files
set undodir=~/.vim/undo//           " Where to store undo files
set undofile                        " Restore from the undo file on buffer read

" Buffers
set hidden                          " Hide buffers instead of unloading

" Command line
set wildmode=longest,full           " 1 longest common string, 2 next full match

" Folding
set foldmethod=indent               " Fold based on indentation
set nofoldenable                    " Open folds by default

" Lines
set number                          " Show line numbers
set relativenumber                  " Use relative numbers
set signcolumn=yes                  " Always show the sign column

" Performance
set lazyredraw                      " No redrawing during macros/registers
set notimeout                       " Do not time out mappings
set synmaxcol=800                   " Don't highlight lines after column 800

" Search
set hlsearch                        " Highlight all matches for previous search
set ignorecase                      " Ignore case in search patterns
set smartcase                       " Don't ignore case if pattern has uppercase

" Spelling
set spelllang=en_us,nl              " Define the spell checking languages

" Splits
set splitbelow                      " Open horizontal splits on the bottom
set splitright                      " Open vertical splits on the right

" Status line
set noshowmode                      " Hide the default mode indicator

" Tabs
set expandtab                       " Use spaces when tab is inserted
set shiftround                      " Round indent to multiple of `shiftwidth`
set shiftwidth=4                    " Use 4 spaces for auto (auto)indent
set softtabstop=4                   " Use 4 spaces for <BS> in insert mode



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup vimrc
    autocmd!

    " Equalize splits after window resize
    autocmd VimResized * wincmd =

    " Reload configuration files on update
    autocmd BufWritePost .tmux.conf silent !tmux source-file %
    autocmd BufWritePost .vimrc source %

    " Save all buffers when losing focus
    autocmd FocusLost * :silent! wall

    " Tweak configuration in Markdown files
    autocmd FileType markdown
    \   let b:coc_suggest_disable = 1 |
    \   setlocal concealcursor=nc conceallevel=2 linebreak spell noruler noshowcmd
augroup end



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings                                                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use space as the leader through `\` so it still shows for `showcmd`
nmap <Space> \

" Confirm completion
inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Hide search results
nnoremap <silent> <Leader>n :nohlsearch<CR>

" Navigate code
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap - :Explore<CR>
nnoremap <silent> <Leader>a :Ag<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>c :BCommits<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>g :GFiles<CR>

" Navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Navigate to broken lines
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
noremap gj j
noremap gk k

" Reselect last inserted text
nnoremap gp `[v`]

" Resize split panes
nnoremap [h :resize -5<CR>
nnoremap ]h :resize +5<CR>
nnoremap [w :vertical resize -5<CR>
nnoremap ]w :vertical resize +5<CR>

" Show documentation
nnoremap <silent> K :call <SID>ShowDocumentation()<CR>

function! s:ShowDocumentation()
    if (index(['help', 'vim'], &filetype) >= 0)
        execute 'help ' . expand('<cword>')
    else
        call CocActionAsync('doHover')
    endif
endfunction

" Start EasyAlign in normal mode and visual mode
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" Trigger completion and navigate
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <TAB> pumvisible()
    \ ? "\<C-n>"
    \ : <SID>CheckBackspace()
        \ ? "\<TAB>"
        \ : coc#refresh()

function! s:CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
