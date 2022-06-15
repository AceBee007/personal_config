alias tree="pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g'"
alias apt-update="sudo -E apt-get update && sudo -E apt-get upgrade && sudo -E apt-get dist-upgrade && sudo apt-get autoremove"

# colored ls command
alias ls='ls -ahFG --color=auto'

# for monitoring GPU status
alias nvidiawatch='watch -n0.5 "nvidia-smi"'

# Docker aliases
# remove all the exited image
alias dockerrmall="docker rm $(docker ps -a --filter 'status=exited' -q)"
# remove all the image with none tag
alias dockerrmiall="docker rmi `docker image ls | grep none | awk '{print $3}'`"


# ls after cd
function cd {
    builtin cd "$@" && ls -aFG
}


