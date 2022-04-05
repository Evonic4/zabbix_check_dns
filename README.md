# Install
  
----Zabbix----  
  
cp -r -f ./ExternalScripts /usr/lib/zabbix/externalscripts && cp -r -f ./trbot /usr/share/zabbix/local/trbot/ && cp -r -f ./logrotate /etc/logrotate.d/ && cp -r -f ./local /usr/share/zabbix/local/ && chmod +rx /usr/share/zabbix/local/setup.sh && /usr/share/zabbix/local/setup.sh  && cp -r -f ./web /usr/share/zabbix/ && chown -R zabbix:zabbix /usr/lib/zabbix/externalscripts/ && chown -R zabbix:zabbix /usr/share/zabbix/local/ && chmod +rx /usr/share/zabbix/local/trbot/setup.sh && /usr/share/zabbix/local/trbot/setup.sh  
  
cp -r -f ./trbot2 /usr/share/zabbix/local/trbot2/ && chmod +rx /usr/share/zabbix/local/trbot2/setup.sh && /usr/share/zabbix/local/trbot2/setup.sh  
  
useradd -d /dev/null -G adm -p 12345 -s /bin/bash mastmetric && chown -R mastmetric:mastmetric /usr/share/metricz2/ && mkdir -p /usr/share/metricz2/ && cp -r -f ./metricz2 /usr/share/metricz2/ && chmod +rx /usr/share/metricz2/setup.sh && /usr/share/metricz2/setup.sh   
  
crontab -e  
*/10 * * * * su mastmetric -c '/usr/share/metricz2/metricz2.sh' -s /bin/bash  
*/1 * * * * su mastmetric -c '/usr/share/metricz2/metricz21.sh' -s /bin/bash  
*/1 * * * * su mastmetric -c '/usr/share/metricz2/metricz22.sh' -s /bin/bash  
*/5 * * * * su zabbix -c '/usr/share/zabbix/local/at1.sh' -s /bin/bash  
*/3 * * * * su zabbix -c '/usr/share/zabbix/local/trbot/delay1.sh 1' -s /bin/bash  
*/3 * * * * su zabbix -c '/usr/share/zabbix/local/trbot/delay2.sh 2' -s /bin/bash  
*/3 * * * * su zabbix -c '/usr/share/zabbix/local/trbot/delay3.sh 3' -s /bin/bash  
@reboot chown -R zabbix:zabbix /usr/share/zabbix/local/trbot/; chown -R zabbix:zabbix /usr/share/zabbix/local/trbot2/  
@reboot sleep 60 && rm -f /usr/share/zabbix/local/trbot/rtb_pid.txt | su zabbix -c '/usr/share/zabbix/local/trbot/trbot.sh' -s /bin/bash &  
@reboot sleep 60 && rm -f /usr/share/zabbix/local/trbot2/rtb_pid.txt | su zabbix -c '/usr/share/zabbix/local/trbot2/trbot2.sh' -s /bin/bash &  
  
