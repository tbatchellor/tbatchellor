 <#
.SYNOPSIS
    # Set Minimum Password Length to 14 characters (WN10-AC-000035).

.NOTES
    Author          : Tom Batchellor
    LinkedIn        : linkedin.com/in/batchellorTom/
    GitHub          : github.com/tBatchellor/STIGS/
    Date Created    : 2025-07-27
    Last Modified   : 2025-07-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000035

.TESTED ON
    Date(s) Tested  : 2025-07-27
    Tested By       : Tom Batchellor
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE

    Example syntax:
    PS C:\> .\__Remediation_STIG-ID-WN10-AC-000035.ps1 
#>

# Set Minimum Password Length to 14 characters (WN10-AC-000035)

Write-Output "Setting minimum password length to 14 characters..."

# Use net accounts to apply the setting
net accounts /minpwlen:14

Write-Output "Minimum password length successfully set to 14 characters." 
