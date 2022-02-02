#!/bin/bash
arch=$(uname -a)
pcpu=$(grep physical.id /proc/cpuinfo | uniq | wc -l)
vcpu=$(grep '^processor' /proc/cpuinfo | wc -l)
memo1=$(free -m | awk '$1=="Mem:" {print $3}')
memo2=$(free -m | awk '$1=="Mem:" {print $2}')
memo3=$(echo ${memo1} ${memo2} | awk '{printf("%.2f", $1*100/$2)}')
disk1=$(df --total -BM | grep '^total' | awk '{printf("%d", $3)}')
disk2=$(df --total -BG | grep '^total' | awk '{printf("%d", $2)}')
disk3=$(df --total -BM | grep '^total' | awk '{printf("%d %d", $2, $3)}' | awk '{printf("%d", $1 / $2)}')
cpul=$(mpstat | awk '$3=="all" {printf("%.1f", 100 - $13)}')
lboo=$(who -b | awk '{printf("%s %s", $3, $4)}')
lvmu=$(lsblk | awk '{print $6}' | grep 'lvm' | wc -l | awk '{if($1>0){print "yes"}else{print "no"}}')
ctcp=$(ss -t | awk '$1=="ESTAB"' | wc -l)
ulog=$(users | wc -w)
netw1=$(hostname -I | awk '{print $1}')
netw2=$(ip lin | grep 'link/ether' | awk 'NR==1{print $2}')
sudo=$((36#$(cat /var/log/sudo/seq)))

wall "  #Architecture: ${arch}
    #CPU physical: ${pcpu}
    #vCPU: ${vcpu}
    #Memory Usage: ${memo1}/${memo2}MB (${memo3}%)
    #Disk Usage: ${disk1}/${disk2}Gb (${disk3}%)
    #CPU load: ${cpul}%
    #Last boot: ${lboo}
    #LVM use: ${lvmu}
    #Connexions TCP: ${ctcp} ESTABLISHED
    #User log: ${ulog}
    #Network: IP ${netw1} (${netw2})
    #Sudo: ${sudo} cmd"
