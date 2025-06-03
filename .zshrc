# OH-MY-ZSH configuration
#path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Pyenv configuration
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# NVM configuration 
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Created by `pipx` on 2023-03-08 13:42:50
export PATH="$PATH:/Users/thomas.mcinally/.local/bin"

export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# pyenv
export PATH="$PATH:$HOME/.pyenv/bin"
eval "$(pyenv init -)"

decode_jwt() {
  echo "$1" | jq -R 'split(".") | .[1] | @base64d | fromjson'
}
### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/thomasmcinally/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
