set autochdir

syntax on
"filetype on
filetype plugin indent on

set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

set cindent
set smartindent
set autoindent
set copyindent    " copy the previous indentation on autoindenting
set expandtab
set tabstop=4
set shiftwidth=4
set cinkeys="0{,0},0),:,0#,!^F,o,O,e"

set number
set background=dark 
set et
set sw=4
set sts=4
set smarttab
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
set noswapfile

set cursorline
set guicursor=n:blinkon0
set laststatus=2 " Enables the status line at the bottom of Vim
set statusline=[%F]\ =>\ %{GitBranchInfoString()}
set selection=inclusive
set showcmd
call pathogen#infect()

set t_Co=256
colorscheme twilight

map <F4> :GitCommit <cr>
map <F5> :GitPush <cr>
nnoremap <silent> <F3> :TlistToggle <cr>
nnoremap <silent> <F2> :NERDTreeToggle <cr>
nnoremap ; :
nnoremap j gj
nnoremap k gk
nmap <silent> <leader>/ :nohlsearch<cr>

au FileType * setl fo-=cro

" Removing Arrow Keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>

" automatically reload vimrc when it's saved
" au BufWritePost .vimrc so ~/.vimrc

" Easy Split Navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Open last/alternate buffer
noremap <Leader><Leader> <C-^>

" Add blank line under current one
noremap <Leader>o :put = ' ' <cr>

function! ConditionalPairMap(open, close)
  let line = getline('.')
  let col = col('.')
  if col < col('$') || stridx(line, a:close, col + 1) != -1
    return a:open
  else
    return a:open . a:close . repeat("\<left>", len(a:close))
  endif
endf
inoremap <expr> ( ConditionalPairMap('(', ')')
inoremap <expr> { ConditionalPairMap('{', '}')
inoremap <expr> [ ConditionalPairMap('[', ']')

