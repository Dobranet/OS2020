#!/bin/bash

if [[ $# > 1 || $# < 1 ]];
then
echo "Wrong count of arguments"
exit 1
fi

if [[ $1 == *"/"* ]];
then
echo "File name contains path"
exit 1
fi

tlogPath=$HOME/.trash.log
[ -f $tlogPath ] || { echo "hidden file trash.log does not exist"; exit 1; };
[ -s $tlogPath ] || { echo "File trash.log is empty"; exit 1; };

tdirPath=$HOME/.trash
[ -d "$tdirPath" ] || [ echo "hidden directory .trash does not exist"; exit 1; };
[ "$(ls -A $tdirPath)" ] || {echo "hidden directory is empty"; exit 1; };

IFS=$'\n'
findFile=0

for var in $(cat $tlogPath)
do
fullPath=$(echo $var | awk '{ print $3 } ')
if [[ $1 == "$(echo $fullPath | awk -F/ '{print $NF }')" ]];
then
let findFile=$findFile+1
echo "Path: $fullPath"

read -p "Do you want to get file (y or n)?" yn
case $yn in
[Yy]* )
dir=$(echo $fullPath | awk 'BEGIN{ FS=OFS="/" }{NF--; print }')
trashName=$(echo $var | awk '{ print $6 }')

if [ -d $dir ];
then
if [ -f $fullPath ];
then
read -p "File with this name exists. Enter another : " Name
ln $tdirPath/$trashName $dir/$Name

else
ln $tdirPath/$trashName $fullPath
fi

else
echo "Directory does not exist. You can find file in home dir";
if  [ -f $HOME/$1 ];
then
read -p "File with thiss name exists. Enter another :  " name
ln $tdirPath/$trashName $HOME/$name

else
ln $tdirPath/$trashName $HOME/$1
fi

fi

grep -v "$trashName" $HOME/.trash.log > tmpfile
mv tpmfile /root/.trash.log
rm $tdirPath/$trashName
;;

[Nn]* )
;;
* )
echo "no possibilities"
;;
esac

fi
done

if [[ $findFile == 0 ]];
then
echo "File did not find in trash.log"
exit 1
fi
