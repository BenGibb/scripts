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
choco install python3
choco install pip
choco install curl
choco install adblockplusfirefox
choco install PsGet
choco install fsviewer
choco install FoxitReader
choco install winmerge
choco install githubforwindows
choco install linqpad4
choco install ScriptCs
choco install SwissFileKnife 
choco install HxD 
choco install NugetPackageExplorer 
choco install rdcman 
choco install mysql.workbench 
choco install fiddler4
choco install procexp
choco install GoogleChrome 

Import-Module PsGet
Install-Module Jump.Location
Install-Module PSReadline
Install-Module PsUrl

<# 
Later - not accessible in this scope:
pip install --upgrade httpie

Other items of interest: 
choco install truecrypt 
choco install webpi

Probably unnecesary
choco install webmatrix 
choco install cmdermini.portable
#>