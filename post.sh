#!/bin/sh

if [ $# -ne 1 ] 
then 
  echo "Usage: $0 SpaceID"
  return 2
fi

mySpaceID=$1

#mySpaceID=753980
#myItemID=76966

useragent='User-Agent: IE/6.0 (compatible; MSIE 5.0; Windows 2000; DigExt)'

wget -O tmp-post.htm --keep-session-cookies --load-cookies cookie.txt --save-cookies cookie.txt\
     --header="$useragent" \
     --header="Host: www.worlduc.com" \
     --header="Referer: http://www.worlduc.com/UManage/blog/postblog.aspx?sid=$mySpaceID" \
     --header="Content-Type: multipart/form-data; boundary=---------------------------7db1d44ee0366" \
     --header="Cache-Control: no-cache" \
     --header="Accept-Encoding: gzip, deflate" \
     --server-response \
     --post-file=postfile.txt \
     "www.worlduc.com/UManage/blog/postblog.aspx?sid=$mySpaceID"


