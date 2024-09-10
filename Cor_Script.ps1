## Created by Mike Hauser 
## Version 0.1

## Get Hash
$wc = [System.Net.WebClient]::new()
$pkgurl = 'https://raw.githubusercontent.com/corcystems/Cor_Script/main/Cor_Script.ps1'
$localHash = Get-FileHash C:\Cor\Cor_Script.ps1 -Algorithm SHA256
$FileHash = Get-FileHash -InputStream ($wc.OpenRead($pkgurl)) -Algorithm SHA256
$FileHash.Hash -eq $localHash.Hash
