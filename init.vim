call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }
" Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
" Plug 'Shougo/deoplete.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'burner/vim-svelte'
call plug#end()

let mapleader=" "  " Change mapleader

set ruler               " Show the line and column numbers of the cursor.
set number
set nostartofline       " Do not jump to first character with page commands.
set noerrorbells                " No beeps
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set noswapfile                  " Don't use swapfile
set nobackup            	" Don't create annoying backup files
set nowritebackup
set encoding=utf-8              " Set default encoding to UTF-8
" set autowrite                   " Automatically save before :next, :make etc.
" set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set showmatch                   " Do not show matching brackets by flickering
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set autoindent
set tabstop=2 shiftwidth=2 expandtab
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
set signcolumn=yes
set updatetime=300
set wrap!
" COC settings
set hidden
set cmdheight=2
set shortmess+=c

" allow nvimrc 
set exrc
set secure

" Hybrid color scheme settings
let g:hybrid_custom_term_colors = 1
colorscheme hybrid

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Maps Alt-[h,j,k,l] to resizing a window split
nnoremap ˙ <C-w><
nnoremap ∆ <C-W>-
nnoremap ˚ <C-W>+
nnoremap ¬ <C-w>>

" Auto center things
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz

" Default search to very magic
no / /\v
" Clear search with ,/
nmap <silent> ,/ :nohlsearch<CR>

" gO to create a new line below cursor in normal mode
nmap g<C-O> o<ESC>k
" g<Ctrl+o> to create a new line above cursor (Ctrl to prevent collision with 'go' command)
nmap gO O<ESC>j

" NERDTree
map <leader>n :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen=0
let NERDTreeShowHidden=1
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>
let g:NERDTreeNodeDelimiter = "\u00a0"

" Airline
let g:airline_powerline_fonts = 1
set laststatus=2

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.space = "\ua0"
let g:airline_inactive_collapse = 0
let g:airline_left_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep = ''

" Ale
let g:ale_linter_aliases = {}
let g:ale_linter_aliases['svelte'] = ['css', 'javascript']

let g:ale_linters = {}
let g:ale_linters['javascript'] = ['prettier']
let g:ale_linters['scss'] = ['scss-lint']
let g:ale_linters['typescript'] = ['eslint']
let g:ale_linters['svelte'] = ['prettier']

let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 1
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:airline#extensions#ale#enabled = 1

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['typescript'] = ['eslint']
let g:ale_fixers['svelte'] = ['prettier']

let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1


" FZF
nnoremap <leader>ff :Files<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>gg :GFiles?<CR>
nnoremap <leader>aa :Ag<CR>

" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" tree style for the vim files explorer 
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_winsize = 25

