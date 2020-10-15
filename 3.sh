#!/bin/bash
ps -u |  tail -n +2 | sort -nk 9  | awk '{ print $2 }' > tmp
tail -n1 tmp 
rm tmp
exit 1
