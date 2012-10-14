#世界大学城辅助上传脚本
-----------------------
##目的
方便教师在世界大学城网站上批量上传课件、日志; 也可方便转载其他老师日志附件。

##运行环境
Unix、Linux/BSD或其他能运行sh脚本的环境（Windows下的Cygwin环境还未测试）。

依赖Wget和xloadimage。

##用法
login.sh 用于登录

push\_files.sh 用于批量上传附件（swf）文件，需要事先编辑文件newfiles.txt，其中每行由标题及文件路径组成，空格间隔。

edit\_blogs.sh 上述命令生成的网络日志中的附件没有在页面展开，这个命令把附件展示在页面上。事先需要编辑newblogs.txt，其中每行为日志id。

collect\_bids.sh 用于收集上述命令的日志id，事先需要下载含有所有所需日志的网页，另存为total.htm。

push\_urls.sh  用于转载其他老师附件链接到自己日志上。需事先编辑newdirs.txt，其中每行由标题和swf文件超链接组成。链接地址可以通过collect\_bids.sh、get\_edt\_fileurl.sh等脚本结合Shell编程收集。

##缺点
使用还显繁琐，用户界面需进一步改进。
上传附件和展开尚需合并自动进行。

##声明
仅授权给在校教师教学研究使用及继续开发,不得作其他任何用途。

软件采用MIT BSD协议。

