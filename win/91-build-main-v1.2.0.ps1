$Prefix='main'
$TdlibVersion='1.2.0'
$TdlibArchive=-join('v',$TdlibVersion,'.zip')
$TdlibArchiveUrl=-join('https://github.com/tdlib/td/archive/',$TdlibArchive)
$TdLibDirOriginal=-join('td','-',$TdlibVersion)
$TdLibDir=-join('td','-',$Prefix,'-',$TdlibVersion)
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
}
Rename-Item $TdlibDirOriginal $TdLibDir
cd $MainPath
mkdir build
cd build
cmake -DCMAKE_TOOLCHAIN_FILE=C:\vcpkg\scripts\buildsystems\vcpkg.cmake ..
cmake --build .
Read-Host -Prompt "Press Enter to exit..."