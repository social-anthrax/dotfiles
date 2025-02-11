#!/usr/bin/env bash
# Written in [Amber](https://amber-lang.com/)
# version: 0.4.0-alpha
# date: 2025-02-11 11:13:17

file_exists__33_v0() {
    local path=$1
     [ -f "${path}" ] ;
    __AS=$?;
if [ $__AS != 0 ]; then
        __AF_file_exists33_v0=0;
        return 0
fi
    __AF_file_exists33_v0=1;
    return 0
}
file_chmod__39_v0() {
    local path=$1
    local mode=$2
    file_exists__33_v0 "${path}";
    __AF_file_exists33_v0__61_8="$__AF_file_exists33_v0";
    if [ "$__AF_file_exists33_v0__61_8" != 0 ]; then
         chmod "${mode}" "${path}" ;
        __AS=$?
        __AF_file_chmod39_v0=1;
        return 0
fi
    echo "The file ${path} doesn't exist"'!'""
    __AF_file_chmod39_v0=0;
    return 0
}
declare -r main_args=("$0" "$@")
    filename="dotter"
    curl -L https://github.com/SuperCuber/dotter/releases/latest/download/dotter-macos-arm64.arm -o ${filename}.arm;
    __AS=$?;
if [ $__AS != 0 ]; then
        echo "Failed to download arm version of dotter"
        exit $__AS
fi
    file_chmod__39_v0 "${filename}.arm" "+x";
    __AF_file_chmod39_v0__11_5="$__AF_file_chmod39_v0";
    echo "$__AF_file_chmod39_v0__11_5" > /dev/null 2>&1
    curl -L https://github.com/SuperCuber/dotter/releases/latest/download/dotter-linux-x64-musl -o ${filename} ;
    __AS=$?;
if [ $__AS != 0 ]; then
        echo "Failed to download linux version of dotter"
        exit $__AS
fi
    file_chmod__39_v0 "${filename}" "+x";
    __AF_file_chmod39_v0__18_5="$__AF_file_chmod39_v0";
    echo "$__AF_file_chmod39_v0__18_5" > /dev/null 2>&1
    echo "Complete"
