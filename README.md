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
  ![image](https://user-images.githubusercontent.com/46780974/161830956-337c54d9-b68f-4f22-8bee-c70c3c524598.png)
![image](https://user-images.githubusercontent.com/46780974/161831115-17ccbed8-7e1c-4a71-955b-1f8b7fc11c9b.png)
![image](https://user-images.githubusercontent.com/46780974/161831496-e5bbc8ec-1d10-4161-a477-83bc574ff5cd.png)

