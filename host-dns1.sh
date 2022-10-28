#!/bin/bash
export PATH="$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"

fhome="/usr/share/z_cheks/"

str="["
while read x; do
! [ "$str" == "[" ] && str=$str","
str1="{"
p1=$(echo $x | awk '{print $1}' | tr -d '\r')
p2=$(echo $x | awk '{print $2}' | tr -d '\r')

str=$str$str1"\"{#DNS}\":\"$p1\","
str=$str"\"{#DNSIP}\":\"$p2\"}"

done < $fhome"dns-servers.txt"
str=$str"]"

echo $str

