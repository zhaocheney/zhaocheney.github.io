---
# hugo 配置
draft: true
layout: post
title: '使用 Hugo + GitHub Pages 搭建博客'
author: 'zhaocheney'
date: '2024-06-08T00:01:40+08:00'
description: '使用 Markdown 编写内容，Hugo 生成静态内容，部署至 GitHub Pages，完成搭建自己的博客'
tags: [ 'Hugo', 'Blog' ]
url: '/2024/06/08/hugo-with-github-pages'
# theme 扩展配置
subtitle: ''
categories: [ 'TECH' ]
image: '/images'
---

> macOS Ventura
>
> Hugo v0.127.0+extended

## 前言

## Hugo

### 介绍

**“The world’s fastest framework for building websites”**

Hugo 是一个流行的开源静态网站生成器，用于创建快速、灵活和现代的网站。

Hugo 使用 Go 编程语言编写的，因此具有出色的性能和可扩展性，以及快速构建速度，能够在几秒钟内将更改部署到网站上。

Hugo 还提供了丰富的主题支持和灵活的模板系统，允许用户根据自己的需求定制网站外观和功能。

Hugo 在内容管理方面，可以使用 Markdown 格式编写内容，并使用 Hugo 的命令行工具快速生成静态页面。

### 安装

Hugo 包含两个版本：standard 标准版，extended 扩展版，扩展版支持更多功能，推荐直接安装。

#### 先决条件

以下安装先决条件并非 Hugo 所有运行场景所必须，但建议安装

- Git
    - 使用 Hugo Mudules 功能；
    - 通过 git submodule 方式安装 Hugo 主题；
    - 维护变更记录
    -
  部署至站点服务，例如： [CloudCannon](https://cloudcannon.com/), [Cloudflare Pages](https://pages.cloudflare.com/), [GitHub Pages](https://pages.github.com/), [GitLab Pages](https://docs.gitlab.com/ee/user/project/pages/), [Netlify](https://www.netlify.com/)
- Go
    - 变异 Hugo 源码；
    - 使用 Hugo Mudules 功能；

- Dart Sass
    - 将 Sass 转换为 CSS

#### macOS 安装

macOS 系统通过包管理工具 [Homebrew](https://brew.sh/) 即可实现安装，命令如下：

```shell
brew install hugo
```

#### Windows 安装

**方式1：包管理工具**

Windows
系统包管理工具很多，包括 [Chocolatey](https://chocolatey.org/)、 [Scoop](https://scoop.sh/)、 [Winget](https://learn.microsoft.com/en-us/windows/package-manager/)
，根据使用习惯进行选择；

```shell
# Chocolatey
choco install hugo-extended
# Scoop
scoop install hugo-extended
# Winget
winget install Hugo.Hugo.Extended
```

**方式2：二进制文件**

1. 下载 Hugo 官方已编译好的[二进制文件](https://github.com/gohugoio/hugo/releases/latest)，解压缩至期望位置；
2. 确保 Hugo 所在目录拥有执行权限；
3. 配置系统环境变量，`PATH` 追加 Hugo 安装路径即可；

#### 检查安装

执行 `hugo version` 命令，输出版本及运行信息，即表示安装成功

```shell
# 执行命令
hugo version
# 输出结果，版本信息
hugo v0.127.0+extended darwin/arm64 BuildDate=2024-06-05T10:27:59Z VendorInfo=brew
```

------

### 目录结构

### 配置

### 主题

#### 安装主题

#### 删除主题

#### 配置主题-CleanWhite

### 第一篇文章

## GitHub Pages

### 初始化 Pages

## Hugo 部署至 GitHub Pages

### GitHub Action

## 总结

## 参考链接

- [Hugo 版本差异](https://gohugo.io/installation/macos/#editions)
- [Hugo 安装先决条件](https://gohugo.io/installation/macos/#prerequisites)
- [Hugo macOS 安装](https://gohugo.io/installation/macos/)
- [Hugo Windows 安装](https://gohugo.io/installation/windows/)
- [Hugo markup 配置](https://gohugo.io/getting-started/configuration-markup/)
- [GitHub Pages Documentation](https://pages.github.com/)
- [facicon.io 生成网站](https://favicon.io/)