## Created by Mike Hauser 
## Version 0.1
## Help Section

param([switch] $help,[switch] $repair)
if ($help)
{
    write-host "Help"
}

if ($repair)
{
    write-host "Repair"
}


### Variables ###
$scriptURL = 'https://raw.githubusercontent.com/corcystems/Cor_Script/main/Cor_Script.ps1'
$scriptPath = 'C:\Cor\Cor_Script.ps1'



### Functions ###
## Get Hash
$wc = [System.Net.WebClient]::new()
$localHash = Get-FileHash $scriptPath -Algorithm SHA256
$fileHash = Get-FileHash -InputStream ($wc.OpenRead($scriptURL)) -Algorithm SHA256
$fileHash.Hash -eq $localHash.Hash

## Update Script



## Show sript version



### CorCystem Tools ###
## CW Automate
# CWA Uninstall

# CWA Install

## CW ScreenConnect
# CWSC Uninstall

# CWSC Install

## CW ScreenConnect Hosted
# CWSCH Uninstall

# CWSCH Install

## Immybot
# Immybot Uninstall

# Immybot Install

## SentinelOne
# SentinelOne Uninstall

# SentinelOne Install




### Troubleshooting ###
## OS Cleanups
# SFC

# DISM

# Optimize

# Repair

# reset and clear print spooler

## Informational
# DSREGCMD /STATUS (for domain / azure join info)

# grab public ip

# speedtest
