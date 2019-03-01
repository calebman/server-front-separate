@echo off
:: 设置jar名称
set JAR_NAME=server-0.0.1-SNAPSHOT
:: 需要指定终止的模式是test，还是prod，默认是test，如果不指定的话
set /p ACTION_MODE_INPUT=请输入关闭应用的运行环境，不输入采用默认环境[test]:
if not "%ACTION_MODE_INPUT%" equ "" (set ACTION_MODE=%ACTION_MODE_INPUT%) else (set ACTION_MODE=test)
echo STARTING APPLICATION ACTION_MODE:%ACTION_MODE%
echo JAR_NAME:[%JAR_NAME%]
set PROCESS_NAME=JAVA_APP_%JAR_NAME%_%ACTION_MODE%
echo PROCESS_NAME:[%PROCESS_NAME%]
:: 杀死对应进程    
tasklist /nh /fi "WINDOWTITLE eq %PROCESS_NAME%"|find /i "cmd.exe" >nul
if ERRORLEVEL 1 (echo Application already stop) else (taskkill /fi "WINDOWTITLE eq %PROCESS_NAME%" >nul & echo Application stop success)
echo This window will close in 10 seconds
ping 127.1 -n 11 >nul