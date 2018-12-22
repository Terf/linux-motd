#!/bin/bash

usage=`df --output=pcent / | tr -dc '0-9'`
pct=`bc -l <<< "${usage}/100"`
echo "Disk space usage: ${usage}%"

bar="====================================================================="
buffer=""
red='\033[0;31m'
nc='\033[0m'
count=${#bar}
buffer+="  ["
for (( i=0; i<$count; i++ )); do
	pctnow=`bc -l <<< "${i}/${count}"`
	colored=`bc -l <<< "${pctnow} > ${pct}"`
	if [[ $colored == '0' ]]; then
		buffer+="${red}${bar:$i:1}"
	else
		buffer+="${nc}${bar:$i:1}"
	fi
done
printf "${buffer}]\n"
