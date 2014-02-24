# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="leon"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Change this value to set how frequently ZSH updates¬
export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
echo

# Google
# URL encode something and print it.
function url-encode; {
    setopt extendedglob
    echo "${${(j: :)@}//(#b)(?)/%$[[##16]##${match[1]}]}"
}

# Search google for the given keywords.
function google; {
    $VIEW "http://www.google.com/search?q=`url-encode "${(j: :)@}"`" > /dev/null 2>&1
}

export VIEW="chromium-browser"

# Git Files auto-complete fix (http://stackoverflow.com/questions/9810327/git-tab-autocompletion-is-useless-can-i-turn-it-off-or-optimize-it)
__git_files () { 
    _wanted files expl 'local files' _files     
}

# TERM 
export TERM=rxvt

# some settings
KEYTIMEOUT=1
autoload -U compinit
compinit

# Now we can pipe to multiple outputs!
setopt MULTIOS

# ssh completion
zstyle -e ':completion::*:*:*:hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

### Env vars
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/leon/bin:/usr/local/bin:/home/leon/bin:/home/leon/bin_local:/usr/local/bin:/home/leon/bin:/usr/local/bin:.
export PYTHONPATH=~/.python

### Set Vim as editor
# export EDITOR="vim"              
export EDITOR="emacscli.sh"              



### Aliases
. $HOME/.aliases
. $HOME/.ssh_alias
. $HOME/.ssh_alias_uol
. $HOME/.ssh_alias_spiral

### SSH Agent
. $HOME/0

# NoCaps
/usr/bin/setxkbmap -option "ctrl:nocaps"

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.history
setopt EXTENDED_HISTORY
setopt APPEND_HISTORY

setopt interactivecomments
setopt auto_cd
unsetopt share_history
unsetopt incappendhistory

# Host specific settings
if [ -f $HOME/.host_specific.sh ]; then
    source $HOME/.host_specific.sh
fi

# Starts tmux automaticaly
# If not running interactively, and not in terminator, do not do anything 
if [ -z $TERMINATOR_UUID ]; then
    [[ $- != *i* ]] && return
    [[ -z "$TMUX" ]] && exec tmux
fi

# Timezone
alias jerusalem='TZ='Asia/Jerusalem' date'
