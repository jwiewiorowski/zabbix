📅 Date Expiration Alarm (Zabbix Template)

This Zabbix template monitors a specified date and generates alerts when the expiration date is approaching.

🔧 How It Works
The template uses a script item that calculates the number of days remaining until a given date. The date is provided via a user macro: {$WHEN}

The script:
Parses the provided date
Compares it with the current date
Returns the number of days remaining
Returns 0 if:
the date is invalid
the date has already passed
no value is provided
📊 Item
Name: How many days left
Type: Script
Key: zbliza_sie_data
Update interval: 1 hour

🚨 Triggers
The template defines two alert levels:

Warning
Condition: less than 22 days and more than 4 days remaining
Message:
Expires in {ITEM.LASTVALUE} days

Disaster
Condition: less than 4 days remaining
Message:
Expires in {ITEM.LASTVALUE} days

Both triggers require manual closing.

⚙️ Macro
{$WHEN} – target expiration date (format: YYYY-MM-DD)
Example:

2026-12-31
📁 Use Case

This template is useful for monitoring:

SSL certificate expiration
License expiry dates
Contract deadlines
Any time-based events requiring alerts before expiration
