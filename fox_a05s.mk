#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 TeamWin Recovery Project
# Copyright (C) 2024 OrangeFox Recovery Project
#

# Inherit konfigurasi dasar device (device.mk, path prebuilt, dsb dari a05s.mk)
$(call inherit-product, device/samsung/a05s/a05s.mk)

# Inherit konfigurasi umum TWRP/OrangeFox (tema, tool recovery, dsb)
$(call inherit-product, vendor/twrp/config/common.mk)

PRODUCT_NAME := fox_a05s
PRODUCT_DEVICE := a05s
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A057
PRODUCT_MANUFACTURER := samsung

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=a05s \
    PRODUCT_NAME=a05s
