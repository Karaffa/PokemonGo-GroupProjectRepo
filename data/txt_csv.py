import csv
import sys
#Manually type out name of txt file you are converting
txt_file = r"userparseddump.txt"

#Manually type out name of csv file for conversion
csv_file = r"userparseddump.csv"

# use 'with' if the program isn't going to immediately terminate
# so you don't leave files open
# the 'b' is necessary on Windows
# it prevents \x1a, Ctrl-z, from ending the stream prematurely
# and also stops Python converting to / from different line terminators
# On other platforms, it has no effect
in_txt = csv.reader(open(txt_file, "rb"), delimiter = '\t')
out_csv = csv.writer(open(csv_file, 'wb'))

out_csv.writerows(in_txt)
