#!/bin/sh

if [ $# -ne 1 ] 
then 
  echo "Usage: $0 URL"
  return 2
fi

myURL=$1

useragent='User-Agent: IE/6.0 (compatible; MSIE 5.0; Windows 2000; DigExt)'

wget -q -O tmp.htm --keep-session-cookies --load-cookies cookie.txt \
     --header="$useragent" \
     --header="Host: www.worlduc.com" \
      "$myURL"

