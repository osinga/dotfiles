source $VIMRUNTIME/defaults.vim         " Load sensible defaults



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins                                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug '/opt/homebrew/opt/fzf'            " Fuzzy finder
Plug 'AndrewRadev/splitjoin.vim'        " Switch single/multi line
Plug 'airblade/vim-gitgutter'           " Show git status in gutter
Plug 'christoomey/vim-tmux-navigator'   " Navigate between Vim/tmux
Plug 'jiangmiao/auto-pairs'             " Auto close brackets etc.
Plug 'joshdick/onedark.vim'             " One Dark theme
Plug 'junegunn/fzf.vim'                 " Fuzzy finder
Plug 'junegunn/goyo.vim'                " Distraction-free writing
Plug 'junegunn/vim-easy-align'          " Align text
Plug 'lambdalisue/fern.vim'             " File explorer
Plug 'lervag/wiki.vim'                  " Personal wiki
Plug 'neoclide/coc.nvim', { 'branch': 'release' }   " Intellisense
Plug 'sheerun/vim-polyglot'             " Collection of syntaxes
Plug 'tpope/vim-commentary'             " Comment stuff out
Plug 'tpope/vim-fugitive'               " Git plugin
Plug 'tpope/vim-repeat'                 " Repeat plugin mappings
Plug 'tpope/vim-surround'               " Surround with everything
Plug 'tpope/vim-unimpaired'             " Complementary mappings

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

colorscheme onedark                     " Set the color scheme to One Dark

" Coc
let g:coc_global_extensions = [
\   'coc-css',
\   'coc-eslint',
\   'coc-json',
\   'coc-tsserver',
\   'coc-yaml',
\   '@yaegassy/coc-tailwindcss3',
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
let g:wiki_index_name = 'README'
let g:wiki_root = '~/Documents/10-19 Personal/12 Notes'

let g:wiki_journal = {
\   'root': '~/Documents/10-19 Personal/11 Journal',
\ }

let g:wiki_link_creation = {
\   'md': {
\       'url_transform': { _ -> strftime('%Y%m%d%H%M') },
\   },
\ }

" fern
let g:fern#default_exclude = '.DS_Store'
let g:fern#default_hidden = 1
let g:fern#renderer#default#leading = '   '

" splitjoin
let g:splitjoin_html_attributes_bracket_on_new_line = 1
let g:splitjoin_trailing_comma = 1

" tmux-navigator
let g:tmux_navigator_disable_when_zoomed = 1

" vim-markdown
let g:markdown_folding = 1

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
set foldlevelstart=99               " Start with no folds closed
set foldmethod=indent               " Fold based on indentation

" Lines
set display=lastline                " Show as much of the last line as possible
set number                          " Show line numbers
set relativenumber                  " Use relative numbers
set signcolumn=yes                  " Always show the sign column
set smoothscroll                    " Make scrolling work with screen lines

" Search
set hlsearch                        " Highlight all matches for previous search
set ignorecase                      " Ignore case in search patterns
set smartcase                       " Don't ignore case if pattern has uppercase

" Spelling
set spelllang=en_us,nl              " Define the spell checking languages

" Splits
set splitbelow                      " Open horizontal splits on the bottom
set splitright                      " Open vertical splits on the right



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup vimrc
    autocmd!

    " Equalize splits after window resize
    autocmd VimResized * wincmd =

    " Increase the legibility of regular text
    autocmd ColorScheme * call onedark#extend_highlight('Normal', { 'fg': { 'cterm16': 15 } })

    " Reload configuration files on update
    autocmd BufWritePost .config/tmux/tmux.conf silent !tmux source-file %
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

" Hide search results
nnoremap <silent> <Leader>n :nohlsearch<CR>

" Navigate code
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap - :Fern . -reveal=%<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>c :BCommits<CR>
nnoremap <silent> <Leader>C :Commits<CR>
nnoremap <silent> <Leader>f :GFiles<CR>
nnoremap <silent> <Leader>F :Files<CR>
nnoremap <silent> <Leader>l :BLines<CR>
nnoremap <silent> <Leader>L :Ag<CR>

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
