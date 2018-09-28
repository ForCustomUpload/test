If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))

{   
Start-Process powershell -Verb runAs -ArgumentList '-ExecutionPolicy Bypass -command [xml]$myXML = Get-Content ${env:ProgramFiles(x86)}\"\SmartSoft\SmartSoft Invoices Automated Clients\SsiAutoClientManager.exe.config\";
cd ${env:ProgramFiles(x86)}\"\SmartSoft\SmartSoft Invoices Automated Clients\";
[string]$ImgCount="0";
[string]$OcrCount="8";
[string]$ClassCount="0";
[string]$CaptureCount="0";
[string]$ExportCount="0";
$myXML.configuration.appSettings.ChildNodes.Item(0).value=$ImgCount;
$myXML.configuration.appSettings.ChildNodes.Item(1).value=$OcrCount;
$myXML.configuration.appSettings.ChildNodes.Item(2).value=$ClassCount;
$myXML.configuration.appSettings.ChildNodes.Item(3).value=$CaptureCount;
$myXML.configuration.appSettings.ChildNodes.Item(4).value=$ExportCount;
$myXML.Save((Resolve-Path "SsiAutoClientManager.exe.config"));
net stop SsiAutoClientManager;
net start SsiAutoClientManager
'
Break
}

