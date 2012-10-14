#!/bin/sh

if [ $# -ne 2 ] 
then 
  echo "Usage: $0 SpaceID BlogID"
  return 2
fi

mySpaceID=$1
myBlogID=$2

useragent='User-Agent: IE/6.0 (compatible; MSIE 5.0; Windows 2000; DigExt)'

wget -q -O tmp0.txt --keep-session-cookies --load-cookies cookie.txt --save-cookies cookie.txt\
     --header="$useragent" \
     --header="Host: www.worlduc.com" \
     --header="Referer: http://www.worlduc.com/UManage/blog/blogspace.aspx?sid=$mySpaceID" \
      "www.worlduc.com/blog.aspx?bid=$myBlogID"

sed -n '/embed/{s,^.*src=.,,; s,\.swf.*$,.swf,; p;q;}' tmp0.txt
