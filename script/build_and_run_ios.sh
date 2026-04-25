#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
APP_DIR="$ROOT_DIR/apps/ios"
BUILD_DIR="$APP_DIR/dist"
APP_BUNDLE="$BUILD_DIR/TracepadCapture.app"
EXECUTABLE="$APP_BUNDLE/TracepadCapture"
SIMULATOR_NAME="${SIMULATOR_NAME:-iPhone 17}"
BUNDLE_ID="ai.tracepad.capture"

SDK_PATH="$(xcrun --sdk iphonesimulator --show-sdk-path)"
RUNTIME_DIR="$BUILD_DIR/runtime"

rm -rf "$APP_BUNDLE" "$RUNTIME_DIR"
mkdir -p "$APP_BUNDLE" "$RUNTIME_DIR"

swiftc \
  -target arm64-apple-ios17.0-simulator \
  -sdk "$SDK_PATH" \
  -parse-as-library \
  -emit-executable \
  -o "$EXECUTABLE" \
  "$APP_DIR/Sources/TracepadIOS/TracepadCaptureApp.swift" \
  "$APP_DIR/App/TracepadCaptureMain.swift"

/usr/libexec/PlistBuddy -c "Clear dict" "$APP_BUNDLE/Info.plist" >/dev/null 2>&1 || true
/usr/libexec/PlistBuddy -c "Add :CFBundleIdentifier string $BUNDLE_ID" "$APP_BUNDLE/Info.plist"
/usr/libexec/PlistBuddy -c "Add :CFBundleName string Tracepad Capture" "$APP_BUNDLE/Info.plist"
/usr/libexec/PlistBuddy -c "Add :CFBundleDisplayName string Tracepad" "$APP_BUNDLE/Info.plist"
/usr/libexec/PlistBuddy -c "Add :CFBundleExecutable string TracepadCapture" "$APP_BUNDLE/Info.plist"
/usr/libexec/PlistBuddy -c "Add :CFBundlePackageType string APPL" "$APP_BUNDLE/Info.plist"
/usr/libexec/PlistBuddy -c "Add :CFBundleShortVersionString string 0.1" "$APP_BUNDLE/Info.plist"
/usr/libexec/PlistBuddy -c "Add :CFBundleVersion string 1" "$APP_BUNDLE/Info.plist"
/usr/libexec/PlistBuddy -c "Add :MinimumOSVersion string 17.0" "$APP_BUNDLE/Info.plist"
/usr/libexec/PlistBuddy -c "Add :UILaunchScreen dict" "$APP_BUNDLE/Info.plist"
/usr/libexec/PlistBuddy -c "Add :UIApplicationSceneManifest dict" "$APP_BUNDLE/Info.plist"
/usr/libexec/PlistBuddy -c "Add :UIApplicationSceneManifest:UIApplicationSupportsMultipleScenes bool false" "$APP_BUNDLE/Info.plist"
/usr/libexec/PlistBuddy -c "Add :UIDeviceFamily array" "$APP_BUNDLE/Info.plist"
/usr/libexec/PlistBuddy -c "Add :UIDeviceFamily:0 integer 1" "$APP_BUNDLE/Info.plist"
/usr/libexec/PlistBuddy -c "Add :UIDeviceFamily:1 integer 2" "$APP_BUNDLE/Info.plist"

codesign --force --sign - "$APP_BUNDLE" >/dev/null

xcrun simctl boot "$SIMULATOR_NAME" >/dev/null 2>&1 || true
xcrun simctl install booted "$APP_BUNDLE"
xcrun simctl launch booted "$BUNDLE_ID"

if [[ "${1:-}" == "--verify" ]]; then
  sleep 2
  xcrun simctl get_app_container booted "$BUNDLE_ID" app >/dev/null
  echo "Tracepad iOS launched on $SIMULATOR_NAME"
fi
