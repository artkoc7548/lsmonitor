#!/bin/bash
info()

 {

	ramt=$(free -m |grep [0-9]|head -n 1|awk '{print $2}')
	ramf=$(free -m |grep [0-9]|head -n 1 |awk '{print $4}')
	ramu=$(free -m |grep [0-9]|head -n 1 |awk '{print $3}')
#	ram=$(cat /proc/meminfo |grep MemTotal |awk '{print $2}')
	cpu=$(cat /proc/cpuinfo |grep "model name" |head -n 1)
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

uslugi()
{
www=$(service apache2 status |grep Active |awk '{print $3 }')
baza=$(service mysql status |grep Active |awk '{print $3 }')
sshstatus=$(service ssh status |grep Active |awk '{print $3 }')

if www=(running)
then
www=ON
www2=$(echo  -e "\E[32m $www  \033[0m" )
else 
www=OFF
www2=$(echo  -e "\E[31m $www  \033[0m" )

fi

}


siec()

{
ifconfig |cut -c-10 |tr -d ' '|tr -s '\n' >/tmp/siec.tmp

printf "%-1s %-15s %-1s %-15s %-1s %-17s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "------------- " "-" "------------------" "-" "--------------------" "" "aaa" "" "ddd" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-17s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "Karta" "" "IP" "|" "MAC" "" "aaa" "" "ddd" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-17s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "------------- " "-" "------------------" "-" "--------------------" "" "aaa" "" "ddd" "|"

for karta in $(cat /tmp/siec.tmp)
   do 
	adres=$(ifconfig $karta |grep "inet addr"|awk '{print $2 }'|cut -f2 -d:)
	adresmac=$(ifconfig eth1 |grep HWaddr |awk '{print $5}')
	printf "%-1s %-15s %-1s %-15s %-1s %-17s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "$karta " "|" "$adres" "|" "$adresmac" "" "aaa" "" "ddd" "|"
	echo
	done


printf "%-1s %-15s %-1s %-15s %-1s %-17s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "------------- " "-" "------------------" "-" "--------------------" "" "aaa" "" "ddd" "|"
}

statlan()

{

vnstat  > /tmp/lan.tmp



}



uslugi
info
clear
echo 
echo 
printf "%-25s %-30s %-10s %s\n" "" "LS - monitor" ""
echo 

printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "" "__________" "_" "__________" "_" "___________" "_" "___________" 
printf "%-25s %-30s %-10s %s\n" "" "Pamięć RAM " ""
printf "%-1s %-15s %-1s %-15s %-1s %-17 %-1s %-10s %-1s %-10s %-1s %s\n" "|" "---------- " "|" "----------" "|" "----------" "" "----------" "|" "" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-17s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "całkowita" "|" "zajęta" "|" "wolna" "" "aaa" "" "ddd" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-17s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "" "|" "" "|" "" "" "" "" "" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-17s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "$ramt" "|" "$ramu" "|" "$ramf" "" "" "" "ddd" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "----------" "-" "----------" "-" "----------" "" "----------" "|" "" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "" "" "" "" "" "" "" "" "" ""
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" " " "" "dyski" "" "HDD" "" "" "|" "system = $os" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-20s %-1s %s\n" "|" "----------" "-" "----------" "-" "----------" "" "----------" "|" "cpu = $cpu" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "dysk" "|" "pojemność" "|" "zajęte" "|" "dostępne" "|" "rdzenie = $rdzenie" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "----------" "-" "----------" "-" "----------" "" "----------" "|" "" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "$hddname" "|" "$hddfull" "|" "$hddzajete" "" "$hdddostepne" "" "$hddprocent" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "---------- " "-" "----------" "-" "----------" "" "----------" "|" "cpu = $cpu" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "" "|" "" "|" "" "" "" "" "" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "" "|" "" "|" "" "" "" "" "" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "ram = $ram" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "1234567890" "|" "1234567890aaa" "|" "aaa" "" "aaa" "" "hdd = $hdd" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-30s %-1s %s\n" "|" "1234567890" "|" "aaa" "|" "aaa" "" "aaa" "" "lan = $lan" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "__________" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "user" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" " " "|" "" "" "Usługi" "" "aaa" "" "....." "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "Apache " "|" "$www2" "|" "aaa" "" "aaa" "" "....." "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "Baza Mysql " "|" "$baza" "|" "aaa" "" "aaa" "" "....." "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "ssh " "|" "$sshstatus" "|" "aaa" "" "aaa" "" "__________" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "grupy" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "......" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "......" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "__________" "|"

siec
statlan
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "ddd" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "ddd" "|"

printf "%-1s %-30s %-1s %-30s %-1s %s\n" "" "__________" "" "___________" "" "__________" "" "__________" "" "__________" "" 
echo
