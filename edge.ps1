$ErrorActionPreference = "Stop"

function Install-ChocoPackage($package) {
  Write-Output ""
  Write-Output "----------------------------------------------"
  Write-Output "Installing $package"
  Write-Output "----------------------------------------------"
  Write-Output ""

  choco install -y $package
}