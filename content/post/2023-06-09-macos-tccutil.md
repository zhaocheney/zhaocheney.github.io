+++
# hugo 配置
draft = false
layout = 'post'
title = 'MacOS 隐私工具 tccutil'
author = 'zhaocheney'
date = '2024-11-08T15:04:33+08:00'
lastMod = '2024-11-08T15:04:33+08:00'
description = '使用 tccutil 命令, 重置或清理 macos 隐私设置'
tags = ['macos']
url = ''
# hugo-theme-cleanwhite 配置
## 文章子标题
subtitle = ''
## 文章顶部背景图片
image = 'images/header-image.jpg'
## 文章所属分类
categories = ['macos']
+++

## tccutil

Manage the privacy database.

**Syntax**

tccutil reset _service_

**Options**

_service_ Reset all decisions for the specified service, causing apps to prompt again the next time they access the
service.

If a bundle identifier is specified, the service will be reset for that bundle only.

The tccutil command manages the privacy database, which stores decisions the user has made about whether apps may access
personal data.

**Examples**

Reset service

- $ tccutil reset AddressBook
- $ tccutil reset Calendar
- $ tccutil reset Reminders
- $ tccutil reset Photos

Reset one app permissions

- $ tccutil reset All com.apple.Terminal

Reset all app permissions

- $ tccutil reset All
