-- 创建数据库（如果不存在）
CREATE DATABASE IF NOT EXISTS mydb;

-- 使用数据库
USE mydb;

-- 创建新闻表
CREATE TABLE IF NOT EXISTS news (
    id INT PRIMARY KEY,
    type VARCHAR(50),
    title VARCHAR(50),
    author VARCHAR(50),
    createdate DATETIME,
    modifydate DATETIME,
    content TEXT
);

-- 插入测试数据
INSERT INTO news VALUES (1, '时政', '国家新政策发布', '记者A', NOW(), NOW(), '详细内容...');
INSERT INTO news VALUES (2, '体育', '足球比赛结果', '记者B', NOW(), NOW(), '比赛详情...');
INSERT INTO news VALUES (3, '科技', '人工智能新突破', '记者C', NOW(), NOW(), '技术详情...');
INSERT INTO news VALUES (4, '娱乐', '明星新闻', '记者D', NOW(), NOW(), '娱乐资讯...');
INSERT INTO news VALUES (5, '时政', '地方政府公告', '记者E', NOW(), NOW(), '公告内容...');
INSERT INTO news VALUES (6, '体育', '篮球联赛开始', '记者F', NOW(), NOW(), '联赛信息...');
