 <#
.SYNOPSIS
    This PowerShell script to enable Microsoft Defender Firewall for all profiles.

.NOTES
    Author          : Tom Batchellor
    LinkedIn        : linkedin.com/in/batchellorTom/
    GitHub          : github.com/tBatchellor/STIGS/
    Date Created    : 2025-07-25
    Last Modified   : 2025-07-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-00135

.TESTED ON
    Date(s) Tested  : 2025-07-25
    Tested By       : Tom Batchellor
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE

    Example syntax:
    PS C:\> .\__Remediation_STIG-ID-WN10-00-000135.ps1 
#>

#
# PowerShell script to enable Microsoft Defender Firewall for all profiles

Write-Output "Enabling Microsoft Defender Firewall..."

Set-NetFirewallProfile -Profile Domain,Private,Public -Enabled True

Write-Output "Firewall successfully enabled for Domain, Private, and Public profiles."
