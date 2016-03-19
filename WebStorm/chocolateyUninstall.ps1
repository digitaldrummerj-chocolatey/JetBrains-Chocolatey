$extractionPath = (${env:ProgramFiles(x86)}, ${env:ProgramFiles} -ne $null)[0]

$installDir = Join-Path $extractionPath 'JetBrains'

$installVersionDir  = Join-Path $installDir  "WebStorm 2016.1"

if (Test-Path ($installVersionDir)) {

	$uninstallExe = (gci "${installDir}/WebStorm 2016.1/bin/Uninstall.exe").FullName | sort -Descending | Select -first 1

	$params = @{
		PackageName = $packageName;
		FileType = "exe";
		SilentArgs = "/S";
		File = $uninstallExe;
	}   

	Uninstall-ChocolateyPackage @params
}
