#!/bin/sh

if [ $# -ne 2 -a $# -ne 3 ] 
then 
  echo "Usage: $0 SpaceID ItemID [attachment_file]"
  return 2
fi

filename=$3

mySpaceID=$1
myItemID=$2

myTitle=$(sed '1q' show.txt)
myContents=$(sed -n '2,$p' show.txt)

#mySpaceID=753980
#myItemID=76966

useragent='User-Agent: IE/6.0 (compatible; MSIE 5.0; Windows 2000; DigExt)'

#wget -O tmp-post.htm --keep-session-cookies --load-cookies cookie.txt --save-cookies cookie.txt\
#     --header="$useragent" \
#     --header="Host: www.worlduc.com" \
#      "www.worlduc.com/UManage/blog/postblog.aspx?sid=$mySpaceID"

viewstat=$(sed -n '/__VIEWSTATE/{s/^.*value="//; s/".*$//; p;}' tmp-post.htm)
eventvalidation=$(sed -n '/__EVENTVALIDATION/{s/^.*value="//; s/".*$//; p;}' tmp-post.htm)
checkcode=$(sh get_check_code.sh $mySpaceID)



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

0
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
Content-Disposition: form-data; name="ctl00\$ContentPlaceHolderMain\$File1"; filename="$(basename "$filename")"
Content-Type: application/octet-stream

EOF_of_the_file

awk '{printf("%s\r\n",$0)}' postfile1.txt > postfile.txt

#attachment
if [ $# -eq 3 -a -f "$filename" ]
then
cat "$filename" >> postfile.txt
fi


cat - << EOF_of_the_file > postfile1.txt

-----------------------------7db1d44ee0366
Content-Disposition: form-data; name="ctl00\$ContentPlaceHolderMain\$txtCheckCode"

$checkcode
-----------------------------7db1d44ee0366
Content-Disposition: form-data; name="ctl00\$ContentPlaceHolderMain\$SaveBtn"

发表
-----------------------------7db1d44ee0366--


EOF_of_the_file

awk '{printf("%s\r\n",$0)}' postfile1.txt >> postfile.txt

