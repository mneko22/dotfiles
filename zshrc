# Key bind
bindkey -e
zstyle ':completion:*:default' menu select=1

#Command completion
autoload -U compinit
compinit
setopt auto_cd
setopt auto_pushd
setopt correct
setopt list_packed
autoload predict-on
autoload -Uz select-word-style
#predict-on
zstyle ':completion:*' menu select
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# If not running interactively, do not do anything
[[ $- != *i* ]] && return

# load enviroment settings
if [ -f ~/.local_profile ]; then
    source ~/.local_profile
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Additional PATH
PATH=~/.local/bin:$PATH

# prompt
PROMPT="%F{green}%~ %F{yellow}%#%k%f "
