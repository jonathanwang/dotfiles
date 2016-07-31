#!/bin/bash
############################
# Dotfiles install script
############################

########## Variables ##########

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
dotfiles=(vimrc vim)  # list of files/folders to symlink in homedir
bash_files=(.profile .bash_profile .bashrc)  # bash files to add the command to source the 'myprofile'
custom_profile=myprofile

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
for file in ${dotfiles[@]}; do
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

# Add the command to source the shell script to '.profile', '.bash_profile', and/or '.bashrc'
# if it has not already been added (DOTFILES), and if the file exists.
if [ -z "$DOTFILES" ]; then
    for file in ${bash_files[@]}; do
        echo "Adding sourcing custom profile to $file"
        if [ -e ~/$file ]; then
            echo "# Sourcing custom bash profile" >> ~/$file
            echo "source $dir/$custom_profile" >> ~/$file
            echo "" >> ~/$file
        fi
    done
fi
echo "IMPORTANT: Open a new shell in order to see the changes"

