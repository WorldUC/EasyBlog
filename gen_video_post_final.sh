#!/bin/sh
if [ $# -ne 1 ]
then
    echo "Usage: $0 attachment_file"
    return 2
fi
filename=$1
mycontent=$(basename "$filename" | sed 's,\.flv,,')


hiddenfilename=$(sed -n '/post_params: { "fname"/{s,^.*7484,7484,;s,".*$,,;p;q;};' tmp.htm)

viewstat=$(sed -n '/__VIEWSTATE/{s,^.*value=",,; s,".*$,,; p;q;}' tmp.htm | myconv | sed 's/%0A$//;')

eventvalue=$(sed -n '/__EVENTVALIDATION/{s,^.*value=",,; s,".*$,,; p;q;}' tmp.htm | myconv | sed 's/%0A$//;')


cat - << EOF_OF_FILE > postfile.txt
__VIEWSTATE=$viewstat&__EVENTVALIDATION=$eventvalue&ctl00%24ContentPlaceHolderMain%24txtStyleStr=&ctl00%24ContentPlaceHolderMain%24hdfVideoStyle=0&ctl00%24ContentPlaceHolderMain%24RightTypeHidden=1&ctl00%24ContentPlaceHolderMain%24FileNameHidden=$hiddenfilename&ctl00%24ContentPlaceHolderMain%24TitleTxt=$mycontent&ctl00%24ContentPlaceHolderMain%24FCKeditor1=$mycontent&ctl00%24ContentPlaceHolderMain%24TagTxt=$mycontent&ctl00%24ContentPlaceHolderMain%24CustomItemDownList=0&ctl00%24ContentPlaceHolderMain%24TitleMenuDownList=83&ctl00%24ContentPlaceHolderMain%24ckbIsAllowComment=on&ctl00%24ContentPlaceHolderMain%24selCommentPriv=0&ctl00%24ContentPlaceHolderMain%24SaveBtn=%E5%8F%91%E5%B8%83&ctl00%24ContentPlaceHolderMain%24hfUserGroupID= 
EOF_OF_FILE

