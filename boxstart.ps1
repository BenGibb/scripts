Disable-InternetExplorerESC
Enable-RemoteDesktop
Set-StartScreenOptions -EnableBootToDesktop -EnableDesktopBackgroundOnStart -EnableShowStartOnActiveScreen -EnableSearchEverywhereInAppsView
Set-CornerNavigationOptions -EnableUsePowerShellOnWinX
Set-WindowsExplorerOptions -EnableShowFileExtensions
Set-ExecutionPolicy RemoteSigned -Force

cinst firefox
cinst cmdermini.portable
cinst 7zip.install
cinst TortoiseGit
cinst filezilla
cinst putty.portable
cinst notepad2-mod
cinst paint.net
cinst python3
cinst pip
cinst curl
cinst fiddler4
cinst procexp
cinst webmatrix
cinst adblockplusfirefox

pip install --upgrade httpie
Install-WindowsUpdate

<# Manually install:
MarkPad Mhttp://code52.org/DownmarkerWPF/
#>