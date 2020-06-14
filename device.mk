# Local Paths
DEVICE_BASE := device/amazon/douglas
DEVICE_VENDOR := /vendor/amazon/douglas

# Device overlay
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_BASE)/overlay

# Languages
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml

# Ramdisk
PRODUCT_COPY_FILES += \
    $(DEVICE_BASE)/rootdir/fstab.mt8163:root/fstab.mt8163 \
    $(DEVICE_BASE)/rootdir/init.douglas.rc:root/init.douglas.rc \
    $(DEVICE_BASE)/rootdir/init.mt8163.rc:root/init.mt8163.rc \
    $(DEVICE_BASE)/rootdir/init.recovery.mt8163.rc:root/init.recovery.mt8163.rc \
    $(DEVICE_BASE)/rootdir/init.mt8163.usb.rc:root/init.mt6592.usb.rc \
    $(DEVICE_BASE)/rootdir/init.project.rc:root/root/init.project.rc \
    $(DEVICE_BASE)/rootdir/init.ssd.rc:root/root/init.ssd.rc \
    $(DEVICE_BASE)/rootdir/init.wifi.rc:root/root/init.wifi.rc \
    $(DEVICE_BASE)/rootdir/ueventd.mt8163.rc:root/ueventd.mt8163.rc

# Config files
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml \
    $(DEVICE_BASE)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(DEVICE_BASE)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(DEVICE_BASE)/configs/audio_device.xml:system/etc/audio_device.xml \
    $(DEVICE_BASE)/configs/audio_policy.conf:system/vendor/etc/audio_policy.conf

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default \
    audio_policy.stub \
    libalsautils \
    libaudio-resampler \
    libtinyalsa \
    libtinycompress \
    libtinyxml \
    libaudioroute

# OMX    
PRODUCT_PACKAGES += \
    libdashplayer

# Bluetooth
PRODUCT_PACKAGES += \
    bluetooth.default
	
# Graphics
PRODUCT_PACKAGES += \
    libion \
    libgralloc_extra \
    libcap

# Memtrack
PRODUCT_PACKAGES += \
    memtrack.mt8163

# Lights
PRODUCT_PACKAGES += \
    lights.mt8163

# Power
PRODUCT_PACKAGES += \
    power.default

# Network
PRODUCT_PACKAGES += \
    netd \
    wpa_supplicant
    
# IPv6 tethering
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes

# Zygote
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.zygote=zygote64_32

# exFAT support
WITH_EXFAT := true

# Audio Fix
PRODUCT_PACKAGES += \
    audiofix \
    libaudio_shim

# Shim Symbols
PRODUCT_PACKAGES += \
    liblog_shim \
    libgui_shim \
    libatomic_shim

# EGL
PRODUCT_PACKAGES += \
    libGLES_android

# Media Extractors
BOARD_SECCOMP_POLICY := \
    $(DEVICE_BASE)/seccomp-policy

# call dalvik heap config
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

# call vendor blobs makefile
$(call inherit-product-if-exists, vendor/amazon/douglas/douglas-vendor.mk)
