$ErrorActionPreference = "Stop"

# Install choco
Set-ExecutionPolicy Bypass -Scope Process -Force
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

$env:ChocolateyInstall = Convert-Path "$((Get-Command choco).path)\..\.."
Import-Module "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"

function Write-PackageInstall($package) {
  Write-Output ""
  Write-Output "----------------------------------------------"
  Write-Output "Installing $package"
  Write-Output "----------------------------------------------"
  Write-Output ""
}
function Install-ChocoPackage($package, $options) {
  Write-PackageInstall $package
  choco install -y $package $options
}

# Python 2.x
Install-ChocoPackage python2

# Node LTS (8.x at the time of writing)
Install-ChocoPackage nodejs-lts

# Installing Git
Install-ChocoPackage git
Update-SessionEnvironment
 
# Git and friends
# git-lfs includes git as a dependency so there is no need to install it explicitly
Install-ChocoPackage git-lfs

# Java 11
Install-ChocoPackage jdk11

# Ruby 2.x
Install-ChocoPackage ruby

# Google Cloud SDK
choco install -y gcloudsdk --version 0.0.0.20171229 

# Force UTF-8 for Python because it does not work at all with cp65001
# gcloud is broken without this fix
# Ref: https://stackoverflow.com/questions/35176270/python-2-7-lookuperror-unknown-encoding-cp65001
[Environment]::SetEnvironmentVariable("PYTHONIOENCODING", "UTF-8", "Machine")

# AWS cli
Install-ChocoPackage awscli

# Azure cli
Install-ChocoPackage azure-cli

# JFrog cli
Install-ChocoPackage jfrog-cli

# Terraform
Install-ChocoPackage terraform

# Packer
Install-ChocoPackage packer

# jq
Install-ChocoPackage jq

# Kubernetes cli
Install-ChocoPackage kubernetes-cli

# Docker client
Install-ChocoPackage docker

echo "================= Intalling Shippable CLIs ================="

git clone https://github.com/Shippable/node.git nodeRepo
Update-SessionEnvironment
.\nodeRepo\shipctl\x86_64\WindowsServer_2016\install.ps1
Remove-Item .\nodeRepo -Force -Recurse

echo "Installed Shippable CLIs successfully"
echo "-------------------------------------"
