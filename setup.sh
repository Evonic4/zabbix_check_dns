#!/bin/bash

f1=/usr/share/z_cheks/

cd $f1
ls | sed -n '/.sh/p' | sed 's/setup.sh//g' | sed '/^$/d' > $f1"fs"

for x in `cat $f1"fs"|grep -v \#`
do
chmod +rx $x
perl -pi -e "s/\r\n/\n/" $x
echo $x
done


ls | sed -n '/.php/p' | sed '/^$/d' > $f1"fs"

for x in `cat $f1"fs"|grep -v \#`
do
chmod +rx $x
perl -pi -e "s/\r\n/\n/" $x
echo $x
done

ls | sed -n '/.py/p' | sed '/^$/d' > $f1"fs"

for x in `cat $f1"fs"|grep -v \#`
do
chmod +rx $x
perl -pi -e "s/\r\n/\n/" $x
echo $x
done

chown -R zabbix:zabbix /usr/share/z_cheks/
