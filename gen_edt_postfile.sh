#!/bin/sh

if [ $# -ne 3 ] 
then 
  echo "Usage: $0 SpaceID ItemID BlogID"
  return 2
fi

mySpaceID=$1
myItemID=$2
myBlogID=$3

myTitle=$(sed '1q' show.txt)
myContents=$(sed -n '2,$p' show.txt)

#mySpaceID=753980
#myItemID=76966

useragent='User-Agent: IE/6.0 (compatible; MSIE 5.0; Windows 2000; DigExt)'

#wget -O tmp-post.htm --keep-session-cookies --load-cookies cookie.txt --save-cookies cookie.txt\
#     --header="$useragent" \
#     --header="Host: www.worlduc.com" \
#     --header="Referer: http://www.worlduc.com/UManage/blog/editblog.aspx?id=$myBlogID" \
#      "www.worlduc.com/UManage/blog/editblog.aspx?id=$myBlogID"

viewstat=$(sed -n '/__VIEWSTATE/{s/^.*value="//; s/".*$//; p;}' tmp-post.htm)
eventvalidation=$(sed -n '/__EVENTVALIDATION/{s/^.*value="//; s/".*$//; p;}' tmp-post.htm)


# generate postfile
cat - << EOF_of_the_file > postfile1.txt
-----------------------------7db1d44ee0366
Content-Disposition: form-data; name="__EVENTTARGET"


-----------------------------7db1d44ee0366
Content-Disposition: form-data; name="__EVENTARGUMENT"


-----------------------------7db1d44ee0366
Content-Disposition: form-data; name="__VIEWSTATE"

$viewstat
-----------------------------7db1d44ee0366
Content-Disposition: form-data; name="__EVENTVALIDATION"

$eventvalidation
-----------------------------7db1d44ee0366
Content-Disposition: form-data; name="ctl00\$search1\$ddlsearch"

2
-----------------------------7db1d44ee0366
Content-Disposition: form-data; name="ctl00\$search1\$txtKeyWord"


-----------------------------7db1d44ee0366
Content-Disposition: form-data; name="ctl00\$menu_manage1\$hid"


-----------------------------7db1d44ee0366
Content-Disposition: form-data; name="ctl00\$menu_manage1\$hidid"


-----------------------------7db1d44ee0366
Content-Disposition: form-data; name="ctl00\$ContentPlaceHolderMain\$UserIDHidden"

7484
-----------------------------7db1d44ee0366
Content-Disposition: form-data; name="ctl00\$ContentPlaceHolderMain\$SpaceIDHidden"

$mySpaceID
-----------------------------7db1d44ee0366
Content-Disposition: form-data; name="ctl00\$ContentPlaceHolderMain\$BlogIDHidden"

$myBlogID
-----------------------------7db1d44ee0366
Content-Disposition: form-data; name="ctl00\$ContentPlaceHolderMain\$txtStyleStr"


-----------------------------7db1d44ee0366
Content-Disposition: form-data; name="ctl00\$ContentPlaceHolderMain\$hdfBlogStyle"

0
-----------------------------7db1d44ee0366
Content-Disposition: form-data; name="ctl00\$ContentPlaceHolderMain\$TitleTxt"

$myTitle
-----------------------------7db1d44ee0366
Content-Disposition: form-data; name="ctl00\$ContentPlaceHolderMain\$TagTxt"

$myTitle
-----------------------------7db1d44ee0366
Content-Disposition: form-data; name="ctl00\$ContentPlaceHolderMain\$CustomItemDownList"

$myItemID
-----------------------------7db1d44ee0366
Content-Disposition: form-data; name="ctl00\$ContentPlaceHolderMain\$TitleMenuDownList"

83
-----------------------------7db1d44ee0366
Content-Disposition: form-data; name="ctl00\$ContentPlaceHolderMain\$ContenEditor"

$myContents
-----------------------------7db1d44ee0366
Content-Disposition: form-data; name="ctl00\$ContentPlaceHolderMain\$File1"; filename=""
Content-Type: application/octet-stream


-----------------------------7db1d44ee0366
Content-Disposition: form-data; name="ctl00\$ContentPlaceHolderMain\$SaveBtn"

保存
-----------------------------7db1d44ee0366
Content-Disposition: form-data; name="ctl00\$ContentPlaceHolderMain\$hidId"

$myBlogID
-----------------------------7db1d44ee0366--

EOF_of_the_file

awk '{printf("%s\r\n",$0)}' postfile1.txt > postfile.txt


