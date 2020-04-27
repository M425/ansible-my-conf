# ALIASES
alias ls='ls --color'
alias ll='ls -AlhF --time-style="+%d/%m/%y" --group-directories-first'
alias la='ls -A'
alias l='ls -CF'
alias l="ls -lhF --time-style='+%d/%m/%y' --group-directories-first"
lso() { ls -alG "$@" | awk '{k=0; for(i=0;i<=8;i++) k+=((substr($1,i+2,1)~/[rwx]/)*2^(8-i)); if(k) printf(" %0o ",k);print}'; }

alias foldersize="du -sh *"

alias v="vim"
alias g="git"
alias va="source ./venv/bin/activate"

alias gl="g l"
alias ggl="g l"

alias tar-ext="tar zxvf"

alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'

alias cpuuse='cut -d " " -f 1-3 /proc/loadavg'
alias reloadBash='source ~/.bashrc'

alias mtmux='tmux attach-session -t base || tmux new -s base'

alias ..="cd .."
alias cd..="cd .."

alias mount="mount | column -t"
alias ports="netstat -tulanp"

alias tf="tail -f"

alias buildwatch="watch -n 10 \"gcloud builds list --limit 10\""
