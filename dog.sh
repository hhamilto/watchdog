#! /bin/bash

. conf.env

if [ -z "$WATCHED_PROCESS_NAME" ] ; then
	echo 'WATCHED_PROCESS_NAME not defined'
	echo 'define WATCHED_PROCESS_NAME in conf.env'
	exit 1
fi

echo '$WATCHED_PROCESS_NAME:' $WATCHED_PROCESS_NAME
echo '$RESTART_COMMAND:' $RESTART_COMMAND

while true ; do
	if [ `ps -eo cmd | grep '^'"$WATCHED_PROCESS_NAME" | wc -l` -lt 1 ] ; then
		echo [ `date` ] 'Restarting Process'
		echo [ `date` ] 'Number of processes currently alive: ' `ps -eo cmd:12 | grep '^'"$WATCHED_PROCESS_NAME" | wc -l`
		nohup "$RESTART_COMMAND" &> /dev/null &
	fi
	if [ `ps -eo cmd | grep '^'"$WATCHED_PROCESS_NAME" | wc -l` -gt 1 ] ; then
		echo [ `date` ] 'More than ONE process running'
	fi
	sleep 1
done
