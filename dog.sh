#! /bin/bash

APP_LOG_FILE=app.log

. conf.env

if [ -z "$RESTART_COMMAND" ] ; then
	echo 'RESTART_COMMAND not defined'
	echo 'define RESTART_COMMAND in conf.env'
	exit 1
fi

echo '$RESTART_COMMAND:' $RESTART_COMMAND



nohup "$RESTART_COMMAND" &> $APP_LOG_FILE &
WATCHED_PID=$!

while true ; do
	if [ `ps -eo pid | grep '^ '$WATCHED_PID'$' | wc -l` -lt 1 ] ; then
		echo [ `date` ] 'Restarting Process'
		nohup "$RESTART_COMMAND" &> $APP_LOG_FILE &
		WATCHED_PID=$!
	fi
	sleep 1
done
