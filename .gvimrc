" Example Vim graphical configuration.
" Copy to ~/.gvimrc or ~/_gvimrc.

set guifont=bitstream\ vera\ sans\ mono\ 14
set antialias                     " MacVim: smooth fonts.
set encoding=utf-8                " Use UTF-8 everywhere.
set guioptions-=T                 " Hide toolbar.
set background=light              " Background.
set go-=m go-=T go-=l go-=L go-=r go-=R go-=b go-=F

" Dark mode settings
colors koehler
highlight LineNr guifg=DarkGray
highlight Search guibg='Purple' guifg=#FFFFFF
highlight String guifg=#FF5733
highlight Visual guibg=#000000
highlight Pmenu guifg=#000000 guibg=#808080

" Uncomment to use.
" set guioptions-=r                 " Don't show right scrollbar
