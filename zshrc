#!/bin/zsh
# SCRIPTPATH="$HOME/git/MyDotFiles"
# source $SCRIPTPATH/zsh/powerthemes/reza                                       
# source $SCRIPTPATH/zsh/bundle/powerlevel9k/powerlevel9k.zsh-theme 
# return

# Parts taken from:
#    https://github.com/cornerman/dotfiles/blob/master/zshrc

# Path to your oh-my-zsh installation.
export APPS=""
export APP_SEP=" "
export CDPATH=$HOME
export ZSH=$HOME/.oh-my-zsh
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export KEYTIMEOUT=1
export VISUAL=vim
# Uncomment the following line to enable vi mode
export EDITOR='vim'
export SSH_KEY_PATH="~/.ssh/dsa_id"
export HISTCONTROL=ignoreboth:erasedups
#export XDG_RUNTIME_DIR=/run/user/0
export STOW_DIR="$HOME/local/stow"
export MANPATH=/usr/share/man
export LSCOLORS=ExFxCxDxBxegedabagacad
export CLICOLOR=true

# setopt BANG_HIST               # Treat the '!' character specially during expansion.
unsetopt BANG_HIST               # Prevent "!" characters from being special on the command line
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Do not record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
setopt HIST_NO_FUNCTIONS         # Remove functions
setopt INC_APPEND_HISTORY        # Append incrementally instead of waiting until the shell exits
setopt HIST_REDUCE_BLANKS
setopt complete_aliases          # Do not expand aliases _before_ completion has finished
setopt AUTO_LIST                 # Automatically list choices on an ambiguous completion
#setopt MENU_COMPLETE             # In case of ambiguous completion, insert the first one immediately 
setopt AUTO_CD
setopt cdablevarS
setopt extended_glob
setopt globdots
setopt CSH_NULL_GLOB
setopt complete_in_word
setopt transient_rprompt
setopt nolistbeep

# todo: use .oh-my-zsh/lib/spectrum.zsh instead
export cZ=$(echo -en '\033[0m')				# RESET
export cR=$(echo -en '\033[00;31m')			# red
export cG=$(echo -en '\033[00;32m')			# green
export cY=$(echo -en '\033[00;33m')			# yellow
export cB=$(echo -en '\033[00;34m')			# blue
export cM=$(echo -en '\033[00;35m')			# magenta (purple)
export cP=$(echo -en '\033[00;35m')			# purple (magenta)
export cC=$(echo -en '\033[00;36m')			# cyan
export cW=$(echo -en '\033[00;37m')			# white
export bR=$(echo -en '\033[01;31m')			# bold red
export bG=$(echo -en '\033[01;32m')			# bold green
export bY=$(echo -en '\033[01;33m')			# bold yellow
export bB=$(echo -en '\033[01;34m')			# bold blue
export bM=$(echo -en '\033[01;35m')			# bold magenta
export bP=$(echo -en '\033[01;35m')			# bold purple
export bC=$(echo -en '\033[01;36m')			# bold cyan
export bW=$(echo -en '\033[01;37m')			# bold white

msgRGB=${cR}R${cG}G${cY}Y${cB}B${cP}P${cC}C${cW}W${cZ}Z${bR}R${bG}G${bY}Y${bB}B${bP}P${bC}C${bW}W${cZ}
export OTERM=$TERM
export CLICOLOR=true
export GREP_OPTIONS="--color=always"
export LESS='-r'
export LESSOPEN='|~/.lessfilter %s'
export PYG_STYLE=terminal				# or you can set to terminal256 if it works
export HISTSIZE=999999999
export SAVEHIST=$HISTSIZE
export HISTFILE=~/.history

ENABLE_CORRECTION="false"

# User configuration
export COMPLETION_WAITING_DOTS="true"
export DISABLE_UNTRACKED_FILES_DIRTY="true"
export DEFAULT_USER=`whoami`
user=`whoami`
use_color=true
export HIST_STAMPS="yyyy-mm-dd" # also: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"

# Find the path to this git repo
export SCRIPT=$(readlink ~/.zshrc -f)
export SCRIPTPATH=$(dirname "$SCRIPT")

source $SCRIPTPATH/zsh/sources.sh

#Other colors: man zshall search for fg=colour
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=242"

#Fix for "Chrome failing to launch GPU process"
export BROWSER=google-chrome

export NVM_DIR="$HOME/.nvm"
stackMsg $APPS
unset APPS APP_SEP
echoMsgs
