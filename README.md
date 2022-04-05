# zabbix temlate check dns
  
----install---- 
setting goes through UsersParameters   
git clone https://github.com/Evonic4/zabbix_check_dns.git  
cd zabbix_check_dns  
all domen names in dns.txt  
mkdir -p /usr/share/z_cheks/ && cp ./dns.conf /etc/zabbix/zabbix_agentd.d/ && cp ./host-dns2.sh /usr/share/z_cheks/ && cp ./dns.txt /tmp/ && chmod +rx /usr/share/z_cheks/host-dns2.sh && chown -R zabbix:zabbix /usr/share/z_cheks/ && systemctl restart zabbix-agent  
  
if required:  
chown -R root:zabbix /etc/zabbix/  
chmod 755 /etc/zabbix/  
chmod 755 /usr/share/z_cheks/ 
    
import the template and apply it to the desired hosts with ip=127.0.0.1  
  