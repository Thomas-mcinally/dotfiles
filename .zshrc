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
alias info=/Users/thomas.mcinally/Documents/Terminal-finance/stock_overview.sh
alias portfolio=/Users/thomas.mcinally/Documents/Terminal-finance/portfolio.sh
alias check-pr-size="git diff --shortstat main | awk -v OFS=, '\$5 ~ /^insertion/ && \$7 ~ /^deletion/ {printf \" Total: %d\n Inserted: %d\n Deleted: %d\n\", \$4,  \$6, \$4 + \$6}'"export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
