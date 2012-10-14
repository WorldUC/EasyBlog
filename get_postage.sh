#!/bin/sh

if [ $# -ne 1 ] 
then 
  echo "Usage: $0 SpaceID"
  return 2
fi

mySpaceID=$1

useragent='User-Agent: IE/6.0 (compatible; MSIE 5.0; Windows 2000; DigExt)'

wget -O tmp-post.htm --keep-session-cookies --load-cookies cookie.txt --save-cookies cookie.txt\
     --header="$useragent" \
     --header="Host: www.worlduc.com" \
      "www.worlduc.com/UManage/blog/postblog.aspx?sid=$mySpaceID"

