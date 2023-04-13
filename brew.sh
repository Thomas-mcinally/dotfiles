#!/usr/bin/env bash

# Install brew casks (MacOS applications)
CASKS=(
    google-chrome,
    visual-studio-code,
    slack,
    rectangle,
    microsoft-outlook,
    microsoft-powerpoint,
    microsoft-excel,
    microsoft-word,
    microsoft-teams,
    onedrive,
    docker,
    postico,
    postgres-unofficial,
    zoom,
    postman,
    maccy,
    tree
)

for cask in "${CASKS[@]}"
do
   echo "brew install $cask MacOS app"
   brew install --cask $cask
done

# Install brew formulae (cli tools)
FORMULAE=(
    pyenv,
    pipenv,
    terraform,
    docker-compose,
    npm,
    nvm,
    yarn,
    awscli,
    pre-commit
)
for formulae in "${CASKS[@]}"
do
   echo "brew install $formulae cli tool"
   brew install $formulae
done