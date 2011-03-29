#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# config.mk
#
# Product-specific compile-time definitions.
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

#TARGET_IS_GALAXYS := true
BOARD_USES_FROYO_GRALLOC := true
BOARD_USES_NEXUS_S_LIBS := true
BOARD_USES_NEXUS_S_AUDIO := true
BOARD_USES_OVERLAY := true
BOARD_USES_COPYBIT := false
BOARD_USES_FROYO := true
BOARD_USES_GALAXYS_INIT := true

#USE_CAMERA_STUB := false
#BOARD_OVERLAY_FORMAT_YCbRc_420_SP := true
#BUILD_PV_VIDEO_ENCODERS := 1
#BOARD_CAMERA_LIBRARIES := libcamera
#BOARD_V4L2_DEVICE := /dev/video1
#BOARD_CAMERA_DEVICE := /dev/video0
#BOARD_SECOND_CAMERA_DEVICE := /dev/video2

# inherit from the proprietary version
-include vendor/samsung/vzwtab/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := galaxytab
TARGET_NO_KERNEL := true
TARGET_NO_RECOVERY := true

TARGET_BOARD := SCH-I800
TARGET_BOARD_PLATFORM := s5pc110
TARGET_BOARD_PLATFORM_GPU := POWERVR_SGX540_120

# ARMv7-A Cortex-A8 architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
#test with -a8 flags
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8
ANDROID_ARM_LINKER := true

BOARD_NO_RGBX_8888 := true

# Sound related defines
#BOARD_USES_ALSA_AUDIO := true
#BUILD_WITH_ALSA_UTILS := true
#ALSA_DEFAULT_SAMPLE_RATE := 44100
#BOARD_USES_GALAXYTAB_AUDIO := true

# WiFi related defines
WIFI_FIRMWARE_LOADER := "wlservice"
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION := VER_0_6_X
BOARD_WLAN_DEVICE := bcm4329
WIFI_DRIVER_FW_STA_PATH := "/system/etc/wifi/bcm4329_sta.bin"
WIFI_DRIVER_FW_AP_PATH := "/system/etc/wifi/bcm4329_aps.bin"
WIFI_DRIVER_MODULE_PATH := "/lib/modules/dhd.ko"
WIFI_DRIVER_MODULE_ARG := "firmware_path=/system/etc/wifi/bcm4329_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt dhd_watchdog_ms=10 dhd_poll=1"
WIFI_DRIVER_APS_FIRMWARE_NAME := "bcm4329_aps.bin"
WIFI_DRIVER_STA_FIRMWARE_NAME := "bcm4329_sta.bin"
WIFI_DRIVER_MODULE_NAME := "dhd"
WIFI_IFACE_DIR  := "/data/misc/wifi"
WIFI_SUPP_CONFIG_FILE :=  "/data/wifi/bcm_supp.conf"
CONFIG_DRIVER_WEXT := true


#USB tethering
RNDIS_DEVICE := "/sys/devices/virtual/sec/switch/tethering"

# Bluetooth related defines
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_HAVE_BLUETOOTH := true
BT_USE_BTL_IF := true
BT_ALT_STACK := true
BRCM_BTL_INCLUDE_A2DP := true
BRCM_BT_USE_BTL_IF := true
WITH_A2DP := true

# egl
BOARD_EGL_CFG := device/samsung/vzwtab/prebuilt/lib/egl/egl.cfg

# emmc storage
BOARD_EMMC_DEVICE := /dev/block/mmcblk0p1

##For recovery key mapping
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/vzwtab/default_recovery_ui.c


# Device related defines
TARGET_PREBUILT_KERNEL := device/samsung/vzwtab/kernel
#TARGET_NO_BUILD_WIFI := true
#TARGET_PREBUILT_MODULES := device/samsung/vzwtab/prebuilt/lib/modules/
BOARD_KERNEL_CMDLINE := no_console_suspend=1 console=null
BOARD_KERNEL_BASE := 0x02e00000

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_USES_FFORMAT := true
#BOARD_RECOVERY_IGNORE_BOOTABLES := true

BOARD_BOOTIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x00780000)
BOARD_RECOVERYIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x00780000)
BOARD_SYSTEMIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x14A00000)
BOARD_USERDATAIMAGE_MAX_SIZE := $(call image-size-from-data-size,0x04ac0000)
# The size of a block that can be marked bad.
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_BOOT_DEVICE := /dev/block/bml7
BOARD_DATA_DEVICE := /dev/block/mmcblk0p2
BOARD_DATA_FILESYSTEM := auto
BOARD_DATA_FILESYSTEM_OPTIONS := llw,check=no,nosuid,nodev
BOARD_HAS_DATADATA := true
BOARD_DATADATA_DEVICE := /dev/block/stl10
BOARD_DATADATA_FILESYSTEM := auto
BOARD_DATADATA_FILESYSTEM_OPTIONS := llw,check=no,nosuid,nodev
BOARD_SYSTEM_DEVICE := /dev/block/stl9
BOARD_SYSTEM_FILESYSTEM := auto
BOARD_SYSTEM_FILESYSTEM_OPTIONS := llw,check=no
BOARD_CACHE_DEVICE := /dev/block/stl11
BOARD_CACHE_FILESYSTEM := auto
BOARD_CACHE_FILESYSTEM_OPTIONS := llw,check=no,nosuid,nodev
BOARD_SDEXT_FILESYSTEM := auto
BOARD_HAS_PARAMFS := true
BOARD_PARAMFS_DEVICE := dev/block/stl6
BOARD_PARAMFS_FILESYSTEM := auto
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_USES_BMLUTILS := true

BOARD_USES_BMLUTILS := true
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk0p1
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_SDCARD_DEVICE_INTERNAL := /dev/block/mmcblk0p1

# redirect recovery stuff to root
TARGET_RECOVERY_OUT := $(PRODUCT_OUT)/root
TARGET_RECOVERY_ROOT_OUT := $(TARGET_RECOVERY_OUT)


