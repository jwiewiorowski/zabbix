Website Monitoring (Zabbix Template)
Overview

This template provides basic website availability and performance monitoring using built-in HTTP checks in Zabbix.

It verifies that a website is reachable, responds correctly, and does not exceed defined response time thresholds.

Features
HTTP availability check (status code 200)
Response time monitoring
Failure detection
Configurable via macros
Multiple alert levels (HIGH / DISASTER)
Configuration
Macros
Macro	Description	Example
{$WEB.URL}	Target website URL	https://google.com
{$POWIADOMIENIE}	Custom alert message prefix	ALERT:
HTTP Test
Name

Website Health Check

Step
Webpage Availability
URL: {$WEB.URL}
Expected status: 200
User-Agent: Chrome (simulated browser)
Triggers
1. Website returns invalid status code

Expression:

min(web.test.rspcode,#5) <> 200
Severity: HIGH
Description: Triggered when the website does not return HTTP 200
2. Slow response time

Expression:

min(web.test.time,#5) > 15
Severity: HIGH
Description: Triggered when response time exceeds 15 seconds
3. Website not responding

Expression:

min(web.test.fail,#5) <> 0
Severity: DISASTER
Manual close: Enabled
Description: Triggered when the website is completely unreachable
How It Works
Zabbix performs periodic HTTP requests to the configured URL
It validates:
HTTP response code
Response time
Availability
Triggers are evaluated based on the last 5 checks
