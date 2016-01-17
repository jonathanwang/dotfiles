#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables ########## 

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="vimrc vim bash-git-prompt"    # list of files/folders to symlink in homedir

###############################

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
if [ -e $olddir ]; then
    rm -rf $olddir
fi
mkdir -p $olddir

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# Git lg
echo "Adding 'git lg'"
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Clone Vundle
if [ -e $dir/vim/bundle/Vundle.vim ]; then
    rm -rf $dir/vim/bundle/Vundle.vim 
fi
git clone https://github.com/gmarik/Vundle.vim.git $dir/vim/bundle/Vundle.vim

# Install Vundle and plugins
vim +PluginInstall +qall

