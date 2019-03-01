#!/bin/sh
# 设置jar名称
export JAR_NAME=server-0.0.1-SNAPSHOT.jar
# 常量定义
export BIN_PATH=$(cd `dirname $0`;pwd)
echo BIN_PATH:[$BIN_PATH]
cd $BIN_PATH
cd ..
export CONTEXT_PATH=`pwd`
echo CONTEXT_PATH:[$CONTEXT_PATH]
export LOG_PATH=/data/logs/sso
echo LOG_PATH:[$LOG_PATH]
# 需要指定启动的模式是test，还是prod，默认是test，如果不指定的话
ACTION_MODE=$1
if [ "$ACTION_MODE" = "" ]
then
	ACTION_MODE=test
fi
echo STARTING APPLICATION ACTION_MODE:[$ACTION_MODE]
# 判断log文件夹是否存在 不存在则创建
if [ ! -d $LOG_PATH ]; then
  mkdir $LOG_PATH
fi
# 删除历史的server.log文件
rm -f $LOG_PATH/server.log
# 后台启动应用 并输出控制台日志
nohup java -jar $JAR_NAME --spring.profiles.active=$ACTION_MODE >> $LOG_PATH/server.log 2>&1 &
# 显示输出前二十行的日志
head -n 20 $LOG_PATH/server.log
