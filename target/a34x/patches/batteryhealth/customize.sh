# Forcefully enable Advanced Battery Information
# SM-A346B is known to support this feature so enable it

# https://cs.android.com/android/platform/superproject/+/android-latest-release:packages/apps/Settings/src/com/android/settings/core/BasePreferenceController.java
# 0x0 = SUPPORTED
# 0x3 = UNSUPPORTED ON DEVICE

# Enable BatteryRegulatoryPreferenceController on SM-A346B if restriction exists
DECODE_APK "system" "system/priv-app/SecSettings/SecSettings.apk" || return 1
SECSETTINGS_DIR="$APKTOOL_DIR/system/priv-app/SecSettings/SecSettings.apk"
BRPC_FILE=$(find "$SECSETTINGS_DIR" -name "BatteryRegulatoryPreferenceController.smali" 2>/dev/null | head -n 1)
SBIF_FILE=$(find "$SECSETTINGS_DIR" -name "SecBatteryInfoFragment.smali" 2>/dev/null | head -n 1)

if [ -n "$BRPC_FILE" ]; then
    BRPC_REL="${BRPC_FILE#$SECSETTINGS_DIR/}"
    if grep -q "SM-A236B" "$BRPC_FILE"; then
        SMALI_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
            "$BRPC_REL" "replace" \
            "getAvailabilityStatus()I" \
            "SM-A236B" "SM-A346B" || true
    fi

    if grep -q "ro.product.model" "$BRPC_FILE"; then
        SMALI_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
            "$BRPC_REL" "replace" \
            "getAvailabilityStatus()I" \
            "ro.product.model" "ro.boot.em.model" || true
    fi
fi

if [ -n "$SBIF_FILE" ]; then
    SBIF_REL="${SBIF_FILE#$SECSETTINGS_DIR/}"
    if grep -q "ro.product.model" "$SBIF_FILE"; then
        SMALI_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
            "$SBIF_REL" "replace" \
            "onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V" \
            "ro.product.model" "ro.boot.em.model" || true
    fi

    if grep -q "SM-A236B" "$SBIF_FILE"; then
        SMALI_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
            "$SBIF_REL" "replace" \
            "onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V" \
            "SM-A236B" "SM-A346B" || true
    fi
fi
