#!/bin/zsh

cd ~

# 当前使用版本
FLUTTER_PATH_0="/Users/zhangmiao/Documents/SDK/flutter-sdk-macosx/flutter"

# 其他版本
FLUTTER_PATH_1="/Users/zhangmiao/Documents/SDK/flutter-sdk-macosx/flutter_libs/flutter_lib1"

# 获取flutter的路径,版本号
function flutterObj() {

    folder="$2"
    version=`cat $folder/version`
    if [ $1 = "1" ]; then
      echo $folder
    fi
    
    if [ $1 = "2" ]; then
      echo $version
    fi
}

# [1]编号 [2]路径 [3]版本号
local obj_1=(1 $(flutterObj 1 $FLUTTER_PATH_0) $(flutterObj 2 $FLUTTER_PATH_0))
local obj_2=(2 $(flutterObj 1 $FLUTTER_PATH_1) $(flutterObj 2 $FLUTTER_PATH_1))

function switch_flutter_lib_folder {

    old=$1
    oldPath=$( echo ${old%/*} )
    oldFile=$( echo ${old##/*/} )
    
    new=$2
    newPath=$( echo ${new%/*} )
    newFile=$( echo ${new##/*/} )
    
    tmp="$oldPath/flutter_tmp"
    mv $old $tmp
    mv $new $old
    mv $tmp $new
    
    echo "切换完成,执行命令 flutter --version"
    flutter --version
    echo
}

function switch_flutter_shell {

    echo "\033[0;30;47m - 切换flutter版本工具 - \033[0m\n"
    echo "\033[31m\033[0m当前flutter版本\033[31m${obj_1[3]}\033[0m"
    echo
    
    echo "[\033[31m${obj_1[1]}\033[0m] ${obj_1[3]}"
    echo "[\033[31m${obj_2[1]}\033[0m] ${obj_2[3]}"
    echo "[\033[36mq\033[0m] 退出"
    echo

    echo "请输入对应的数字进行版本的切换或q退出:"
    read param
    echo

    # 检测空格是否存在
    if [[ -z $param ]]; then
        echo "\033[31m输入有误,请重新输入\033[0m"
        switch_flutter_shell;
        return
    fi
    
    old_obj=${obj_1[2]}
    
    if [ $param = "1" ]; then

        new_obj=${obj_1[2]}
        
        if [ $old_obj = $new_obj ]; then
            return
        fi

        switch_flutter_lib_folder $old_obj $new_obj

    elif [ $param = "2" ]; then

        new_obj=${obj_2[2]}
        
        if [ $old_obj = $new_obj ]; then
            return
        fi
        
        switch_flutter_lib_folder $old_obj $new_obj

    elif [ $param = "q" ]; then
        echo
    else
        echo "\033[31m输入有误,请重新输入\033[0m"
        echo
        switch_flutter_shell;
    fi
}

switch_flutter_shell
