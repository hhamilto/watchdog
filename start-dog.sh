#! /bin/bash


BASEDIR=$(dirname $0)
cd $BASEDIR
nohup ./dog.sh > watch-dop.log 2> watch-dop.log < /dev/null &
