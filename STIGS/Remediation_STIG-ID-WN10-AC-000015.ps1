 <#
.SYNOPSIS
    # Set Reset Account Lockout Counter After to 15 minutes (WN10-AC-000015).

.NOTES
    Author          : Tom Batchellor
    LinkedIn        : linkedin.com/in/batchellorTom/
    GitHub          : github.com/tBatchellor/STIGS/
    Date Created    : 2025-07-27
    Last Modified   : 2025-07-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000015

.TESTED ON
    Date(s) Tested  : 2025-07-27
    Tested By       : Tom Batchellor
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE

    Example syntax:
    PS C:\> .\__Remediation_STIG-ID-WN10-AC-000015.ps1 
#>

# Set Reset Account Lockout Counter After to 15 minutes (WN10-AC-000015)

Write-Output "Setting bad logon counter reset time to 15 minutes..."

# Use net accounts to set the reset counter time (in minutes)
net accounts /lockoutwindow:15

Write-Output "Bad logon counter reset time successfully set to 15 minutes." 
