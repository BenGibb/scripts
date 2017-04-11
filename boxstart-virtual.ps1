iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

choco install notepad2-mod 7zip.install git.install TortoiseGit filezilla python3 PsGet winmerge linqpad5 fiddler4 procexp GoogleChrome -y 
choco install firefox-dev -pre -packageParameters "l=en-US" -y 

Import-Module PsGet
Install-Module Jump.Location

choco install FoxitReader -y

# scoop
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
scoop install jq curl less grep
