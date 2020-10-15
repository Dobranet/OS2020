#!/bin/bash
ps -ax | grep "/sbin/" | awk '{  print $1 }' > answ2
exit 1
