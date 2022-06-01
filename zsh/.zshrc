# Luke's config for the Zoomer Shell

# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$reset_color%} %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/flutter/bin
alias icat="kitty +kitten icat"
alias ls="ls --color=auto"
alias history="history 100"
alias vi="nvim"
alias vim="nvim"

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

#key
bindkey "^[[1;5C" forward-word 
bindkey "^[[1;5D" backward-word

(cat ~/.cache/wal/sequences &)

source ~/.cache/wal/colors-tty.sh

alias hs="history | cut -c 8- | sort | uniq | fzf | tr -d '\\n' | xclip -selection c"
