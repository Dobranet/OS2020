#!/bin/bash
rm answ5
count=0
sum=0
k=0
while read LINE;
do
	ppid=`echo $LINE | cut -d ' ' -f 5`
	art=`echo $LINE | cut -d ' ' -f 9`
	if [[ -z "$art" ]]
	then art=0
	fi
	fart=`echo "${art:0:1}"`
	if [[ "$fart" == '.' ]]
	then
	a="0"
	a+="$art"
	art=$a
	fi
	echo "$art" > a1
	if [ "$k" != "$ppid" ]
	then
	div=$(bc <<< "scale=4;$sum/$count")
	printf '%s' 'Average_Sleeping_Children_of_ParentID= ' >> answ5
	printf '%s' $k >> answ5
	printf '%s' ' is ' >> answ5
	printf '%f\n' $div >> answ5
	count=1
	sum=$(echo "$art" | bc | awk '{printf "%f", $0}')
	k=$ppid
	echo $LINE >> answ5
	else
	sum=$(echo "$sum+$art" | bc | awk '{printf "%f", $0}')
	count=$(($count + 1))
	echo $LINE >> answ5
	fi;

done < answ4
	printf '%s' 'Average_Sleeping_Children_of_ParentID=' >> answ5
	printf '%s' $k >> answ5
	printf '%s' " is " >> answ5
	if [[ "$count" = "1" ]]; then
	printf '%f\n' $sum >> answ5
	else printf '%f\n' $div >> answ5
	fi
