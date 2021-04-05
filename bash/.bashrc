#############
# ~/.bashrc #
#############

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

source ~/.bash_alias
source ~/.bash_colors

is_in_git_repo() {
	git rev-parse --is-inside-work-tree
}

parse_git_dirty_state() {
	if [[ -n $(git status -s | grep -e "^A" -e "^M" -e "^D") ]]; then
		echo -n "+"
	fi

	if [[ -n $(git status -s | grep -e "^\s*A" -e "^\s*M" -e "^\s*D") ]]; then
		echo -n "*"
	fi

	if [[ -n $(git status -s | grep "^\s*??") ]]; then
		echo -n "?"
	fi
}

parse_git_branch() {
	if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) ]]; then
		echo -n " ($(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')$(parse_git_dirty_state))"
	fi
}

print_return_code() {
	if [[ "$1" == "0" ]]; then
		echo -n "\\[${COL_BG_GREEN}${COL_FG_BLACK}\\]"
	else
		echo -n "\\[${COL_BG_RED}${COL_FG_BLACK}\\]"
	fi
}

print_user_symbol() {
	if [[ "$(whoami)" == "root" ]]; then
		echo -n "#"
	else
		echo -n "$"
	fi
}

export PS1="[\\[${TERM_RESET}${TERM_BOLD}\\]\u@\h \\[${COL_FG_GREEN}\\]\w\\[${COL_FG_MAGENTA}\\]\$(parse_git_branch)\\[${TERM_RESET}${TERM_BOLD}\\]] \\[${COL_FG_GREEN}${TERM_BOLD}\\]\$(print_user_symbol) \\[${TERM_RESET}\\]"
