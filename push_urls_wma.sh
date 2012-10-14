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
      mycmd2="sh gen_postfile.sh "spaceid" "itemid;
      mycmd3="sh post.sh "spaceid;
      system(mycmd1); 
     }
     {print $1 > "show.txt"; 
      print "<embed src=\""$2"\" width=\"550\" height=\"400\" type=\"video/x-ms-asf-plugin\" autoplay=\"false\" loop=\"true\"></embed>" >> "show.txt"; 
      close("show.txt");
      system(mycmd2);
      system(mycmd3);
      system("sleep 60");
     }' newdirs.txt
