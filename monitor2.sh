#!/bin/bash

statlan()

{

vnstat  > /tmp/lan.tmp
odebrane=$(cat /tmp/lan.tmp|grep "'18"|awk '{print $3}')
odebrane2=$(cat /tmp/lan.tmp|grep "'18"|awk '{print $4}')
wyslane=$(cat /tmp/lan.tmp|grep "'18"|awk '{print $6}')
wyslane2=$(cat /tmp/lan.tmp|grep "'18"|awk '{print $7}')

odebrane=$(echo $odebrane $odebrane2)
wyslane=$(echo $wyslane $wyslane2)

}

info()

 {

	ramt=$(free -m |grep [0-9]|head -n 1|awk '{print $2}')
	ramf=$(free -m |grep [0-9]|head -n 1 |awk '{print $4}')
	ramu=$(free -m |grep [0-9]|head -n 1 |awk '{print $3}')
#	ram=$(cat /proc/meminfo |grep MemTotal |awk '{print $2}')
	cpu1=$(cat /proc/cpuinfo |grep "model name" |head -n 1| cut -f2 -d:|awk '{print $1}')
	cpu2=$(cat /proc/cpuinfo |grep "model name" |head -n 1| cut -f2 -d:|awk '{print $2}')
	cpu3=$(cat /proc/cpuinfo |grep "model name" |head -n 1| cut -f2 -d:|awk '{print $4}')
	cpu4=$(cat /proc/cpuinfo |grep "model name" |head -n 1| cut -f2 -d:|awk '{print $6}')
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
www=$(echo  -e "\E[32m $www  \033[0m" )
else 
www=OFF
www2=$(echo  -e "\E[31m $www  \033[0m" )
fi


if baza=(running)
then
baza=ON
baza=$(echo  -e "\E[32m $baza  \033[0m" )
else 
baza=OFF
baza=$(echo  -e "\E[31m $baza \033[0m" )
fi

if sshstatus=(running)
then
sshstatus=ON
sshstatus=$(echo  -e "\E[32m $sshstatus \033[0m" )
else 
sshstatus=OFF
sshstatus=$(echo  -e "\E[31m $sshstatus  \033[0m" )
fi
}


siec()

{

statlan

ifconfig |cut -c-10 |tr -d ' '|tr -s '\n' >/tmp/siec.tmp
printf "%-1s %-15s %-1s %-15s %-1s %-17s %-1s %-13s %-1s %-13s %-1s %s\n" "|" "------------- " "-" "------------------" "-" "--------------------" "" "aaa" "" "ddd" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-17s %-1s %-13s %-1s %-13s %-1s %s\n" "|" "Karta" "" "IP" "|" "MAC" "|" "dane odebrane" "|" "dane wyslane" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-17s %-1s %-13s %-1s %-13s %-1s %s\n" "|" "" "" "" "" "-" "|" "$odebrane" "|" "$wyslane" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-17s %-1s %-13s %-1s %-13s %-1s %s\n" "|" "---------------" "-" "---------------" "-" "-----------------" "|" "-------------" "|" "-------------" "|"

for karta in $(cat /tmp/siec.tmp)
   do 
	adres=$(ifconfig $karta |grep "inet addr"|awk '{print $2 }'|cut -f2 -d:)
	adresmac=$(ifconfig eth1 |grep HWaddr |awk '{print $5}')
	printf "%-1s %-15s %-1s %-15s %-1s %-17s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "$karta " "|" "$adres" "|" "$adresmac" "" "" "" "" "|"
	echo
	done
printf "%-1s %-15s %-1s %-15s %-1s %-17s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "------------- " "-" "------------------" "-" "--------------------" "-" "--------------------" "-" "--------------------" "|"
}


uslugi
info
clear
echo 
printf "%-25s %-30s %-10s %s\n" "" "" ""
printf "%-1s %-15s %-1s %-15s %-1s %-17s %-1s %-15s %-1s %-15s %-1s %s\n" "" "" "" "" "" "LS - monitor" "" "" "" "" ""
printf "%-1s %-15s %-1s %-15s %-1s %-17s %-1s %-15s %-1s %-15s %-1s %s\n" " " "---------------" "-" "---------------" "-" "-----------------" "-" "---------------" "" "---------------" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-17s %-1s %-15s %-1s %-15s %-1s %s\n" "|" "" "|" "Pamieć" "|" "RAM" "|" "Parametry" "" "komputera" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-17s %-1s %-15s %-1s %-15s %-1s %s\n" "|" "---------------" "|" "---------------" "|" "---------------" "|" "" "|" "" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-17s %-1s %-15s %-1s %-15s %-1s %s\n" "|" "całkowita" "|" "zajęta" "|" "wolna" "|"  "System" "" "$os" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-17s %-1s %-15s %-1s %-15s %-1s %s\n" "|" "" "|" "" "|" "" "" "Procesor" "" "$cpu1 $cpu2" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-17s %-1s %-15s %-1s %-15s %-1s %s\n" "|" " " "" "" "" "" "|" "model" "-" "$cpu3" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-17s %-1s %-15s %-1s %-15s %-1s %s\n" "|" "$ramt" "|" "$ramu" "|" "$ramf" "" "czestotliwosc" "" "$cpu4" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-17s %-1s %-15s %-1s %-15s %-1s %s\n" "|" "----------" "-" "----------" "-" "----------" "|" "rdzenie" "-" "$rdzenie" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-17s %-1s %-15s %-1s %-15s %-1s %s\n" "|" "" "" "" "" "" "|" "RAM" "-" "$ramt" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-15s %-1s %-15s %-1s %s\n" "|" "" "" "dyski" "" "HDD" "|" "hdd" "-" "$hdd" "|"
printf "%-1s %-7s %-1s %-9s %-1s %-9s %-1s %-9s %-1s %-9s %-1s %-15s %-1s %-15s%-1s %s\n" "|" "-------" "-" "---------" "-" "---------" "-" "---------" "-" "---------" "|" "---------------" "|" "" "|"
printf "%-1s %-7s %-1s %-9s %-1s %-9s %-1s %-9s %-1s %-9s %-1s %-15s %-1s %-15s %-1s %s\n" "|" "dysk" "|" "pojemność" "|" "zajęte" "|" "dostępne" "|" "procent" "|" "----------" "|" "---------" "|"

printf "%-1s %-7s %-1s %-9s %-1s %-9s %-1s %-9s %-1s %-9s %-1s %-15s %-1s %-15s %-1s %s\n" "|" "" "|" "" "|" "" "|" "" "|" "---" "" "" "|" "" "|"
printf "%-1s %-7s %-1s %-9s %-1s %-9s %-1s %-9s %-1s %-9s %-1s %-15s %-1s %-15s %-1s %s\n" "|" "$hddname" "|" "$hddfull" "|" "$hddzajete" "|" "$hdddostepne" "|" "$hddprocent" "|" "" "|" "" "|"
printf "%-1s %-7s %-1s %-9s %-1s %-9s %-1s %-9s %-1s %-10s %-1s %s\n" "|" "" "" "" "" "" "" "" "" "|"
printf "%-1s %-7s %-1s %-9s %-1s %-9s %-1s %-9s %-1s %-10s %-1s %s\n" "|" "---------- " "-" "----------" "-" "----------" "|" "...." "-" "...." "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "" "|" "" "|" "aaa" "" "aaa" "" "" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-30s %-1s %s\n" "|" "" "|" "aaa" "|" "aaa" "" "aaa" "" "" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "user" "|"

printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" " " "|" "" "" "Usługi" "" "aaa" "" "....." "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "Apache " "|" "$www" "|" "aaa" "" "aaa" "" "....." "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "Baza Mysql " "|" "$baza" "|" "aaa" "" "aaa" "" "....." "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "ssh " "|" "$sshstatus" "|" "aaa" "" "aaa" "" "__________" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "grupy" "|"
printf "%-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %s\n" "|" "aaa " "|" "aaa" "|" "aaa" "" "aaa" "" "......" "|"
siec

statlan

echo
