#!/bin/bash
ps -fU user | tail -n +2 | awk '{print $2 ":" $8}' > tmp
rm answ1
cat tmp | wc -l >> answ1
cat tmp >> answ1
rm tmp
exit 1
