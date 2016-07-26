#! /bin/bash


BASEDIR=$(dirname $0)
cd $BASEDIR
nohup ./dog.sh > watch-dog.log 2> watch-dog.log < /dev/null &
