choco install ConEmu -y
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
choco install Listary  -y
choco install evernote  -y
choco install skitch -y
choco install PsGet -y
choco install SublimeText3  -y
choco install SublimeText3.PackageControl -y
choco install FoxitReader  -y
choco install f.lux  -y
choco install tor-browser  -y
choco install uTorrent -y
choco install winmerge -y
choco install linqpad4 -y
choco install ScriptCs -y
choco install SwissFileKnife  -y
choco install HxD  -y
choco install NugetPackageExplorer  -y
choco install rdcman  -y
choco install mysql.workbench  -y
choco install fiddler4 -y
choco install procexp -y
choco install GoogleChrome  -y
choco install nodejs.install -y

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
#>