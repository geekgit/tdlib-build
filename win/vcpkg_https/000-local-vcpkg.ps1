git clone -b force_https https://github.com/geekgit/vcpkg
$Mirror=Read-Host -Prompt 'Enter https mirror (domain)'
$OldContent=$(Get-Content "vcpkg\scripts\cmake\vcpkg_find_acquire_program.cmake")
$NewContent=$OldContent.replace("mirror.local",$Mirror)
$NoBom=New-Object System.Text.UTF8Encoding $False
[System.IO.File]::WriteAllLines("vcpkg\scripts\cmake\vcpkg_find_acquire_program.cmake.old",$OldContent,$NoBom)
[System.IO.File]::WriteAllLines("vcpkg\scripts\cmake\vcpkg_find_acquire_program.cmake",$NewContent,$NoBom)
cd vcpkg
.\bootstrap-vcpkg.bat
.\vcpkg.exe install openssl:x64-windows openssl:x86-windows zlib:x64-windows zlib:x86-windows
Read-Host -Prompt "Press Enter to exit..."