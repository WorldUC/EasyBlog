#!/bin/sh

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
   

> newblogs.txt


awk 'BEGIN{
      spaceid="'$mySpaceID'";
      itemid="'$myItemID'"; 
      mycmd1="sh get_postage.sh "spaceid;
      mycmd3="sh post.sh "spaceid;
      system(mycmd1); 
     }
     {mycmd2="sh gen_postfile.sh "spaceid" "itemid" \""$2"\"";
      print $1 > "show.txt"; 
      print $1 >> "show.txt"; 
      close("show.txt");
      system(mycmd2);
      system(mycmd3);
      system("sed -n \"/<script>openTipWindow../{s,,,; s/.,.*$//; p; q;}\" tmp-post.htm >> newblogs.txt");
      system("sleep 5");
     }' newfiles.txt

clear
echo "edit blogs..."

if [ $myType = "normal" ]
then
    sh edit_blogs.sh $mySpaceID $myItemID
elif [ $myType = "small" ]
then 
    sh edit_blogs_small.sh $mySpaceID $myItemID
elif [ $myType = "wma" ]
then
    sh edit_blogs_wma.sh $mySpaceID $myItemID
fi
