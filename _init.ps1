# Copy paste this to an admin PowerShell

. { iwr -useb https://boxstarter.org/bootstrapper.ps1 } | iex; Get-Boxstarter -Force

# Once the above is done, run this command

Install-BoxstarterPackage -PackageName https://raw.githubusercontent.com/Dessyreqt/setup/master/standard.ps1 -DisableReboots
