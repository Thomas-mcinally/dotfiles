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

# create symlink for vscode dotfiles
ln -s /Users/thomas.mcinally/dotfiles/VSCODE/settings.json /Users/thomas.mcinally/Library/Application\ Support/Code/User/settings.json
ln -s /Users/thomas.mcinally/dotfiles/VSCODE/keybindings.json /Users/thomas.mcinally/Library/Application\ Support/Code/User/keybindings.json
ln -s /Users/thomas.mcinally/dotfiles/VSCODE/snippets/ /Users/thomas.mcinally/Library/Application\ Support/Code/User
ln -s /Users/thomas.mcinally/dotfiles/.zprofile /Users/thomas.mcinally/.zprofile

# install vscode extensions
extensions = (
    hashicorp.terraform
    hbenl.vscode-test-explorer
    littlefoxteam.vscode-python-test-adapter
    matangover.mypy
    mhutchie.git-graph
    ms-azuretools.vscode-docker
    ms-python.python
    ms-python.vscode-pylance
    ms-toolsai.jupyter
    ms-toolsai.jupyter-keymap
    ms-toolsai.jupyter-renderers
    ms-vscode.test-adapter-converter
    oderwat.indent-rainbow
    ritwickdey.LiveServer
)

for extension in "${extensions[@]}"
do
    code --install-extension $extension
done

