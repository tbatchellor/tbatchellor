 <#
.SYNOPSIS
    # Set Maximum Password Age to 60 days (WN10-AC-000025).

.NOTES
    Author          : Tom Batchellor
    LinkedIn        : linkedin.com/in/batchellorTom/
    GitHub          : github.com/tBatchellor/STIGS/
    Date Created    : 2025-07-27
    Last Modified   : 2025-07-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000025

.TESTED ON
    Date(s) Tested  : 2025-07-27
    Tested By       : Tom Batchellor
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE

    Example syntax:
    PS C:\> .\__Remediation_STIG-ID-WN10-AC-000025.ps1 
#>

# Set Maximum Password Age to 60 days (WN10-AC-000025)

Write-Output "Setting maximum password age to 60 days..."

# Use net accounts to configure the setting
net accounts /maxpwage:60

Write-Output "Maximum password age successfully set to 60 days." 
