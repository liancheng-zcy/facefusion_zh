@echo off
REM 设置内置ffmpeg路径
set PATH=%~dp0bin;%PATH%

REM 激活conda环境，保留系统PATH
call conda activate %~dp0env || (
    echo 无法激活虚拟环境，请检查env文件夹
    pause
    exit /b 1
)

REM 启动facefusion，支持传入参数
if "%1"=="" (
    python facefusion.py run --open-browser
) else (
    python facefusion.py %* --open-browser
)

pause
