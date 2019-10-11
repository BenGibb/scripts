if (!(Test-Path $PROFILE))  {
    "" | Set-Content $PROFILE
}

Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression

choco install -y 7zip.install git.install TortoiseGit filezilla putty.portable notepad2-mod paint.net Listary tor-browser wire linqpad HxD fiddler4 procexp aimp audacity resilio-sync-home calibre ConEmu curl freevideoeditor fsviewer gimp imgburn io-unlocker keepass.install keepass-keepasshttp notepad2-mod spotify teamviewer vlc

Import-Module PsGet
Install-Module Jump.Location
Install-WindowsUpdate


choco install FoxitReader -y

# scoop
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
scoop install jq curl less grep

