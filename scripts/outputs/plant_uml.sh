#!/usr/bin/env bash
# Written in [Amber](https://amber-lang.com/)
# version: 0.3.5-alpha
# date: 2024-11-20 16:00:06
exit__80_v0() {
    local code=$1
    exit "${code}"
    __AS=$?
}
printf__82_v0() {
    local format=$1
    local args=("${!2}")
    args=("${format}" "${args[@]}")
    __AS=$?
    printf "${args[@]}"
    __AS=$?
}
echo_success__90_v0() {
    local message=$1
    __AMBER_ARRAY_0=("${message}")
    printf__82_v0 "\x1b[1;3;97;42m %s \x1b[0m
" __AMBER_ARRAY_0[@]
    __AF_printf82_v0__148_5="$__AF_printf82_v0"
    echo "$__AF_printf82_v0__148_5" >/dev/null 2>&1
}
error__92_v0() {
    local message=$1
    local exit_code=$2
    __AMBER_ARRAY_1=("${message}")
    printf__82_v0 "\x1b[1;3;97;41m %s \x1b[0m
" __AMBER_ARRAY_1[@]
    __AF_printf82_v0__158_5="$__AF_printf82_v0"
    echo "$__AF_printf82_v0__158_5" >/dev/null 2>&1
    if [ $(echo ${exit_code} '>' 0 | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') != 0 ]; then
        exit__80_v0 ${exit_code}
        __AF_exit80_v0__159_24="$__AF_exit80_v0"
        echo "$__AF_exit80_v0__159_24" >/dev/null 2>&1
    fi
}
# #!/usr/bin/env amber
args=("$0" "$@")
docker pull plantuml/plantuml-server:jetty
__AS=$?
if [ $__AS != 0 ]; then
    error__92_v0 "Failed to pull plantuml/plantuml-server:jetty" $__AS
    __AF_error92_v0__8_9="$__AF_error92_v0"
    echo "$__AF_error92_v0__8_9" >/dev/null 2>&1
fi
docker run -d --name "plantuml_server" -p 8087:8080 plantuml/plantuml-server:jetty
__AS=$?
if [ $__AS != 0 ]; then

    exit $__AS
fi
echo_success__90_v0 "plantuml server has started on 8087"
__AF_echo_success90_v0__13_5="$__AF_echo_success90_v0"
echo "$__AF_echo_success90_v0__13_5" >/dev/null 2>&1
