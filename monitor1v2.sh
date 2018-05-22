#!/bin/bash

usecpu()
{
ps -eo comm,pcpu | tail -n +2 > /tmp/usecpu.tmp
#read -p "hfsfhsdkfhsdjk"
cat /tmp/usecpu.tmp | sort -nrk 2 | head |cut -d " " -f1 > /tmp/usecpu1.tmp
cat /tmp/usecpu.tmp | sort -nrk 2 | head  > /tmp/usecpu2.tmp

printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "" "" "" "" "" "|" "procesy" "|" "Procent" "|"
for usecpu in $(cat /tmp/usecpu1.tmp)
do
usecpu1=$(cat /tmp/usecpu2.tmp|grep $usecpu |awk '{print$1}')
usecpu2=$(cat /tmp/usecpu2.tmp|grep $usecpu |awk '{print$2}')
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "" "" "" "" "-" "|" "$usecpu1" "-" "$usecpu2" "|"

done

printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "" "" "" "" "" "|" "---------------" "-" "--------------------" "|"


}


#10
#----------
#15
#---------------
#20
#c
#



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
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "--------------- " "-" "---------------" "-" "---------------" "-" "---------------" "-" "---------------" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "Karta" "|" "IP" "|" "MAC" "|" "dane odebrane" "|" "dane wyslane" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "" "" "" "" "" "|" "$odebrane" "|" "$wyslane" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "---------------" "-" "---------------" "-" "-----------------" "-" "-------------" "|" "-------------" "|"

for karta in $(cat /tmp/siec.tmp)
   do 
	adres=$(ifconfig $karta |grep "inet addr"|awk '{print $2 }'|cut -f2 -d:)
	adresmac=$(ifconfig eth1 |grep HWaddr |awk '{print $5}')
	printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "$karta " "|" "$adres" "|" "$adresmac" "|" "" "" "" "|"
	done
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "--------------- " "-" "---------------" "-" "---------------" "-" "---------------" "-" "---------------" "|"
}


uslugi
info
clear
echo 
printf "%-25s %-30s %-10s %s\n" "" "" ""
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "" "" "" "" "" "LS - monitor" "" "" "" "" ""
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" " " "---------------" "-" "---------------" "-" "-----------------" "-" "---------------" "" "---------------" "|"

#
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "" "|" "Pamiec RAM" "|" "" "|" "Parametry" "" "komputera" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "---------------" "-" "---------------" "-" "---------------" "|" "" "" "" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "calkowita" "|" "zajeta" "|" "wolna" "|"  "System" "" "$os" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "" "|" "" "|" "" "|" "Procesor" "" "$cpu1 $cpu2" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "" "|" "" "|" "" "|" "model" "-" "$cpu3" "|"
#
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "$ramt" "|" "$ramu" "|" "$ramf" "|" "czestotliwosc" "" "$cpu4" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "----------" "-" "----------" "-" "----------" "|" "rdzenie" "-" "$rdzenie" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "" "|" "" "|" "" "|" "RAM" "-" "$ramt" "|"
#
#
printf "%-1s %-8s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "" "|" "" "|" "DYSKI HDD" "|" "" "|" "" "|" "HDD" "-" "$hdd" "|"
printf "%-1s %-8s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "--------" "-" "----------" "-" "----------" "-" "-----------" "-" "----------" "|" "----------" "|" "----------" "|"
printf "%-1s %-8s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "dysk" "|" "pojemnosc" "|" "zajete" "|" "dostepne" "|" "procent" "|" "----------" "|" "---------" "|"

printf "%-1s %-8s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "12345678" "|" "1234567890" "|" "1234567890" "|" "1234567890" "|" "1234567890" "|" "15" "|" "20" "|"
printf "%-1s %-8s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "$hddname" "|" "$hddfull" "|" "$hddzajete" "|" "$hdddostepne" "|" "$hddprocent" "|" "" "|" "" "|"
printf "%-1s %-8s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-10s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "-------" "-" "---------" "-" "---------" "-" "---------" "-" "---------" "|" "---------------" "|" "" "|"
#
#

printf "%-1s %-10s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "" "" "Usługi" "" "" "|" "aaa" "" "" "|"
printf "%-1s %-10s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "---------------" "-" "---------------" "-" "--------------------" "|" "---------------" "|" "--------------------" "|"
printf "%-1s %-10s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "Apache " "-" "$www" "|" "" "|" "" "|" "....." "|"
printf "%-1s %-10s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "Mysql " "-" "$baza" "|" "" "|" "" "|" "....." "|"
printf "%-1s %-10s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "SSH " "-" "$sshstatus" "|" "" "|" "" "|" "" "|"

siec

statlan
usecpu
echo
