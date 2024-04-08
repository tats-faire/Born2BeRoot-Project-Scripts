#!/bin/bash

# Operating system architecture and kernel version
arch=$(uname -mnorsv)

# Number of Physical CPUs (processors)
cpuph=$(grep "physical id" /proc/cpuinfo | sort -u | wc -l)

# Number of Virtual CPUs (processors)
cpuv=$(grep "processor" /proc/cpuinfo | sort -u | wc -l)

# Available RAM and utilization rate
ram_total=$(free --mega | awk '$1 == "MEM:"{print $2}')
ram_use=$(free --mega | awk '$1 == "MEM:" {print $3}')
ram_percent=$(free --mega | awk '$1 == "MEM:" {print ("%.2f"), $3/$2*100}')

# Available disk memory and utilization rate
disk_total=$(df -h -total | grep "total" | awk '{print $2}')
disk_use=$(df -h -total | grep "total" | awk '{print $3}')
disk_percent=$(df -k -total | grep "total" | awk '{print $5}')

# CPU Load (processor utilization rate)
cpu=$(top -bn1 | grep '^%Cpu' | xargs | awk '{printf"%.1f%%", $2 + $4}')

# Last reboot
lb=$(who -b | awk '$1 == "system" {print $3 " " $4}')

# Is LVM active?
lvms=$(if [ $(lsblk | grep "lvm" | wc -l) -gt 0 ]; then echo yes; else echo no; fi)

# Number of active connections
cncn=$(ss -ta | grep ESTAB | wc -l)

# Number of active users
ulog=$(users | wc -w)

# IPv4 and MAC (Media Access Control) addresses
ip=$(hostname -I)
mac=$(ip link show | awk '$1 == "link/ether" {print $2}')

# Number of commands executed with sudo
sucm=$(journalctl_COMM=sudo | grep COMMAND | wc -l)

wall "  _________________________________________________________________________
        #Architecture: $arch
        #CPU physical: $cpuph
        #vCPU: $cpuv
        #Memory usage: $ram_use/${ram_total}MB ($ram_percent%)
        #Disk usage: $disk_use/$disk_total ($disk_percent%)
        #CPU load: $cpu%
        #Last boot: $lb
        #LVM use: $lvms
        #Connections TCP: $cncn
        #User log: $ulog
        #Network: IP $ip ($mac)
        #Sudo: $sucm
        _________________________________________________________________________