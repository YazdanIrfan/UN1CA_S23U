LOG_STEP_IN "- Adding OK Google Hotword Enrollment blobs"
DELETE_FROM_WORK_DIR "product" "priv-app/HotwordEnrollmentOKGoogleEx4CORTEXM55"
DELETE_FROM_WORK_DIR "product" "priv-app/HotwordEnrollmentXGoogleEx4CORTEXM55"
local fw_target_dir="$SRC_DIR/out/fw/${TARGET_FIRMWARE//\//_}"
if [ -d "$fw_target_dir/product/priv-app/HotwordEnrollmentOKGoogleEx4RISCV" ]; then
    ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "product" "priv-app/HotwordEnrollmentOKGoogleEx4RISCV" 0 0 755 "u:object_r:system_file:s0"
fi
if [ -d "$fw_target_dir/product/priv-app/HotwordEnrollmentXGoogleEx4RISCV" ]; then
    ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "product" "priv-app/HotwordEnrollmentXGoogleEx4RISCV" 0 0 755 "u:object_r:system_file:s0"
fi
LOG_STEP_OUT

LOG_STEP_IN "- Fix Photo Remaster"
# Fix Photo Remaster
if [ -f "$WORK_DIR/system/system/etc/selinux/plat_property_contexts" ]; then
    EVAL "echo \"ro.midas.device u:object_r:build_prop:s0 exact string\"  >> \"$WORK_DIR/system/system/etc/selinux/plat_property_contexts\""
fi
SET_PROP "system" "ro.midas.device" "a34x"
if [ -f "$WORK_DIR/system/system/lib64/libmidas_core.camera.samsung.so" ]; then
    HEX_PATCH "$WORK_DIR/system/system/lib64/libmidas_core.camera.samsung.so" \
        "726f2e70726f647563742e646576696365" "726f2e6d696461732e6465766963650000" || true
fi
LOG_STEP_OUT
