#!/bin/bash
#
# Auto-generate Android Makefiles for Samsung A05s Vendor Tree
#

set -e

DEVICE=a05s
VENDOR=samsung
BUILD_TREE_ROOT="/home/nevadamurdock/samsung/build_tree"
OUT_DIR="${BUILD_TREE_ROOT}/vendor/${VENDOR}/${DEVICE}"

mkdir -p "${OUT_DIR}"

# 1. Android.mk
cat << 'MAKEFILE' > "${OUT_DIR}/Android.mk"
# Auto-generated file. DO NOT MODIFY.
LOCAL_PATH := $(call my-dir)

ifneq ($(filter a05s,$(TARGET_DEVICE)),)
include $(CLEAR_VARS)
endif
MAKEFILE

# 2. BoardConfigVendor.mk
cat << 'MAKEFILE' > "${OUT_DIR}/BoardConfigVendor.mk"
# Auto-generated file. DO NOT MODIFY.
MAKEFILE

# 3. a05s-vendor.mk
cat << 'MAKEFILE' > "${OUT_DIR}/${DEVICE}-vendor.mk"
# Auto-generated file. DO NOT MODIFY.

PRODUCT_SOONG_NAMESPACES += \
    vendor/samsung/a05s

PRODUCT_COPY_FILES += \
MAKEFILE

# Fill PRODUCT_COPY_FILES from proprietary-files.txt
PROPRIETARY_FILES="/home/nevadamurdock/samsung/build_tree/device/samsung/a05s/proprietary-files.txt"

while IFS= read -r line || [ -n "$line" ]; do
    [[ "${line}" =~ ^#.*$ ]] && continue
    [[ -z "${line}" ]] && continue

    FILE=$(echo "${line}" | awk '{print $1}')
    CLEAN_PATH="${FILE#vendor/}"
    
    echo "    vendor/${VENDOR}/${DEVICE}/proprietary/${CLEAN_PATH}:$(echo "${FILE}" | sed 's|^vendor/|vendor/|'):samsung \\" >> "${OUT_DIR}/${DEVICE}-vendor.mk"
done < "${PROPRIETARY_FILES}"

echo "" >> "${OUT_DIR}/${DEVICE}-vendor.mk"

echo "[+] Vendor Makefiles generated at ${OUT_DIR}"
