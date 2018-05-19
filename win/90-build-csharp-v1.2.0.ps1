$Prefix='csharp'
$TdlibVersion='1.2.0'
$TdlibArchive=-join('v',$TdlibVersion,'.zip')
$TdlibArchiveUrl=-join('https://github.com/tdlib/td/archive/',$TdlibArchive)
$TdLibDirOriginal=-join('td','-',$TdlibVersion)
$TdLibDir=-join('td','-',$Prefix,'-',$TdlibVersion)
$CsharpPath=-join($TdLibDir,'\example\csharp')
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
cd $CsharpPath
mkdir build
cd build
cmake -DTD_ENABLE_DOTNET=ON -DCMAKE_TOOLCHAIN_FILE=C:\vcpkg\scripts\buildsystems\vcpkg.cmake ../../..
cmake --build . --config Release
cmake --build . --config Debug
Read-Host -Prompt "Press Enter to exit..."