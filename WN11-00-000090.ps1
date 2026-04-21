<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Danny Bruna
    LinkedIn        : https://www.linkedin.com/in/dr-danny-bruna
    GitHub          : https://github.com/DBruna84
    Date Created    : April 20, 2026
    Last Modified   : April 20, 2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-00-000090 
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-00-000090/

.TESTED ON
    Date(s) Tested  : April 20, 2026
    Tested By       : Danny Bruna
    Systems Tested  : Windows 11 Professional 
    PowerShell Ver. : Major-5 Minor-1 Build-26100  Revision-8115

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# 🎯 Minimal, Direct Remediation (PowerShell)
1. Set Password Expiration Policy

STIG baseline typically requires ≤ 60 days:

net accounts /maxpwage:60
2. Remove “Password Never Expires” from All Local Accounts
Get-LocalUser | Where-Object {$_.PasswordNeverExpires -eq $true} | ForEach-Object {
    Set-LocalUser -Name $_.Name -PasswordNeverExpires $false
}
3. Verify Compliance
net accounts
Get-LocalUser | Select Name, PasswordNeverExpires

You should see:

Maximum password age (days): 60
All users → PasswordNeverExpires = False
