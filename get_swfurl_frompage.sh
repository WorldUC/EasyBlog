#!/bin/sh
if [ $# -ne 1 ] 
then 
  echo "Usage: $0 URL"
  return 2
fi

sh get_one_page.sh $1

sed -n '/附件【/{s/^.*href=.//; s/\.swf.>.*$/.swf/; s,\\,/,g; s,^,http://www.worlduc.com,; h; s,^.*/,,; s/.swf$//; G; s/\n/    /; p;}' tmp.htm
