#!/bin/sh

if [ $# -ne 2 ]
then
   echo "Usage: $0 LoginEmail Password"
   return 2
fi

myUser=$1
myPassword=$2


useragent='User-Agent: IE/6.0 (compatible; MSIE 5.0; Windows 2000; DigExt)'

wget -O tmp.htm --keep-session-cookies --save-cookies cookie.txt\
     --header="$useragent" \
     'www.worlduc.com'


wget -O tmp.htm --keep-session-cookies --load-cookies cookie.txt --save-cookies cookie.txt\
     --header="$useragent" \
     --header="Host: www.worlduc.com" \
     --header="Referer: http://www.worlduc.com/" \
     --server-response \
     --post-data="op=Login&email=$myUser+&pass=$myPassword" \
     "www.worlduc.com/index.aspx"

