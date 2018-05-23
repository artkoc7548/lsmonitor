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

kartasieciowa()
{
ilekart=$(lspci |grep Ethernet | wc -l)



for (( i=1; $i <= $ilekart; i++ )) ;
	do
	#lan=$(lspci |grep Ethernet |cut -d: -f3| tail -n $i|head -n 1)
	lan$i=$(lspci |grep Ethernet |cut -d: -f3|tail -n +$i|head -n 1|awk '{print $1}')

	done

}


uslugi()
{
www=$(service apache2 status |grep Active |awk '{print $3 }')
baza=$(service mysql status |grep Active |awk '{print $3 }')
sshstatus=$(service ssh status |grep Active |awk '{print $3 }')

#if [ $www = "(running)" ];
#then
#www=$(echo  -e "\E[32m ON \033[0m" )
#else 
#www=$(echo "OFF")
#www=$(echo  -e "\E[31m OFF \033[0m" )
#fi

#if [ $baza = "(running)" ];
#then
#baza=$(echo  -e "\E[32m ON \033[0m" )
#else 
#baza=$(echo  -e "\E[31m OFF \033[0m" )
#fi

#if [ $sshstatus = "(running)" ];
#then
#sshstatus=$(echo  -e "\E[32m ON \033[0m" )
#else 
#sshstatus=$(echo  -e "\E[31m OFF  \033[0m" )
#fi

}
#printf '\e[5;32;40m Blink Text\e[m\n'

siec()

{

statlan

ifconfig |cut -c-10 |tr -d ' '|tr -s '\n' >/tmp/siec.tmp
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "---------------" "-" "---------------" "-" "--------------------" "|" "---------------" "-" "--------------------" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "Karta" "|" "IP" "|" "MAC" "|" "" "|" "" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "" "" "" "" "" "|" "" "|" "" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "---------------" "-" "---------------" "-" "--------------------" "-" "---------------" "-" "--------------------" "|"

for karta in $(cat /tmp/siec.tmp)
   do 
	adres=$(ifconfig $karta |grep "inet addr"|awk '{print $2 }'|cut -f2 -d:)
	adresmac=$(ifconfig eth1 |grep HWaddr |awk '{print $5}')
	printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "$karta " "|" "$adres" "|" "$adresmac" "|" "" "" "" "|"
	done
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "---------------" "-" "---------------" "-" "--------------------" "-" "---------------" "-" "--------------------" "|"
}


stanuslug(){

printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "---------------" "-" "---------------" "-" "--------------------" "-" "---------------" "-" "--------------------" "|"

#read -sp "Podajnumer z menu " menu
read menu       
	case $menu in
		a)
		clear
		echo -e "\E[31m Podaj prawidłowy kod \033[0m"
		read -p "naciśnij [Enter] aby kontynułować..." 
			;;
		m)
		clear
		echo -e "\E[31m Podaj prawidłowy kod \033[0m"
		read -p "naciśnij [Enter] aby kontynułować..." 
			;;
		s)
		clear
		echo -e "\E[31m Podaj prawidłowy kod \033[0m"
		read -p "naciśnij [Enter] aby kontynułować..." 
			
			;;
		
	
		*)
			echo "błąd: podaj numer z menu..."	
			read -p "naciśnij [Enter] aby kontynułować..." 
			;;
	esac


}



# dmesg | grep -i dma
# dmesg | grep -i memory
# dmesg | grep -i usb
# dmesg > boot_info

while :
do
clear
uslugi
kartasieciowa
statlan
info
clear
echo 
printf "%-25s %-30s %-10s %s\n" "" "" ""
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "" "" "" "" "" "LS - monitor" "" "" "" "" ""
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "---------------" "-" "---------------" "-" "--------------------" "-" "---------------" "-" "--------------------" "|"

#
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "" "" "Pamiec RAM" "" "" "|" "Parametry" "" "komputera" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "---------------" "-" "---------------" "-" "--------------------" "|" "---------------" "-" "--------------------" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "calkowita" "|" "zajeta" "|" "wolna" "|"  "system" ">" "$os" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "" "|" "" "|" "" "|" "procesor" ">" "$cpu1 $cpu2" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "" "|" "" "|" "" "|" "model" ">" "$cpu3" "|"
#
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "$ramt" "|" "$ramu" "|" "$ramf" "|" "czestotliwosc" ">" "$cpu4" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "---------------" "-" "---------------" "-" "--------------------" "|" "rdzenie" ">" "$rdzenie" "|"
#
#
printf "%-1s %-8s %-1s %-10s %-1s %-10s %-1s %-8s %-1s %-8s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "" "" "" "" "DYSKI HDD" "" "" "" "" "|" "RAM" ">" "$ramt" "|"
printf "%-1s %-8s %-1s %-10s %-1s %-10s %-1s %-8s %-1s %-8s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "--------" "-" "----------" "-" "----------" "-" "--------" "-" "--------" "|" "HDD" ">" "$hdd" "|"
printf "%-1s %-8s %-1s %-10s %-1s %-10s %-1s %-8s %-1s %-8s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "dysk" "|" "pojemnosc" "|" "zajete" "|" "dostepne" "|" "procent" "|" "" ">" "" "|"

printf "%-1s %-8s %-1s %-10s %-1s %-10s %-1s %-8s %-1s %-8s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "" "|" "" "|" "" "|" "" "|" "" "|" "" ">" "" "|"
printf "%-1s %-8s %-1s %-10s %-1s %-10s %-1s %-8s %-1s %-8s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "$hddname" "|" "$hddfull" "|" "$hddzajete" "|" "$hdddostepne" "|" "$hddprocent" "|" "" ">" "" "|"
printf "%-1s %-8s %-1s %-10s %-1s %-10s %-1s %-8s %-1s %-8s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "--------" "-" "----------" "-" "----------" "-" "--------" "-" "--------" "|" "" ">" "" "|"
#
#

printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "" "" "Uslugi" "" "" "|" "" ">" "" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "---------------" "-" "---------------" "-" "--------------------" "|" "---------------" "-" "--------------------" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "Apache " "-" "$www" "|" "" "|" "dane odebrane" "|" "dane wyslane" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "Mysql " "-" "$baza" "|" "" "|" "" "|" "" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "SSH " "-" "$sshstatus" "|" "" "|" "$odebrane" "|" "$wyslane" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "---------------" "-" "---------------" "-" "--------------------" "-" "---------------" "-" "--------------------" "|"
printf "%-1s %-15s %-1s %-15s %-1s %-20s %-1s %-15s %-1s %-20s %-1s %s\n" "|" "A - Apache2" "-" "M - Mysql" "-" "S - SSH" "-" "F4" "-" "F5" "|"

siec
#usecpu
stanuslug
echo
done

