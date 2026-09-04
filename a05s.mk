# Inherit generic AOSP recovery config
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit OrangeFox configuration
$(call inherit-product, vendor/recovery/config/common.mk)

PRODUCT_DEVICE := a05s
PRODUCT_NAME := aosp_a05s
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := Galaxy A05s
PRODUCT_MANUFACTURER := samsung
