Disable-InternetExplorerESC
Enable-RemoteDesktop
Set-StartScreenOptions -EnableBootToDesktop -EnableDesktopBackgroundOnStart -EnableShowStartOnActiveScreen -EnableSearchEverywhereInAppsView
Set-CornerNavigationOptions -EnableUsePowerShellOnWinX
Set-WindowsExplorerOptions -EnableShowFileExtensions
Set-ExecutionPolicy RemoteSigned -Force

choco install Firefox -installArgs l=en-US
choco install ConEmu 
choco install 7zip.install
choco install TortoiseGit
choco install filezilla
choco install putty.portable
choco install notepad2-mod
choco install paint.net
choco install python3
choco install pip
choco install curl
choco install pushbullet
choco install adblockplusfirefox
choco install skitch
choco install keepass
choco install skype 
choco install Listary 
choco install evernote 
choco install skitch
choco install PsGet
choco install fsviewer
choco install SublimeText3 
choco install SublimeText3.PackageControl
choco install FoxitReader 
choco install f.lux 
choco install tor-browser 
choco install uTorrent
choco install winmerge 
choco install teamviewer 

Import-Module PsGet
Install-Module Jump.Location
Install-Module PSReadline
Install-Module PsUrl

Install-WindowsUpdate

<# Manually install:
http://powertab.codeplex.com/
#>

<# 
Later - not accessible in this scope:
pip install --upgrade httpie

Other items of interest: 
choco install linqpad4
choco install calibre 
choco install truecrypt 
choco install ScriptCs
choco install SwissFileKnife 
choco install webpi

choco install HxD 
choco install NugetPackageExplorer 
choco install rdcman 
choco install mysql.workbench 
choco install fiddler4
choco install procexp

Probably unnecesary
choco install webmatrix 
choco install cmdermini.portable
#>