 <#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Tom Batchellor
    LinkedIn        : linkedin.com/in/batchellorTom/
    GitHub          : github.com/tBatchellor
    Date Created    : 2025-07-25
    Last Modified   : 2025-07-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 2025-07-25
    Tested By       : Tom Batchellor
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE

    Example syntax:
    PS C:\> .\__Remediation_STIG-ID-WN10-AU-000500.ps1 
#>

#
# PowerShell script to create a registry key and set a DWORD value

# Define the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Eventlog\Application"
$valueName = "MaxSize"
$valueData = 0x00010000  # This is 65536 in decimal

# Create the registry key if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the DWORD value
New-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -PropertyType DWord -Force | Out-Null

Write-Output "Registry key and value successfully created." 
