# Enter in your VPN name (your choice), the server address provided by your admin, and the Preshared key provided
# by your admin.

$vpnname = ''
$server = ''
$preshared = ''

Add-VpnConnection -Name $vpnname -ServerAddress $server -TunnelType L2tp -L2tpPsk $preshared -AuthenticationMethod Pap -SplitTunneling -AllUserConnection -Force -RememberCredential

# Creates folder on desktop for Win10
New-Item -ItemType directory -Path  C:\Users\Public\Desktop\YOUR_FOLDER_NAME_HERE

# Creates a VPN Shortcut within the above created folder.
# NOTE: shortcut needs to be in a folder, else Win10 auto-deletes VPN shortcut off desktop.
$TargetFile = "C:\Windows\System32\rasphone.exe"
$ShortcutFile = "$env:Public\Desktop\YOUR_FOLDER_NAME_HERE\SHORTCUT_NAME_HERE.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Arguments = '-d "VPN_NAME_HERE"'
$Shortcut.Save()
