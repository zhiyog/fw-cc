@echo off
echo ===== 新闻管理系统启动脚本 =====
echo.

REM 设置变量
set MYSQL_USER=root
set MYSQL_PASSWORD=
set TOMCAT_PATH=C:\Program Files\Apache Software Foundation\Tomcat 9.0
set PROJECT_NAME=news

echo 请确认以下信息:
echo MySQL用户名: %MYSQL_USER%
echo Tomcat路径: %TOMCAT_PATH%
echo.
echo 如需修改，请编辑此脚本文件中的变量设置
echo.
pause

echo 1. 创建数据库和表...
if "%MYSQL_PASSWORD%"=="" (
    mysql -u %MYSQL_USER% < create_table.sql
) else (
    mysql -u %MYSQL_USER% -p%MYSQL_PASSWORD% < create_table.sql
)

if %ERRORLEVEL% NEQ 0 (
    echo 数据库操作失败！请检查MySQL是否启动以及用户名密码是否正确。
    pause
    exit /b
)

echo 2. 部署项目到Tomcat...
if not exist "%TOMCAT_PATH%\webapps\%PROJECT_NAME%" (
    mkdir "%TOMCAT_PATH%\webapps\%PROJECT_NAME%"
)

xcopy /E /Y web\* "%TOMCAT_PATH%\webapps\%PROJECT_NAME%\"

echo 3. 启动Tomcat服务器...
cd /d "%TOMCAT_PATH%\bin"
call startup.bat

echo 4. 正在打开浏览器...
timeout /t 5
start http://localhost:8080/%PROJECT_NAME%/login.jsp

echo.
echo ===== 部署完成 =====
echo 请使用以下信息登录:
echo 用户名: admin
echo 密码: 123456
echo.
pause
