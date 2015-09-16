$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/alps/k05ts_a/k05ts_a-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/alps/k05ts_a/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/alps/k05ts_a/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/alps/k05ts_a/recovery/init.recovery.mt6753.rc:recovery/root/init.recovery.mt6753.rc \
    device/alps/k05ts_a/recovery/init.mt6753.rc:recovery/root/init.mt6753.rc \
    device/alps/k05ts_a/recovery/init.recovery.mt6753.rc:root/init.recovery.mt6753.rc \
    device/alps/k05ts_a/recovery/init.mt6753.rc:root/init.mt6753.rc \
    device/alps/k05ts_a/recovery/twrp.fstab:recovery/root/etc/twrp.fstab \
#    $(LOCAL_PATH)/rootdir/recovery.fstab:recovery.fstab
#    $(LOCAL_PATH)/rootdir/init.rc:root/init.rc \

PRODUCT_COPY_FILES_OVERRIDES += \
    recovery/root/file_contexts \
    recovery/root/property_contexts \
    recovery/root/seapp_contexts \
    recovery/root/sepolicy \
    recovery/root/ueventd.rc \
    root/fstab.goldfish \
    root/init.goldfish.rc \
    recovery/root/fstab.goldfish


$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
#PRODUCT_NAME := full_k05ts_a
#PRODUCT_DEVICE := k05ts_a

ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0 \
ro.allow.mock.location=1 \
persist.mtk.aee.aed=on \
ro.debuggable=1 \
ro.adb.secure=0 \
persist.service.acm.enable=0 \
persist.sys.usb.config=mtp \
ro.mount.fs=EXT4 \
ro.persist.partition.support=no \
ro.cip.partition.support=no \
persist.service.adb.enable=1
