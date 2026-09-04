#!/bin/bash
#
# Copyright (C) 2026 The LineageOS Project
# Auto-extract vendor blobs from dumped images
#

set -e

DEVICE=a05s
VENDOR=samsung

# Setup path
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

BUILD_TREE_ROOT="/home/nevadamurdock/samsung/build_tree"
SRC_BLOBS_DIR="${BUILD_TREE_ROOT}/vendor_blobs"
TARGET_VENDOR_DIR="${BUILD_TREE_ROOT}/vendor/${VENDOR}/${DEVICE}"

echo "[*] Preparing target directory: ${TARGET_VENDOR_DIR}"
mkdir -p "${TARGET_VENDOR_DIR}/proprietary"

# Parse proprietary-files.txt and copy blobs
PROPRIETARY_FILES="${MY_DIR}/proprietary-files.txt"

if [ ! -f "${PROPRIETARY_FILES}" ]; then
    echo "[-] Error: ${PROPRIETARY_FILES} not found!"
    exit 1
fi

echo "[*] Copying proprietary files..."
while IFS= read -r line || [ -n "$line" ]; do
    # Skip comments and empty lines
    [[ "${line}" =~ ^#.*$ ]] && continue
    [[ -z "${line}" ]] && continue

    # Extract target relative path
    FILE=$(echo "${line}" | awk '{print $1}')
    
    SRC_FILE=""
    if [ -f "${SRC_BLOBS_DIR}/${FILE}" ]; then
        SRC_FILE="${SRC_BLOBS_DIR}/${FILE}"
    elif [ -f "${SRC_BLOBS_DIR}/vendor/${FILE#vendor/}" ]; then
        SRC_FILE="${SRC_BLOBS_DIR}/vendor/${FILE#vendor/}"
    fi

    if [ -n "${SRC_FILE}" ] && [ -f "${SRC_FILE}" ]; then
        DEST_FILE="${TARGET_VENDOR_DIR}/proprietary/${FILE#vendor/}"
        mkdir -p "$(dirname "${DEST_FILE}")"
        cp "${SRC_FILE}" "${DEST_FILE}"
        echo "  + ${FILE}"
    else
        echo "  - [MISSING] ${FILE}"
    fi
done < "${PROPRIETARY_FILES}"

echo "[*] Running setup-makefiles.sh..."
bash "${MY_DIR}/setup-makefiles.sh"

echo "[+] Done extracting vendor blobs!"
