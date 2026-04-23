Windows Server Update Monitoring (Zabbix Template)
⚠️ Prerequisite (Required)

Before using this template, you must enable execution of PowerShell commands via Zabbix Agent.

This template relies on system.run[], which is disabled by default for security reasons.

Enable system.run in Zabbix Agent

Open Zabbix Agent configuration file:

zabbix_agentd.conf

Add or modify the following parameter:
AllowKey=system.run[*]
(Optional – recommended) Restrict to PowerShell only:
AllowKey=system.run[powershell*]

Restart Zabbix Agent service:
Restart-Service zabbix-agent2


Overview

This template monitors Windows Update status on servers using PowerShell commands executed via Zabbix Agent.

It provides visibility into:

Pending updates
Last update installation date
Last update search date
Reboot requirements
Features
Detects number of pending updates
Tracks last successful update installation
Monitors last update search time
Detects if system reboot is required
Configurable trigger behavior using macros
Items
1. Pending Updates Count
Returns number of updates waiting for installation
Uses Windows Update COM API
2. Last Installation Date
Returns timestamp of last successful update installation
Stored as Unix time
3. Last Search Date
Returns timestamp of last update scan
4. Reboot Required

Checks registry key:

HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired
Returns True or False
Triggers
🔹 Reboot Required
Severity: WARNING
Fires when system reboot is required after updates
Manual close enabled
🔹 New Updates Installed
Severity: INFO
Fires when updates were installed within defined time window

Controlled by macro:

{$WIN_UPDATES.TRIGGERS.TIMEOUT}
Macros
Macro	Description	Default
{$WIN_UPDATES.TRIGGERS.INFO}	Enable/disable info triggers	1
{$WIN_UPDATES.TRIGGERS.TIMEOUT}	Time window for update detection	36h
How It Works
Zabbix Agent executes PowerShell commands using system.run
Commands query Windows Update API and registry
Data is collected every 2 hours
Triggers evaluate update state and generate alerts
