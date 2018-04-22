#! /bin/bash

#takes a file and searches for the time
if [ $1 ]; then
	cat $1 | sed -n -e 's/^.*Time: //p'
else
	echo Expected a file to parse...
fi