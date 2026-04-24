The Active Directory Monitoring Template for Zabbix provides comprehensive monitoring of key AD services and health metrics using Zabbix Agent 2.
It helps detect common issues in Active Directory environments such as replication problems, service failures, and domain controller health degradation.

🚀 Features:
🧠 Monitoring of Active Directory core services
🔄 Replication status checks
⚙️ Windows service monitoring (NTDS, DNS, Netlogon, etc.)
📊 Performance and health metrics
⚠️ Built-in triggers for critical AD issues
🔍 Automatic detection of domain controller problems

🧱 Requirements
* Zabbix Server 6.0+ / 7.0+ / 8.0+
* Zabbix Agent 2 installed on Domain Controller
* Windows Server with Active Directory role
* Administrator privileges for agent

📊 Monitored components

🔹 Services
Active Directory Domain Services (NTDS)
DNS Server
Netlogon
Kerberos Key Distribution Center
DFS Replication

🔹 Metrics
Service status (running/stopped),
Replication health,
LDAP responsiveness,
CPU / memory usage,
Event log errors 

🔹 Example items
service.info[NTDS,state]
service.info[DNS,state]
service.info[Netlogon,state]
AD replication checks
System performance counters
