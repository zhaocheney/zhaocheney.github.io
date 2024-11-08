+++
# hugo 配置
draft = false
layout = 'post'
title = 'Linux 安装 Clash-Verge 代理'
author = 'zhaocheney'
date = '2024-06-12T10:37:35+08:00'
lastMod = '2024-06-12T10:37:35+08:00'
description = 'Linux 安装 Clash-Verge 代理, 实现访问 GitHub'
tags = ['Linux', 'Proxy']
url = '/2024/06/12/linux-install-clash-verge'
# hugo-theme 配置
## 文章子标题
subtitle = ''
## 文章顶部背景图片
image = 'https://images.unsplash.com/photo-1542378151504-0361b8ec8f93'
## 文章所属分类
categories = ['NOTE']
+++

> Ubuntu 22.04 LTS

## 安装

```shell
# 安装依赖库
sudo apt install libayatana-appindicator3-1 libwebkit2gtk-4.0-37 libgtk-3-0
# 安装
sudo dpkg -i clash-verge_1.3.8_amd64.deb
```

## 配置

```shell
# 命令行启用
export http_proxy=http://127.0.0.1:7890; export https_proxy=http://127.0.0.1:7890; export all_proxy=socks5://127.0.0.1:7890
# 命令行关闭
unset http_proxy https_proxy all_proxy

# 编辑 profile 添加 alias
alias proxy="export http_proxy=http://127.0.0.1:7890; export https_proxy=http://127.0.0.1:7890; export all_proxy=socks5://127.0.0.1:7890"
alias proxyoff="unset http_proxy https_proxy all_proxy"
```

## 检查

```shell
# 执行&检查当前目录是否有 index.html 生成
wget www.google.com
```

## 卸载

```shell
# 卸载
sudo dpkg -r clash-verge
# 卸载依赖库
sudo apt remove libayatana-appindicator3-1 libwebkit2gtk-4.0-37 libgtk-3-0
# 清理卸载
sudo apt autoremove
```

