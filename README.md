# Cor_Script

This is script can be used by technicians for basic CorCystems tasks.
The script is pushed to all new CWA Agents durring the onboarding script.
The script can also update itself by comparing the local hash to the hash of the file in github.

You can either run the script in Powershell with the full CLI Menus or you can run silently with examples below.
If you run from the ScreenConnect command window just tack on the powershell tags above the command.

ScreenConnect Example that runs a SpeedTest:
```
#!ps
#maxlength=100000
#timeout=600000
C:\CorTools\Cor_Script.ps1 -silent SpeedTest
```

## Cor Tools Examples
### Install CW Automate.
```
C:\CorTools\Cor_Script.ps1 -silent CWAInstall
```

### Uninstall CW Automate.
```
C:\CorTools\Cor_Script.ps1 -silent CWAUninstall
```

### Install CW ScreenConnect.
```
C:\CorTools\Cor_Script.ps1 -silent CWSCInstall
```
### Uninstall CW ScreenConnect.
```
C:\CorTools\Cor_Script.ps1 -silent CWSCUninstall
```

### Install Hosted CW ScreenConnect.
```
C:\CorTools\Cor_Script.ps1 -silent CWSCHInstall
```
### Uninstall Hosted CW ScreenConnect.
```
C:\CorTools\Cor_Script.ps1 -silent CWSCHUninstall
```

### Install ImmyBot.
```
C:\CorTools\Cor_Script.ps1 -silent ImmyInstall
```
### Uninstall ImmyBot.
```
C:\CorTools\Cor_Script.ps1 -silent ImmyUninstall
```


## Troubleshooting Examples
### Get Public IP Address.
```
C:\CorTools\Cor_Script.ps1 -silent GetIP
```

### Clean the Print Spooler.
```
C:\CorTools\Cor_Script.ps1 -silent PrintRepair
```
### Download Sys Internals Tools.
```
C:\CorTools\Cor_Script.ps1 -silent SysInternals
```


## Script Management Examples
### Update Script.
```
C:\CorTools\Cor_Script.ps1 -silent UpdateScript
```
