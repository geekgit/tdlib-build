$IsAdmin=([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator");
Write-Host 'Admin: ' $IsAdmin
if (!$IsAdmin)
{
	Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs;
	exit; 
}
Start-Process -FilePath 'C:\git\tdlib-build\win\gperf-3.0.1.exe' -ArgumentList '/VerySilent','/SuppressMsgBoxes','/NoRestart' -Wait
[Environment]::SetEnvironmentVariable('Path', $env:Path + ';C:\Program Files (x86)\GnuWin32\bin', [EnvironmentVariableTarget]::Machine)
Read-Host -Prompt "Press Enter to exit..."