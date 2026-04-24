The Website certificate SSL by Zabbix agent 2 template allows you to monitor SSL certificates for multiple websites using Zabbix Agent 2.
With automatic discovery, you can easily manage the list of monitored domains via a simple configuration file.

Features
 Automatic website discovery (LLD)
 Monitoring days until certificate expiration
 
⚠️ Alerts for:
certificate expires in < 7 days
expired certificate
certificate change (fingerprint)
invalid certificate

🔐 Certificate details:
issuer
subject
fingerprint (SHA1 / SHA256)
serial number
algorithm
valid from / to

🧱 Requirements
Zabbix Server 7.0+
Zabbix Agent 2
Access to agent configuration files

⚙️ Configuration
1. Add UserParameter

Edit the file:
nano /etc/zabbix/zabbix_agent2.d/plugins.d/cert.conf

Add:
UserParameter=cert.discovery,printf '{"data":['; awk '{printf "%s{\"{#HOST}\":\"%s\"}", NR==1?"":",",$1}' /etc/zabbix/sites.txt; printf ']}'

2. List of monitored websites
Create the file:
nano /etc/zabbix/sites.txt

Add domains (one per line):

example.com

google.com

yourdomain.com

3. Restart agent
systemctl restart zabbix-agent2

