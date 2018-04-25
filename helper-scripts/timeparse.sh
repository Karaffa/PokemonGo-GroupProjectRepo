#! /bin/bash

#takes a file and searches for the time
if [ $1 == "-t" ]; then
	if [ $2 != "-p" ]; then
		cat $2 | sed -n -e 's/^.*Time: //p'
	else
		cat $3 | sed -n -e 's/^.*Time: //p' | awk '{print substr($0,2,2)}' | sort | uniq -c | sort -bnr
	fi
	
else
	cat $1 | tr '[:space:]' '[\n*]' | grep -v "^\s*$" | sort | uniq -c | sort -bnr > wordoccur.txt
fi

#cat times.txt | awk '{print substr($0,2,2)}'