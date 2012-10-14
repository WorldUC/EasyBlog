#!/bin/sh

if [ $# -ne 2 ] 
then 
  echo "Usage: $0 SpaceID BlogID"
  return 2
fi

mySpaceID=$1
myBlogID=$2

sh get_edt_postage.sh $mySpaceID $myBlogID

sed -n '/<input name="ctl00$ContentPlaceHolderMain$TitleTxt"/{s/^.*value=.//; s/".*$//; p;}' tmp-post.htm 
