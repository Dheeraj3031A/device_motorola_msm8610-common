# Copyright (C) 2015 The CyanogenMod Project
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

COMMON_PATH := device/motorola/msm8610-common

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# common vendor blobs
$(call inherit-product, vendor/motorola/msm8610-common/msm8610-common-vendor.mk)

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=16m \
    dalvik.vm.heapgrowthlimit=192m \
    dalvik.vm.heapsize=128m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=2m \
    dalvik.vm.heapmaxfree=8m

# HWUI
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.texture_cache_size=72 \
    ro.hwui.layer_cache_size=48 \
    ro.hwui.path_cache_size=32 \
    ro.hwui.gradient_cache_size=1 \
    ro.hwui.drop_shadow_cache_size=6 \
    ro.hwui.r_buffer_cache_size=8 \
    ro.hwui.texture_cache_flushrate=0.4 \
    ro.hwui.text_small_cache_width=1024 \
    ro.hwui.text_small_cache_height=1024 \
    ro.hwui.text_large_cache_width=2048 \
    ro.hwui.text_large_cache_height=1024

# Ramdisk
PRODUCT_PACKAGES += \
    init.mmi.boot.sh \
    init.mmi.touch.sh

PRODUCT_PACKAGES += \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.safailnet.rc \
    ueventd.qcom.rc

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.print.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.print.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml

PRODUCT_ENFORCE_RRO_TARGETS := \
    framework-res

# WiFi configuration
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/wifi/WCNSS_cfg.dat:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/prima/WCNSS_cfg.dat \
    $(COMMON_PATH)/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/prima/WCNSS_qcom_cfg.ini

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_AAPT_PREF_CONFIG := hdpi

DEVICE_PACKAGE_OVERLAYS += \
    $(COMMON_PATH)/overlay

# Audio
PRODUCT_PACKAGES += \
    audio_policy.msm8610 \
    audio.primary.msm8610 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler \
    libqcomvisualizer \
    libqcomvoiceprocessing

PRODUCT_PACKAGES += \
    android.hardware.audio@4.0-impl \
    android.hardware.audio.effect@4.0-impl \
    android.hardware.broadcastradio@1.0-impl

# Audio Configuration
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(COMMON_PATH)/audio/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf

# Boot animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540
TARGET_BOOTANIMATION_HALF_RES := true

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/external_camera_config.xml:system/vendor/etc/external_camera_config.xml

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl

# Display
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.configstore@1.1-service \
    android.hardware.memtrack@1.0-impl \
    gralloc.msm8610 \
    copybit.msm8610 \
    hwcomposer.msm8610 \
    memtrack.msm8610

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth@1.0-service \
    libbt-vendor

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl-legacy \
    camera.device@3.2-impl \
    camera.msm8610 \
    libshim_qcopt \
    libshim_skia \
    libshims_sensorlistener \
    Snap

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilts/libskia.so:system/lib/libskia.so

# IPC router config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# Keystore
PRODUCT_PACKAGES +=  \
    android.hardware.keymaster@3.0-impl \
    keystore.msm8610

# Media Config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# Motorola
PRODUCT_PACKAGES += \
    charge_only_mode \
    libmoto

# Motorola-specific permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/permissions/com.motorola.android.dm.service.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.motorola.android.dm.service.xml \
    $(LOCAL_PATH)/permissions/com.motorola.android.tcmd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.motorola.android.tcmd.xml \
    $(LOCAL_PATH)/permissions/com.motorola.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.motorola.camera.xml \
    $(LOCAL_PATH)/permissions/com.motorola.context.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.motorola.context.xml \
    $(LOCAL_PATH)/permissions/com.motorola.gallery.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.motorola.gallery.xml \
    $(LOCAL_PATH)/permissions/com.motorola.motosignature.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.motorola.motosignature.xml \
    $(LOCAL_PATH)/permissions/com.motorola.smartaction.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.motorola.smartaction.xml \
    $(LOCAL_PATH)/permissions/com.motorola.software.bodyguard.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.motorola.software.bodyguard.xml \
    $(LOCAL_PATH)/permissions/com.motorola.software.guideme.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.motorola.software.guideme.xml \
    $(LOCAL_PATH)/permissions/com.motorola.software.storageoptimizer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.motorola.software.storageoptimizer.xml \
    $(LOCAL_PATH)/permissions/com.motorola.software.x_line.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.motorola.software.x_line.xml

# Go
PRODUCT_PROPERTY_OVERRIDES += \
    pm.dexopt.shared=quicken

# OMX
PRODUCT_PACKAGES += \
    android.hardware.media.omx@1.0-impl \
    android.hardware.media.omx@1.0-service \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

PRODUCT_PACKAGES += \
    librs_jni \
    android.hardware.usb@1.0-service.basic \
    com.android.future.usb.accessory

# Perf
PRODUCT_PACKAGES += \
    libshims_atomic

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.1-service-qti

# Ebtables
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes \
    libebtc

# FM
PRODUCT_PACKAGES += \
    FMRadio \
    libfmjni

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl \
    lights.msm8610

# GNSS HAL
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-imp
    
# GPS
PRODUCT_PACKAGES += \
    gps.msm8610

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-impl \
    android.hardware.health@2.0-service

# Filesystem
PRODUCT_PACKAGES += \
    setup_fs

# LiveDisplay
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.0-service-sysfs
    
# Preopt
PRODUCT_DEXPREOPT_SPEED_APPS += \
    Settings \
    Snap \
    SystemUI \
    TrebuchetQuickStep

# RenderScript HAL
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# Ril
PRODUCT_PACKAGES += \
    libqsap_shim

# Seccomp policy
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/seccomp/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(LOCAL_PATH)/seccomp/mediaextractor.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl

# Misc
PRODUCT_PACKAGES += \
    libxml2

# Misc
PRODUCT_PACKAGES += \
    curl \
    libcurl \
    tcpdump \
    libcnefeatureconfig \
    libshims_thermal

# Trust HAL
PRODUCT_PACKAGES += \
    vendor.lineage.trust@1.0-service

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl

# WiFi HAL
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service

# HIDL
PRODUCT_PACKAGES += \
	android.hidl.base@1.0 \
	android.hidl.manager@1.0-java

# Wifi
PRODUCT_PACKAGES += \
    hostapd.accept \
    hostapd.deny \
    hostapd \
    wpa_supplicant \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf \
    wpa_supplicant.conf \
    wlan_module_symlink \
    wlan_persist_symlink \
    wcnss_service \
    libQWiFiSoftApCfg \
    libqsap_sdk \
    libwpa_client \
    wificond

PRODUCT_GMS_CLIENTID_BASE := android-motorola

$(call inherit-product-if-exists, hardware/qcom/msm8x74/msm8x74.mk)
