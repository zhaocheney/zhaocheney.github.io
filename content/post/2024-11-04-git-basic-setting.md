+++
# hugo 配置
draft = true
layout = 'post'
title = 'Git 常见配置'
author = 'zhaocheney'
date = '2024-11-04T13:11:28+08:00'
lastMod = '2024-11-04T13:11:28+08:00'
description = 'Git 安装完成后, 通过命令行完成常见配置'
tags = ['git']
url = ''
# hugo-theme-cleanwhite 配置
## 文章子标题
subtitle = ''
## 文章顶部背景图片
image = 'images/header-image.jpg'
## 文章所属分类
categories = ['NOTE']
+++

### 查看当前配置

```shell
# 查看当前配置
git config --list

# 查看全局配置
git config --global --list

# 查看本地配置
git config --local --list
```

### 配置用户信息

```shell
git config --global user.name "username"
git config --global user.email "username@email.com"
```

### 配置 git log 时间格式

```shell
git config --global log.date format:'%Y-%m-%d %H:%M:%S'
```

### 查看指定目录下所有 git 仓库的提交记录

[//]: # (单行命令)

[//]: # (find . -type d -name '.git' -execdir bash -c 'echo "Project: $&#40;pwd&#41;"; git log  --pretty=format:"%C&#40;yellow&#41;%cd, %h, %an&#40;%ae&#41; : %s %Creset" --author="zhaochen" --since="2024-10-01" --until="2024-10-31"' \;)

```shell
find . -type d -name '.git' \
    -execdir bash -c 'echo "Project: $(pwd)"; \
                      git log  --pretty=format:"%C(yellow)%cd, %h, %an(%ae) : %s %C(reset)" \
                      --author="zhaochen" \
                      --since="2024-10-01" \
                      --until="2024-10-31" ' \;
```
