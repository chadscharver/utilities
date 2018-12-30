# Add vim as default editor
export EDITOR=vim
export PULSE_LATENCY_MSEC=60

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'

[ ! "$UID" = "0" ] && archbluey -c white
[  "$UID" = "0" ] && archbluey -c blue
#PS1="\[\e[01;31m\]┌─[\[\e[01;35m\u\e[01;31m\]]──[\[\e[00;37m\]${HOSTNAME%%.*}\[\e[01;32m\]]:\w$\[\e[01;31m\]\n\[\e[01;31m\]└──\[\e[01;36m\]>>\[\e[0m\]"

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\n\[\e[32m\]\u@\h \[\e[33m\]\w \[\e[36m\]\$(parse_git_branch)\[\e[m\]\n$ "


