@echo off
:: ����jar����
set JAR_NAME=server-0.0.1-SNAPSHOT
:: ��������
set BIN_PATH=%~dp0
echo BIN_PATH:[%BIN_PATH%]
cd %BIN_PATH%
cd ..
set CONTEXT_PATH=%cd%
echo CONTEXT_PATH:[%CONTEXT_PATH%]
echo JAR_NAME:[%JAR_NAME%]
:: ��Ҫָ��������ģʽ��test������prod��Ĭ����test�������ָ���Ļ�
set /p ACTION_MODE_INPUT=�������������������������Ĭ�ϻ���[test]:
if not "%ACTION_MODE_INPUT%" equ "" (set ACTION_MODE=%ACTION_MODE_INPUT%) else (set ACTION_MODE=test)
echo STARTING APPLICATION ACTION_MODE:%ACTION_MODE%
set PROCESS_NAME=JAVA_APP_%JAR_NAME%_%ACTION_MODE%
title %PROCESS_NAME%
echo PROCESS_NAME:[%PROCESS_NAME%]
:: ��̨����Ӧ�� ���������̨��־
java -jar %JAR_NAME%.jar --spring.profiles.active=%ACTION_MODE%