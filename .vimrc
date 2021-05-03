"
" Settings
"

set hidden                        " Handle multiple buffers better.
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set cmdheight=2										" Give more space for displaying messages.
set updatetime=300								" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set shortmess+=c 									" Don't pass messages to |ins-completion-menu|.


set clipboard+=unnamedplus				" Clipboard for neovim
set number                        " Show line numbers.
set ruler                         " Show cursor position.
set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set backspace=indent,eol,start    " Intuitive backspacing.
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
set backupcopy=yes							  " For parcel to work with html fsdfiles
set directory=/tmp  							" Keep swap files in one location
set tabstop=2                    	" Global tab width.
set shiftwidth=2                 	" And again, related.
set autoindent
set splitright                  	" Open splits on the right

"
" Plugins
" Install: :PlugInstall
"
"
call plug#begin('~/.vim/plugged') " Specify a directory for plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Code completion
Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dominickng/fzf-session.vim'
Plug 'vim-airline/vim-airline'	
Plug 'scrooloose/nerdtree'
"Plug 'w0rp/ale' " Async Lint Engine
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'sjl/badwolf'
Plug 'tpope/vim-eunuch'
" Plug 'xolox/vim-notes'
" Plug 'xolox/vim-misc'
" Plug 'heavenshell/vim-jsdoc'
" Plug 'sheerun/vim-polyglot'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Plug 'ap/vim-css-color'
" Plug 'terryma/vim-multiple-cursors'
Plug 'jparise/vim-graphql'
" Plug 'kylef/apiblueprint.vim'
" Plug 'vim-syntastic/syntastic'

"if has('nvim')
	"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
	"Plug 'Shougo/deoplete.nvim'
	"Plug 'roxma/nvim-yarp'
	"Plug 'roxma/vim-hug-neovim-rpc'
"endif

" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
call plug#end()

" deoplete
"let g:deoplete#enable_at_startup = 1

" 
" Plugin Settings
"
let NERDTreeChDirMode=2
let g:UltiSnipsExpandTrigger='<c-s>' 

" NERDCommenter
filetype plugin on

" FzfSession
silent !mkdir ~/.vim_sessions > /dev/null 2>&1
let g:fzf_session_path = $HOME . '/.vim_sessions'
" use rg for search to .gitignore files aren't listed
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

" Vim Notes
" let g:notes_directories = ['~/Documents/Notes']

let g:airline_powerline_fonts = 1

" coc.nvim

" Prettier & eslint
"let g:ale_fixers = {
 "\ 'javascript': ['eslint']
 "\ }
"let g:ale_sign_error = ''
"let g:ale_sign_warning = ''
"let g:ale_fix_on_save = 1

" 
" File type specific settings
"
augroup FileTypeSpecificAutocommands
		autocmd Filetype markdown setlocal conceallevel=0
		au BufNewFile, BufRead *.sld set filetype=xml
    autocmd FileType javascript setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
		autocmd FileType apiblueprint setlocal ts=4 sw=4 expandtab
augroup END

"
" Colour, Fonts and Layout
"
set guifont=operatormononerdfont\ nerd\ font\ light\ 18
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175
set termguicolors									" Use true colors
set encoding=utf-8                " Use UTF-8 everywhere.
set go-=m go-=T go-=l go-=L go-=r go-=R go-=b go-=F " Hide all menu's and widgets from GVim GUI
syntax on
set background=dark
let g:badwolf_darkgutter = 1
colorscheme badwolf
highlight Comment cterm=italic gui=italic

" 
" Powerline settings
"
set laststatus=2                  " Show the status line all the time
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
set noshowmode										" No need to show mode at the bottom as Lightline already showing it

" 
" My key mappings
"
"

map <leader>f :FZF<Enter>
map <leader>r :Rg<Enter>
map <leader>b :Buffers<Enter>	
map <leader>d :NERDTreeToggle<Enter>
map <leader>t :terminal<Enter>
" map <leader>n :75vs note:Notepad<Enter>
" map <expr> <leader>n expand('%:t')== 'Notepad' ? ':wq<Enter>' : ':75vs note:Notepad<Enter>'
map <leader>ss :Sessions<CR>
map <leader>sc :Session<Space>

"
" Coc specific key mappings
"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>fs  <Plug>(coc-format-selected)
nmap <leader>fs  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"
" Chris's custom Coc bindings
"
nmap <expr> <silent> <C-d> <SID>select_current_word()
function! s:select_current_word()
  if !get(b:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc
