#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from Lineage common product configuration
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from device configuration
$(call inherit-product, device/realme/dongfeng/device.mk)

# Device identifier
PRODUCT_NAME := lineage_dongfeng
PRODUCT_DEVICE := dongfeng
PRODUCT_BRAND := realme
PRODUCT_MODEL := RMX5079
PRODUCT_MANUFACTURER := realme

PRODUCT_GMS_CLIENTID_BASE := android-oppo

# Build fingerprint & description
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=RMX5079 \
    TARGET_DEVICE=dongfeng \
    BUILD_FINGERPRINT="realme/RMX5079/dongfeng:14/UKQ1.230924.001/V.18b2c4e_1-512c:user/release-keys" \
    PRIVATE_BUILD_DESC="dongfeng-user 14 UKQ1.230924.001 V.18b2c4e_1-512c release-keys"
