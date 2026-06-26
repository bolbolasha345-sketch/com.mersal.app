@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
set DIST_VERSION=7.5.1
set DIST_URL=https://services.gradle.org/distributions/gradle-%DIST_VERSION%-bin.zip
set TMP_ZIP=gradle-%DIST_VERSION%-bin.zip
set WRAPPER_DIR=gradle\wrapper
set JAR_PATH=%WRAPPER_DIR%\gradle-wrapper.jar
nif exist "%JAR_PATH%" (
  echo gradle-wrapper.jar already exists at %JAR_PATH%
  exit /b 0
)
necho Downloading Gradle distribution: %DIST_URL%
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; (New-Object System.Net.WebClient).DownloadFile('%DIST_URL%','%TMP_ZIP%')"
necho Extracting gradle-wrapper.jar from the distribution...
powershell -Command "Add-Type -AssemblyName System.IO.Compression.FileSystem; [System.IO.Compression.ZipFile]::ExtractToDirectory('%TMP_ZIP%','tmp_gradle');"
if not exist "%WRAPPER_DIR%" mkdir "%WRAPPER_DIR%"
copy /Y "tmp_gradle\gradle-%DIST_VERSION%\lib\gradle-wrapper.jar" "%JAR_PATH%"
if exist "%JAR_PATH%" (
  echo gradle-wrapper.jar successfully extracted to %JAR_PATH%
  rmdir /S /Q tmp_gradle
  del /Q %TMP_ZIP%
  exit /b 0
) else (
  echo Failed to extract gradle-wrapper.jar. Please extract %TMP_ZIP% and copy gradle-%DIST_VERSION%\lib\gradle-wrapper.jar to %JAR_PATH%.
  exit /b 1
)
