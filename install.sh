#!/usr/bin/env bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in ${homedir}/dotfiles
# And also installs Homebrew Packages
############################

if [ "$#" -ne 2 ]; then
    echo "Usage: install.sh <home_directory> <dotfile_directory>"
    exit 1
fi

homedir=$1
dotfiledir=$2

# Download oh-my-zsh
RUNZSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Run the Homebrew Script
./brew.sh

# set up directory for nvm
mkdir ${homedir}/.nvm

# install python versions
pyenv install 2.7.18
pyenv install 3.10.4
pyenv global 3.10.4

# install vscode extensions
extensions=(
    hashicorp.terraform
    hbenl.vscode-test-explorer
    littlefoxteam.vscode-python-test-adapter
    matangover.mypy
    mhutchie.git-graph
    ms-azuretools.vscode-docker
    ms-python.python
    ms-python.vscode-pylance
    ms-vscode.test-adapter-converter
    oderwat.indent-rainbow
    ritwickdey.LiveServer
)

for extension in "${extensions[@]}"
do
    code --install-extension $extension
done


# create symlinks
ln -sf ${dotfiledir}/.zshrc ${homedir}/.zshrc
ln -sf ${dotfiledir}/.gitconfig ${homedir}/.gitconfig
ln -sf ${dotfiledir}/VSCODE/settings.json ${homedir}/Library/Application\ Support/Code/User/settings.json 
ln -sf ${dotfiledir}/VSCODE/keybindings.json ${homedir}/Library/Application\ Support/Code/User/keybindings.json
