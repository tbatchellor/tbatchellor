 <#
.SYNOPSIS
    # Set Minimum Password Age to 1 day (WN10-AC-000030).

.NOTES
    Author          : Tom Batchellor
    LinkedIn        : linkedin.com/in/batchellorTom/
    GitHub          : github.com/tBatchellor/STIGS/
    Date Created    : 2025-07-27
    Last Modified   : 2025-07-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000030

.TESTED ON
    Date(s) Tested  : 2025-07-27
    Tested By       : Tom Batchellor
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE

    Example syntax:
    PS C:\> .\__Remediation_STIG-ID-WN10-AC-000030.ps1 
#>

# Set Minimum Password Age to 1 day (WN10-AC-000030)

Write-Output "Setting minimum password age to 1 day..."

# Use net accounts to configure the setting
net accounts /minpwage:1

Write-Output "Minimum password age successfully set to 1 day." 
