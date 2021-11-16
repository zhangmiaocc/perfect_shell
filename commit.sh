#!/bin/zsh

BLACK="\033[30m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
PINK="\033[35m"
CYAN="\033[36m"
WHITE="\033[37m"
NORMAL="\033[0;39m"
END="\033[0m"

local comment_type=""
local comment_msg=""
local comment_info=""

function chooseCommitTypeFunc {

    echo
    echo "[\033[31m 1\033[0m]$CYAN feat$END     新功能(feature)"
    echo "[\033[31m 2\033[0m]$CYAN fix$END      修复bug,可以是QA发现的BUG,也可以是研发自己发现的BUG"
    echo "[\033[31m 3\033[0m]$CYAN docs$END     文档(documentation)"
    echo "[\033[31m 4\033[0m]$CYAN style$END    格式(不影响代码运行的变动)"
    echo "[\033[31m 5\033[0m]$CYAN refactor$END 重构(即不是新增功能，也不是修改bug的代码变动)"
    echo "[\033[31m 6\033[0m]$CYAN perf$END     优化相关,比如提升性能,体验"
    echo "[\033[31m 7\033[0m]$CYAN test$END     增加测试"
    echo "[\033[31m 8\033[0m]$CYAN build$END    影响系统构建或者修改外部依赖"
    echo "[\033[31m 9\033[0m]$CYAN ci$END       对CI配置文件和脚本的更改"
    echo "[\033[31m10\033[0m]$CYAN chore$END    构建过程或辅助工具的变动"
    echo "[\033[31m11\033[0m]$CYAN revert$END   回滚到上一个版本"
    echo "[\033[36m q\033[0m] 退出"
    echo

    echo "请输入对应的数字或q退出:"
    read param
    echo

    # 检测空格是否存在
    if [[ -z $param ]]; then
        echo "$RED输入有误,请重新输入$END"
        chooseCommitTypeFunc;
        return
    fi
    
    if [ $param = "1" ]; then

        comment_type="feat"
        commitInfoFunc;

    elif [ $param = "2" ]; then

        comment_type="fix"
        commitInfoFunc;
        
    elif [ $param = "3" ]; then

        comment_type="docs"
        commitInfoFunc;
        
    elif [ $param = "4" ]; then

        comment_type="style"
        commitInfoFunc;
        
    elif [ $param = "5" ]; then

        comment_type="refactor"
        commitInfoFunc;

    elif [ $param = "6" ]; then

        comment_type="perf"
        commitInfoFunc;

    elif [ $param = "7" ]; then

        comment_type="test"
        commitInfoFunc;
        
    elif [ $param = "8" ]; then

        comment_type="build"
        commitInfoFunc;
        
    elif [ $param = "9" ]; then

        comment_type="ci"
        commitInfoFunc;
        
    elif [ $param = "10" ]; then

        comment_type="chore"
        commitInfoFunc;
        
    elif [ $param = "11" ]; then

        comment_type="revert"
        commitInfoFunc;

    elif [ $param = "q" ]; then
        echo
    else
        echo "$RED输入有误,请重新输入$END"
        echo
        chooseCommitTypeFunc;
    fi
}

function commitInfoFunc {

    echo "请输入提交的信息:"
    read param
    echo
    
    comment_msg=$param
    comment_info="git commit -m \"$comment_type:$param\""
    commitConfirm;
}

function commitConfirm {

    echo "[\033[31my\033[0m] 确认"
    echo "[\033[31mn\033[0m] 取消"

    echo "命名行为$PINK$comment_info$END,确认要提交吗?"
    read param
    echo
    
        # 检测空格是否存在
    if [[ -z $param ]]; then
        echo "$RED输入有误,请重新输入$END"
        commitConfirm;
        return
    fi
    
    if [ $param = "y" ]; then

        git commit -m "$comment_type:$comment_msg"

    elif [ $param = "n" ]; then



    elif [ $param = "q" ]; then
        echo
    else
        echo "$RED输入有误,请重新输入$END"
        echo
        commitConfirm;
    fi
}

chooseCommitTypeFunc;
