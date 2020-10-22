#!/bin/bash
for pid in $(ps -A -o pid)
	do
	if [[ -d /proc/$pid ]]
	then
	rchar=$(cat /proc/$pid/io | grep "rchar" | grep -o "[0-9]\+")
	echo $pid : $rchar >> tmp
	fi
done
	sleep 60s
for pid in $(cat tmp | grep -o "[0-9]\+ :" | grep -o "[0-9]\+")
	do
	if [[ -d /proc/$pid ]]
	then
	rchar=$(cat /proc/$pid/io | grep "rchar" | grep -o "[0-9]\+")
	oldchar=$(cat tmp | grep -E "^$pid :" | grep -o ": [0-9]\+" | grep -o "[0-9]\+")
	dif=$((rchar - oldchar))
	path=$(ps -o args $pid | tail -n 1)
	echo $pid : $path : $dif >> tmp2
	fi
done
	cat tmp2 | sort -nk5 -r | head -3
	rm tmp
	rm tmp2
