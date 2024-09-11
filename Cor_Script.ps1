<#
.NOTES
Author:  Mike Hauser
Version: 0.1

.SYNOPSIS
This is script for some basic tasks at CorCystems.

.Description
This is script can be used by technicians for basic CorCystems tasks.

.PARAMETER Help
Help to view examples and script info.

.PARAMETER Silent
Silently run some functions without needing to navigatge through a menu.

.EXAMPLE
PS> C:\Cor_Script.ps1 -silent InstallCWA
Install CW Automate.

.EXAMPLE
PS> C:\Cor_Script.ps1 -silent UninstallCWA
Uninstall CW Automate.

.EXAMPLE
PS> C:\Cor_Script.ps1 -silent SpeedTest
Runs an internet speed test on the machine.

#>

[cmdletbinding()]
param(
    [switch] $Help,
    [parameter(Mandatory = $false, ParameterSetName = 'Silent')]
    [ValidateSet("CWAInstall","CWAUninstall","CWSCInstall","CWSCUninstall","CWSCHInstall","CWSCHUninstall","GetIP","ImmyInstall","ImmyUninstall","PrintRepair","SpeedTest")]
    [string] $Silent
)

if ($help){
    write-host "Help"
}

if ($silent){
    Switch ($silent) {
        "CWAInstall" {
            $silentApp = "CWA-Install"
        }
        "CWAUninstall" {
            $silentApp = "CWA-Unistall"
        }
        "CWSCInstall" {
            $silentApp = "CWSC-Install"
        }
        "CWSCUninstall" {
            $silentApp = "CWSC-Unistall"
        }
        "CWSCHInstall" {
            $silentApp = "CWSCH-Install"
        }
        "CWSCHUninstall" {
            $silentApp = "CWSCH-Unistall"
        }
        "GetIP" {
            $silentApp = "Public-IP"
        }
        "ImmyInstall" {
            $silentApp = "Immy-Install"
        }
        "ImmyUninstall" {
            $silentApp = "Immy-Uninstall"
        }
        "PrintRepair" {
            $silentApp = "Repair-Spooler"
        }
        "SpeedTest" {
            $silentApp = "Speed-Test"
        }
    }
}







######### Variables #########
$scriptVersion = '0.1'
$scriptURL = 'https://raw.githubusercontent.com/corcystems/Cor_Script/main/Cor_Script.ps1'
$scriptPath = 'C:\CorTools\Cor_Script.ps1'






######### Functions #########
## Get and Compare Script Hash
function Get-Hash {
$wc = [System.Net.WebClient]::new()
$localHash = Get-FileHash $scriptPath -Algorithm SHA256
$fileHash = Get-FileHash -InputStream ($wc.OpenRead($scriptURL)) -Algorithm SHA256
if($fileHash.Hash -eq $localHash.Hash){
    write-host "Script already up to date. Going back to Main Menu."
    Main-Menu
} else {
    Update-CorScript
}
}

## Update Script
function Update-CorScript {
    clear
    write-host "updating Script"
    Invoke-WebRequest -Uri $scriptURL -OutFile $scriptPath
    exit
}


### CorCystem Tools Functions ###
## CW Automate
# CWA Uninstall
function CWA-Uninstall{
    clear
    write-host "CWA Uninstall"
    AfterOptions-Menu
}
# CWA Install
function CWA-Install{
    clear
    write-host "CWA Install"
    AfterOptions-Menu
}

## CW ScreenConnect
# CWSC Uninstall
function CWSC-Uninstall{
    clear
    write-host "CWSC Uninstall"
    AfterOptions-Menu
}
# CWSC Install
function CWSC-Install{
    clear
    write-host "CWSC Install"
    AfterOptions-Menu
}
## CW ScreenConnect Hosted
# CWSCH Uninstall
function CWSCH-Uninstall{
    clear
    write-host "CWSCH Uninstall"
    AfterOptions-Menu
}
# CWSCH Install
function CWSCH-Install{
    clear
    write-host "CWSCH Install"
    AfterOptions-Menu
}

## Immybot
# Immybot Uninstall
function Immy-Uninstall{
    clear
    write-host "Immybot Uninstall"
    AfterOptions-Menu
}
# Immybot Install
function Immy-Install{
    clear
    write-host "Immybot Install"
    AfterOptions-Menu
}


### Troubleshooting Functions ###
## OS Cleanups
# SFC
function SFC-Scan{
    clear
    write-host "sfc /scannow"
    AfterOptions-Menu
}
# DISM
function DISM-Scan{
    clear
    write-host "dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase"
    write-host "dism.exe /Online /Cleanup-Image /RestoreHealth"
    AfterOptions-Menu
}
# Optimize
function Optimize-Vol{
    clear
    write-host "Optimize-Volume -DriveLetter C -Defrag -Verbose"
    AfterOptions-Menu
}
# Repair
function Repair-Vol{
    clear
    write-host "Repair-Volume -DriveLetter C -OfflineScanAndFix"
    AfterOptions-Menu
}
# reset and clear print spooler
function Repair-Spooler{
    clear
    write-host "Repair Spooler"
    AfterOptions-Menu
}

## Informational 
# DSREGCMD /STATUS (for domain / azure join info)
function Domain-Info{
    clear
    DSREGCMD /STATUS
    AfterOptions-Menu
}

# grab public ip
function Public-IP{
    clear
    Invoke-RestMethod -Uri https://ipinfo.io
    AfterOptions-Menu
}

# speedtest
function Speed-Test{
    clear
    $speedtestScript = (new-object Net.WebClient).DownloadString('https://raw.githubusercontent.com/corcystems/Corcystems-Public/master/speedtest.ps1')
    Invoke-Expression $speedtestScript
    AfterOptions-Menu
}





######### Menus #########
## Main Menu
function Main-Menu{
clear
$mainMenu=@"
1 CorCystems Tools
2 Troubleshooting
3 Update Script (current: $scriptVersion)
Q Quit
Select a task or Q to quit
"@

Write-Host "CorCystems, Inc. - Main Menu" -ForegroundColor Cyan
$mainMenuSelection = Read-Host $mainMenu

Switch($mainMenuSelection){
    "1" {
        CorTools-Menu
    }
    "2" {
        Troubleshooting-Menu
    }
    "3" {
        Update-CorScript
    }
    "Q" {
        Write-Host "Quitting" -ForegroundColor Green
    } default {
        Write-Host "Please type a valid option and try again." -ForegroundColor Yellow
    }
    }
}

### CorTools Menu ###
function CorTools-Menu{
clear
$corToolsMenu=@"
1 CW Automate
2 CW ScreenConnect
3 CW ScreenConnect (Hosted)
4 ImmyBot
B Go Back to Main Menu.
Q Quit
Select a task or Q to quit
"@

Write-Host "CorCystems, Inc. - Cor Tools Menu" -ForegroundColor Cyan
$corToolsMenuSelection = Read-Host $corToolsMenu

Switch($corToolsMenuSelection){
    "1" {
        $corApp = "CWA"
        CorToolsOptions-Menu
    }
    "2" {
        $corApp = "CWSC"
        CorToolsOptions-Menu
    }
    "3" {
        $corApp = "CWSCH"
        CorToolsOptions-Menu
    }
    "4" {
        $corApp = "Immy"
        CorToolsOptions-Menu
    }
    "B" {
        Main-Menu
    }
    "Q" {
        Write-Host "Quitting" -ForegroundColor Green
    } default {
        Write-Host "Please type a valid option and try again." -ForegroundColor Yellow
    }
    }
}

### CorTools-Menu Menu ###
function CorToolsOptions-Menu{
clear
$corToolsMenuOptions=@"
1 Uninstall
2 Install
B Go Back to Main Menu.
Q Quit
Select a task or Q to quit
"@
    
Write-Host "CorCystems, Inc. - Cor Tools Options Menu" -ForegroundColor Cyan
$corToolsMenuOptionsSelection = Read-Host $corToolsMenuOptions

Switch($corToolsMenuOptionsSelection){
    "1" {
        $corAppAction = "Uninstall"
        $corAppSelection = $corApp + '-' + $corAppAction
        & $corAppSelection

    }
    "2" {
        $corAppAction = "Install"
        $corAppSelection = $corApp + '-' + $corAppAction
        & $corAppSelection           
    }
    "B" {
        Main-Menu
    }
    "Q" {
        Write-Host "Quitting" -ForegroundColor Green
    } default {
        Write-Host "Please type a valid option and try again." -ForegroundColor Yellow
    }
    }
}


### Troubleshooting-Menu Menu ###
function Troubleshooting-Menu{
clear
$troubleshootingMenu=@"
1 Grab Domain-Info
2 Grab Public IP
3 Optimize C Drive Volume
4 Repair C Drive Volume
5 Repair Print Spooler
6 Run a DISM Scan
7 Run a SFC Scan
8 Run a SpeedTest
B Go Back to Main Menu.
Q Quit
Select a task or Q to quit
"@
        
Write-Host "CorCystems, Inc. - Troubleshooting Menu" -ForegroundColor Cyan
$troubleshootingMenuSelection = Read-Host $troubleshootingMenu

Switch($troubleshootingMenuSelection){
    "1" {
        Domain-Info
    }
    "2" {
        Public-IP
    }
    "3" {
        Optimize-Vol
    }
    "4" {
        Repair-Vol
    }
    "5" {
        Repair-Spooler
    }
    "6" {
        DISM-Scan
    }
    "7" {
        SFC-Scan
    }
    "8" {
        Speed-Test
    }
    "B" {
        Main-Menu
    }
    "Q" {
        Write-Host "Quitting" -ForegroundColor Green
    } default {
        Write-Host "Please type a valid option and try again." -ForegroundColor Yellow
    }
    }
}


### AfterTools-Menu Menu ###
function AfterOptions-Menu{
    if($silent){
            exit
        }
write-host ""
write-host ""
$afterToolsMenu=@"
B Go Back to Main Menu.
Q Quit
Select a task or Q to quit
"@

Write-Host "CorCystems, Inc. - After Tools Menu" -ForegroundColor Cyan
$afterToolsMenuSelection = Read-Host $afterToolsMenu

Switch ($afterToolsMenuSelection) {
    "B" {
        Main-Menu
    }
    "Q" {
        Write-Host "Quitting" -ForegroundColor Green
    }
    default {
        Write-Host "Please type a valid option and try again." -ForegroundColor Yellow
    }
    }
}



######### Script #########
if (-not $silent){
    Main-Menu
    } else {
    & $silentApp
    }
