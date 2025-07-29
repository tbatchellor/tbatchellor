# Threat Hunt Scenario: Unauthorized Google Chrome Installation and Suspicious Activity

## Reason for Threat Hunt
Recent cybersecurity news reported a rise in insider threats using unauthorized browser installations, specifically Google Chrome, to bypass corporate monitoring and access restricted or malicious sites. Management has directed a proactive threat hunt to identify any unauthorized Google Chrome installations or suspicious activities on company endpoints.

## Threat Event
Unauthorized Google Chrome Installation and Potential Data Exfiltration

## Steps the "Bad Actor" Took to Create Logs and IoCs
1. Downloaded the Google Chrome installer from: https://www.google.com/chrome/
2. Installed Google Chrome silently using the command: `ChromeSetup.exe /silent /install`
3. Launched Google Chrome from a non-standard directory (e.g., a folder on the Desktop named "Browser").
4. Used Google Chrome to browse potentially malicious or unauthorized sites (e.g., phishing sites or file-sharing platforms).
5. Created a file named `sensitive-data.txt` on the Desktop containing fake sensitive information (e.g., "Confidential: ProjectX Plans").
6. Transferred `sensitive-data.txt` to an external USB drive or uploaded it to a cloud service via Google Chrome.
7. Deleted `sensitive-data.txt` from the Desktop to cover tracks.

## Tables Used to Detect IoCs

| **Parameter** | **Description** |
|---------------|-----------------|
| **Name** | DeviceFileEvents |
| **Info** | [DeviceFileEvents Table](https://learn.microsoft.com/en-us/defender-xdr/advanced-hunting-devicefileevents-table) |
| **Purpose** | Detects the download of the Google Chrome installer, creation/deletion of `sensitive-data.txt`, and file transfers to external devices. |

| **Parameter** | **Description** |
|---------------|-----------------|
| **Name** | DeviceProcessEvents |
| **Info** | [DeviceProcessEvents Table](https://learn.microsoft.com/en-us/defender-xdr/advanced-hunting-deviceprocessevents-table) |
| **Purpose** | Identifies silent installation of Google Chrome and execution of `chrome.exe` from non-standard locations. |

| **Parameter** | **Description** |
|---------------|-----------------|
| **Name** | DeviceNetworkEvents |
| **Info** | [DeviceNetworkEvents Table](https://learn.microsoft.com/en-us/defender-xdr/advanced-hunting-devicenetworkevents-table) |
| **Purpose** | Detects Google Chrome network activity, including connections to suspicious or unauthorized domains. |

## Related Queries

### Detect Google Chrome installer download
```kql
DeviceFileEvents
| where FileName startswith "ChromeSetup"
| project Timestamp, DeviceName, FileName, ActionType
```

### Detect silent Google Chrome installation
```kql
DeviceProcessEvents
| where ProcessCommandLine contains "ChromeSetup.exe /silent /install"
| project Timestamp, DeviceName, ActionType, FileName, ProcessCommandLine
```

### Detect Google Chrome executable on disk in non-standard locations
```kql
DeviceFileEvents
| where FileName == "chrome.exe" and FolderPath !contains "Program Files"
| project Timestamp, DeviceName, RequestAccountName, ActionType, FolderPath
```

### Detect Google Chrome process execution
```kql
DeviceProcessEvents
| where FileName == "chrome.exe"
| project Timestamp, DeviceName, AccountName, ActionType, ProcessCommandLine
```

### Detect suspicious network activity from Google Chrome
```kql
DeviceNetworkEvents
| where InitiatingProcessFileName == "chrome.exe"
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
- **Author Name**: Alex Carter
- **Author Contact**: [LinkedIn Profile](https://www.linkedin.com/in/alexcarter-cyber/)
- **Date**: July 29, 2025

## Validated By
- **Reviewer Name**: [Pending Validation]
- **Reviewer Contact**: [Pending Validation]
- **Validation Date**: [Pending Validation]

## Additional Notes
- Ensure to check for Google Chrome installations in non-standard directories, as legitimate installations are typically in "C:\Program Files".
- Cross-reference network activity with known malicious or unauthorized domains.

## Revision History

| Version | Changes       | Date         | Modified By   |
|---------|---------------|--------------|---------------|
| 1.0     | Initial draft | July 29, 2025 | Alex Carter   |