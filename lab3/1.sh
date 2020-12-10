#!/bin/bash
now=$(date '+%d.%m.%y_%H:%M')
mkdir -p ~/test && echo "catalog test was created successfully" >> ~/report && touch ~/test/$now
ping www.net.nikogo.ru || echo "${now} Error" >> ~/report
