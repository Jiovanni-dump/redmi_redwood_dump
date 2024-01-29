#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from redwood device
$(call inherit-product, device/xiaomi/redwood/device.mk)

PRODUCT_DEVICE := redwood
PRODUCT_NAME := lineage_redwood
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := 22101320C
PRODUCT_MANUFACTURER := xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="redwood-user 13 RKQ1.211001.001 V14.0.7.0.TMSMIXM release-keys"

BUILD_FINGERPRINT := Redmi/redwood/redwood:13/RKQ1.211001.001/V14.0.7.0.TMSMIXM:user/release-keys
