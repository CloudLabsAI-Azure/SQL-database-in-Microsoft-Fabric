Param (
    [Parameter(Mandatory = $true)]
    [string]
    $adminUsername,

     [string]
    $virtualMachineName,

    [string]
    $adminPassword
)

Start-Transcript -Path .\CustomScriptExtension.txt -Append

[Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls
[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"

Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force

mkdir C:\LabFiles
#Download zip file
Invoke-WebRequest -Uri "https://stfabcon.blob.core.windows.net/sqlscript/onpremsql.ps1" -OutFile "C:\LabFiles\onpremsql.ps1"


#Download LogonTask
# $WebClient = New-Object System.Net.WebClient
# $WebClient.DownloadFile("https://stfabcon.blob.core.windows.net/sqlscript/onpremsql.ps1","C:\LabFiles\onpremsql.ps1")

#Enable Auto-Logon
$AutoLogonRegPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
Set-ItemProperty -Path $AutoLogonRegPath -Name "AutoAdminLogon" -Value "1" -type String
Set-ItemProperty -Path $AutoLogonRegPath -Name "DefaultUsername" -Value "$($env:ComputerName)\$adminUsername" -type String
Set-ItemProperty -Path $AutoLogonRegPath -Name "DefaultPassword" -Value $adminPassword -type String
Set-ItemProperty -Path $AutoLogonRegPath -Name "AutoLogonCount" -Value "1" -type DWord

# Scheduled Task
$Trigger= New-ScheduledTaskTrigger -AtLogOn
$User= "$($env:ComputerName)\$adminUsername"
$Action= New-ScheduledTaskAction -Execute "C:\Windows\System32\WindowsPowerShell\v1.0\Powershell.exe" -Argument "-executionPolicy Unrestricted -File C:\LabFiles\onpremsql.ps1"
Register-ScheduledTask -TaskName "Setup" -Trigger $Trigger -User $User -Action $Action -RunLevel Highest -Force
Set-ExecutionPolicy -ExecutionPolicy bypass -Force
Restart-Computer -Force 
