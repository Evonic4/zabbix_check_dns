# zabbix dns monitoring  template_check_dns
  
----установка----   
cd /usr/share/ && git clone https://github.com/Evonic4/zabbix_check_dns.git && mv ./zabbix_check_dns ./z_cheks && chmod +rx /usr/share/z_cheks/setup.sh && /usr/share/z_cheks/setup.sh  
  
---настройка---  
1. можно изменить серверы проверки DNS тут: /usr/share/z_cheks/dns-servers.txt  
2. завести USERS PARAMETERS на сервере с агентом скопировав dns.conf в /etc/zabbix/zabbix_agentd.d/  
! в /etc/zabbix/zabbix_agentd.conf должно быть Include=/etc/zabbix/zabbix_agentd.d/*.conf  
3. импортировать шаблон Telmpate_check_dns.yaml в ZAbbix  
4. сделаем отдельную группу эндпоинтов и заведем туда урлы, примерно так:  
  
![image](https://user-images.githubusercontent.com/46780974/198819501-5b0325a2-5550-45cc-a655-182217664a77.png)
  
5. применить шаблон к хостам и настроить оповещения, фсе  
  
   
зависимости: 
1. пользователь zabbix  
2. host  
3. bash  
4. zabbix  
  
