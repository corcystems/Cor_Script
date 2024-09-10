<#
.Description
This is script for some basic tasks at CorCystems. Created by Mike Hauser Version 0.1
 #> 
 
.PARAMETER help
Determines if you are deploying to the Production or Dev DB server. Valid values are ProdDB_Server or DevDB_Server
Must be used with the region parameter. May not be used with the database parameter
 
.PARAMETER repair
Determines if you are deploying to the Sales or Product database. Valid values are sales or product
May not be used with the dbServer and region parameters

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
