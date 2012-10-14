#!/bin/sh
if [ $# -ne 1 ] 
then 
  echo "Usage: $0 URL"
  return 2
fi

sh get_one_page.sh $1

sed -n '/附件【/{s/^.*href=.//; s/\.wma.>.*$/.wma/; s,\\,/,g; s,^,http://www.worlduc.com,; h; s,^.*/,,; s/.wma$//; G; s/\n/    /; p;}' tmp.htm
