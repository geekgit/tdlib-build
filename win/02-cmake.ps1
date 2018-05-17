$IsAdmin=([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator");
Write-Host 'Admin: ' $IsAdmin
if (!$IsAdmin)
{
	Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs;
	exit; 
}
Install-Package -ProviderName ChocolateyGet -name cmake -Force
[Environment]::SetEnvironmentVariable('Path', $env:Path + ';C:\Program Files\CMake\bin', [EnvironmentVariableTarget]::Machine)
Read-Host -Prompt "Press Enter to exit..."