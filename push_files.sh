#!/bin/sh
if [ $# -ne 2 ]
then
   echo "Usage: $0 SpaceID ItemID"
   return 2
fi

mySpaceID=$1
myItemID=$2

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
      system("sleep 45");
     }' newfiles.txt
