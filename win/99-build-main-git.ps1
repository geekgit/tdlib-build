git clone https://github.com/tdlib/td
cd td
$LastCommitDate=$(git log -1 --pretty='%ad' --date=format:'%Y.%m.%d')
$LastCommitHash=$(git rev-parse --short HEAD)
cd ..
$Prefix='main'
$TdlibVersion=-join('git','-',$LastCommitDate,'-',$LastCommitHash)
$TdLibDir=-join('td','-',$Prefix,'-',$TdlibVersion)
Rename-Item 'td' $TdlibDir
$MainPath=$TdLibDir

cd $MainPath
mkdir build
cd build
cmake -DCMAKE_TOOLCHAIN_FILE=..\..\vcpkg\scripts\buildsystems\vcpkg.cmake ..
cmake --build .
Read-Host -Prompt "Press Enter to exit..."