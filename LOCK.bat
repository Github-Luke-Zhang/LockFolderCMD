@ECHO OFF 
CLS 
title 文件夹上锁工具 Folder Lock Tool
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto PASSWORD
if NOT EXIST Locker goto MD-FOLDER

:YON
echo 确认要锁定这个文件夹吗(Y/N)
echo Lock this Folder?
set/p "cho=>"
if %cho%==Y goto LOCK
if %cho%==y goto LOCK
if %cho%==n goto END
if %cho%==N goto END
echo 无效选择
echo No valid selection.
pause
CLS
goto YON

:UNLOCK
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" Locker
echo 文件夹成功解锁！
echo Unlock successful.
goto end

:LOCK
ren Locker "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
echo 文件夹已被锁定
echo Locked successful.
goto End

:PASSWORD
CLS
echo 输入解锁文件夹的密码
echo Password?
set/p "pass=>"
if NOT %pass%==MIMA-PASSWORD goto WUXIAO
goto UNLOCK

:WUXIAO
echo 密码无效
echo Password Wrong.
Pause
goto PWOSQ

:SAFEQ1WUXIAO
echo 回答错误！
echo Answer not right.
Pause
goto SAFEQ1

:PWOSQ
CLS
echo 是否跳转至安全问题？(Y/N)
echo Go to Safe Questions?
set/p "cho=>"
if %cho%==Y goto SAFEQ1
if %cho%==y goto SAFEQ1
if %cho%==n goto PASSWORD
if %cho%==N goto PASSWORD
echo 无效选择
echo No valid selection.
pause
goto PWOSQ

:MD-FOLDER
md Locker
echo 文件夹锁建立成功
echo Folder create successful.
goto End

:SAFEQ1
CLS
echo 安全问题1请在此输入/Safe question 1 is here.
set/p "pass=>"
if NOT %pass%==SAFEQ1ANS goto SAFEQ1WUXIAO
goto SAFEQ2

:SAFEQ2
CLS
echo 安全问题2请在此输入/Safe question 2 is here.
set/p "pass=>"
if NOT %pass%==SAFEQ2ANS goto SAFEQ2WUXIAO
goto UNLOCK

:SAFEQ2WUXIAO
echo 回答错误！
echo Answer not right.
Pause
goto SAFEQ2

:End
Pause
