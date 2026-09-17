#
# Copyright (C) 2026 The LineageOS Project
#
# SP-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/samsung/a05s

# Inherit Proprietary Vendor Blobs
$(call inherit-product, vendor/samsung/a05s/a05s-vendor.mk)

# Inherit Samsung Hardware HAL Extensions
$(call inherit-product, hardware/samsung/hidl/samsung-hidl.mk)

# Product Overlays
PRODUCT_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Dynamic Partitions & System Modules
PRODUCT_PACKAGES += \
    vendor_boot \
    android.hardware.audio.service \
    android.hardware.graphics.composer-service \
    android.hardware.bluetooth@1.0-service

# Standard Permissions Setup
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml

# Enable Scoped Storage & Dynamic Partition Capabilities
PRODUCT_USE_DYNAMIC_PARTITIONS := true
