@echo off
setlocal enabledelayedexpansion

:menu
cls
echo PHP Version Checker and Switcher
echo ---------------------------
echo.
if defined LAST_ACTION (
    echo %LAST_ACTION%
) else (
    echo Current Status: Ready to check or switch PHP versions
)
echo.

echo.
echo 1. Check PHP Version                  2. Exit
echo.
echo 3. UNINSTALL PHP 5.6                  4. INSTALL PHP 5.6
echo.
echo 5. UNINSTALL PHP 7.0                  6. INSTALL PHP 7.0
echo.
echo 7. UNINSTALL PHP 7.1                  8. INSTALL PHP 7.1
echo.
echo 9. UNINSTALL PHP 7.2                  10. INSTALL PHP 7.2
echo.
echo 11. UNINSTALL PHP 7.3                 12. INSTALL PHP 7.3
echo.
echo 13. UNINSTALL PHP 7.4                 14. INSTALL PHP 7.4
echo.
echo 15. UNINSTALL PHP 8.0                 16. INSTALL PHP 8.0
echo.
echo 17. UNINSTALL PHP 8.1                 18. INSTALL PHP 8.1
echo.
echo 19. UNINSTALL PHP 8.2                 20. INSTALL PHP 8.2
echo.
echo.

set /p choice="Enter your choice and press Enter: "
if "%choice%"=="1" goto checkmenu
if "%choice%"=="2" exit /b
if "%choice%"=="3" goto php56remove
if "%choice%"=="4" goto php56add
if "%choice%"=="5" goto php70remove
if "%choice%"=="6" goto php70add
if "%choice%"=="7" goto php71remove
if "%choice%"=="8" goto php71add
if "%choice%"=="9" goto php72remove
if "%choice%"=="10" goto php72add
if "%choice%"=="11" goto php73remove
if "%choice%"=="12" goto php73add
if "%choice%"=="13" goto php74remove
if "%choice%"=="14" goto php74add
if "%choice%"=="15" goto php80remove
if "%choice%"=="16" goto php80add
if "%choice%"=="17" goto php81remove
if "%choice%"=="18" goto php81add
if "%choice%"=="19" goto php82remove
if "%choice%"=="20" goto php82add
echo Invalid choice. Please try again.
timeout /t 5 >nul
goto menu

if errorlevel 20 goto php82add
if errorlevel 19 goto php82remove
if errorlevel 18 goto php81add
if errorlevel 17 goto php81remove
if errorlevel 16 goto php80add
if errorlevel 15 goto php80remove
if errorlevel 14 goto php74add
if errorlevel 13 goto php74remove
if errorlevel 12 goto php73add
if errorlevel 11 goto php73remove
if errorlevel 10 goto php72add
if errorlevel 9 goto php72remove
if errorlevel 8 goto php71add
if errorlevel 7 goto php71remove
if errorlevel 6 goto php70add
if errorlevel 5 goto php70remove
if errorlevel 4 goto php56add
if errorlevel 3 goto php56remove
if errorlevel 2 exit /b
if errorlevel 1 goto checkmenu

:checkmenu
echo.
echo You selected: Check PHP Version
set "PHP_FOUND=0"
set "PATH=%PATH:D:\xampp\php-5.6;=%"
set "PATH=%PATH:D:\xampp\php-7.0;=%"
set "PATH=%PATH:D:\xampp\php-7.1;=%"
set "PATH=%PATH:D:\xampp\php-7.2;=%"
set "PATH=%PATH:D:\xampp\php-7.3;=%"
set "PATH=%PATH:D:\xampp\php-7.4;=%"
set "PATH=%PATH:D:\xampp\php-8.0;=%"
set "PATH=%PATH:D:\xampp\php-8.1;=%"
set "PATH=%PATH:D:\xampp\php-8.2;=%"
set "PATH=%PATH:D:\xampp\php;=%"

if exist "D:\xampp\php\php.exe" (
    set "PHP_FOUND=1"
    for /f "tokens=1,2 delims= " %%a in ('"D:\xampp\php\php.exe" -v 2^>nul') do (
        if "%%a"=="PHP" (
            set "PHP_VERSION=Current PHP Version: %%b (Active XAMPP Installation)"
            goto :display_version
        )
    )
) else (
    set "PHP_VERSION=Note: No active PHP version in XAMPP (D:\xampp\php\)"
)

if %PHP_FOUND%==0 (
    where php >nul 2>nul
    if %errorlevel% equ 0 (
        for /f "tokens=1,2 delims= " %%a in ('php -v 2^>nul') do (
            if "%%a"=="PHP" (
                set "PHP_VERSION=Current PHP Version: %%b (System PATH)"
                goto :display_version
            )
        )
    ) else (
        set "PHP_VERSION=Status: No PHP version active (all versions are currently switched off)"
    )
)
:display_version
set "LAST_ACTION=%PHP_VERSION%"
echo.
echo 
timeout /t 5 >nul
goto menu

:php56remove
set "LAST_ACTION=UNINSTALLED PHP VERSION 5.6"
if exist "D:\xampp\apache" (
    ren "D:\xampp\apache" "apache-5.6"
    echo Apache folder renamed successfully.
    echo 
    echo.
) else (
    echo Apache folder not found.
    echo 
    echo.
)
if exist "D:\xampp\php" (
    ren "D:\xampp\php" "php-5.6"
    set "PATH=D:\xampp\php-5.6;%PATH%"
    echo PHP folder renamed successfully.
    echo 
    echo.
) else (
    echo PHP folder not found.
    echo 
    echo.
)
if exist "D:\xampp\phpMyAdmin" (
    ren "D:\xampp\phpMyAdmin" "phpMyAdmin-4.9.2"
    echo phpMyAdmin folder renamed successfully.
    echo 
    echo.
) else (
    echo phpMyAdmin folder not found.
    echo 
    echo.
)
timeout /t 5 >nul
echo 
goto menu

:php56add
set "LAST_ACTION=INSTALLED PHP VERSION 5.6"
if exist "D:\xampp\apache-5.6" (
    ren "D:\xampp\apache-5.6" "apache"
    echo Apache folder renamed successfully.
    echo 
    echo.
) else (
    echo Apache folder not found.
    echo 
    echo.
)
if exist "D:\xampp\php-5.6" (
    ren "D:\xampp\php-5.6" "php"
    set "PATH=D:\xampp\php;%PATH%"
    echo PHP folder renamed successfully.
    echo 
    echo.
) else (
    echo PHP folder not found.
    echo 
    echo.
)
if exist "D:\xampp\phpMyAdmin-4.9.2" (
    ren "D:\xampp\phpMyAdmin-4.9.2" "phpMyAdmin"
    echo phpMyAdmin folder renamed successfully.
    echo 
    echo.
) else (
    echo phpMyAdmin folder not found.
    echo 
    echo.
)
timeout /t 5 >nul
echo 
goto menu

:php70remove
set "LAST_ACTION=UNINSTALLED PHP VERSION 7.0"
if exist "D:\xampp\apache" (
    ren "D:\xampp\apache" "apache-7.0"
    echo Apache folder renamed successfully.
    echo 
    echo.
) else (
    echo Apache folder not found.
    echo 
    echo.
)
if exist "D:\xampp\php" (
    ren "D:\xampp\php" "php-7.0"
    set "PATH=D:\xampp\php-7.0;%PATH%"
    echo PHP folder renamed successfully.
    echo 
    echo.
) else (
    echo PHP folder not found.
    echo 
    echo.
)
if exist "D:\xampp\phpMyAdmin" (
    ren "D:\xampp\phpMyAdmin" "phpMyAdmin-4.9.2"
    echo phpMyAdmin folder renamed successfully.
    echo 
    echo.
) else (
    echo phpMyAdmin folder not found.
    echo 
    echo.
)
timeout /t 5 >nul
echo 
goto menu

:php70add
set "LAST_ACTION=INSTALLED PHP VERSION 7.0"
if exist "D:\xampp\apache-7.0" (
    ren "D:\xampp\apache-7.0" "apache"
    echo Apache folder renamed successfully.
    echo 
    echo.
) else (
    echo Apache folder not found.
    echo 
    echo.
)
if exist "D:\xampp\php-7.0" (
    ren "D:\xampp\php-7.0" "php"
    set "PATH=D:\xampp\php;%PATH%"
    echo PHP folder renamed successfully.
    echo 
    echo.
) else (
    echo PHP folder not found.
    echo 
    echo.
)
if exist "D:\xampp\phpMyAdmin-4.9.2" (
    ren "D:\xampp\phpMyAdmin-4.9.2" "phpMyAdmin"
    echo phpMyAdmin folder renamed successfully.
    echo 
    echo.
) else (
    echo phpMyAdmin folder not found.
    echo 
    echo.
)
timeout /t 5 >nul
echo 
goto menu

:php71remove
set "LAST_ACTION=UNINSTALLED PHP VERSION 7.1"
if exist "D:\xampp\apache" (
    ren "D:\xampp\apache" "apache-7.1"
    echo Apache folder renamed successfully.
    echo 
    echo.
) else (
    echo Apache folder not found.
    echo 
    echo.
)
if exist "D:\xampp\php" (
    ren "D:\xampp\php" "php-7.1"
    set "PATH=D:\xampp\php-7.1;%PATH%"
    echo PHP folder renamed successfully.
    echo 
    echo.
) else (
    echo PHP folder not found.
    echo 
    echo.
)
if exist "D:\xampp\phpMyAdmin" (
    ren "D:\xampp\phpMyAdmin" "phpMyAdmin-4.9.2"
    echo phpMyAdmin folder renamed successfully.
    echo 
    echo.
) else (
    echo phpMyAdmin folder not found.
    echo 
    echo.
)
timeout /t 5 >nul
echo 
goto menu

:php71add
set "LAST_ACTION=INSTALLED PHP VERSION 7.1"
if exist "D:\xampp\apache-7.1" (
    ren "D:\xampp\apache-7.1" "apache"
    echo Apache folder renamed successfully.
    echo 
    echo.
) else (
    echo Apache folder not found.
    echo 
    echo.
)
if exist "D:\xampp\php-7.1" (
    ren "D:\xampp\php-7.1" "php"
    set "PATH=D:\xampp\php;%PATH%"
    echo PHP folder renamed successfully.
    echo 
    echo.
) else (
    echo PHP folder not found.
    echo 
    echo.
)
if exist "D:\xampp\phpMyAdmin-4.9.2" (
    ren "D:\xampp\phpMyAdmin-4.9.2" "phpMyAdmin"
    echo phpMyAdmin folder renamed successfully.
    echo 
    echo.
) else (
    echo phpMyAdmin folder not found.
    echo 
    echo.
)
timeout /t 5 >nul
echo 
goto menu

:php72remove
set "LAST_ACTION=UNINSTALLED PHP VERSION 7.2"
if exist "D:\xampp\apache" (
    ren "D:\xampp\apache" "apache-7.2"
    echo Apache folder renamed successfully.
    echo 
    echo.
) else (
    echo Apache folder not found.
    echo 
    echo.
)
if exist "D:\xampp\php" (
    ren "D:\xampp\php" "php-7.2"
    set "PATH=D:\xampp\php-7.2;%PATH%"
    echo PHP folder renamed successfully.
    echo 
    echo.
) else (
    echo PHP folder not found.
    echo 
    echo.
)
if exist "D:\xampp\phpMyAdmin" (
    ren "D:\xampp\phpMyAdmin" "phpMyAdmin-5.2.1"
    echo phpMyAdmin folder renamed successfully.
    echo 
    echo.
) else (
    echo phpMyAdmin folder not found.
    echo 
    echo.
)
timeout /t 5 >nul
echo 
goto menu

:php72add
set "LAST_ACTION=INSTALLED PHP VERSION 7.2"
if exist "D:\xampp\apache-7.2" (
    ren "D:\xampp\apache-7.2" "apache"
    echo Apache folder renamed successfully.
    echo 
    echo.
) else (
    echo Apache folder not found.
    echo 
    echo.
)
if exist "D:\xampp\php-7.2" (
    ren "D:\xampp\php-7.2" "php"
    set "PATH=D:\xampp\php;%PATH%"
    echo PHP folder renamed successfully.
    echo 
    echo.
) else (
    echo PHP folder not found.
    echo 
    echo.
)
if exist "D:\xampp\phpMyAdmin-5.2.1" (
    ren "D:\xampp\phpMyAdmin-5.2.1" "phpMyAdmin"
    echo phpMyAdmin folder renamed successfully.
    echo 
    echo.
) else (
    echo phpMyAdmin folder not found.
    echo 
    echo.
)
timeout /t 5 >nul
echo 
goto menu

:php73remove
set "LAST_ACTION=UNINSTALLED PHP VERSION 7.3"
if exist "D:\xampp\apache" (
    ren "D:\xampp\apache" "apache-7.3"
    echo Apache folder renamed successfully.
    echo 
    echo.
) else (
    echo Apache folder not found.
    echo 
    echo.
)
if exist "D:\xampp\php" (
    ren "D:\xampp\php" "php-7.3"
    set "PATH=D:\xampp\php-7.3;%PATH%"
    echo PHP folder renamed successfully.
    echo 
    echo.
) else (
    echo PHP folder not found.
    echo 
    echo.
)
if exist "D:\xampp\phpMyAdmin" (
    ren "D:\xampp\phpMyAdmin" "phpMyAdmin-5.2.1"
    echo phpMyAdmin folder renamed successfully.
    echo 
    echo.
) else (
    echo phpMyAdmin folder not found.
    echo 
    echo.
)
timeout /t 5 >nul
echo 
goto menu

:php73add
set "LAST_ACTION=INSTALLED PHP VERSION 7.3"
if exist "D:\xampp\apache-7.3" (
    ren "D:\xampp\apache-7.3" "apache"
    echo Apache folder renamed successfully.
    echo 
    echo.
) else (
    echo Apache folder not found.
    echo 
    echo.
)
if exist "D:\xampp\php-7.3" (
    ren "D:\xampp\php-7.3" "php"
    set "PATH=D:\xampp\php;%PATH%"
    echo PHP folder renamed successfully.
    echo 
    echo.
) else (
    echo PHP folder not found.
    echo 
    echo.
)
if exist "D:\xampp\phpMyAdmin-5.2.1" (
    ren "D:\xampp\phpMyAdmin-5.2.1" "phpMyAdmin"
    echo phpMyAdmin folder renamed successfully.
    echo 
    echo.
) else (
    echo phpMyAdmin folder not found.
    echo 
    echo.
)
timeout /t 5 >nul
echo 
goto menu

:php74remove
set "LAST_ACTION=UNINSTALLED PHP VERSION 7.4"
if exist "D:\xampp\apache" (
    ren "D:\xampp\apache" "apache-7.4"
    echo Apache folder renamed successfully.
    echo 
    echo.
) else (
    echo Apache folder not found.
    echo 
    echo.
)
if exist "D:\xampp\php" (
    ren "D:\xampp\php" "php-7.4"
    set "PATH=D:\xampp\php-7.4;%PATH%"
    echo PHP folder renamed successfully.
    echo 
    echo.
) else (
    echo PHP folder not found.
    echo 
    echo.
)
if exist "D:\xampp\phpMyAdmin" (
    ren "D:\xampp\phpMyAdmin" "phpMyAdmin-5.2.1"
    echo phpMyAdmin folder renamed successfully.
    echo 
    echo.
) else (
    echo phpMyAdmin folder not found.
    echo 
    echo.
)
timeout /t 5 >nul
echo 
goto menu

:php74add
set "LAST_ACTION=INSTALLED PHP VERSION 7.4"
if exist "D:\xampp\apache-7.4" (
    ren "D:\xampp\apache-7.4" "apache"
    echo Apache folder renamed successfully.
    echo 
    echo.
) else (
    echo Apache folder not found.
    echo 
    echo.
)
if exist "D:\xampp\php-7.4" (
    ren "D:\xampp\php-7.4" "php"
    set "PATH=D:\xampp\php;%PATH%"
    echo PHP folder renamed successfully.
    echo 
    echo.
) else (
    echo PHP folder not found.
    echo 
    echo.
)
if exist "D:\xampp\phpMyAdmin-5.2.1" (
    ren "D:\xampp\phpMyAdmin-5.2.1" "phpMyAdmin"
    echo phpMyAdmin folder renamed successfully.
    echo 
    echo.
) else (
    echo phpMyAdmin folder not found.
    echo 
    echo.
)
timeout /t 5 >nul
echo 
goto menu

:php80remove
set "LAST_ACTION=UNINSTALLED PHP VERSION 8.0"
if exist "D:\xampp\apache" (
    ren "D:\xampp\apache" "apache-8.0"
    echo Apache folder renamed successfully.
    echo 
    echo.
) else (
    echo Apache folder not found.
    echo 
    echo.
)
if exist "D:\xampp\php" (
    ren "D:\xampp\php" "php-8.0"
    set "PATH=D:\xampp\php-8.0;%PATH%"
    echo PHP folder renamed successfully.
    echo 
    echo.
) else (
    echo PHP folder not found.
    echo 
    echo.
)
if exist "D:\xampp\phpMyAdmin" (
    ren "D:\xampp\phpMyAdmin" "phpMyAdmin-5.2.1"
    echo phpMyAdmin folder renamed successfully.
    echo 
    echo.
) else (
    echo phpMyAdmin folder not found.
    echo 
    echo.
)
timeout /t 5 >nul
echo 
goto menu

:php80add
set "LAST_ACTION=INSTALLED PHP VERSION 8.0"
if exist "D:\xampp\apache-8.0" (
    ren "D:\xampp\apache-8.0" "apache"
    echo Apache folder renamed successfully.
    echo 
    echo.
) else (
    echo Apache folder not found.
    echo 
    echo.
)
if exist "D:\xampp\php-8.0" (
    ren "D:\xampp\php-8.0" "php"
    set "PATH=D:\xampp\php;%PATH%"
    echo PHP folder renamed successfully.
    echo 
    echo.
) else (
    echo PHP folder not found.
    echo 
    echo.
)
if exist "D:\xampp\phpMyAdmin-5.2.1" (
    ren "D:\xampp\phpMyAdmin-5.2.1" "phpMyAdmin"
    echo phpMyAdmin folder renamed successfully.
    echo 
    echo.
) else (
    echo phpMyAdmin folder not found.
    echo 
    echo.
)
timeout /t 5 >nul
echo 
goto menu

:php81remove
set "LAST_ACTION=UNINSTALLED PHP VERSION 8.1"
if exist "D:\xampp\apache" (
    ren "D:\xampp\apache" "apache-8.1"
    echo Apache folder renamed successfully.
    echo 
    echo.
) else (
    echo Apache folder not found.
    echo 
    echo.
)
if exist "D:\xampp\php" (
    ren "D:\xampp\php" "php-8.1"
    set "PATH=D:\xampp\php-8.1;%PATH%"
    echo PHP folder renamed successfully.
    echo 
    echo.
) else (
    echo PHP folder not found.
    echo 
    echo.
)
if exist "D:\xampp\phpMyAdmin" (
    ren "D:\xampp\phpMyAdmin" "phpMyAdmin-5.2.1"
    echo phpMyAdmin folder renamed successfully.
    echo 
    echo.
) else (
    echo phpMyAdmin folder not found.
    echo 
    echo.
)
timeout /t 5 >nul
echo 
goto menu

:php81add
set "LAST_ACTION=INSTALLED PHP VERSION 8.1"
if exist "D:\xampp\apache-8.1" (
    ren "D:\xampp\apache-8.1" "apache"
    echo Apache folder renamed successfully.
    echo 
    echo.
) else (
    echo Apache folder not found.
    echo 
    echo.
)
if exist "D:\xampp\php-8.1" (
    ren "D:\xampp\php-8.1" "php"
    set "PATH=D:\xampp\php;%PATH%"
    echo PHP folder renamed successfully.
    echo 
    echo.
) else (
    echo PHP folder not found.
    echo 
    echo.
)
if exist "D:\xampp\phpMyAdmin-5.2.1" (
    ren "D:\xampp\phpMyAdmin-5.2.1" "phpMyAdmin"
    echo phpMyAdmin folder renamed successfully.
    echo 
    echo.
) else (
    echo phpMyAdmin folder not found.
    echo 
    echo.
)
timeout /t 5 >nul
echo 
goto menu

:php82remove
set "LAST_ACTION=UNINSTALLED PHP VERSION 8.2"
if exist "D:\xampp\apache" (
    ren "D:\xampp\apache" "apache-8.2"
    echo Apache folder renamed successfully.
    echo 
    echo.
) else (
    echo Apache folder not found.
    echo 
    echo.
)
if exist "D:\xampp\php" (
    ren "D:\xampp\php" "php-8.2"
    set "PATH=D:\xampp\php-8.2;%PATH%"
    echo PHP folder renamed successfully.
    echo 
    echo.
) else (
    echo PHP folder not found.
    echo 
    echo.
)
if exist "D:\xampp\phpMyAdmin" (
    ren "D:\xampp\phpMyAdmin" "phpMyAdmin-5.2.1"
    echo phpMyAdmin folder renamed successfully.
    echo 
    echo.
) else (
    echo phpMyAdmin folder not found.
    echo 
    echo.
)
timeout /t 5 >nul
echo 
goto menu

:php82add
set "LAST_ACTION=INSTALLED PHP VERSION 8.2"
if exist "D:\xampp\apache-8.2" (
    ren "D:\xampp\apache-8.2" "apache"
    echo Apache folder renamed successfully.
    echo 
    echo.
) else (
    echo Apache folder not found.
    echo 
    echo.
)
if exist "D:\xampp\php-8.2" (
    ren "D:\xampp\php-8.2" "php"
    set "PATH=D:\xampp\php;%PATH%"
    echo PHP folder renamed successfully.
    echo 
    echo.
) else (
    echo PHP folder not found.
    echo 
    echo.
)
if exist "D:\xampp\phpMyAdmin-5.2.1" (
    ren "D:\xampp\phpMyAdmin-5.2.1" "phpMyAdmin"
    echo phpMyAdmin folder renamed successfully.
    echo 
    echo.
) else (
    echo phpMyAdmin folder not found.
    echo 
    echo.
)
timeout /t 5 >nul
echo 
goto menu