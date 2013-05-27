#!/bin/sh

if [ $# -ne 1 ]
then
    echo "Usage: $0 attachment_file"
    return 2
fi

basefilename=$1
filename=$(basename $basefilename)

hiddenfilename=$(sed -n '/post_params: { "fname"/{s,^.*7484,7484,;s,".*$,,;p;q;};' tmp.htm)

if [ ! -f "$basefilename" ]
then 
   echo "file ($basefilename) not found!"
   return 2
fi

cat - << EOF_of_the_file > postfile1.txt

------------ae0KM7cH2gL6Ef1GI3KM7KM7Ij5ae0
Content-Disposition: form-data; name="$filename"

$filename
------------ae0KM7cH2gL6Ef1GI3KM7KM7Ij5ae0
Content-Disposition: form-data; name="fname"

$hiddenfilename
------------ae0KM7cH2gL6Ef1GI3KM7KM7Ij5ae0
Content-Disposition: form-data; name="Filedata"; filename="$filename"
Content-Type: application/octet-stream

EOF_of_the_file

awk '{printf("%s\r\n",$0)}' postfile1.txt > postfile.txt
cat "$basefilename" >> postfile.txt

cat - << EOF_of_the_file > postfile1.txt

------------ae0KM7cH2gL6Ef1GI3KM7KM7Ij5ae0
Content-Disposition: form-data; name="Upload"

Submit Query
------------ae0KM7cH2gL6Ef1GI3KM7KM7Ij5ae0--

EOF_of_the_file

awk '{printf("%s\r\n",$0)}' postfile1.txt >> postfile.txt
