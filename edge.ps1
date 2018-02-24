#-----------------------------------------------------------------------------
#
# This file is for dev use ONLY
# No packages that are part of the final image should be installed from here
#
#-----------------------------------------------------------------------------

$ErrorActionPreference = "Stop"

function Install-ChocoPackage($package) {
  Write-Output ""
  Write-Output "----------------------------------------------"
  Write-Output "Installing $package"
  Write-Output "----------------------------------------------"
  Write-Output ""

  choco install -y $package
}