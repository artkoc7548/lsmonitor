#!/bin/bash
info()

 {

	ramt=$(free -m |grep [0-9]|head -n 1|awk '{print $2}')
	ramf=$(free -m |grep [0-9]|head -n 1 |awk '{print $4}')
	ramu=$(free -m |grep [0-9]|head -n 1 |awk '{print $3}')
#	ram=$(cat /proc/meminfo |grep MemTotal |awk '{print $2}')
	cpu=$(cat /proc/cpuinfo |grep "model name" |awk '{print $4}' |head -n 1)
	rdzenie=$( cat /proc/cpuinfo |grep "model name" | wc -l)
	hdd=$(df -H | grep ^/dev/ |cut -f3 -d '/'|awk '{print $1}')
	os=$(uname)
	lan=$( ifconfig |cut -c-10 |tr -d ' '|tr -s '\n' )
	hddname=$(df -H | grep ^/dev/ |cut -f3 -d '/'| awk '{ print $1 }')
hddfull=$(df -H | grep ^/dev/ |cut -f3 -d '/'| awk '{ print $2 }')
hddzajete=$(df -H | grep ^/dev/ |cut -f3 -d '/'| awk '{ print $3 }')
hdddostepne=$(df -H | grep ^/dev/ |cut -f3 -d '/'| awk '{ print $4 }')
hddprocent=$(df -H | grep ^/dev/ |cut -f3 -d '/'| awk '{ print $5 }')

}


info
#echo $rdzenie
#echo $os
#echo $cpu
#echo $ram
#echo $hdd
#echo $lan
#read -p "nacinij [Enter] aby ." 
clear
echo 
echo 
printf "%-25s %-30s %-10s %s\n" "" "LS - monitor" ""
echo 

printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "" "__________" "_" "__________" "_" "___________" "_" "___________" 
printf "%-1s %-10s %-3s %-10s %-3s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" " " "" "" "" "" "" "" "" "" "|"
printf "%-25s %-30s %-10s %s\n" "" "Pamięć RAM " ""
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "---------- " "|" "----------" "|" "----------" "" "----------" "|" "" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "całkowita" "|" "zajęta" "|" "wolna" "" "aaa" "" "ddd" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "" "|" "" "|" "" "" "" "" "" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "$ramt" "|" "$ramu" "|" "$ramf" "" "" "" "ddd" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "----------" "-" "----------" "-" "----------" "" "----------" "|" "" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "" "" "" "" "" "" "" "" "" ""
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" " " "" "dyski" "" "HDD" "" "" "|" "system = $os" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "----------" "-" "----------" "-" "----------" "" "----------" "|" "cpu = $cpu" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "dysk" "|" "pojemność" "|" "zajęte" "|" "dostępne" "|" "rdenie = $rdzenie" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "----------" "-" "----------" "-" "----------" "" "----------" "|" "" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "$hddname" "|" "$hddfull" "|" "$hddzajete" "" "$hdddostepne" "" "$hddprocent" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "---------- " "-" "----------" "-" "----------" "" "----------" "|" "cpu = $cpu" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "ram = $ram" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "1234567890" "|" "1234567890aaa" "|" "aaa" "" "aaa" "" "hdd = $hdd" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-30s %-1s %s\n" "|" "1234567890" "|" "aaa" "|" "aaa" "" "aaa" "" "lan = $lan" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "__________" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "user" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "....." "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "....." "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "....." "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "__________" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "grupy" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "......" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "......" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "__________" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "ddd" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "ddd" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "ddd" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "ddd" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "ddd" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "ddd" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "ddd" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "ddd" "|"
printf "%-1s %-30s %-1s %-30s %-1s %s\n" "" "__________" "" "___________" "" "__________" "" "__________" "" "__________" "" 
echo
