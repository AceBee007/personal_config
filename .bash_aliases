alias tree="pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g'"
alias apt-update="sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo apt-get autoremove"

# colored ls command
alias ls='ls -aFG'

# Docker aliases
# remove all the exited image
alias dockerrmall='docker rm $(docker ps -a --filter 'status=exited' -q)'


# ls after cd
function cd {
    builtin cd "$@" && ls -aFG
}
