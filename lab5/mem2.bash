#!/bin/bash
> report2.log
declare -a arr
count=0
n=0
while true;
do
let "n = count % 100000"
if [[ "$n" -eq 0 && "$count" -gt 0 ]]; then
echo ${#arr[@]} >> report2.log
fi
arr+=(1 2 3 4 5 6 7 8 9 10)
count=$(( count + 1))
done
