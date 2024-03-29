#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval "$(starship init bash)"
#PS1='[\u@\h \W]\$ '

# export
export PATH=$PATH:$HOME/.local/bin
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# alias
alias icat="kitty +kitten icat"
alias ls="ls --color=auto"
alias vi="nvim"
alias vim="nvim"
alias zathura="~/.local/bin/zathura"
alias ncmpcpp="~/.config/ncmpcpp/ncmpcpp-ueberzug"
alias ip="ifconfig | grep inet | head -n3  | tail -n1"
alias hs="history | cut -c 8- | sort | uniq | fzf | tr -d '\\n' | xclip -selection c"
alias grep="grep --color"
#shortcuts
gp(){
grep -ir "$1"
}

f(){    
        find $1 -name "$2" 2>/dev/null    
}    
fcd(){    
    
        cd $(find $HOME -type d | fzf)    
    
}    
    
fop(){    
    
        nano $(find $HOME -type f | fzf)    
    
}    

#wal
(cat ~/.cache/wal/sequences &)    
    
source ~/.cache/wal/colors-tty.sh    
    
