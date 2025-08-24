Linux, Exfiltration and Escalation Of Privilege Lab
Incident Response lab fully created by myself - covers creating a Linux vm, creating storage container in Azure, basic linux commands, script writing, creating rules in MDE, report writing, and more.

Google docs covering the full lab: https://docs.google.com/document/d/1pcssRize7ksabLfACIgAkX-AGibAjiMY9YSy28MlmuU/edit?tab=t.0

Youtube Video of whole lab: https://www.youtube.com/watch?v=YWhpAxc_Aco&ab_channel=GregEaster

Scenario: Company A has been noticing some PII information about employees might be getting leaked because of recent phishing attempts that have been perpetrated. Such information includes address, email address, and phone number. All of this information is stored on a linux server as a hidden file where only the root/sudo users have read and write access. There was a report by another employee the other day of a fellow employee messing with the computer while the root administrator was in the bathroom. The company has decided to investigate this.

Platforms and Languages Leveraged
Ubuntu Server 22.04 LTS
EDR Platform: Microsoft Defender for Endpoint
Kusto Query Language (KQL)
Azure Blob Storage
Steps Taken
1. Searched the DeviceFileEvents Table
One of the things we can look for is a file creation that the attacker might have performed in the time span that the company suspects (this is naturally when you placed the “attack script” in the VM). The day in question is X.

I used a query that searches for “FileCreated” Action type using the query below:
