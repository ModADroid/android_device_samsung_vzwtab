#
# Copyright (C) 2009 The Android Open Source Project
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

#
# This is the product configuration for a generic GSM passion,
# not specialized for any geography.
#

# use libs from nexus s
$(call inherit-product, device/samsung/common/galaxys.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

## (1) First, the most specific values, i.e. the aspects that are specific to GSM
PRODUCT_COPY_FILES += \
    device/samsung/vzwtab/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/vzwtab/vzwtab-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=200 \
    rild.libpath=/system/lib/libsec-ril40.so \
    rild.libargs=-d[SPACE]/dev/ttyS0 \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=15 \
    ro.wifi.channels=11

#verizon cdma stuff
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.android.wifi-watchlist=GoogleGuest \
	ro.error.receiver.system.apps=com.google.android.feedback \
	ro.setupwizard.enterprise_mode=1 \
	ro.com.google.clientidbase=android-verizon \
	ro.com.google.clientidbase.yt=android-verizon \
	ro.com.google.clientidbase.am=android-verizon \
	ro.com.google.clientidbase.vs=android-verizon \
	ro.com.google.clientidbase.gmm=android-verizon \
	ro.com.google.locationfeatures=1 \
	ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
	ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
	ro.cdma.home.operator.numeric=310004 \
	ro.cdma.home.operator.alpha=Verizon \
	ro.cdma.homesystem=64,65,76,77,78,79,80,81,82,83 \
	net.dns1=8.8.8.8 \
	net.dns2=8.8.4.4 \
	ro.config.vc_call_vol_steps=7 \
	ro.cdma.otaspnumschema=SELC,1,80,99 \
	ro.telephony.call_ring.multiple=false \
	ro.telephony.call_ring.delay=3000 \
  	net.cdma.pppd.authtype=require-chap \
	net.cdma.pppd.user=user[SPACE]VerizonWireless \
	net.cdma.datalinkinterface=/dev/ttyCDMA0 \
	net.interfaces.defaultroute=cdma \
	net.cdma.ppp.interface=ppp0 \
	net.connectivity.type=CDMA1 \
	gsm.operator.alpha=VzW \
	gsm.operator.numeric=310012 \
	gsm.operator.iso-country=us \
	gsm.operator.isroaming=false \
	gsm.current.phone-type=2 \
	ro.csc.sales_code=VZW \
	ril.sales_code=VZW \
	ro.carrier=Verizon \
	mobiledata.interfaces=eth0,ppp0

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.startheapsize=8m \
    dalvik.vm.heapsize=48m

# For mobiledatainterfaces
PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=eth0,ppp0

# vzwtab uses high-density artwork where available
PRODUCT_LOCALES := hdpi

DEVICE_PACKAGE_OVERLAYS += device/samsung/vzwtab/overlay

# media profiles and capabilities spec
PRODUCT_PROPERTY_OVERRIDES += \
      media.a1026.nsForVoiceRec            = 0 \
      media.a1026.enableA1026              = 1

# media config xml file
PRODUCT_COPY_FILES += \
    device/samsung/vzwtab/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml

# gps stuff from DJ11
PRODUCT_COPY_FILES += \
    device/samsung/vzwtab/prebuilt/etc/gps.conf:system/etc/gps.conf \
    device/samsung/vzwtab/prebuilt/lib/libgps.so:system/lib/libgps.so \
    device/samsung/vzwtab/prebuilt/lib/libsecgps.so:system/lib/libsecgps.so \
    device/samsung/vzwtab/prebuilt/lib/libgps.so:obj/lib/libgps.so \
    device/samsung/vzwtab/prebuilt/lib/libsecgps.so:obj/lib/libsecgps.so \
    device/samsung/vzwtab/prebuilt/bin/gpsd/glgps_samsungJupiter:system/bin/gpsd/glgps_samsungJupiter \
    device/samsung/vzwtab/prebuilt/etc/jupiter.xml:system/etc/jupiter.xml

# other stuffs
PRODUCT_COPY_FILES += \
    device/samsung/vzwtab/prebuilt/app/FlashPlayer.apk:system/app/FlashPlayer.apk \
    device/samsung/vzwtab/prebuilt/etc/terminfo/l/linux:system/etc/terminfo/l/linux \
    device/samsung/vzwtab/prebuilt/etc/terminfo/u/unknown:system/etc/terminfo/u/linux \
    device/samsung/vzwtab/prebuilt/xbin/redbend_ua:system/xbin/redbend_ua \
    device/samsung/vzwtab/prebuilt/xbin/strace:system/xbin/strace \
    device/samsung/vzwtab/prebuilt/xbin/bmlunlock:system/xbin/bmlunlock \
    device/samsung/vzwtab/prebuilt/xbin/rw:system/xbin/rw \
    device/samsung/vzwtab/prebuilt/xbin/ro:system/xbin/ro \
    device/samsung/vzwtab/prebuilt/app/Swype.apk:system/app/Swype.apk \
    device/samsung/vzwtab/prebuilt/lib/libSwypeCore.so:system/lib/libSwypeCore.so

# asound.conf
PRODUCT_COPY_FILES += \
    device/samsung/vzwtab/prebuilt/etc/asound.conf:system/etc/asound.conf

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/handheld_core_hardware.xml

# Keylayout / Keychars
PRODUCT_COPY_FILES += \
     device/samsung/vzwtab/prebuilt/keylayout/AT42QT602240_Touchscreen.kl:system/usr/keylayout/AT42QT602240_Touchscreen.kl.kl \
     device/samsung/vzwtab/prebuilt/keylayout/Broadcom_Bluetooth_HID.kl:system/usr/keylayout/Broadcom_Bluetooth_HID.kl \
     device/samsung/vzwtab/prebuilt/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
     device/samsung/vzwtab/prebuilt/keylayout/p1_keyboard.kl:system/usr/keylayout/p1_keyboard.kl \
     device/samsung/vzwtab/prebuilt/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
     device/samsung/vzwtab/prebuilt/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
     device/samsung/vzwtab/prebuilt/keylayout/melfas-touchkey.kl:system/usr/keylayout/melfas-touchkey.kl \
     device/samsung/vzwtab/prebuilt/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
     device/samsung/vzwtab/prebuilt/keychars/AT42QT602240_Touchscreen.kcm.bin:system/usr/keychars/AT42QT602240_Touchscreen.kcm.bin \
     device/samsung/vzwtab/prebuilt/keychars/Broadcom_Bluetooth_HID.kcm.bin:system/usr/keychars/Broadcom_Bluetooth_HID.kcm.bin \
     device/samsung/vzwtab/prebuilt/keychars/gpio-keys.kcm.bin:system/usr/keychars/gpio-keys.kcm.bin \
     device/samsung/vzwtab/prebuilt/keychars/p1_keyboard.kcm.bin:system/usr/keychars/p1_keyboard.kcm.bin \
     device/samsung/vzwtab/prebuilt/keychars/sec_jack.kcm.bin:system/usr/keychars/sec_jack.kcm.bin \
     device/samsung/vzwtab/prebuilt/keychars/melfas-touchkey.kcm.bin:system/usr/keychars/melfas-touchkey.kcm.bin \
     device/samsung/vzwtab/prebuilt/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
     device/samsung/vzwtab/prebuilt/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin 

#
#Test Files aka other, other stuff
#
PRODUCT_COPY_FILES += \
    vendor/samsung/vzwtab/proprietary/etc/wifi/nvram_mfg_lna.txt:system/etc/wifi/nvram_mfg_lna.txt \
    vendor/samsung/vzwtab/proprietary/etc/wifi/nvram_mfg_nolna.txt:system/etc/wifi/nvram_mfg_nolna.txt \
    vendor/samsung/vzwtab/proprietary/etc/wifi/nvram_net_2G.txt:system/etc/wifi/nvram_net_2G.txt \
    vendor/samsung/vzwtab/proprietary/etc/wifi/nvram_net_lna.txt:system/etc/wifi/nvram_net_lna.txt \
    vendor/samsung/vzwtab/proprietary/etc/wifi/nvram_net_nolna.txt:system/etc/wifi/nvram_net_nolna.txt \
    vendor/samsung/vzwtab/proprietary/bin/mfgloader:system/bin/mfgloader\
    vendor/samsung/vzwtab/proprietary/lib/hw/copybit.s5pc110.so:system/lib/hw/copybit.s5pc110.so\
    vendor/samsung/vzwtab/proprietary/bin/killmediaserver:system/bin/killmediaserver\
    vendor/samsung/vzwtab/proprietary/bin/notified_event:system/bin/notified_event\
    vendor/samsung/vzwtab/proprietary/lib/libtvoutservice.so:system/lib/libtvoutservice.so \
    vendor/samsung/vzwtab/proprietary/lib/libtvout.so:system/lib/libtvout.so \
    vendor/samsung/vzwtab/proprietary/lib/lib_tvoutengine.so:system/lib/lib_tvoutengine.so \
    vendor/samsung/vzwtab/proprietary/lib/libtvoutfimc.so:system/lib/libtvoutfimc.so \
    vendor/samsung/vzwtab/proprietary/lib/libtvouthdmi.so:system/lib/libtvouthdmi.so \
    vendor/samsung/vzwtab/proprietary/lib/libtvout_jni.so:system/lib/libtvout_jni.so \
    vendor/samsung/vzwtab/proprietary/lib/libedid.so:system/lib/libedid.so \
    vendor/samsung/vzwtab/proprietary/lib/libddc.so:system/lib/libddc.so \
    vendor/samsung/vzwtab/proprietary/bin/tvoutserver:system/bin/tvoutserver \
    vendor/samsung/vzwtab/proprietary/lib/libtvout.so:obj/lib/libtvout.so


 

# Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/samsung/vzwtab/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_NAME := full_vzwtab
PRODUCT_DEVICE := vzwtab
PRODUCT_MODEL := vzwtab
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := Samsung
PRODUCT_POLICY := android.policy_phone

PRODUCT_BUILD_PROP_OVERRIDES := BUILD_ID=FROYO BUILD_DISPLAY_ID=FROYO.DJ11 PRODUCT_NAME=SCH-I800 TARGET_DEVICE=SCH-I800 PRODUCT_MODEL=SCH-I800 PRODUCT_BRAND=verizon BUILD_FINGERPRINT=verizon/SCH-I800/SCH-I800/SCH-I800:2.2.1/FROYO/DJ11:user/release-keys PRIVATE_BUILD_DESC="SCH-I800-user 2.2.1 FROYO DJ11 release-keys"

PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=Vanilla_FroYo_Tab-v0.9.3 \
        ro.sf.hwrotation=90

PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.execution-mode=int:jit

