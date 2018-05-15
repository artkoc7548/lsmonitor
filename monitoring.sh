#!/bin/bash


nazwafunkcji()
		{
			polecenie1
			polecenie2
		...
		}
		
		
read -p "naciśnij [Enter] aby kontynułować..."  nazwazmiennej
		
#lub		
		
echo do jakiej karty fizycznej są dołączone
read nrlan


echo -e "\E[31m na czerwono \033[0m" -- czerwony

#pętla
while :

while (warunek)
polecenie1
polecenie2
...

#pętla

do
polecenie1
polecenie2
...

done
#----------------------------------------------------------------------
#case
read -p "Podajnumer z menu " menu
        
	case $menu in
		1)
			polecenie1
			polecenie2
			;;
		2)
			polecenie1
			polecenie2
			;;
		
	
		*)
			echo "błąd: podaj numer z menu..."	
			read -p "naciśnij [Enter] aby kontynułować..." 
			;;
	esac


#lista kart lan 

ifconfig |cut -c-10|tr -d ' '| tr -s '\n'


ip link |cut -d:  -f2|grep [a-z]


wc -l
wc -w
wc -m

#tekst

printf "%-15s %-30s %-10s %s\n" ""  "Pracownia Systemów Komputerowych" ""
echo
printf "%-30s %-3s %-30s %-3s %s\n" "1 -ustaw ip w sali 6/v... " "|" "5 -ustaw nazwe komutera" "|"
printf "%-30s %-3s %-30s %-3s %s\n" "2 -ustaw ip - dhcp " "|" "6 -repozytoria " "|"
printf "%-30s %-3s %-30s %-3s %s\n" "3 -ustaw ip - all " "|" "7 - programy" "|"
printf "%-30s %-3s %-30s %-3s %s\n" "4 -ustaw ip karta 2 " "|" "8 - wjscie" "|"


printf "%-3s %-5s %-3s %-5s %-3s %s\n" "|""kol1 " "|" "kol3" "|"
printf "%-3s %-5s %-3s %-5s %-3s %s\n" "|""kol1 " "|" "kol3" "|"
printf "%-3s %-5s %-3s %-5s %-3s %s\n" "|""kol1 " "|" "kol3" "|"
printf "%-3s %-5s %-3s %-5s %-3s %s\n" "|""kol1 " "|" "kol3" "|"

#---------------------------------------------------------------
for (( i=$ilestart; $i <= $numer; i++ )) ;
	do
	polecenie 1 dla  $i
	done
#---------------------------------------------------------------

for ip in $(cat /root/ip.tmp)
    do 
	polecenie1 dla $ip
	done

	
	# lub
read nameserwer
CONFFILE=$nameserwer".tmp"	
cat $CONFFILE | while read LINE
        do
              VMNAME=$LINE
              polecenie 1 dla VMNAME
		done

#---------------------------------------------------------------
INFO=$(/usr/bin/VBoxManage showvminfo "$VMNAME" 2>/dev/null)
echo "$INFO" | grep State | awk '{ print $2; }')
xd


#---------------------------------------------------------------
    VBoxManage showvminfo "$VMNAME" | grep "Guest OS"
	VBoxManage showvminfo "$VMNAME" | grep "Memory size"
	VBoxManage showvminfo "$VMNAME" | grep VRDE: | awk '{ print $2; }'
	VBoxManage showvminfo "$VMNAME" | grep "VRDE port:"| awk '{ print $3; }'
1
	#VBoxManage showvminfo "$VMNAME" | grep "NIC 3"| awk '{ print $3; }'



if [ $UID -ne 0 ]; 
then
polecenie1
else 
polecenie20


