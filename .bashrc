
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

shopt -s autocd cdspell
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vi=vim

GIT_PS1_SHOWDIRTYSTATE=1
PS1='[\[\e[32m\]\u@\h\[\e[0m\]:\w \[\e[33m\]$(__git_ps1 "(%s)")\[\e[0m\]]\$ '
