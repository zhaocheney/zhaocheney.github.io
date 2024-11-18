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

#### 2.3 生成 ca.crt, ca.key, power.conf

```shell
mv power.conf /opt/ja-netfilter/config/power.conf
```

注意: `power.conf` 和 `ca.crt`, `ca.key` 是配套的

**power.conf 内容简述**

`EQUAL,x,y,z->fakeResult` 就是 `x.modpow(y,z)=fakeResult`, 匹配 x,y,z 三个参数, 并替换模幂运算结果为 fakeResult;

- x: 证书的签名密文;
- y: 指数;
- z: JetBrains 内置 root 证书的公钥的模;
- fakeResult: 证书签名 (sh256 摘要后的明文) ASN.1 格式;

JetBrains 的验证主要就是证书的验签

> 原理此处不做过多解释, 参考网上大神文章

#### 2.4 生成 activation code

### 3. 启动 IntelliJIdea

启动 IntelliJIdea, 输入 activation code

_注意: 不要再登陆账号_
