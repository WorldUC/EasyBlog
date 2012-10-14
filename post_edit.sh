#!/bin/sh

if [ $# -ne 2 ] 
then 
  echo "Usage: $0 BlogID SpaceID"
  return 2
fi

myBlogID=$1
mySpaceID=$2

useragent='User-Agent: IE/6.0 (compatible; MSIE 5.0; Windows 2000; DigExt)'

wget -O tmp-post.htm --keep-session-cookies --load-cookies cookie.txt --save-cookies cookie.txt\
     --header="$useragent" \
     --header="Host: www.worlduc.com" \
     --header="Referer: http://www.worlduc.com/UManage/blog/editblog.aspx?id=$myBlogID&sid=$mySpaceID" \
     --header="Content-Type: multipart/form-data; boundary=---------------------------7db1d44ee0366" \
     --header="Cache-Control: no-cache" \
     --header="Accept-Encoding: gzip, deflate" \
     --server-response \
     --post-file=postfile.txt \
     "www.worlduc.com/UManage/blog/editblog.aspx?id=$myBlogID&sid=$mySpaceID"



