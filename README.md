# zabbix template check dns
  
----установка---- 
cd /usr/share/ && git clone https://github.com/Evonic4/zabbix_check_dns.git %% mv ./zabbix_check_dns ./z_cheks && chmod +rx /usr/share/z_cheks/setup.sh && /usr/share/z_cheks/setup.sh  
  
---настройка---  
1. можно изменить серверы проверки DNS тут: /usr/share/z_cheks/dns-servers.txt  
2. завести USERS PARAMETERS на сервере с агентом скопировав dns.conf в /etc/zabbix/zabbix_agentd.d/  
! в /etc/zabbix/zabbix_agentd.conf должно быть Include=/etc/zabbix/zabbix_agentd.d/*.conf  
3. экспорторовать шаблон Telmpate_check_dns.yaml в ZAbbix  
4. сделаем отдельную группу эндпоинтов и заведем туда урлы, примерно так:  



    
import the template and apply it to the desired hosts with ip=127.0.0.1  
  ![image](https://user-images.githubusercontent.com/46780974/161830956-337c54d9-b68f-4f22-8bee-c70c3c524598.png)
![image](https://user-images.githubusercontent.com/46780974/161831115-17ccbed8-7e1c-4a71-955b-1f8b7fc11c9b.png)
![image](https://user-images.githubusercontent.com/46780974/161831496-e5bbc8ec-1d10-4161-a477-83bc574ff5cd.png)

