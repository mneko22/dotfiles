# Created by newuser for 5.1.1
source ~/.zplug/init.zsh

#Command completion
autoload -U compinit
compinit
setopt auto_cd
setopt auto_pushd 
setopt correct
setopt list_packed
autoload predict-on
#predict-on 
zstyle ':completion:*' menu select
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data 

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

eval $(thefuck --alias)

# plugin settings
zplug "agnoster/agnoster-zsh-theme", use:agnoster.zsh-theme, as:theme
zplug "zsh-users/zsh-autosuggestions"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
