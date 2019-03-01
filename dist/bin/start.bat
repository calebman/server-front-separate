@echo off
:: 设置jar名称
set JAR_NAME=server-0.0.1-SNAPSHOT
:: 常量定义
set BIN_PATH=%~dp0
echo BIN_PATH:[%BIN_PATH%]
cd %BIN_PATH%
cd ..
set CONTEXT_PATH=%cd%
echo CONTEXT_PATH:[%CONTEXT_PATH%]
echo JAR_NAME:[%JAR_NAME%]
:: 需要指定启动的模式是test，还是prod，默认是test，如果不指定的话
set /p ACTION_MODE_INPUT=请输入启动环境，不输入采用默认环境[test]:
if not "%ACTION_MODE_INPUT%" equ "" (set ACTION_MODE=%ACTION_MODE_INPUT%) else (set ACTION_MODE=test)
echo STARTING APPLICATION ACTION_MODE:%ACTION_MODE%
set PROCESS_NAME=JAVA_APP_%JAR_NAME%_%ACTION_MODE%
title %PROCESS_NAME%
echo PROCESS_NAME:[%PROCESS_NAME%]
:: 后台启动应用 并输出控制台日志
java -jar %JAR_NAME%.jar --spring.profiles.active=%ACTION_MODE%