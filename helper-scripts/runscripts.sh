#! /bin/bash

echo Running processes!

(python hashtagpull.py >> timedtwitterdump.txt) & ./streamfile.sh && fg

echo output should appear below!

wait
