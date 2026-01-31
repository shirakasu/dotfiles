if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# nvm PATH
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Ghidra PATH
alias ghidra="$HOME/code/ghidra_11.4.1_PUBLIC/ghidraRun"

# capa PATH
export PATH="$PATH:$HOME/code/capa"

# EV3RT PATH
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/gcc-arm-none-eabi-6-2017-q1-update/bin:$PATH"

# Neovim PATH
export PATH="$HOME/nvim-macos-arm64/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# pyenv PATH
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# wezterm PATH
export PATH="/Applications/WezTerm.app/Contents/MacOS:$PATH"

# json mock server path
export PATH="$HOME/.nvm/versions/node/v24.12.0/bin:$PATH"
