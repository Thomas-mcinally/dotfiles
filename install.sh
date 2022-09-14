#!/usr/bin/env bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in ${homedir}/dotfiles
# And also installs Homebrew Packages
############################

if [ "$#" -ne 1 ]; then
    echo "Usage: install.sh <home_directory>"
    exit 1
fi

homedir=$1

# Run the Homebrew Script
./brew.sh

# install python versions
pyenv install 2.7.18
pyenv install 3.10.4
pyenv global 3.10.4

# Download oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# create symlinks for dotfiles in homedirectory
ln -s /Users/thomas.mcinally/dotfiles/.gitconfig /Users/thomas.mcinally/.gitconfig

#create symlinks for VSCCODE
#not sure if vscode install comes with settings.json and keybindings.json. If they do, need to delete the default files before making these symlinks
ln -s /Users/thomas.mcinally/dotfiles/VSCODE/settings.json /Users/thomas.mcinally/Library/Application\ Support/Code/User/settings.json 
ln -s /Users/thomas.mcinally/dotfiles/VSCODE/keybindings.json /Users/thomas.mcinally/Library/Application\ Support/Code/User/keybindings.json

# install vscode extensions
extensions = (
    hashicorp.terraform,
    hbenl.vscode-test-explorer,
    littlefoxteam.vscode-python-test-adapter,
    matangover.mypy,
    mhutchie.git-graph,
    ms-azuretools.vscode-docker,
    ms-python.python,
    ms-python.vscode-pylance,
    ms-vscode.test-adapter-converter,
    oderwat.indent-rainbow,
    ritwickdey.LiveServer
)

for extension in "${extensions[@]}"
do
    code --install-extension $extension
done

