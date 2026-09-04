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
TARGET_SUPPORTS_64_BIT_APPS := true

# Platform / Processor
PRODUCT_PLATFORM := sm6225
TARGET_BOARD_PLATFORM := sm6225
TARGET_BOOTLOADER_BOARD_NAME := sm6225

# Kernel - Prebuilt Paths
TARGET_PREBUILT_KERNEL := device/samsung/a05s/prebuilt/kernel
BOARD_PREBUILT_DTBOIMAGE := device/samsung/a05s/prebuilt/dtbo.img
BOARD_PREBUILT_DTBIMAGE_DIR := device/samsung/a05s/prebuilt/
BOARD_MKBOOTIMG_ARGS += --dtb device/samsung/a05s/prebuilt/dtb

# Kernel Header / Page Parameters
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 androidboot.usbcontroller=4e00000.mw3c swiotlb=0 loop.max_part=7
BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x02000000
BOARD_TAGS_OFFSET := 0x01e00000

# Kernel Modules Integration
BOARD_VENDOR_KERNEL_MODULES := $(wildcard device/samsung/a05s/prebuilt/modules/*.ko)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(wildcard device/samsung/a05s/prebuilt/modules/*.ko)

# Partitions (Dynamic Partitions / EROFS)
BOARD_SUPER_PARTITION_SIZE := 8589934592
BOARD_SUPER_PARTITION_GROUPS := samsung_dynamic_partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor vendor_dlkm system_dlkm
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 8585740288

# System / EROFS Configuration
BOARD_HAS_LARGE_BLOCK_SIZE := true
TARGET_USERIMAGES_USE_EROFS := true

# VINTF / Matrix
DEVICE_MANIFEST_FILE := device/samsung/a05s/manifest.xml
