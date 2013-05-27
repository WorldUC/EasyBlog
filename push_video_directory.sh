#!/bin/sh

ls ~/samba/upload/*.flv 
ls ~/samba/upload/*.flv | sed "s,^,sh push_video.sh ',; s,$,',;" | sh

