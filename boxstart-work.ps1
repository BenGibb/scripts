iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

choco install 7zip.install git.install TortoiseGit filezilla putty.portable notepad2-mod paint.net python3 pip Listary PsGet f.lux tor-browser winmerge linqpad HxD fiddler4 procexp GoogleChrome nodejs.install -y 

Import-Module PsGet
Install-Module Jump.Location
Install-WindowsUpdate


choco install FoxitReader -y

# scoop
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
scoop install jq curl less grep

refreshenv

pip install --user httpie csvkit virtualenv workon csv-to-sqlite azure-cli
