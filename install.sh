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
dotfiledir=${homedir}/dotfiles

# Download oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Run the Homebrew Script
./brew.sh

# set up directory for nvm
mkdir ${homedir}/.nvm

# install python versions
pyenv install 2.7.18
pyenv install 3.10.4
pyenv global 3.10.4

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

files="gitconfig zshrc"
# create symlinks to dotfiles (will overwrite old dotfiles)
for file in ${files}; do
    echo "Creating symlink to $file in home directory."
    ln -sf ${dotfiledir}/.${file} ${homedir}/.${file}
done

#create symlinks for VSCCODE settings files (will overwrite existing ones)
ln -sf ${dotfiledir}/VSCODE/settings.json ${homedir}/Library/Application\ Support/Code/User/settings.json 
ln -sf ${dotfiledir}/VSCODE/keybindings.json ${homedir}/Library/Application\ Support/Code/User/keybindings.json
