 <#
.SYNOPSIS
    # Set Password History to 24 (WN10-AC-000020).

.NOTES
    Author          : Tom Batchellor
    LinkedIn        : linkedin.com/in/batchellorTom/
    GitHub          : github.com/tBatchellor/STIGS/
    Date Created    : 2025-07-27
    Last Modified   : 2025-07-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000020

.TESTED ON
    Date(s) Tested  : 2025-07-27
    Tested By       : Tom Batchellor
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE

    Example syntax:
    PS C:\> .\__Remediation_STIG-ID-WN10-AC-000020.ps1 
#>

# Set Password History to 24 (WN10-AC-000020)

Write-Output "Setting password history to 24 passwords remembered..."

# Export the current security policy to a file
secedit /export /cfg C:\Temp\secpol.cfg

# Modify the PasswordHistorySize setting
(Get-Content C:\Temp\secpol.cfg) -replace 'PasswordHistorySize\s*=\s*\d+', 'PasswordHistorySize = 24' |
    Set-Content C:\Temp\secpol.cfg

# Apply the updated policy
secedit /configure /db C:\Windows\Security\Local.sdb /cfg C:\Temp\secpol.cfg /areas SECURITYPOLICY

# Clean up
Remove-Item C:\Temp\secpol.cfg

Write-Output "Password history requirement successfully set to 24." 
