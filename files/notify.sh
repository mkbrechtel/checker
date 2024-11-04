#!/bin/sh

hostname=$1
check_id=$2
run_file=$3
exit_code=$EXIT_CODE

failed=0
pids=""
for script in /etc/checker/notifiers/*.sh; do
    if [ -x "$script" ]; then
        echo "Notifying with $script"
        cat "$run_file" | "$script" "$hostname" "$check_id" "$exit_code" & pids="$pids $!"
    fi
done
for pid in $pids; do
    wait $pid
    if [ $? -ne 0 ]; then
        echo "A notifier failed with exit code $?"
        failed=8
    fi
done
exit $failed
