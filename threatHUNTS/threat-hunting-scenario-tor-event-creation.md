

# Threat Hunt Scenario: Unauthorized Firefox Installation and Suspicious Activity

## Reason for Threat Hunt
Recent cybersecurity news reported a rise in insider threats using unauthorized browser installations, specifically Firefox, to bypass corporate monitoring and access restricted or malicious sites. Management has directed a proactive threat hunt to identify any unauthorized Firefox installations or suspicious activities on company endpoints.

## Threat Event
Unauthorized Firefox Installation and Potential Data Exfiltration

## Steps the "Bad Actor" Took to Create Logs and IoCs
1. Downloaded the Firefox installer from: https://www.mozilla.org/en-US/firefox/download/thanks/
2. Installed Firefox silently using the command: `firefox-130.0.exe /S`
3. Launched Firefox from a non-standard directory (e.g., a folder on the Desktop named "Browser").
4. Used Firefox to browse potentially malicious or unauthorized sites (e.g., phishing sites or file-sharing platforms).
5. Created a file named `sensitive-data.txt` on the Desktop containing fake sensitive information (e.g., "Confidential: ProjectX Plans").
6. Transferred `sensitive-data.txt` to an external USB drive or uploaded it to a cloud service via Firefox.
7. Deleted `sensitive-data.txt` from the Desktop to cover tracks.

## Tables Used to Detect IoCs

| **Parameter** | **Description** |
|---------------|-----------------|
| **Name** | DeviceFileEvents |
| **Info** | [DeviceFileEvents Table](https://learn.microsoft.com/en-us/defender-xdr/advanced-hunting-devicefileevents-table) |
| **Purpose** | Detects the download of the Firefox installer, creation/deletion of `sensitive-data.txt`, and file transfers to external devices. |

| **Parameter** | **Description** |
|---------------|-----------------|
| **Name** | DeviceProcessEvents |
| **Info** | [DeviceProcessEvents Table](https://learn.microsoft.com/en-us/defender-xdr/advanced-hunting-deviceprocessevents-table) |
| **Purpose** | Identifies silent installation of Firefox and execution of `firefox.exe` from non-standard locations. |

| **Parameter** | **Description** |
|---------------|-----------------|
| **Name** | DeviceNetworkEvents |
| **Info** | [DeviceNetworkEvents Table](https://learn.microsoft.com/en-us/defender-xdr/advanced-hunting-devicenetworkevents-table) |
| **Purpose** | Detects Firefox network activity, including connections to suspicious or unauthorized domains. |

## Related Queries

### Detect Firefox installer download
```kql
DeviceFileEvents
| where FileName startswith "firefox"
| project Timestamp, DeviceName, FileName, ActionType
```

### Detect silent Firefox installation
```kql
DeviceProcessEvents
| where ProcessCommandLine contains "firefox-130.0.exe /S"
| project Timestamp, DeviceName, ActionType, FileName, ProcessCommandLine
```

### Detect Firefox executable on disk in non-standard locations
```kql
DeviceFileEvents
| where FileName == "firefox.exe" and FolderPath !contains "Program Files"
| project Timestamp, DeviceName, RequestAccountName, ActionType, FolderPath
```

### Detect Firefox process execution
```kql
DeviceProcessEvents
| where FileName == "firefox.exe"
| project Timestamp, DeviceName, AccountName, ActionType, ProcessCommandLine
```

### Detect suspicious network activity from Firefox
```kql
DeviceNetworkEvents
| where InitiatingProcessFileName == "firefox.exe"
| where RemoteUrl contains_any ("dropbox.com", "drive.google.com", "onedrive.live.com") or RemoteIPType == "External"
| project Timestamp, DeviceName, InitiatingProcessAccountName, InitiatingProcessFileName, RemoteIP, RemoteUrl
| order by Timestamp desc
```

### Detect creation, modification, or deletion of sensitive-data.txt
```kql
DeviceFileEvents
| where FileName == "sensitive-data.txt"
| project Timestamp, DeviceName, ActionType, FileName, FolderPath
```

## Created By
- **Author Name**: Tom Batchellor
- **Author Contact**: [LinkedIn Profile](https://www.linkedin.com/in/batchellorTom/)
- **Date**: July 28, 2025

## Validated By
- **Reviewer Name**: [Pending Validation]
- **Reviewer Contact**: [Pending Validation]
- **Validation Date**: [Pending Validation]

## Additional Notes
- Ensure to check for Firefox installations in non-standard directories, as legitimate installations are typically in "C:\Program Files".
- Cross-reference network activity with known malicious or unauthorized domains.

## Revision History

| Version | Changes       | Date         | Modified By   |
|---------|---------------|--------------|---------------|
| 1.0     | Initial draft | July 28, 2025 | Tom Batchellor   |
