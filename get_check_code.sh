#!/bin/sh

if [ $# -ne 1 ] 
then 
  echo "Usage: $0 SpaceID"
  return 2
fi

mySpaceID=$1


useragent='User-Agent: IE/6.0 (compatible; MSIE 5.0; Windows 2000; DigExt)'

wget -O tmp_check_code.gif --keep-session-cookies --load-cookies cookie.txt --save-cookies cookie.txt\
     --header="$useragent" \
     --header="Host: www.worlduc.com" \
     --header="Referer: http://www.worlduc.com/UManage/blog/postblog.aspx?sid=$mySpaceID" \
     --header="Cache-Control: no-cache" \
     --header="Accept-Encoding: gzip, deflate" \
     "www.worlduc.com/plugin/check_code.aspx"

#sed -n '/CheckCode/{s/^.*	//; p;q;}' cookie.txt
feh -Z tmp_check_code.gif 2> /dev/null &

echo -n Code: >&2
read mycode
echo $mycode
