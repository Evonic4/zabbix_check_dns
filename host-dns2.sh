#!/bin/bash

host=$1
DNS_SERVER=$2
STAND=$3
tmpf="./tmp.txt"

dns_file="/tmp/dns.txt"
dns2_file="/tmp/dns2.txt"
cd /usr/share/z_cheks/

otv2=`host $host $DNS_SERVER | grep "has address" | awk '{print $4}' | head -n 1`

if [ -z "$otv2" ]; then
    #FAIL
    otv1="0"
else
    #DONE
	otv1="1"
	
	old_ip=`grep "_"$host $dns_file | awk '{print $2}'`
	
	if ! [ "$otv2" = "$old_ip" ]; then
		#change ip 
		otv1="2"
		
		str_col=$(grep -cv "^#" $dns_file)
		rm -f $dns2_file
		touch $dns2_file
		
		for (( i=1;i<=$str_col;i++)); do
		test=$(sed -n $i"p" $dns_file | tr -d '\r')
		test_dns=$(echo $test | awk '{print $1}')
		test_ip=$(echo $test | awk '{print $2}')
		
		if [ "_$host" = "$test_dns" ]; then
			echo "_"$host" "$otv2 >> $dns2_file
			else
			echo $test >> $dns2_file
		fi
		
		done
		
		cp -f $dns2_file $dns_file
	otv2=$old_ip"->"$otv2
	fi
	
fi

echo "{\"status\":"$otv1",\"ipres\":\""$otv2"\"}"
