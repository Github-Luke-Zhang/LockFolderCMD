@echo off 
cls 
:start 
cls 
echo =============================================================================== 
echo LOCK BAT: Only has a Chinese Edition.
echo 加密 批处理文件 只有中文版。
echo Please Translate Chinese into English, if you want to use this tool.
echo ===============================================================================
echo. 
echo 说明: 在下面输入需要加密的批处理文件, 直接输入批处理文件名为加密当前目录下的批处理文件,也可以带路径指定任意批处理文件。当前目录下生成的LOCKED.bat文件即为加密的批处理文件。
echo.
echo ===============================================================================
set /p file=请输入需要加密的批处理后按回车键(q=退出): 
if "%file%"=="q" goto quit 
echo %file%|findstr /i "\.bat$">nul && goto go 
echo %file%|findstr /i "\.cmd$">nul && goto go 
cls 
echo ============== 
echo 请正确输入! 
echo ============== 
echo. 
pause
goto start 
:go 
if not exist "%file%" goto newly 
if exist encrypt.bat copy encrypt.bat encryptbak.bat 
echo %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a >"%tmp%\LOCKED.tmp" 
echo cls>>"%tmp%\LOCKED.tmp" 
type "%file%">>"%tmp%\LOCKED.tmp" 
setlocal enabledelayedexpansion 
for %%i in ("%tmp%\LOCKED.tmp") do ( 
echo %%~zi >nul 2>nul 
set size=%%~zi 
set num=!size:~-1! 
set /a mod=!num!%%2 
if !mod! equ 0 (goto even) else (goto odd) 
) 
:even 
copy "%tmp%\LOCKED.tmp" LOCKED.bat 
del "%tmp%\LOCKED.tmp" 
cls 
echo ========================== 
echo 完成批处理加密! 
echo ========================== 
echo. 
echo. 
pause
goto quit 
:odd 
echo. >>"%tmp%\LOCKED.tmp" 
copy "%tmp%\LOCKED.tmp" LOCKED.bat 
del "%tmp%\LOCKED.tmp" 
cls 
echo ========================== 
echo 恭喜你, 批处理加密成功! 
echo ========================== 
echo. 
echo. 
echo 按任意键退出...... 
pause>nul 
goto quit 
:newly 
cls 
echo ================================ 
echo 找不到批处理文件, 请重新输入! 
echo ================================ 
echo. 
pause
goto start 
:quit 
exit
