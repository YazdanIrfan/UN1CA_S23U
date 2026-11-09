# Fix Edge Lighting corner radius
# Remove SM-M127 support to support SM-A346 instead
DECODE_APK "system_ext" "priv-app/SystemUI/SystemUI.apk" || return 1
SYSTEMUI_DIR="$APKTOOL_DIR/system_ext/priv-app/SystemUI/SystemUI.apk"
DEL_FILE=$(find "$SYSTEMUI_DIR" -name "DrawEdgeLayout.smali" 2>/dev/null | head -n 1)

if [ -n "$DEL_FILE" ]; then
    DEL_REL="${DEL_FILE#$SYSTEMUI_DIR/}"
    if grep -q "SM-M127" "$DEL_FILE"; then
        SMALI_PATCH "system_ext" "priv-app/SystemUI/SystemUI.apk" \
            "$DEL_REL" "replace" \
            "dispatchDraw(Landroid/graphics/Canvas;)V" \
            "SM-M127" \
            "SM-A346" || true
    fi
fi

if grep -q "sm_m127" "$SYSTEMUI_DIR/res/values/dimens.xml" 2>/dev/null; then
    LOG "- Patching /system_ext/priv-app/SystemUI/SystemUI.apk/res/values/dimens.xml"
    EVAL "sed -i \"s/<dimen name\=\\\"sm_m127\\\">36.0dp<\/dimen>/<dimen name\=\\\"sm_a346\\\">40.0dp<\/dimen>/\" \"$SYSTEMUI_DIR/res/values/dimens.xml\""
fi
if grep -q "sm_m127" "$SYSTEMUI_DIR/res/values/public.xml" 2>/dev/null; then
    LOG "- Patching /system_ext/priv-app/SystemUI/SystemUI.apk/res/values/public.xml"
    EVAL "sed -i \"s/<public type\=\\\"dimen\\\" name\=\\\"sm_m127\\\"/<public type\=\\\"dimen\\\" name\=\\\"sm_a346\\\"/\" \"$SYSTEMUI_DIR/res/values/public.xml\""
fi

SET_PROP "system" "ro.factory.model" "SM-A346B"
