#!/bin/bash
if [[ $# > 1 || $# < 1 ]];
then
echo "Wrong count of arguments"
exit 1
fi

if [[ ! -f $1 ]];
then
echo "File does not exists"
exit 1
fi

mkdir $HOME/.trash 2>/dev/null && echo "hidden folder created" || echo "hidden folder exists";

date=$(date +'%F_%H-%M-%S');
ln $1 $HOME/.trash/$date
echo "deleted path: $PWD/$1 created link: $date" >> $HOME/.trash.log
rm $1
