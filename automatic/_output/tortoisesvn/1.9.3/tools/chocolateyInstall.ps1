$packageName = 'tortoisesvn'
$installerType = 'msi'
$silentArgs = '/quiet /qn /norestart ADDLOCAL=ALL'
$urlArray = @('https://sourceforge.net/projects/tortoisesvn/files/1.9.3/Application/TortoiseSVN-1.9.3.27038-win32-svn-1.9.3.msi', 'https://sourceforge.net/projects/tortoisesvn/files/1.9.3/Application/TortoiseSVN-1.9.3.27038-x64-svn-1.9.3.msi')
$url = $urlArray[0]
$checksum = '63a0ae6427bdd674f5b353a998b393026820756b'
$checksumType = 'sha1'
$url64 = $urlArray[1]
$checksum64 = '8005189f252f806f593a497a7cf85864751f1162'
$checksumType64 = 'sha1'
$validExitCodes = @(0,3010)

Install-ChocolateyPackage -PackageName "$packageName" `
                          -FileType "$installerType" `
                          -SilentArgs "$silentArgs" `
                          -Url "$url" `
                          -Url64bit "$url64" `
                          -ValidExitCodes $validExitCodes `
                          -Checksum "$checksum" `
                          -ChecksumType "$checksumType" `
                          -Checksum64 "$checksum64" `
                          -ChecksumType64 "$checksumType64"
