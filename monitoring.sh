#!/bin/bash

architecture=$(uname -a)
cpu_physical=$(cat /proc/cpuinfo | grep "cpu cores" | awk '{printf($4)}')
vcpu=$(cat /proc/cpuinfo | grep "processor" | wc -l)
memory_usage=$(free --mega | grep "Mem" | awk '{printf("%s/%sMB (%.2f%%)", $3, $2, $3/$2*100)}')
disk_usage=$(df -BMB --total | grep "total" | awk '{printf("%.0f",$3)}' && df --total -h | grep "total" | awk '{printf("/%.0fGb (%s)", $2, $5)}')
cpu_load=$(vmstat 1 2 | tail -1 | awk '{printf("%.1f%%", 100-$15)}')
last_boot=$(who -b | awk '{printf("%s %s", $3, $4)}')
lvm_use=$(lsblk | awk '{printf($6)}' | grep "hello" | wc -l | awk '{if($1){printf("yes")}else{printf("no")}}')
connections_tcp=$(ss -t | grep "ESTAB" | wc -l)
user_log=$(users | wc -w)
network_IP=$(hostname -I)
network_mac=$(ip link | grep "link/ether" | awk '{printf("%s", $2)}')
sudo=$(sudoreplay -d /var/log/sudo/ -l | wc -l)

wall    "       #Architecture: $architecture
        #CPU physical : $cpu_physical
        #vCPU : $vcpu
        #Memory Usage: $memory_usage
        #Disk Usage: $disk_usage
        #CPU load: $cpu_load
        #Last boot: $last_boot
        #LVM use: $lvm_use
        #Connections TCP : $connections_tcp
        #User log: $user_log
        #Network: IP $network_IP($network_mac)
        #Sudo : $sudo cmd"
