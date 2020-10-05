#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

source ~/.bash_alias
source ~/.bash_colors

#[[ -e /usr/share/git/completion/git-completion.sh ]] && . /usr/share/git/completion/git-completion.sh
#[[ -e /usr/share/git/completion/git-prompt.sh ]] && . /usr/share/git/completion/git-prompt.sh

# Git bash prompt
source /usr/share/git/completion/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM=1

export PS1='${COL_FG_YELLOW}>>$(tput sgr0) ${COL_FG_MAGENTA}\t \d$(tput sgr0) ${COL_FG_GREEN}[\u@\h]$(tput sgr0) ${COL_FG_BLUE}{\w}$(tput sgr0)$(__git_ps1 " ($(tput bold)${COL_FG_MAGENTA}%s$(tput sgr0))") ${COL_FG_YELLOW}$?$(tput sgr0) ${COL_FG_GREEN}$ $(tput sgr0)\n${COL_FG_CYAN}> \[$(tput sgr0)\]'
