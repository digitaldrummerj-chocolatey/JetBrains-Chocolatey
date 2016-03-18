$extractionPath = (${env:ProgramFiles(x86)}, ${env:ProgramFiles} -ne $null)[0]

$installDir = Join-Path $extractionPath 'JetBrains'

$uninstallExe = (gci "${installDir}/WebStorm 2016.1/bin/Uninstall.exe").FullName | sort -Descending | Select -first 1

$params = @{
	PackageName = $packageName;
	FileType = "exe";
	SilentArgs = "/S";
	File = $uninstallExe;
}   

Uninstall-ChocolateyPackage @params
