@echo off
color a
title = My Fuvking Tools =
:main
cls
echo.
echo ===== mY fUvKiNg ToOlS =====
echo.
echo === 1. Install Chocolatey (req. internet)
echo === 2. Install Softwares form Chocolatey (req. chocolatey, internet)
echo === 3. Install Softwares Ninite (req. internet)
echo === 4. Change Region and Time Zone to Thailand
echo === 5. Disable Defender (untill restart) and Update (incomplete)
echo === 6. Auto Backup Data
echo === 7. Debloat Windows By Chris Titus (req. internet)
echo === 8. Auto 1 2 4 5
echo.
echo ===== mY fUvKiNg ToOlS =====
echo.
set /p menu=Input Number:

if %menu% == 1 (goto installchoco
) else (if %menu% == 2 (goto install_choco
) else (if %menu% == 3 (goto install_software_ninite
) else (if %menu% == 4 (goto change_tz
) else (if %menu% == 5 (goto change_rg
) else (if %menu% == 6 (goto auto_backup
) else (if %menu% == 7 (goto debloat_windows
) else (if %menu% == 8 (goto auto_install_n_config
) else (goto error_command)))))))
)


:install_choco
rem 1. Install Chocolatey
powershell -command "Set-ExecutionPolicy AllSigned"
powershell -command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
echo Install Chocolatey
goto complete

:insatll_software_choco
rem 2. Install Softwares form Chocolatey (req. chocolatey, internet)
powershell -command "choco install 7zip.install winrar vlc googlechrome zoom line autohotkey sumatrapdf.install firefox jre8 notepadplusplus.install -y"
echo Install Software form Chocolatey
goto complete

:install_software_ninite
rem 3. Install Softwares Ninite (req. internet)
powershell -command "(New-Object Net.WebClient).DownloadFile('https://ninite.com/7zip-aimp-audacity-chrome-firefox-foxit-klitecodecs-notepadplusplus-sumatrapdf-vlc-winrar/ninite.exe', 'ninite.exe')"
ninite.exe
echo Install Software form Ninite
goto complete

:change_tz
rem 4. Change Region and Time Zone to Thailand
powershell -command "Set-WinHomeLocation 0xe3"
powershell -command "Set-WinSystemLocale th-TH"
powershell -command "Set-Culture -CultureInfo th-TH"
powershell -command "Set-TimeZone -id 'SE Asia Standard Time'"
reg add "HKEY_CURRENT_USER\Control Panel\International\Geo" /v "Nation" /d "227" /f
reg add "HKEY_CURRENT_USER\Control Panel\International\Geo" /v "Name" /d "TH" /f
echo Change Region and Time Zone
goto complete

:change_rg
rem 5. Disable Defender and Update (incomplete)
powershell -command "Set-MpPreference -DisableIntrusionPreventionSystem $true -DisableIOAVProtection $true -DisableRealtimeMonitoring $true -DisableScriptScanning $true -EnableControlledFolderAccess Disabled -EnableNetworkProtection AuditMode -Force -MAPSReporting Disabled -SubmitSamplesConsent NeverSend"
sc stop wuauserv
sc config wuauserv start=disabled
echo Disable Defender and Update
goto complete

:auto_backup
rem 6. Auto Backup Data
for /f "delims=;" %%i in ("Desktop;Documents;Favorites;Links;Music;Pictures;Saved Games;Videos") do robocopy "C:\Users\%username%\%%i" "D:\BackupDataCauto\%username%\%%i" /z /s /e /mt:16 /r:5 /w:5
echo Auto Backup.
goto complete

:debloat_windows
rem 7. Debloat Windows By Chris Titus
powershell -command "iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/JJ8R4'))"
echo Debloat
goto complete

:auto_install_n_config
rem 8. Auto 1 2 4 5
rem 1. Install Chocolatey
powershell -command "Set-ExecutionPolicy AllSigned"
powershell -command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"
rem 2. Install Softwares form Chocolatey (req. chocolatey, internet)
powershell -command "choco install 7zip.install winrar vlc googlechrome zoom line autohotkey sumatrapdf.install firefox jre8 notepadplusplus.install -y"
rem 4. Change Region and Time Zone to Thailand
powershell -command "Set-WinHomeLocation 0xe3"
powershell -command "Set-WinSystemLocale th-TH"
powershell -command "Set-Culture -CultureInfo th-TH"
powershell -command "Set-TimeZone -id 'SE Asia Standard Time'"
reg add "HKEY_CURRENT_USER\Control Panel\International\Geo" /v "Nation" /d "227" /f
reg add "HKEY_CURRENT_USER\Control Panel\International\Geo" /v "Name" /d "TH" /f
powershell -command "Set-MpPreference -DisableIntrusionPreventionSystem $true -DisableIOAVProtection $true -DisableRealtimeMonitoring $true -DisableScriptScanning $true -EnableControlledFolderAccess Disabled -EnableNetworkProtection AuditMode -Force -MAPSReporting Disabled -SubmitSamplesConsent NeverSend"
sc stop wuauserv
sc config wuauserv start=disabled
goto complete


:error_command
cls
echo.
echo Error.
pause > nul
goto main

:complete
echo.
echo Complete.
pause > nul
goto main
