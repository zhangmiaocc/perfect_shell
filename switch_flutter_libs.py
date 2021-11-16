#!/usr/bin/python
# -*- coding: UTF-8 -*-

import shutil
import os

def redString( str ):
   return '\033[31m' + str + '\033[0m'

path  = '/Users/mac/flutter'
path1 = '/Users/mac/.flutter_local_libs/flutter_lib_1'
path2 = '/Users/mac/.flutter_local_libs/flutter_lib_2'
pathTmp = '/Users/mac/Desktop/tmp'

print('\n\033[39;47;1m - 切换flutter版本工具 - \033[0m')
print('当前Flutter版本 ' + '\033[31;5;1m' + open(path + '/version').read() + '\033[0m')

print('[\033[31m1\033[0m] ' + open(path1 + '/version').read())
print('[\033[31m2\033[0m] ' + open(path2 + '/version').read())

print('[\033[32mq\033[0m] ' + '退出')

select = raw_input("请输入对应的数字或q退出:\n")

if select == '1':
    shutil.move(path, pathTmp)
    shutil.move(path1, path)
    shutil.move(pathTmp, path1)
    print('切换成功,正在执行flutter --version')
    os.system('flutter --version')
    
elif select == '2':
    shutil.move(path, pathTmp)
    shutil.move(path2, path)
    shutil.move(pathTmp, path2)
    print('切换成功,正在执行flutter --version')
    os.system('flutter --version')
    
elif select == 'q':
    print('已退出')
    
else:
    print('输入错误')
