@ECHO OFF 
CLS 
title �ļ����������� Folder Lock Tool
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto PASSWORD
if NOT EXIST Locker goto MD-FOLDER

:YON
echo ȷ��Ҫ��������ļ�����(Y/N)
echo Lock this Folder?
set/p "cho=>"
if %cho%==Y goto LOCK
if %cho%==y goto LOCK
if %cho%==n goto END
if %cho%==N goto END
echo ��Чѡ��
echo No valid selection.
pause
goto YON

:UNLOCK
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" Locker
echo �ļ��гɹ�������
echo Unlock successful.
goto end

:LOCK
ren Locker "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
echo �ļ����ѱ�����
echo Locked successful.
goto End

:PASSWORD
echo ��������ļ��е�����
echo Password?
set/p "pass=>"
if NOT %pass%==MIMA-PASSWORD goto WUXIAO
goto UNLOCK

:WUXIAO
echo ������Ч
echo Password Wrong.
goto SAFEQ1

:SAFEQ1WUXIAO
echo �ش����
echo Answer not right.
goto SAFEQ1

:MD-FOLDER
md Locker
echo �ļ����������ɹ�
echo Folder create successful.
goto End

:SAFEQ1
echo ��ȫ����1���ڴ�����/Safe question 1 is here.
set/p "pass=>"
if NOT %pass%==SAFEQ1ANS goto SAFEQ1WUXIAO
goto SAFEQ2

:SAFEQ2
echo ��ȫ����2���ڴ�����/Safe question 2 is here.
set/p "pass=>"
if NOT %pass%==SAFEQ2ANS goto SAFEQ2WUXIAO
goto UNLOCK

:SAFEQ2WUXIAO
echo �ش����
echo Answer not right.
Pause
goto SAFEQ2

:End
Pause