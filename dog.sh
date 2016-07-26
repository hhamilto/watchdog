#! /bin/bash

. conf.env

if [ -z "$WATCHED_PROCESS_NAME" ] ; then
	echo 'WATCHED_PROCESS_NAME not defined'
	echo 'define WATCHED_PROCESS_NAME in conf.env'
	exit 1
fi

while true ; do
	if [  `ps -eo cmd | grep "$WATCHED_PROCESS_NAME" | wc -l` -ne 2 ] ; then
		echo [ `date` ] 'Restarting Process'
		echo `ps -eo cmd:12 | grep "$WATCHED_PROCESS_NAME" | wc -l`
		nohup "RESTART_COMMAND" &
	fi
	sleep 1
done
