#!/bin/zsh

echo "请将1024x1024像素的图片拖拽进来并按回车"
read param

filename="${param##*/}" # 获取文件名字
dirname="${param%/*}"   # 获取文件夹名字

sips -Z 96 -s format png $param --out "$dirname/ic_launcher_96.png"

sips -Z 144 -s format png $param --out "$dirname/ic_launcher_144.png"

sips -Z 192 -s format png $param --out "$dirname/ic_launcher_192.png"

sips -Z 512 -s format png $param --out "$dirname/ic_launcher_512.png"

sips -Z 1024 -s format png $param --out "$dirname/ic_launcher_1024.png"

