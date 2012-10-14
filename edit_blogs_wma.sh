#!/bin/sh
if [ $# -ne 2 ]
then
   echo "Usage: $0 SpaceID ItemID"
   return 2
fi

mySpaceID=$1;
myItemID=$2;

awk 'BEGIN{
      spaceid="'$mySpaceID'";
      itemid="'$myItemID'"; 
     }
     {blogid=$1;
      mycmd1="sh get_edt_title.sh "spaceid" "blogid;
      mycmd1 | getline mytitle;
      close(mycmd1);
      mycmd2="sh get_edt_fileurl_wma.sh "spaceid" "blogid;
      mycmd2 | getline myurl;
      close(mycmd2);
      mycmd3="sh gen_edt_postfile.sh "spaceid" "itemid" "blogid;
      mycmd4="sh post_edit.sh "blogid" "spaceid;
      print mytitle > "show.txt"; 
      print "<embed src=\"http://"myurl"\" width=\"550\" height=\"400\" type=\"video/x-ms-asf-plugin\" autoplay=\"false\" loop=\"true\"></embed>" >> "show.txt"; 
      close("show.txt");
      system(mycmd3);
      system(mycmd4);
      system("sleep 10");
     }' newblogs.txt
