choco install Firefox -installArgs l=en-US -y
choco install ConEmu  -y
choco install 7zip.install -y
choco install TortoiseGit -y
choco install filezilla -y
choco install putty.portable -y
choco install notepad2-mod -y
choco install paint.net -y
choco install python3 -y
choco install pip -y
choco install curl -y
choco install pushbullet -y
choco install adblockplusfirefox -y
choco install skitch -y
choco install keepass -y
choco install skype  -y
choco install Listary  -y
choco install evernote  -y
choco install PsGet -y
choco install fsviewer -y
choco install SublimeText3  -y
choco install SublimeText3.PackageControl -y
choco install FoxitReader  -y
choco install f.lux  -y
choco install tor-browser -y
choco install winmerge  -y
choco install teamviewer  -y
choco install avastfreeantivirus -y
choco install truecrypt  -y
choco install ScriptCs -y
choco install vim -y
choco install spotify -y

Import-Module PsGet
Install-Module Jump.Location
Install-Module PSReadline
Install-Module PsUrl

Install-WindowsUpdate

<# Manually install:
PowerTab		http://powertab.codeplex.com/
Fences			https://store.stardock.com/ 
EnhancedSteam	http://firefox.enhancedsteam.com/
#>

<# 
Later - not accessible in this scope:
pip install --upgrade httpie

Other items of interest: 
choco install linqpad4
choco install calibre 
choco install SwissFileKnife 

choco install HxD 
choco install NugetPackageExplorer 
choco install rdcman 
choco install mysql.workbench 
choco install fiddler4
choco install procexp
#>