 <#
.SYNOPSIS
    # Set Account Lockout Threshold to 3 invalid logon attempts (WN10-AC-000010).

.NOTES
    Author          : Tom Batchellor
    LinkedIn        : linkedin.com/in/batchellorTom/
    GitHub          : github.com/tBatchellor/STIGS/
    Date Created    : 2025-07-27
    Last Modified   : 2025-07-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000010

.TESTED ON
    Date(s) Tested  : 2025-07-27
    Tested By       : Tom Batchellor
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE

    Example syntax:
    PS C:\> .\__Remediation_STIG-ID-WN10-AC-000010.ps1 
#>

# Set Account Lockout Threshold to 3 invalid logon attempts (WN10-AC-000010)

Write-Output "Configuring Account Lockout Threshold to 3 bad logon attempts..."

# Use net accounts to set the threshold
net accounts /lockoutthreshold:3

Write-Output "Account Lockout Threshold successfully set to 3." 
