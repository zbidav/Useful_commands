#!/bin/sh
# check all the allocated memmorry for each user (on the ram)

SERVERS=(zelda01 zelda02 zelda03 zelda04 zelda05 zelda06); 
for i in ${SERVERS[*]}; do 
  echo; 
  ssh $USER@$i ipcs -m |awk -v alu="$i" 'NR>3{a[$3] += $5} END{for (i in a) if (a[i] > a[i]/(1073741824) ) {print i "\t" sprintf("%.2f",a[i]/(1073741824))"G" "\t" alu}}' |grep -v "gdm" | grep -v "root" ; 
done |sort |column -t
