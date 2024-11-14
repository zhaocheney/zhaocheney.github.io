+++
# hugo 配置
draft = false
layout = 'post'
title = 'JetBrains 使用网络过滤器'
author = 'zhaocheney'
date = '2024-11-12T15:00:53+08:00'
lastMod = '2024-11-12T15:00:53+08:00'
description = 'JetBrains 如何配置并使用网络过滤器'
tags = ['JetBrains']
url = ''
# hugo-theme-cleanwhite 配置
## 文章子标题
subtitle = ''
## 文章顶部背景图片
image = 'img/header-image.jpg'
## 文章所属分类
categories = ['NOTE']
+++

> macOS Ventura
>
> IntelliJIdea 2024.1
>
> ja-netfilter 2022.2.0

### 1. 修改 IDEA 虚拟机配置

修改 idea.vmoptions

```shell
vi $HOME/Library/Application Support/JetBrains/IntelliJIdea2024.1/idea.vmoptions
```

添加以下内容

```text
-javaagent:/opt/ja-netfilter/ja-netfilter.jar
--add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED
--add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED
```

### 2. 修改 ja-netfilter 配置

#### 2.1 修改 dns.conf

```shell
# 编辑 dns.conf
vi /opt/ja-netfilter/config/dns.conf
```

```shell
# 配置内容
[DNS]
EQUAL,jetbrains.com
PREFIX,jetbrains.com
PREFIX,plugin.obroom.com
PREFIX,account.jetbrains.com
SUFFIX,r.cloudfront.net
```

#### 2.2 修改 url.conf

```shell
# 编辑 url.conf
vi /opt/ja-netfilter/config/url.conf
```

```shell
# 配置内容
[URL]
PREFIX,https://account.jetbrains.com/lservice/rpc/validateKey.action
```

#### 2.3 生成 power.conf & activation code

> power.conf 和 activation code 是配套的

```shell
mv power.conf /opt/ja-netfilter/config/power.conf
```

### 3. 启动 IntelliJIdea

启动 IntelliJIdea, 输入 activation code

_注意: 不要再登陆账号_
