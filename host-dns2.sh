#!/bin/bash
export PATH="$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"

fhome="/usr/share/z_cheks/"
host=$1
DNS_SERVER=$2
old_ip="0.0.0.0"

dns_file=$fhome"dns_"$DNS_SERVER".txt"
cd /usr/share/z_cheks/

otv2=$(timeout 4 host $host $DNS_SERVER | grep "has address" | awk '{print $4}' | head -n 1)

if [ -z "$otv2" ]; then
    #FAIL - not resolved
    otv1="0"
	otv2="0.0.0.0"
else
    #DONE
	otv1="1"
	! [ -f $dns_file ] && touch $dns_file
	
	old_ip=$(grep "_"$host $dns_file | awk '{print $2}' | head -n 1)
	
	if ! [ "$otv2" == "$old_ip" ]; then
		#DONE - change ip 
		otv1="2"
		host1="_"$host
		sed -i "/$host1/d" $dns_file
		echo "_"$host" "$otv2 >> $dns_file
		[ -z "$old_ip" ] && old_ip="0.0.0.0"
	else
		old_ip="0.0.0.0"
	fi
fi

ip1=$(echo $otv2 | awk -F"." '{print $1}')
ip2=$(echo $otv2 | awk -F"." '{print $2}')
ip3=$(echo $otv2 | awk -F"." '{print $3}')
ip4=$(echo $otv2 | awk -F"." '{print $4}')

ipo1=$(echo $old_ip | awk -F"." '{print $1}')
ipo2=$(echo $old_ip | awk -F"." '{print $2}')
ipo3=$(echo $old_ip | awk -F"." '{print $3}')
ipo4=$(echo $old_ip | awk -F"." '{print $4}')

echo "{\"status\":"$otv1",\"ip1\":\""$ip1"\",\"ip2\":\""$ip2"\",\"ip3\":\""$ip3"\",\"ip4\":\""$ip4"\",\"ipo1\":\""$ipo1"\",\"ipo2\":\""$ipo2"\",\"ipo3\":\""$ipo3"\",\"ipo4\":\""$ipo4"\",\"ipres1\":\""$otv2"\",\"ipres2\":\""$old_ip"\"}"
