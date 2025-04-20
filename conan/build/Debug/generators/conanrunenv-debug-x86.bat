@echo off
chcp 65001 > nul
setlocal
echo @echo off > "%~dp0/deactivate_conanrunenv-debug-x86.bat"
echo echo Restoring environment >> "%~dp0/deactivate_conanrunenv-debug-x86.bat"
for %%v in (OPENSSL_MODULES) do (
    set foundenvvar=
    for /f "delims== tokens=1,2" %%a in ('set') do (
        if /I "%%a" == "%%v" (
            echo set "%%a=%%b">> "%~dp0/deactivate_conanrunenv-debug-x86.bat"
            set foundenvvar=1
        )
    )
    if not defined foundenvvar (
        echo set %%v=>> "%~dp0/deactivate_conanrunenv-debug-x86.bat"
    )
)
endlocal


set "OPENSSL_MODULES=C:\Users\istock\.conan2\p\b\opens881677f4af633\p\lib\ossl-modules"