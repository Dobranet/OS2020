#!/bin/bash
	ps aux | tail -n+2 | sort -rnk4 > n
	line=$(head -n 1 n)
	pid=`echo $line | cut -d ' ' -f 2`
	cat /proc/$pid/status > n
	line=$(head -n 1 n)
	echo $line > answ6
	rm n
exit 1
