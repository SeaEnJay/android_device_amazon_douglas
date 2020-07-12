# Define local paths
DEVICE_BASE := device/amazon/douglas
DEVICE_VENDOR := vendor/amazon/douglas
KERNEL_SOURCE := kernel/amazon/douglas

# inherit from the proprietary version
-include $(DEVICE_VENDOR)/BoardConfigVendor.mk

# Mediatek Audio Headers
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_BASE)/include

# Board/Bootloader
TARGET_BOARD_PLATFORM_GPU := mali-720mp2
TARGET_BOOTLOADER_BOARD_NAME := douglas
TARGET_NO_BOOTLOADER := true

# CPU/ARCH
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a15
TARGET_CPU_SMP := true

# Kernel
TARGET_PREBUILT_KERNEL := $(DEVICE_BASE)/prebuilt/kernel
TARGET_KERNEL_ARCH := arm64
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x03f88000 --second_offset 0x00e80000 --tags_offset 0x48000000 --base 0x40078000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_OFFSET := 0
BOARD_KERNEL_PAGESIZE := 2048
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb

#TARGET_KERNEL_SOURCE := kernel/amazon/douglas
#TARGET_KERNEL_CONFIG := douglas_defconfig

#TARGET_KERNEL_CROSS_COMPILE_PREFIX := $(shell pwd)/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-

TARGET_USES_64_BIT_BINDER := true

# MTK Flags
TARGET_BOARD_PLATFORM := mt8163
BOARD_USES_MTK_AUDIO := true
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true
MTK_APPENDED_DTB_SUPPORT := yes
BOARD_USES_MTK_HARDWARE := true
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true

# Wi-Fi
BOARD_WLAN_DEVICE := MediaTek
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM := /dev/wmtWifi
WIFI_DRIVER_FW_PATH_AP := AP
WIFI_DRIVER_FW_PATH_STA := STA
WIFI_DRIVER_FW_PATH_P2P := P2P
WIFI_DRIVER_STATE_CTRL_PARAM := /dev/wmtWifi
WIFI_DRIVER_STATE_ON := 1
WIFI_DRIVER_STATE_OFF := 0

# Camera
USE_CAMERA_STUB := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_BASE)/bluetooth

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file

# Graphics
BOARD_EGL_CFG := $(DEVICE_BASE)/configs/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_OVERLAY := true
TARGET_USES_OVERLAY := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MAX_VIRTUAL_DISPLAY_DIMENSION := 1
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 1024*1024
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true

# Hwcomposer
MTK_HWC_SUPPORT := yes
MTK_HWC_VERSION := 1.4.1

# Bootanimation
TARGET_BOOTANIMATION_MULTITHREAD_DECODE := true
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_SCREEN_WIDTH := 800
TARGET_SCREEN_HEIGHT := 1280

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 17825792
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1692925952
BOARD_CACHEIMAGE_PARTITION_SIZE := 444596224
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

#Use dlmalloc instead of jemalloc for mallocs
MALLOC_SVELTE := true

# OTA
BLOCK_BASED_OTA := false
TARGET_OTA_ASSERT_DEVICE := douglas

# Shim Symbols
LINKER_FORCED_SHIM_LIBS := \
    /system/lib/liblog.so|liblog_shim.so \
    /system/lib64/liblog.so|liblog_shim.so \
    /system/lib/libasp.so|liblog_shim.so \
    /system/lib64/libasp.so|liblog_shim.so \
    /system/lib/libgui_ext.so|libgui_shim.so \
    /system/lib64/libgui_ext.so|libgui_shim.so \
    /system/lib/libui_ext.so|libgui_shim.so \
    /system/lib64/libui_ext.so|libgui_shim.so \
    /system/lib/hw/hwcomposer.mt8163.so|libatomic_shim.so \
    /system/lib64/hw/hwcomposer.mt8163.so|libatomic_shim.so \
    /system/lib/hw/hwcomposer.mt8163.so|libgui_shim.so \
    /system/lib64/hw/hwcomposer.mt8163.so|libgui_shim.so

# TWRP COMMON
TARGET_RECOVERY_FSTAB := $(DEVICE_BASE)/rootdir/etc/recovery.fstab
BOARD_HAS_NO_SELECT_BUTTON := true
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone2/temp
DEVICE_RESOLUTION := 800x1280
