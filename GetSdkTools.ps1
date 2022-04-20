[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$sourceNugetExe = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"
$targetNugetExe = ".\nuget.exe"
if (Test-Path -Path .\Tools) {
    Remove-Item .\Tools -Force -Recurse -ErrorAction Ignore
}
Invoke-WebRequest $sourceNugetExe -OutFile $targetNugetExe
Set-Alias nuget $targetNugetExe -Scope Global -Verbose

##
##Download Plugin Registration Tool
##
./nuget install Microsoft.CrmSdk.XrmTooling.PluginRegistrationTool -O .\Tools
New-Item -Type Directory .\Tools\PluginRegistration
$prtFolder = Get-ChildItem ./Tools | Where-Object { $_.Name -match 'Microsoft.CrmSdk.XrmTooling.PluginRegistrationTool.' }
Move-Item .\Tools\$prtFolder\tools\*.* .\Tools\PluginRegistration
Remove-Item .\Tools\$prtFolder -Force -Recurse

##
##Download CoreTools
##
./nuget install  Microsoft.CrmSdk.CoreTools -O .\Tools
New-Item -Type Directory .\Tools\CoreTools
$coreToolsFolder = Get-ChildItem ./Tools | Where-Object { $_.Name -match 'Microsoft.CrmSdk.CoreTools.' }
Move-Item .\Tools\$coreToolsFolder\content\bin\coretools\*.* .\Tools\CoreTools
Remove-Item .\Tools\$coreToolsFolder -Force -Recurse

##
##Download Configuration Migration
##
./nuget install  Microsoft.CrmSdk.XrmTooling.ConfigurationMigration.Wpf -O .\Tools
New-Item -Type Directory .\Tools\ConfigurationMigration
$configMigFolder = Get-ChildItem ./Tools | Where-Object { $_.Name -match 'Microsoft.CrmSdk.XrmTooling.ConfigurationMigration.Wpf.' }
Move-Item .\Tools\$configMigFolder\tools\*.* .\Tools\ConfigurationMigration
Remove-Item .\Tools\$configMigFolder -Force -Recurse

##
##Download Package Deployer 
##
./nuget install  Microsoft.CrmSdk.XrmTooling.PackageDeployment.WPF -O .\Tools
New-Item -Type Directory .\Tools\PackageDeployment
$pdFolder = Get-ChildItem ./Tools | Where-Object { $_.Name -match 'Microsoft.CrmSdk.XrmTooling.PackageDeployment.Wpf.' }
Move-Item .\Tools\$pdFolder\tools\*.* .\Tools\PackageDeployment
Remove-Item .\Tools\$pdFolder -Force -Recurse

##
##ReMove-Item NuGet.exe
##
Remove-Item nuget.exe    