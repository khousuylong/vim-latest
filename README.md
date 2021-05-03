# README

Simple Vim config for navigating files

## Installation

### Location
* Rename working directory to ~/.vim
* Symlink .gvimrc - ln -s  ~/.vim/.gvimrc ~/.gvimrc
* Symlink .vimrc - ln -s  ~/.vim/.vimrc ~/.vimrc

### Fonts
The configuration require the Operator font which has been packaged with nerd fonts for symbols. 
Move the fonts in the font directory to your font directory:

```
sudo mkdir -p /user/share/fonts/operator/
sudo cp fonts/* /usr/share/fonts/operator/
```

## Key Mappings

* :cd set working directory (do this before using fuzzy tools)
* \f fuzzy search for files in working directory
* \b navigate open buffers
* :bd delete current file from buffer
* \c<space> comment/uncomment selected text
* \sc create new session
* \ss navigate saved sessions
* CTRL+<tab> to launch a snippet 
* CTRL+J to to move forward to next snippet argument
* CTRL+K to move back to previous snippet argumnet
* \s to fuzzy find available snippets
* S<tag> to surround selected text
* cst<tag> to replace existing surround with <tag>
* yss<tag> to surround current line
* See all Eunich Linux key mappings: https://github.com/tpope/vim-eunuch

### ALE Lint Config

* Lint packages for most languages need to be installed separately
* User :ALEDetail to see what's happening if Lint isn't running on a file 

## Upgrade Errors

If deoplete starts having errors after a system update, then run :PlugUpdate
Run pip3 install --user --upgrade pynvim
