# 新闻管理系统

## 项目简介

这是一个基于 Java Web 技术开发的新闻管理系统，实现了新闻的增删改查等功能。

## 环境要求

- JDK 8 或更高版本
- MySQL 数据库
- Tomcat 9 或更高版本

## 一键启动方法（推荐）

### Windows 系统

1. 确保已安装 JDK、MySQL 和 Tomcat
2. 双击运行`start_project.bat`
3. 根据提示确认配置信息（如需修改 MySQL 用户名、密码或 Tomcat 路径，请编辑脚本文件）
4. 脚本将自动完成数据库配置、项目部署和启动 Tomcat
5. 浏览器会自动打开登录页面

### Mac/Linux 系统

1. 确保已安装 JDK、MySQL 和 Tomcat
2. 给脚本添加执行权限：`chmod +x start_project.sh`
3. 运行脚本：`./start_project.sh`
4. 根据提示确认配置信息（如需修改 MySQL 用户名、密码或 Tomcat 路径，请编辑脚本文件）
5. 脚本将自动完成数据库配置、项目部署和启动 Tomcat
6. 浏览器会自动打开登录页面

## 手动部署指南

如果一键启动脚本不适用于您的环境，也可以按照以下步骤手动部署：

### 1. 准备数据库

```bash
# 启动MySQL服务（如果没有启动）
# Windows: 在服务中启动MySQL
# Mac/Linux: sudo service mysql start 或 sudo systemctl start mysql

# 执行SQL脚本创建数据库和表
mysql -u root -p < create_table.sql
```

### 2. 部署到 Tomcat

```bash
# 1. 将整个项目文件夹复制到Tomcat的webapps目录下
# 例如：将项目文件夹重命名为"news"，然后复制到Tomcat的webapps目录

# 2. 启动Tomcat
# Windows:
cd Tomcat安装目录/bin
startup.bat

# Mac/Linux:
cd Tomcat安装目录/bin
./startup.sh
```

### 3. 访问系统

1. 打开浏览器，访问：http://localhost:8080/news/login.jsp
2. 登录信息：
   - 用户名：admin
   - 密码：123456

## 功能说明

- 登录系统
- 查看新闻列表
- 按类型筛选新闻
- 查看新闻详情
- 添加新闻
- 修改新闻
- 删除新闻

## 常见问题

1. **数据库连接失败**

   - 检查 MySQL 服务是否启动
   - 如果数据库用户名密码不是 root/空密码，请修改`src/com/stu/util/DBUtil.java`中的配置

2. **404 错误**

   - 确保项目文件夹名称为"news"
   - 确保 Tomcat 正常启动

3. **无法登录**
   - 确认使用用户名"admin"和密码"123456"
   - 确保数据库连接正常
