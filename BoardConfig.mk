#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 TeamWin Recovery Project
# Copyright (C) 2024 OrangeFox Recovery Project
#

DEVICE_PATH := device/samsung/a05s

# Platform / Processor
TARGET_BOARD_PLATFORM := sm6225
TARGET_BOOTLOADER_BOARD_NAME := sm6225

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

# WAJIB: device 64-bit (arm64) harus deklarasi ini secara eksplisit,
# kalau tidak build gagal dengan "Building a 32-bit-app-only product on a 64-bit device"
TARGET_SUPPORTS_64_BIT_APPS := true

# Assert
TARGET_OTA_ASSERT_DEVICE := a05s,a05sxx,a05snn

# Kernel (PREBUILT - diekstrak dari firmware stock, tidak compile dari source)
TARGET_NO_KERNEL := true
TARGET_PREBUILT_KERNEL := device/samsung/a05s/prebuilt/kernel
BOARD_PREBUILT_DTBOIMAGE := device/samsung/a05s/prebuilt/dtbo.img

# Kernel & Boot
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_TAGS_OFFSET := 0x00000100
BOARD_MKBOOTIMG_ARGS := --header_version 2
BOARD_BOOT_HEADER_VERSION := 2
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb

# Dynamic Partitions
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := samsung_dynamic_partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 9122611200
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext vendor product odm

# Treble / VNDK - WAJIB dideklarasikan eksplisit untuk device dynamic-partition,
# kalau tidak build system bisa bingung antara skema lama (vendor = symlink)
# vs skema modern (vendor = mountpoint asli), menyebabkan konflik rsync/symlink
BOARD_VNDK_VERSION := current
PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# System / Recovery
TARGET_NO_RECOVERY := false
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true
ALLOW_MISSING_DEPENDENCIES := true

# Device ini tidak punya partisi recovery terpisah - recovery menumpang di boot.img
BOARD_USES_RECOVERY_AS_BOOT := true
# Referensi ukuran TWRP untuk device ini ~100MB, dikasih ruang ekstra karena
# OrangeFox biasanya lebih besar (tema, tools, Magisk bundling, dll)
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728

# OrangeFox Configuration Flags
TW_THEME := portrait_hdpi
TW_MAX_BRIGHTNESS := 255
FOX_MAINTAINER_PATCH_VERSION := 0
FOX_BUILD_TYPE := Unofficially
FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER := 1
OF_FLASHLIGHT_ENABLE := 1
OF_ALLOW_DISABLE_NAVBAR := 0
OF_SCREEN_H := 2400
OF_STATUS_H := 80
OF_STATUS_INDENT_LEFT := 48
OF_STATUS_INDENT_RIGHT := 48
OF_USE_GREEN_LED := 0

# Security Patch / Verity
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
PLATFORM_VERSION := 12.1
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
