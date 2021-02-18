#
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/samsung/klimtlte

PRODUCT_CHARACTERISTICS := tablet
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal large xlarge

# AdvancedDisplay (MDNIE)
PRODUCT_PACKAGES += \
    AdvancedDisplay 

# Audio HAL
PRODUCT_PACKAGES += \
    audio.primary.universal5420

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/mixer_paths_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_0.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1600

# Livedisplay
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.0-service.samsung-exynos

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.0-service \
    fingerprint.universal5420 \
    validityService

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/sec_touchscreen.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/sec_touchscreen.kl \
    $(LOCAL_PATH)/configs/keylayout/sec_touchkey.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/sec_touchkey.kl

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/gps.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps/gps.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/gps.xml

# Shim
PRODUCT_PACKAGES += \
    libshim

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml

# Ramdisk
PRODUCT_PACKAGES += \
    init.target.rc \
    init.baseband.rc

# Radio
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    libsecril-client \
    modemloader \
    libxml2 \
    rild \
    libril \
    libreference-ril \
    libsecril-client-sap \
    android.hardware.radio@1.1 \
    android.hardware.radio.deprecated@1.0

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init/rild.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/rild.legacy.rc

# System properties
-include $(LOCAL_PATH)/system_prop.mk

# Shipping API level
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_k.mk)

# Import the common tree changes
include device/samsung/exynos5420-common/exynos5420.mk

# call the proprietary setup
$(call inherit-product, vendor/samsung/klimtlte/klimtlte-vendor.mk)
