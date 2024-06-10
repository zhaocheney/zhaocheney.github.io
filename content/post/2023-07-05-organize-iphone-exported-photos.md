---
draft: true
layout: post
title: 'macOS 整理 iPhone 导出照片'
author: 'zhaocheney'
date: '2023-07-05T15:02:17+08:00'
description: 'description'
tags: [ 'macOS', '照片' ]
categories: [ 'NOTES' ]
#url: ''
---

## 介绍

通过 macOS 将 iPhone 的照片导出时，默认按照“地点 + 年-月-日”形式创建导出文件夹。此时若想按照“年-月-日”或“年-月”组织备份照片时，非常不方便。

因此编写以下脚本，实现将导出后的照片，自动按照“年-月”进行分组放置。

## 整理照片

```shell
#!/bin/bash

# 照片来源路径
source_dir="$HOME/photos/20240601"
# 照片目标路径
target_dir="$HOME/photos/20240601_ORG"

# 按照指定年份范围, 查找来源路径中“地点 + 年-月-日”文件夹照片, 忽略“地点”, 将照片复制到目标路径对应的“年-月”文件夹下
echo "复制文件"
mkdir -p "$target_dir"
for yyyy in {2010..2030}; do
  for m in {1..12}; do
    mm=$(printf "%02d" $m)
    mkdir -p "$target_dir/$yyyy-$mm"
    find "$source_dir"/*$yyyy年$m月* -type f | xargs -t -I {} cp {} "$target_dir/$yyyy-$mm/"
  done
done

# 删除复制过程中可能创建的空文件夹
echo "删除空文件夹"
# 查看
find "$target_dir" -type d -empty -print0 | xargs -t -0 ls -alh
# 删除
find "$target_dir" -type d -empty | xargs rm -rf

# 检查来源路径、目标路径文件数量是否一致
echo "检查文件数量"
find "$source_dir" -type f | wc -l; 
find "$target_dir" -type f | wc -l;
```

## 删除隐藏文件

```shell
# 查看
find "$target_dir" -type f -name ".*" -print0 | xargs -t -0 ls -alh
# 删除
find "$target_dir" -type f -name ".*" -print0 | xargs -t -0 rm
```

## 检查结果

```shell
# 若检查结果不一致, 通过该脚本输出差异内容. 注意: 由于排序, 脚本执行并不快
echo "输出差异内容"
find "$source_dir" -type f -exec basename {} \; | sort > file_source.txt
find "$target_dir" -type f -exec basename {} \; | sort > file_target.txt
diff file_source.txt file_target.txt
```
