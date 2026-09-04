# Call Vendor Blobs
$(call inherit-product-if-exists, vendor/samsung/a05s/a05s-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/a05s/overlay

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Soong Namespaces
PRODUCT_SOONG_NAMESPACES += \
    device/samsung/a05s
