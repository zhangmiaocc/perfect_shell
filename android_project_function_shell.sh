#!/bin/zsh

function imageAddCorner {

    # https://stackoverflow.com/questions/718314/rounding-corners-of-pictures-with-imagemagick
    # $1-正方形图片宽度
    # $2-圆角大小
    # $3-被转换图片路径
    # $4-输出图片路径

    # 生成圆角图片
    convert -size $1x$1 xc:none -draw "roundrectangle 0,0,$1,$1,$2,$2" mask.png

    # 圆角图片合成
    convert $3 -matte mask.png -compose DstIn -composite $4

    # 删除圆角图片
    rm mask.png
}

function resizeAjMallImageSize {

    echo "请将1024x1024像素的图片拖拽进来并按回车"
    read param

    sips -Z 96 -s format png $param --out "./android/app/src/main/res/mipmap-hdpi/ic_launcher.png"
    sips -Z 96 -s format png $param --out "./android/app/src/main/res/mipmap-mdpi/ic_launcher.png"
    sips -Z 144 -s format png $param --out "./android/app/src/main/res/mipmap-xhdpi/ic_launcher.png"
    sips -Z 144 -s format png $param --out "./android/app/src/main/res/mipmap-xxhdpi/ic_launcher.png"
    sips -Z 192 -s format png $param --out "./android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png"

    sips -Z 96 -s format png $param --out "./android/app/src/app1/res/mipmap-hdpi/ic_launcher.png"
    sips -Z 96 -s format png $param --out "./android/app/src/app1/res/mipmap-mdpi/ic_launcher.png"
    sips -Z 144 -s format png $param --out "./android/app/src/app1/res/mipmap-xhdpi/ic_launcher.png"
    sips -Z 144 -s format png $param --out "./android/app/src/app1/res/mipmap-xxhdpi/ic_launcher.png"
    sips -Z 192 -s format png $param --out "./android/app/src/app1/res/mipmap-xxxhdpi/ic_launcher.png"

    imageAddCorner 144 30 "./android/app/src/main/res/mipmap-xhdpi/ic_launcher.png" "./android/app/src/main/res/mipmap-xhdpi/ic_launcher_s.png"
    imageAddCorner 144 30 "./android/app/src/app1/res/mipmap-xhdpi/ic_launcher.png" "./android/app/src/app1/res/mipmap-xhdpi/ic_launcher_s.png"
}

function resizeChicyImageSize {

    echo "请将1024x1024像素的图片拖拽进来并按回车"
    read param

    sips -Z 96 -s format png $param --out "./android/app/src/app2/res/mipmap-hdpi/ic_launcher.png"
    sips -Z 96 -s format png $param --out "./android/app/src/app2/res/mipmap-mdpi/ic_launcher.png"
    sips -Z 144 -s format png $param --out "./android/app/src/app2/res/mipmap-xhdpi/ic_launcher.png"
    sips -Z 144 -s format png $param --out "./android/app/src/app2/res/mipmap-xxhdpi/ic_launcher.png"
    sips -Z 192 -s format png $param --out "./android/app/src/app2/res/mipmap-xxxhdpi/ic_launcher.png"

    imageAddCorner 144 30 "./android/app/src/app2/res/mipmap-xhdpi/ic_launcher.png" "./android/app/src/app2/res/mipmap-xhdpi/ic_launcher_s.png"
}

function resizeModishImageSize {

    echo "请将1024x1024像素的图片拖拽进来并按回车"
    read param

    sips -Z 96 -s format png $param --out "./android/app/src/app3/res/mipmap-hdpi/ic_launcher.png"
    sips -Z 96 -s format png $param --out "./android/app/src/app3/res/mipmap-mdpi/ic_launcher.png"
    sips -Z 144 -s format png $param --out "./android/app/src/app3/res/mipmap-xhdpi/ic_launcher.png"
    sips -Z 144 -s format png $param --out "./android/app/src/app3/res/mipmap-xxhdpi/ic_launcher.png"
    sips -Z 192 -s format png $param --out "./android/app/src/app3/res/mipmap-xxxhdpi/ic_launcher.png"

    imageAddCorner 144 30 "./android/app/src/app3/res/mipmap-xhdpi/ic_launcher.png" "./android/app/src/app3/res/mipmap-xhdpi/ic_launcher_s.png"
}

function resizeAjBabyImageSize {

    echo "请将1024x1024像素的图片拖拽进来并按回车"
    read param

    sips -Z 96 -s format png $param --out "./android/app/src/app4/res/mipmap-hdpi/ic_launcher.png"
    sips -Z 96 -s format png $param --out "./android/app/src/app4/res/mipmap-mdpi/ic_launcher.png"
    sips -Z 144 -s format png $param --out "./android/app/src/app4/res/mipmap-xhdpi/ic_launcher.png"
    sips -Z 144 -s format png $param --out "./android/app/src/app4/res/mipmap-xxhdpi/ic_launcher.png"
    sips -Z 192 -s format png $param --out "./android/app/src/app4/res/mipmap-xxxhdpi/ic_launcher.png"

    imageAddCorner 144 30 "./android/app/src/app4/res/mipmap-xhdpi/ic_launcher.png" "./android/app/src/app4/res/mipmap-xhdpi/ic_launcher_s.png"
}
function project_function_shell {

    echo "\033[43m - 项目相关实用功能 - \033[0m\n"
    echo "[\033[31m1\033[0m] AjMall图标替换功能"
    echo "[\033[31m2\033[0m] Chicy图标替换功能"
    echo "[\033[31m3\033[0m] Modish图标替换功能"
    echo "[\033[31m4\033[0m] AjBaby图标替换功能"
    echo "[\033[36mq\033[0m] 退出"

    echo "请输入对应的数字或q退出:"
    read open_vpn_opt
    echo

    # 检测空格是否存在
    if [[ -z $open_vpn_opt ]]; then
        echo "\033[41;30m输入有误,请重新选择输入\033[0m"
        
        project_function_shell
        return
    fi

    if [ $open_vpn_opt = "1" ]; then

        resizeAjMallImageSize

    elif [ $open_vpn_opt = "2" ]; then

        resizeChicyImageSize

    elif [ $open_vpn_opt = "3" ]; then

        resizeModishImageSize

    elif [ $open_vpn_opt = "4" ]; then

        resizeAjBabyImageSize

    elif [ $open_vpn_opt = "q" ]; then

        echo

    else
        echo "\033[41;30m输入有误,请重新选择输入\033[0m" 
        echo
        project_function_shell;
    fi
}

project_function_shell

