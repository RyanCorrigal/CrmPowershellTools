[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$sourceNugetExe = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"
$targetNugetExe = ".\nuget.exe"
Remove-Path-Item .\Tools -Force -Recurse -ErrorAction Ignore
Invoke-WebRequest $sourceNugetExe -OutFile $targetNugetExe
Set-Alias nuget $targetNugetExe -Scope Global -Verbose

##
##Download Plugin Registration Tool
##
./nuget install Microsoft.CrmSdk.XrmTooling.PluginRegistrationTool -O .\Tools
New-Item -Type Directory .\Tools\PluginRegistration
$prtFolder = Get-ChildItem ./Tools | Where-Object {$_.Name -match 'Microsoft.CrmSdk.XrmTooling.PluginRegistrationTool.'}
Move-Path .\Tools\$prtFolder\tools\*.* .\Tools\PluginRegistration
Remove-Path-Item .\Tools\$prtFolder -Force -Recurse

##
##Download CoreTools
##
./nuget install  Microsoft.CrmSdk.CoreTools -O .\Tools
New-Item -Type Directory .\Tools\CoreTools
$coreToolsFolder = Get-ChildItem ./Tools | Where-Object {$_.Name -match 'Microsoft.CrmSdk.CoreTools.'}
Move-Path .\Tools\$coreToolsFolder\content\bin\coretools\*.* .\Tools\CoreTools
Remove-Path-Item .\Tools\$coreToolsFolder -Force -Recurse

##
##Download Configuration Migration
##
./nuget install  Microsoft.CrmSdk.XrmTooling.ConfigurationMigration.Wpf -O .\Tools
New-Item -Type Directory .\Tools\ConfigurationMigration
$configMigFolder = Get-ChildItem ./Tools | Where-Object {$_.Name -match 'Microsoft.CrmSdk.XrmTooling.ConfigurationMigration.Wpf.'}
Move-Path .\Tools\$configMigFolder\tools\*.* .\Tools\ConfigurationMigration
Remove-Path-Item .\Tools\$configMigFolder -Force -Recurse

##
##Download Package Deployer 
##
./nuget install  Microsoft.CrmSdk.XrmTooling.PackageDeployment.WPF -O .\Tools
New-Item -Type Directory .\Tools\PackageDeployment
$pdFolder = Get-ChildItem ./Tools | Where-Object {$_.Name -match 'Microsoft.CrmSdk.XrmTooling.PackageDeployment.Wpf.'}
Move-Path .\Tools\$pdFolder\tools\*.* .\Tools\PackageDeployment
Remove-Path-Item .\Tools\$pdFolder -Force -Recurse

##
##Remove-Path NuGet.exe
##
Remove-Path-Item nuget.exe    