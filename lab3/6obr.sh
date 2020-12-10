#!/bin/bash
echo $$ > .pid
res=1
mode=" "
usr1(){
mode = "+"
}
usr2(){
mode = "*"
}
sigterm(){
mode = "SIGTERM"
}
trap 'usr1' USR1
trap 'usr2' USR2
trap 'sigterm' SIGTERM
while true; do
	case $mode in
		"+")
			let res = $res+2
			echo "res == $res"
			;;
		"*")
			let res = $res*2
			echo "res == $res"
			;;
		"TERM")
			echo "FINISH"
			exit
			;;
	esac
	sleep 1
done
