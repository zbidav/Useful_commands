#!/bin/sh
#assuming you can pass beetwen diffrnt servers without passwords.
# the command will run and list all the processes that take more than 0 memorry. 
SERVERS=(alu10 alu11 alu12 alu13 alu14 alu15 alu16); 
for i in ${SERVERS[*]}; do 
  ssh $USER@$i ps aux |awk -v alu=$i '$4>0 {mem[$1] += $4; cpu[$1] += $3} END {for (i in mem) print i "\t" cpu[i] "\t" mem[i] "\t" alu}' ; 
done |column -t
