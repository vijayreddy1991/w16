$ErrorActionPreference = "Stop"

# Install choco
Set-ExecutionPolicy Bypass -Scope Process -Force
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

function Install-ChocoPackage($package) {
  Write-Output ""
  Write-Output "----------------------------------------------"
  Write-Output "Installing $package"
  Write-Output "----------------------------------------------"
  Write-Output ""

  choco install -y $package
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