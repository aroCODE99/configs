
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.git-prompt.sh

fs() {
    local target
    target=$(find . -path "*/node_modules/*" -prune -o -print | fzf) || return

    if [ -d "$target" ]; then
        cd "$target" || echo "Failed to cd into $target"
	elif [ -f "$target" ]; then
		vim "$target"
	else
		echo "Time wast mt kr"
    fi
}

HISTSIZE=20000
HISTFILESIZE=20000
shopt -s autocd cdspell
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vi=vim
alias s=ls
alias shush='shutdown -h now'

GIT_PS1_SHOWDIRTYSTATE=1
PS1='[\[\e[38;5;214m\]\u\[\e[0m\]@\[\e[38;5;109m\]\h\[\e[0m\]: \
\[\e[38;5;142m\]\w\[\e[0m\] \
\[\e[38;5;167m\]$(__git_ps1 "(%s)")\[\e[0m\]]\$ '
