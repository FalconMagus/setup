# Setup for basic server machines

Disable-UAC

# Get the base URI path from the ScriptToCall value
$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$helperUri = $helperUri.Substring(0, $helperUri.LastIndexOf("/"))
$helperUri += "/scripts"
write-host "helper script base URI is $helperUri"

function executeScript {
    Param ([string]$script)
    write-host "executing $helperUri/$script ..."
	iex ((new-object net.webclient).DownloadString("$helperUri/$script"))
}

#--- Setting up Windows ---
executeScript "Windows10Debloater.ps1"
executeScript "FileExplorerSettings.ps1";
executeScript "SystemConfiguration.ps1";
executeScript "HyperV.ps1";
executeScript "CommonApplications.ps1"
executeScript "ServerApplications.ps1"

# checkout setup scripts
mkdir C:\git
Set-Location C:\git
git clone https://github.com/Dessyreqt/setup.git
Start-Process powershell -Verb runAs

Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula
