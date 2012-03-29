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
# This is the product configuration for a generic GSM bravo,
# not specialized for any geography.
#

# First, the most specific values, i.e. the aspects that are specific to GSM

DEVICE_PACKAGE_OVERLAYS += device/htc/bravo/overlay \
						   vendor/aokp/overlay/bravo

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    rild.libpath=/system/lib/libhtc_ril.so \
    ro.ril.ecc.HTC-ELL=92,93,94 \
    ro.ril.ecc.HTC-WWE=999 \
    ro.ril.enable.a52.HTC-ITA=1 \
    ro.ril.enable.a53.HTC-ITA=1 \
    ro.ril.enable.a52=0 \
    ro.ril.enable.a53=1 \
    ro.ril.enable.dtm=1 \
    ro.ril.gprsclass=12 \
    ro.ril.hsdpa.category=8 \
    ro.ril.hsupa.category=5 \
    ro.ril.hsxpa=2 \
    ro.ril.def.agps.mode=2 \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=15 \
    mobiledata.interfaces=rmnet0,rmnet1,rmnet2 \
    ro.media.dec.jpeg.memcap=20000000 \
    dalvik.vm.heapsize=48m \
    ro.opengles.version=131072

# Default network type.
# 0 => /* GSM/WCDMA (WCDMA preferred) */
# 3 => /* GSM/WCDMA (auto mode, according to PRL) */
PRODUCT_PROPERTY_OVERRIDES += ro.telephony.default_network=3

# Set default_france.acdb to audio_ctl driver if the ro.cid is HTC__203
PRODUCT_PROPERTY_OVERRIDES += ro.ril.enable.prl.recognition=1

# Don't set /proc/sys/vm/dirty_ratio to 0 when USB mounting
PRODUCT_PROPERTY_OVERRIDES += ro.vold.umsdirtyratio=20

# Disable HWAccel for now
PRODUCT_PROPERTY_OVERRIDES += ro.config.disable_hw_accel=true

# Ril workaround
PRODUCT_PROPERTY_OVERRIDES += ro.telephony.ril.v3=signalstrength
    #skipbrokendatacall,facilitylock,datacall,icccardstatus

# Set usb type
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mass_storage \
    persist.service.adb.enable=1

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
    vendor/aokp/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml \
	vendor/aokp/prebuilt/common/media/bootanimation.zip:system/media/bootanimation.zip \
	vendor/aokp/prebuilt/common/app/LatinImeDictionaryPack.apk:system/app/LatinImeDictionaryPack.apk

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/bravo/media_profiles.xml:system/etc/media_profiles.xml

# Sensors
PRODUCT_PACKAGES += \
    gps.bravo \
    lights.bravo \
    sensors.bravo \
    camera.qsd8k
# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.qsd8k \
    audio_policy.qsd8k \
    libaudioutils
# GPU
PRODUCT_PACKAGES += \
    copybit.qsd8k \
    gralloc.qsd8k \
    hwcomposer.default \
    hwcomposer.qsd8k
#    libgenlock \
#    libmemalloc \
#    liboverlay \
#    libtilerenderer \
#    libQcomUI
# Omx
PRODUCT_PACKAGES += \
    libOmxCore \
    libOmxVenc \
    libOmxVdec \
    libstagefrighthw

# Camera
PRODUCT_PACKAGES += Camera

# Superuser
PRODUCT_PACKAGES += Superuser

# Trebuchet launcher
PRODUCT_PACKAGES += Trebuchet

# LWPs
PRODUCT_PACKAGES += LiveWallpapers LiveWallpapersPicker VisualizationWallpapers PhaseBeam UnicornPorn

PRODUCT_LOCALES := en

# Passion uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_COPY_FILES += \
    device/htc/bravo/init.bravo.rc:root/init.bravo.rc \
    device/htc/bravo/init.bravo.usb.rc:root/init.bravo.usb.rc \
    device/htc/bravo/ueventd.bravo.rc:root/ueventd.bravo.rc \
    device/htc/bravo/bravo-keypad.kl:system/usr/keylayout/bravo-keypad.kl \
    device/htc/bravo/bravo-keypad.kcm:system/usr/keychars/bravo-keypad.kcm \
    device/htc/bravo/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/bravo/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/bravo/curcial-oj.idc:system/usr/idc/curcial-oj.idc \
    device/htc/bravo/vold.fstab:system/etc/vold.fstab

# Prebuilt kernel / wifi module
PRODUCT_COPY_FILES += \
    device/htc/bravo/prebuilt/bcm4329.ko:system/lib/modules/bcm4329.ko \
    device/htc/bravo/prebuilt/kernel:kernel

# Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/bravo/bravo-vendor.mk)
