$packageName = '{{PackageName}}'
$packageVersion = '{{PackageVersion}}'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = '{{DownloadUrl}}'
Install-ChocolateyZipPackage -packageName "$packageName" -url "$url" -unzipLocation "$toolsDir"
try {
	$installDir = (gci $toolsDir -dir).FullName
	$osBitness = Get-ProcessorBits
	if ($osBitness -eq 64) {
		Remove-Item -Recurse (Join-Path "$installDir" '32')
	} else {
		Remove-Item -Recurse (Join-Path "$installDir" '64')
	}
	Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" $($_.Exception.Message)
  throw
}