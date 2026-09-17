#
# Copyright (C) 2026 The LineageOS Project
#
# SP-License-Identifier: Apache-2.0
#

# Inherit AOSP Core Product Config
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit Device Tree Utama
$(call inherit-product, device/samsung/a05s/device.mk)

# Identitas Produk Perangkat
PRODUCT_NAME := aosp_a05s
PRODUCT_DEVICE := a05s
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := SM-A057F
PRODUCT_MANUFACTURER := Samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung
