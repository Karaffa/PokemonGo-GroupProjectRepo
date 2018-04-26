#! /bin/bash

#takes a file and searches for the time
if [ $1 == "-t" ]; then
	if [ $2 != "-p" ]; then
		#This parses the dump so that we only have the time
		cat $2 | sed -n -e 's/^.*Time: //p'
	else
		#this parses and sorts the twitterdump into a sorted list of occurance with #of occurances on the left
		#However this one deals strictly with time
		cat $3 | sed -n -e 's/^.*Time: //p' | awk '{print substr($0,2,2)}' | sort | uniq -c | sort -bnr
	fi

elif [ $1 == "-u" ]; then
	#this parses out usernames
	cat $2 | sed 's/^.*\(Tweet:.*Time:\).*$/\1/'

else
	#this parses and sorts the twitterdump into a sorted list of occurance with #of occurances on the left
	cat $1 | tr '[:space:]' '[\n*]' | grep -v "^\s*$" | sort | uniq -c | sort -bnr > wordoccur.txt
fi

#this was used to parse hours out of the time was done in the terminal though
#cat times.txt | awk '{print substr($0,2,2)}'