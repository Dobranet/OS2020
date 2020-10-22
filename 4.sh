#!/bin/bash
p="PID"
n=""
for pid in $(ps -A -o pid)
do
	ppid=$(grep -E -h -s -i "ppid:\s(.+)" /proc/$pid/status | grep -o "[0-9]\+")
	sumr=$(grep -E -h -s -i "se.sum_exec_runtime" /proc/$pid/sched | grep -o "[0-9.]\+")
	nrs=$(grep -E -h -s -i "nr_switches" /proc/$pid/sched | grep -o "[0-9.]\+"  )
	if [[ "$ppid" == "" ]]
	then ppid="0"
	fi
	if [[ $sumr != "" && $nrs != "" ]]
	then
	 art=$(echo "scale=4;$sumr/$nrs" | bc)
	else
	 art="0"
	fi
	echo  "ProcessID:" $pid ", Parent_ProcessID:" $ppid ", Average_Running_Time:" $art >> tmp1
done
tail -n +2 tmp1 > tmp
sort -nk5 tmp > answ4
rm tmp
rm tmp1
exit 1
