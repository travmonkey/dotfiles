# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="custom"

plugins=( 
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# source ~/.zsh/catppuccin_macchiato-zsh-syntax-highlighting.zsh

source $ZSH/oh-my-zsh.sh

# Aliases
# Neovim
alias vim ="nvim"
alias vi="nvim"
alias v="nvim"

# LS related
alias la="ls -lta"
alias lr="ls -ltr"
alias l="ls"

# New line for input
# prompt_end() {
#   if [[ -n $CURRENT_BG ]]; then
#       print -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
#   else
#       print -n "%{%k%}"
#   fi
#
#   print -n "%{%f%}"
#   CURRENT_BG='' 
#
#   #Adds the new line and ➜ as the start character.
#   printf "\n ➜ $";
# }

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

# Login to start Hyprland
if [ "$(tty)" = "/dev/tty2" ]
then
  Hyprland
fi

# Display Pokemon-colorscripts
pokemon-colorscripts --no-title -s -r

# Created by SPICETIFY
export PATH=$PATH:/home/travis/.spicetify

# Use keyword 'config' to manage the git for .configs
alias config='/usr/bin/git --git-dir=/home/travis/.cfg/ --work-tree=/home/travis'
