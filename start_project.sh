#!/bin/bash

echo "===== 新闻管理系统启动脚本 ====="
echo

# 设置变量
MYSQL_USER="root"
MYSQL_PASSWORD=""
TOMCAT_PATH="/opt/tomcat" # 默认路径，可能需要修改
PROJECT_NAME="news"

echo "请确认以下信息:"
echo "MySQL用户名: $MYSQL_USER"
echo "Tomcat路径: $TOMCAT_PATH"
echo
echo "如需修改，请编辑此脚本文件中的变量设置"
echo
read -p "按回车键继续..."

echo "1. 创建数据库和表..."
if [ -z "$MYSQL_PASSWORD" ]; then
    mysql -u $MYSQL_USER < create_table.sql
else
    mysql -u $MYSQL_USER -p$MYSQL_PASSWORD < create_table.sql
fi

if [ $? -ne 0 ]; then
    echo "数据库操作失败！请检查MySQL是否启动以及用户名密码是否正确。"
    read -p "按回车键退出..."
    exit 1
fi

echo "2. 部署项目到Tomcat..."
if [ ! -d "$TOMCAT_PATH/webapps/$PROJECT_NAME" ]; then
    mkdir -p "$TOMCAT_PATH/webapps/$PROJECT_NAME"
fi

cp -r web/* "$TOMCAT_PATH/webapps/$PROJECT_NAME/"

echo "3. 启动Tomcat服务器..."
cd "$TOMCAT_PATH/bin"
./startup.sh

echo "4. 正在打开浏览器..."
sleep 5

# 尝试使用不同的命令打开浏览器（适用于不同的系统）
if command -v xdg-open > /dev/null; then
    xdg-open "http://localhost:8080/$PROJECT_NAME/login.jsp"
elif command -v open > /dev/null; then
    open "http://localhost:8080/$PROJECT_NAME/login.jsp"
else
    echo "请手动打开浏览器访问: http://localhost:8080/$PROJECT_NAME/login.jsp"
fi

echo
echo "===== 部署完成 ====="
echo "请使用以下信息登录:"
echo "用户名: admin"
echo "密码: 123456"
echo
read -p "按回车键退出..."
