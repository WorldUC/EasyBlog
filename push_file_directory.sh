#!/bin/sh

uploaddir="/home/jxd/samba/upload"

paras_num=$#

if [ $paras_num -ne 2 -a $paras_num -ne 3 ]
then
   echo "Usage: $0 SpaceID ItemID [type(normal | small | wma)]"
   return 2
fi


mySpaceID=$1
myItemID=$2
myType=${3:-"normal"}

if [ $myType != "normal" -a  $myType != "small" -a $myType != "wma" ]
then
   echo "Please select collected type"
   echo "Usage: $0 SpaceID ItemID [type(normal | small | wma)]"
   return 2
fi
   
mycurdir=$(pwd)
cd "$uploaddir"
ls | sed -n 'h;g;s, ,_,g;x;G;s,\n," ,;s,^,mv ",;p;' | sh
cd "$mycurdir"
ls "$uploaddir" | sed "h;s,\....$,,;G;s,\n,    $uploaddir/,;" > newfiles.txt

sh push_files.sh $mySpaceID $myItemID $myType
