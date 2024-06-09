#!/bin/bash

# 删除 hugo 生成内容
find public -mindepth 1 ! -name ".gitkeep" | xargs rm -rf
find resources -mindepth 1 ! -name ".gitkeep" | xargs rm -rf