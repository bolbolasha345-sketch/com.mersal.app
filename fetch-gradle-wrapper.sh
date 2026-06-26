#!/usr/bin/env sh
set -e

DIST_VERSION="7.5.1"
DIST_URL="https://services.gradle.org/distributions/gradle-${DIST_VERSION}-bin.zip"
TMP_ZIP="gradle-${DIST_VERSION}-bin.zip"
WRAPPER_DIR="gradle/wrapper"
JAR_PATH="$WRAPPER_DIR/gradle-wrapper.jar"

mkdir -p "$WRAPPER_DIR"
if [ -f "$JAR_PATH" ]; then
  echo "gradle-wrapper.jar already exists at $JAR_PATH"
  exit 0
fi

echo "Downloading Gradle distribution: $DIST_URL"
if command -v curl >/dev/null 2>&1; then
  curl -L -o "$TMP_ZIP" "$DIST_URL"
elif command -v wget >/dev/null 2>&1; then
  wget -O "$TMP_ZIP" "$DIST_URL"
else
  echo "Error: curl or wget is required to download Gradle." 1>&2
  exit 1
fi

echo "Extracting gradle-wrapper.jar from the distribution..."
# Attempt to extract directly with unzip if available
if command -v unzip >/dev/null 2>&1; then
  unzip -j "$TMP_ZIP" "gradle-${DIST_VERSION}/lib/gradle-wrapper.jar" -d "$WRAPPER_DIR"
else
  # Fallback: try to use jar (bundled with JDK) to extract
  if command -v jar >/dev/null 2>&1; then
    mkdir -p tmp_gradle_extract
    unzip_available=false
    jar xf "$TMP_ZIP"
    # The jar tool doesn't extract from .zip nicely in all environments; try unzip via mkdir+unzip
    # As a last resort, attempt to create a temporary directory and use unzip if present
    echo "Please install 'unzip' to allow automatic extraction, or extract $TMP_ZIP manually and copy gradle-wrapper.jar to $JAR_PATH"
    rm -f "$TMP_ZIP"
    exit 1
  else
    echo "Error: unzip or jar command required to extract gradle-wrapper.jar." 1>&2
    rm -f "$TMP_ZIP"
    exit 1
  fi
fi

if [ -f "$JAR_PATH" ]; then
  echo "gradle-wrapper.jar successfully extracted to $JAR_PATH"
  rm -f "$TMP_ZIP"
  exit 0
else
  echo "Failed to extract gradle-wrapper.jar. Please extract $TMP_ZIP and copy gradle-${DIST_VERSION}/lib/gradle-wrapper.jar to $JAR_PATH" 1>&2
  rm -f "$TMP_ZIP"
  exit 1
fi
