while true
do
    # Get dead process information
    deadProcess="$(ps -ax | grep "python" | grep "D" | grep -v "grep")"
    # Get PID of the dead process
    for str in $deadProcess; do
        deadPID=$str
        break
    done
    # If $deadPID is not NULL (there is a number in deadPID)
    if [ -n "$deadPID" ] ; then
        # The ssr-server is dead, reboot
        eval "sudo reboot -f"
    else
        # Do nothing
        :
    fi
    sleep 20
done
