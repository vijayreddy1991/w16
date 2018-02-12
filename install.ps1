$ErrorActionPreference = "Stop"

# Install choco
Set-ExecutionPolicy Bypass -Scope Process -Force
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

function Install-ChocoPackage($package, $options) {
  Write-Output ""
  Write-Output "----------------------------------------------"
  Write-Output "Installing $package"
  Write-Output "----------------------------------------------"
  Write-Output ""

  choco install -y $package $options
}

# Python 2.x
Install-ChocoPackage python2

# Node LTS
Install-ChocoPackage nodejs-lts

# Git and friends
Install-ChocoPackage git
Install-ChocoPackage git-lfs

# Java 8
Install-ChocoPackage jdk8

# Ruby 2.x
Install-ChocoPackage ruby

# Google Cloud SDK
Install-ChocoPackage gcloudsdk --ignore-checksum
# Force UTF-8 for Python because it does not work at all with cp65001
# Ref: https://stackoverflow.com/questions/35176270/python-2-7-lookuperror-unknown-encoding-cp65001
[Environment]::SetEnvironmentVariable("PYTHONIOENCODING", "UTF-8", "Machine")