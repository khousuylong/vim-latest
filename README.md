# README

## Install nvim (neovim).

### Download and install the appimage, use the output-document option to rename it to nvim:

```` 
wget --quiet https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage --output-document nvim

````

### Set the owner to root, and make nvim accessible to all users:

````
chmod +x nvim
sudo chown root:root nvim
````

### Move the binary file to /usr/bin:

````
sudo mv nvim /usr/bin
````

### Move into your home directory and create the subfolder structure to store the configuration file:

````
cd ~
mkdir -p .config/nvim
````

### Install the Vim-plug Plugin Manager
To make it easier to install plugins, use the Vim-plug plugin manager. This plugin manager uses git to manage most plugins:

````
 curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 ````

### (Optional) Import Existing vim Configuration
If you already have a vim configuration you enjoy, reutilize it for nvim. While vim and nvim can share the same configuration file, create a separate one for nvim to prevent errors if you don’t have Vim-plug also configured for vim:

````
ln -s ~/.vimrc ~/.config/nvim/init.vim
````

### Or create a separate one beginning with the current contents of ~/.vimrc:

````
cp ~/.vimrc ~/.config/nvim/init.vim
````

### Simple Vim config for navigating files

### Installation ###
* Rename working directory to ~/.vim
* Navigate the ~/.vim then run => curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
* Symlink .gvimrc - ln -s  ~/.vim/.gvimrc ~/.gvimrc
* Symlink .vimrc - ln -s  ~/.vim/.vimrc ~/.vimrc
* run vim
* :PlugInstall

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

### Create snippet
* Inside ~/.vim create a folder => mkdir UltiSnips
* Navigate to UltiSnips and create a snippet => touch cpp.snippets

### ALE Lint Config

* Lint packages for most languages need to be installed separately
* User :ALEDetail to see what's happening if Lint isn't running on a file 

## Upgrade Errors

If deoplete starts having errors after a system update, then run :PlugUpdate
Run pip3 install --user --upgrade pynvim
