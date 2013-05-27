#!/bin/sh

if [ $# -ne 1 ]
then
    echo "Usage: $0 attachment_file"
    return 2
fi

filename=$1


if [ $? -ne 0 ]
then
   return 2
fi

useragent='User-Agent: IE/6.0 (compatible; MSIE 5.0; Windows 2000; DigExt)'

wget -O tmp.htm --keep-session-cookies --load-cookies cookie.txt --save-cookies cookie.txt\
     --header="$useragent" \
     --header="Host: www.worlduc.com" \
     --header="refer: www.worlduc.com/SpaceManage/Video/Custom_PostVideo.aspx?sid=5243630" \
     'www.worlduc.com/SpaceManage/Video/Custom_PostVideo.aspx?sid=5243630'


sh gen_video_post.sh $filename


wget -O tmp-post.htm --keep-session-cookies --load-cookies cookie.txt --save-cookies cookie.txt\
     --header="$useragent" \
     --header="Content-Type: multipart/form-data; boundary=----------ae0KM7cH2gL6Ef1GI3KM7KM7Ij5ae0" \
     --header="User-Agent: Shockwave Flash" \
     --header="Cache-Control: no-cache" \
     --server-response \
     --post-file=postfile.txt \
     'www.worlduc.com/SpaceManage/Video/upload.aspx'

sh  gen_video_post_final.sh  $filename

wget -O tmp.htm --keep-session-cookies --load-cookies cookie.txt --save-cookies cookie.txt\
     --header="$useragent" \
     --header="Host: www.worlduc.com" \
     --header="Refer: www.worlduc.com/SpaceManage/Video/Custom_PostVideo.aspx?sid=5243630" \
     --post-file=postfile.txt \
     'www.worlduc.com/SpaceManage/Video/Custom_PostVideo.aspx?sid=5243630'


