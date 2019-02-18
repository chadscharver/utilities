#  _               _              
# | |__   __ _ ___| |__  _ __ ___ 
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__ 
# |_.__/ \__,_|___/_| |_|_|  \___|
                        

### DEFAULT EDITOR ###
export EDITOR=vim
export PULSE_LATENCY_MSEC=60

### ALIASES ###
alias ls='ls -hF --color=tty'
alias l='ls -CF'
alias ll='ls -l'
alias la='ls -la'
alias cls='clear'
alias less='less -r'
alias whence='type -a'
alias grep='grep --color'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias python='winpty python'
alias psql='winpty psql.exe'
alias weather='curl -s https://wttr.in'

### PROMPT 1 ###
#[ ! "$UID" = "0" ] && archbluey -c white
#[  "$UID" = "0" ] && archbluey -c blue
#PS1="\[\e[01;31m\]┌─[\[\e[01;35m\u\e[01;31m\]]──[\[\e[00;37m\]${HOSTNAME%%.*}\[\e[01;32m\]]:\w$\[\e[01;31m\]\n\[\e[01;31m\]└──\[\e[01;36m\]>>\[\e[0m\]"

### PROMPT 2 ###
#parse_git_branch() {
#	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
#}
#export PS1="\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[36m\]`__git_ps1`\[\e[m\]\n$ "

### PROMPT MINGW64 ###
#export PS1="\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[32m\]\u@\h \[\033[35m\]$MSYSTEM \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$ "

