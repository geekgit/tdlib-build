$Prefix='main'
$TdlibVersion='1.4.0'
$TdlibArchive=-join('v',$TdlibVersion,'.zip')
$TdlibArchiveUrl=-join('https://github.com/tdlib/td/archive/',$TdlibArchive)
$TdLibDirOriginal=-join('td','-',$TdlibVersion)
$TdLibDir=-join('td','-',$Prefix,'-',$TdlibVersion)
$TdLibOutDir=-join('td','-',$Prefix,'-',$TdlibVersion,'-','out')
$MainPath=$TdLibDir
if (Test-Path "$TdlibArchive")
{
Write-Host $TdlibArchive "exists"
}
else
{
curl.exe -L "$TdlibArchiveUrl" --output "$TdlibArchive"
}
if (Test-Path $TdLibDir)
{
Write-Host $TdlibDir "exists"
}
else
{
7z.exe x "$TdlibArchive"
Rename-Item $TdlibDirOriginal $TdLibDir
}
cd $MainPath
if (Test-Path "build")
{
Write-Host "build" "exists"
}
else
{
mkdir build
}
cd build
cmake -DCMAKE_TOOLCHAIN_FILE=C:\vcpkg\scripts\buildsystems\vcpkg.cmake ..
cmake --build . --config Release
Write-Host "Copy..."
cd ..
cd ..
if (Test-Path $TdLibOutDir)
{
Write-Host $TdlibOutDir "exists"
}
else
{
New-Item $TdlibOutDir -ItemType Directory
}
#LIBEAY32.dll
$LIBEAY32DLL=-join($TdLibDir,'\','build','\','Release','\','LIBEAY32.dll')
#SSLEAY32.dll
$SSLEAY32DLL=-join($TdLibDir,'\','build','\','Release','\','SSLEAY32.dll')
#tdjson.dll
$TDJSONDLL=-join($TdLibDir,'\','build','\','Release','\','tdjson.dll')
#tg_cli.exe
$TGCLIEXE=-join($TdLibDir,'\','build','\','Release','\','tg_cli.exe')
#zlib1.dll
$ZLIBDLL=-join($TdLibDir,'\','build','\','Release','\','zlib1.dll')
#
Copy-Item $LIBEAY32DLL -Destination $TdlibOutDir
Copy-Item $SSLEAY32DLL -Destination $TdlibOutDir
Copy-Item $TDJSONDLL -Destination $TdlibOutDir
Copy-Item $TGCLIEXE -Destination $TdlibOutDir
Copy-Item $ZLIBDLL -Destination $TdlibOutDir
#
Read-Host -Prompt "Press Enter to exit..."