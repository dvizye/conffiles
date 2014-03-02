alias matlab='/usr/local/MATLAB/R2012a/bin/matlab'
alias rebash='source ~/.bashrc'

alias apache_start='sudo /usr/sbin/apache2ctl start'
alias apache_stop='sudo /usr/sbin/apache2ctl stop'
alias apache_restart='sudo /usr/sbin/apache2ctl restart'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
#
## show battery state
alias showbatt='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias restart_nm='sudo service network-manager restart'

alias cl=changeDirectory
function changeDirectory {
    cd $1 ; ls
}
alias git-ls='git ls-tree --full-tree -r HEAD'

alias ..='cl ..'

source ~/.ros_aliases.sh

# xclip
alias xclip='xclip -selection c'


alias celar=clear

alias download_pdfs='wget -r -l 1 -nd -nH -A pdf '

alias gopath='export GOPATH=$HOME/Projects/6.824/'

# helper functions
upto ()
{
    if [ -z "$1" ]; then
        return
    fi
    local upto=$1
    cd "${PWD/\/$upto\/*//$upto}"
}

_upto()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    local d=${PWD//\//\ }
    COMPREPLY=( $( compgen -W "$d" -- "$cur" ) )
}
complete -F _upto upto

jd(){
    if [ -z "$1" ]; then
        echo "Usage: jd [directory]";
        return 1
    else
        cd **"/$1"
    fi
}

submitq(){
    if [ -z "$1" ]; then
        echo "Usage: submitq [file]";
        return 1
    else
        curl -F file=@$1 -F key=UXSUK8634016L3H38RGCMZCU3RG7UUZ1 \
            https://ydmao.scripts.mit.edu:444/6.824/handin.py/upload
    fi
}

attach-session(){
    tmux attach-session -t $1;
}
