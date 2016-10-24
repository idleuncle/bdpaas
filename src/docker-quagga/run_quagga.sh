#!/bin/sh

#trap clean_exit EXIT
#function clean_exit {
    #local pids=$(jobs -p)
    #if [[ "$pids" != "" ]]; then
        #kill $pids || :
    #fi
    #wait $pids
#}

/usr/sbin/zebra &
/usr/sbin/ripd &
/usr/sbin/ospfd &

# Keep the console alive.
while :; do
 echo "------------------------------------------------------"
 echo "Attaching console. To disconnect, press Ctrl-P Ctrl-Q."
 echo "------------------------------------------------------"
 /usr/bin/vtysh || :
 sleep 1
done
