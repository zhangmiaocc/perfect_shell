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

function resizeiOSImageSize {

    echo "请将1024x1024像素的图片拖拽进来并按回车"
    read param

    sips -Z 1024 -s format png $param --out "./ios/Runner/Assets.xcassets/AppIcon.appiconset/AppStore_1024pt.png"
    sips -Z 76 -s format png $param --out "./ios/Runner/Assets.xcassets/AppIcon.appiconset/iPad_App_76pt.png"
    sips -Z 152 -s format png $param --out "./ios/Runner/Assets.xcassets/AppIcon.appiconset/iPad_App_76pt@2x.png"
    sips -Z 20 -s format png $param --out "./ios/Runner/Assets.xcassets/AppIcon.appiconset/iPad_Notifications_20pt.png"
    sips -Z 40 -s format png $param --out "./ios/Runner/Assets.xcassets/AppIcon.appiconset/iPad_Notifications_20pt@2x.png"
    sips -Z 167 -s format png $param --out "./ios/Runner/Assets.xcassets/AppIcon.appiconset/iPad_Pro_167px.png"
    sips -Z 29 -s format png $param --out "./ios/Runner/Assets.xcassets/AppIcon.appiconset/iPad_Settings_29pt.png"
    sips -Z 58 -s format png $param --out "./ios/Runner/Assets.xcassets/AppIcon.appiconset/iPad_Settings_29pt@2x.png"
    sips -Z 40 -s format png $param --out "./ios/Runner/Assets.xcassets/AppIcon.appiconset/iPad_Spotlight_40pt.png"
    sips -Z 80 -s format png $param --out "./ios/Runner/Assets.xcassets/AppIcon.appiconset/iPad_Spotlight_40pt@2x.png"

    sips -Z 120 -s format png $param --out "./ios/Runner/Assets.xcassets/AppIcon.appiconset/iPhone_App_60pt@2x.png"
    sips -Z 180 -s format png $param --out "./ios/Runner/Assets.xcassets/AppIcon.appiconset/iPhone_App_60pt@3x.png"
    sips -Z 40 -s format png $param --out "./ios/Runner/Assets.xcassets/AppIcon.appiconset/iPhone_Notification_20pt@2x.png"
    sips -Z 60 -s format png $param --out "./ios/Runner/Assets.xcassets/AppIcon.appiconset/iPhone_Notification_20pt@3x.png"
    sips -Z 29 -s format png $param --out "./ios/Runner/Assets.xcassets/AppIcon.appiconset/iPhone_Settings_29pt.png"
    sips -Z 58 -s format png $param --out "./ios/Runner/Assets.xcassets/AppIcon.appiconset/iPhone_Settings_29pt@2x.png"
    sips -Z 87 -s format png $param --out "./ios/Runner/Assets.xcassets/AppIcon.appiconset/iPhone_Settings_29pt@3x.png"
    sips -Z 80 -s format png $param --out "./ios/Runner/Assets.xcassets/AppIcon.appiconset/iPhone_Spotlight_40pt@2x.png"
    sips -Z 120 -s format png $param --out "./ios/Runner/Assets.xcassets/AppIcon.appiconset/iPhone_Spotlight_40pt@3x.png"
    
    sips -Z 256 -s format png $param --out "./ios/Runner/tmp_logo.png"
    imageAddCorner 256 50 "./ios/Runner/tmp_logo.png" "./ios/Runner/logo.png"
    rm "./ios/Runner/tmp_logo.png"
}

function project_function_shell {

    echo "\033[43m - 项目相关实用功能 - \033[0m\n"
    echo "[\033[31m1\033[0m] iOS图片替换功能"
    echo "[\033[31m2\033[0m] 更新项目中所有图片的hash值"
    echo "[\033[36mq\033[0m] 退出"

    echo "请输入对应的数字或q退出:"
    read open_vpn_opt
    echo

    # 检测空格是否存在
    if [[ -z $open_vpn_opt ]]; then
        echo "\033[41;30m输入有误,请重新选择输入\033[0m"
        
        project_function_shell;
        return
    fi

    if [ $open_vpn_opt = "1" ]; then

        resizeiOSImageSize

    elif [ $open_vpn_opt = "2" ]; then

        echo "开始更新*.png,*gif,*jpg图片"
        find . -iname "*.png" -exec echo {} \; -exec convert {} {} \;
        find . -iname "*.gif" -exec echo {} \; -exec convert {} {} \;
        find . -iname "*.jpg" -exec echo {} \; -exec convert {} {} \;

    elif [ $open_vpn_opt = "q" ]; then

        echo

    else
        echo "\033[41;30m输入有误,请重新选择输入\033[0m" 
        echo
        project_function_shell;
    fi
}

project_function_shell

