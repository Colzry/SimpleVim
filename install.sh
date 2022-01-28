#!/bin/bash

#================================================================
#   Copyright (C) 2022 IEucd Inc. All rights reserved.
#   
#   FileName：install.sh
#   Author：SongTL, colzry@163.com
#   CreateDate：2022-01-23
#   Description：
#
#================================================================

# 获取日期
function get_datetime() {
    time=$(date "+%Y%m%d%H%M%S")
    echo $time
}

# 判断文件是否存在
function is_exist_file() {
    filename=$1
    if [ -f $filename ]; then
        echo 1
    else
        echo 0
    fi
}

# 判断目录是否存在
function is_exist_dir() {
    dir=$1
    if [ -d $dir ]; then
        echo 1
    else
        echo 0
    fi
}

#备份原有的.vimrc文件
function backup_vimrc_file() {
    old_vimrc=$HOME"/.vimrc"
    is_exist=$(is_exist_file $old_vimrc)
    if [ $is_exist == 1 ]; then
        time=$(get_datetime)
        backup_vimrc=$old_vimrc"_bak_"$time
        read -p "Find "$old_vimrc" already exists,backup "$old_vimrc" to "$backup_vimrc"? [Y/N] " ch
        if [[ $ch == "Y" ]] || [[ $ch == "y" ]]; then
            cp $old_vimrc $backup_vimrc
        fi
    fi
}

#备份原有的.vim目录
function backup_vim_dir() {
    old_vim=$HOME"/.vim"
    is_exist=$(is_exist_dir $old_vim)
    if [ $is_exist == 1 ]; then
        time=$(get_datetime)
        backup_vim=$old_vim"_bak_"$time
        read -p "Find "$old_vim" already exists,backup "$old_vim" to "$backup_vim"? [Y/N] " ch
        if [[ $ch == "Y" ]] || [[ $ch == "y" ]]; then
            cp -R $old_vim $backup_vim
        fi
    fi
}

# 备份原有的.vimrc和.vim
function backup_vimrc_and_vim() {
    backup_vimrc_file
    backup_vim_dir
}

# 拷贝文件
function copy_files() {
    rm -rf ~/.vimrc
    ln -s ${PWD}/.vimrc ~

    mkdir ~/.vim
    rm -rf ~/.vim/autoload
    ln -s ${PWD}/autoload ~/.vim

    rm -rf ~/.vim/dictionary
    ln -s ${PWD}/dictionary ~/.vim

    rm -rf ~/.vim/plugged
    ln -s ${PWD}/plugged ~/.vim
    
    rm -rf ~/.vim/plugins
    ln -s ${PWD}/plugins ~/.vim
    
    rm -rf ~/.vim/syntax
    ln -s ${PWD}/syntax ~/.vim
}

# 安装vim插件
function install_vim_plugin()
{
    vim -c "PlugInstall" -c "q" -c "q"
}

# 打印logo
function print_logo() {
    color="$(tput setaf 6)"
    normal="$(tput sgr0)"
    printf "${color}"
    echo '  _____ _                 _   __      ___           '
    echo ' / ____(_)               | |  \ \    / (_)          '
    echo '| (___  _ _ __ ___  _ __ | | __\ \  / / _ _ __ ___  '
    echo ' \___ \| | |_ | _ \| |_ \| |/ _ \ \/ / | | |_  | _ \ '
    echo ' ____) | | | | | | | |_) | |  __/\  /  | | | | | | |'                   
    echo '|_____/|_|_| |_| |_| .__/|_|\___| \/   |_|_| |_| |_|'
    echo '                   | |                              '
    echo '                   |_|                              '
    echo ''
    echo ''
    echo '......is now installed!!!'
    echo ''
    printf "${normal}"
}

function install_SimpleVim() {
	backup_vimrc_and_vim
	copy_files
	sudo apt install vim-nox
	print_logo
}

install_SimpleVim

