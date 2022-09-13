#!/usr/bin/env bash

# Install MacOS Applications
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
)

for app in "${CASKS[@]}"
do
   echo "brew install $app on your MacOS."
   brew install --cask $app
done

# Install Brew Packages
brew install pyenv
brew install pipenv
brew install terraform
brew install docker-compose

