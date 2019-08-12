" GVim graphical configuration.
set guifont=bitstream\ vera\ sans\ mono\ 16
set antialias                     " MacVim: smooth fonts.
set encoding=utf-8                " Use UTF-8 everywhere.
set go-=m go-=T go-=l go-=L go-=r go-=R go-=b go-=F " Hide all menu's and widgets from GVim GUI

" Vim configuration
set number                        " Show line numbers.
set ruler                         " Show cursor position.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.

set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
" set nowritebackup                 " And again.
set directory=/tmp  " Keep swap files in one location

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set autoindent
set splitright                  " Open splits on the right

" Powerline settings
set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
" No need to show mode at the bottom as Lightline already showing it
set noshowmode

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'ludovicchabant/vim-lawrencium'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-surround'
Plug 'sjl/badwolf'
Plug 'tpope/vim-eunuch'
Plug 'xolox/vim-notes'
Plug 'altercation/vim-colors-solarized'
Plug 'xolox/vim-misc'
Plug 'leafgarland/typescript-vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier'


" Initialize plugin system
call plug#end()

" Enable Theme
syntax enable
set background=dark
let g:badwolf_darkgutter = 1
colorscheme badwolf

" My key mappings
map <leader>f :FZF<Enter>
map <leader>r :Rg<Enter>
map <leader>s :Snippets<Enter>
map <leader>b :Buffers<Enter>
map <leader>d :NERDTreeToggle<Enter>
map <leader>t :terminal<Enter>
map <leader>n :75vs note:Notepad<Enter>
map <expr> <leader>n expand('%:t')== 'Notepad' ? ':wq<Enter>' : ':75vs note:Notepad<Enter>'

" Plugin Settings
let NERDTreeChDirMode=2
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" NERDCommenter
filetype plugin on

" Vim Notes
let g:notes_directories = ['~/Documents/Notes']

" Lightline Ale Integration
"let g:lightline = {}

"let g:lightline.component_expand = {
      "\  'linter_checking': 'lightline#ale#checking',
      "\  'linter_warnings': 'lightline#ale#warnings',
      "\  'linter_errors': 'lightline#ale#errors',
      "\  'linter_ok': 'lightline#ale#ok',
      "\ }

"let g:lightline.component_type = {
      "\     'linter_checking': 'left',
      "\     'linter_warnings': 'warning',
      "\     'linter_errors': 'error',
      "\     'linter_ok': 'left',
      "\ }

"let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ], ['fileencoding']] }

let g:airline_powerline_fonts = 1

" File type specific settings
au BufNewFile, BufRead *.sld set filetype=xml

augroup FileTypeSpecificAutocommands
    autocmd FileType javascript setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
augroup END
