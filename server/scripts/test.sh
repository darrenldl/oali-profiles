#!/bin/bash



map() {
{
local A f;
[ $# -ge 1 ] && A="${1}"
[ $# -ge 2 ] && f="${2}"
}
shift 2
eval "{
local k; for k in \"\${!$A[@]}\"; do
local v=\"\${$A[\"\${k}\"]}\";
$f \"\${@}\" \"\${k}\" \"\${v}\"
done
}"
}

mappipe() {
{
local f;
[ $# -ge 1 ] && f="${1}"
}
shift
while read -r line; do
"${f}" "${@}" "${line}"
done
}

curry() {
{
local out f x;
[ $# -ge 1 ] && out="${1}"
[ $# -ge 2 ] && f="${2}"
[ $# -ge 3 ] && x="${3}"
}
eval "{
$out() {
$f '$x' \"\${@}\"
}
}"
}

keys() {
{
local x y;
[ $# -ge 1 ] && x="${1}"
[ $# -ge 2 ] && y="${2}"
}
echo "${x}"
}

values() {
{
local x y;
[ $# -ge 1 ] && x="${1}"
[ $# -ge 2 ] && y="${2}"
}
echo "${y}"
}

set?() {
{
local s;
[ $# -ge 1 ] && s="${1}"
}
eval "{
return \"\$(( \${$s+-1}+1 ))\"
}"
}

unset?() {
{
local s;
[ $# -ge 1 ] && s="${1}"
}
eval "{
return \"\$(( \${$s+1}+0 ))\"
}"
}

empty?() {
{
local s;
[ $# -ge 1 ] && s="${1}"
}
eval "{
return \"\$(( \${$s:+1}+0 ))\"
}"
}

nonempty?() {
{
local s;
[ $# -ge 1 ] && s="${1}"
}
eval "{
return \"\$(( \${$s:+-1}+1 ))\"
}"
}

bool() {
{
local int;
[ $# -ge 1 ] && int="${1}"
}
return "${int}"
}

filter() {
{
local A p;
[ $# -ge 1 ] && A="${1}"
[ $# -ge 2 ] && p="${2}"
}
shift 2
eval "{
local k; for k in \"\${!$A[@]}\"; do
local v=\"\${$A[\"\${k}\"]}\";
if $p \"\${@}\" \"\${k}\" \"\${v}\"; then
echo \"\${v}\"
fi
done
}"
}

compose() {
{
local fg f g;
[ $# -ge 1 ] && fg="${1}"
[ $# -ge 2 ] && f="${2}"
[ $# -ge 3 ] && g="${3}"
}
eval "{
$fg() {
$f \"\$( $g \"\${@}\" )\"
}
}"
}

pick() {
{
local A k;
[ $# -ge 1 ] && A="${1}"
[ $# -ge 2 ] && k="${2}"
}
if [ -z "${k}" ]; then
return 1
fi
eval "{
local output=\"\${$A[$k]}\"
}"
if [ -n "${output}" ]; then
echo "${output}"
fi
}

first() {
{
local A;
[ $# -ge 1 ] && A="${1}"
}
if unset? A; then
return 1
fi
eval "{
echo \"\${$A[0]}\"
}"
}

last() {
{
local A;
[ $# -ge 1 ] && A="${1}"
}
if unset? A; then
return 1
fi
eval "{
echo \"\${$A[-1]}\"
}"
}

require_env() {
{
local var;
[ $# -ge 1 ] && var="${1}"
}
eval "{
pass \"\${$var?\"The variable $var is unset. Exitting.\"}\"
}"
}

ismap?() {
{
local x;
[ $# -ge 1 ] && x="${1}"
}
local result k1=__ismap_dummy1 k2=__ismap_dummy2
if empty? x; then
return 1
fi
eval "{
local $k1=0 $k2=0
local v
[ \"\$(( \${$x[$k1]+-1}+1 ))\" = 0 ] && v=\"\${$x[$k1]}\" 
$x[$k1]=a 
$x[$k2]=b 
if [ \"\${$x[$k1]}\" = a ]; then
unset $x[$k1]
unset $x[$k2]
return 0
else
[ \"\$(( \${v+-1}+1 ))\" = 0 ] && $x=\"\${v}\" || unset $x
return 1
fi
}"
}

copy_map() {
{
local __A __B;
[ $# -ge 1 ] && __A="${1}"
[ $# -ge 2 ] && __B="${2}"
}
if ! ismap? "${__A}"; then
echo 'ERROR: in copy_map: '"${__A}"' is not a map'
return 1
fi
if ! ismap? "${__B}"; then
echo 'ERROR: in copy_map: '"${__B}"' is not a map'
return 1
fi
eval "{
local __k; for __k in \"\${!$__A[@]}\"; do
local __v=\"\${$__A[\"\${__k}\"]}\";
$__B[\"\${__k}\"]=\"\${__v}\" 
done
}"
}

copy_array() {
{
local __A __B;
[ $# -ge 1 ] && __A="${1}"
[ $# -ge 2 ] && __B="${2}"
}
eval "{
local __k; for __k in \"\${!$__A[@]}\"; do
local __v=\"\${$__A[\"\${__k}\"]}\";
if ! [[ \"\${__k}\" =$ ^[1-9]+\$  ]]; then
echo 'ERROR: not a valid array key: '\"\${__k}\"''
return 1
fi
$__B[\"\${__k}\"]=\"\${__v}\" 
done
}"
}

clear_array() {
{
local __A;
[ $# -ge 1 ] && __A="${1}"
}
eval "{
local __k; for __k in \"\${!$__A[@]}\"; do
unset $__A[\"\${__k}\"]
done
}"
}

NL='
' 

pass() {
true
}





INVALID_ANS='Invalid answer' 

print_kv() {
{
local k v;
[ $# -ge 1 ] && k="${1}"
[ $# -ge 2 ] && v="${2}"
}
echo "${k}" '->' "${v}"
}

print_map() {
{
local m;
[ $# -ge 1 ] && m="${1}"
}
map "${m}" print_kv
}

div_rup() {
{
local a b;
[ $# -ge 1 ] && a="${1}"
[ $# -ge 2 ] && b="${2}"
}
echo $(( ( ( ${a:-0}+${b:-0}-1 )/${b:-0} ) ))
}


ask_ans() {
{
local ret msg;
[ $# -ge 1 ] && ret="${1}"
[ $# -ge 2 ] && msg="${2}"
}
echo -ne "${msg}"' : '
read ans
eval ''"${ret}"'='"${ans}"''
}

ask_yn() {
{
local ret msg;
[ $# -ge 1 ] && ret="${1}"
[ $# -ge 2 ] && msg="${2}"
}
while true; do
echo -ne "${msg}"' y/n : '
read ans
if [ "${ans}" = 'y' ]; then
eval ''"${ret}"'=true'
break
else
if [ "${ans}" = 'n' ]; then
eval ''"${ret}"'=false'
break
else
echo -e "${INVALID_ANS}"
fi
fi
done
}

ask_if_correct() {
{
local ret;
[ $# -ge 1 ] && ret="${1}"
}
ask_yn "${ret}" 'Is this correct?'
}

default_wait=1 
wait_and_clear() {
{
local v;
[ $# -ge 1 ] && v="${1}"
}
if [ $# = 0 ]; then
sleep "${default_wait}"
else
sleep "${v}"
fi
clear
}

tell_press_enter() {
echo 'Press enter to continue'
read
}

install_with_retries() {
{
local package_name;
[ $# -ge 1 ] && package_name="${1}"
}
if [ $# = 0 ]; then
echo 'Too few parameters'
exit
fi
retries=5 
retries_left="${retries}" 
while true; do
echo 'Installing '''"${package_name}"''' package'
arch-chroot "${config['mount_path']}" pacman --noconfirm -S "${package_name}"
if [ $? = 0 ]; then
break
else
retries_left=$["${retries_left}" 1 ]
fi
if [ "${retries_left}" = 0 ]; then
echo 'Package install failed '''"${retries}"''' times'
ask_yn change_name 'Do you want to change package name before continuing retry?'
if "${change_name}"; then
ask_new_name_end=false 
while ! "${ask_new_name_end}"; do
ask_ans package_name 'Please enter new package name : '
ask_if_correct ask_new_name_end
done
fi
retries_left="${retries}" 
fi
done
}


f() {
echo $#
}

f
f 'a'

declare -A config 
config['a']=2 

echo "${config['a']}"

div_rup '( '"${config['a']}"' * 4)' 3



if [ "${ASYNC}" = 1 ]; then
wait
fi




