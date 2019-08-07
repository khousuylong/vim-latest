# README #

Simple Vim config for navigating files

### Installation ###
* Rename working directory to ~/.vim
* Navigate the ~/.vim then run => curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
* Symlink .gvimrc - ln -s  ~/.vim/.gvimrc ~/.gvimrc
* Symlink .vimrc - ln -s  ~/.vim/.vimrc ~/.vimrc

### Key Mappings ###

* :cd set working directory (do this before using fuzzy tools)
* \f fuzzy search for files in working directory
* \b navigate open buffers
* :bd delete current file from buffer
* \c<space> comment/uncomment selected text
* <tab> to launch a snippet 
* CTRL+J to to move forward to next snippet argument
* CTRL+K to move back to previous snippet argumnet
* \s to fuzzy find available snippets
* S<tag> to surround selected text
* cst<tag> to replace existing surround with <tag>
* yss<tag> to surround current line
* See all Eunich Linux key mappings: https://github.com/tpope/vim-eunuch

### ALE Lint Config ###

* Lint packages for most languages need to be installed separately
* User :ALEDetail to see what's happening if Lint isn't running on a file 

### Create snippet
* Inside ~/.vim create a folder => mkdir UltiSnips
* Navigate to UltiSnips and create a snippet => touch cpp.snippets

