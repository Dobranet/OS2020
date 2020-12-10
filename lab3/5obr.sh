#!/bin/bash
res=1
oper="+"
(tail -f pipe) |
while true; do
	read LINE;
	case $LINE in
		*)
			echo "ERROR"
			killall tail
			killall 5gen.sh
			exit
			;;
		QUIT)
			echo "exit"
			killall tail
			killall 5gen.sh
			exit
			;;
		"+")
			oper="+"
			;;
		"*")
			oper="*"
			;;
		[0-9]*)
			if [[ $oper == "*" ]]
			then
			let res=$res*$LINE
			else
			let res=$res+$LINE
			fi
			;;
		esac
done
