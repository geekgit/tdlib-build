git clone https://github.com/tdlib/td
cd td
$LastCommitDate=$(git log -1 --pretty='%ad' --date=format:'%Y.%m.%d')
$LastCommitHash=$(git rev-parse --short HEAD)
cd ..
$Prefix='csharp'
$TdlibVersion=-join('git','-',$LastCommitDate,'-',$LastCommitHash)
$TdLibDir=-join('td','-',$Prefix,'-',$TdlibVersion)
Rename-Item 'td' $TdlibDir
$CsharpPath=-join($TdLibDir,'\example\csharp')

cd $CsharpPath
mkdir build
cd build
cmake -DTD_ENABLE_DOTNET=ON -DCMAKE_TOOLCHAIN_FILE=..\..\..\vcpkg\scripts\buildsystems\vcpkg.cmake ../../..
cmake --build . --config Release
cmake --build . --config Debug
Read-Host -Prompt "Press Enter to exit..."