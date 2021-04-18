# Arch
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := lahaina

# Recovery
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_RECOVERY_FSTAB := device/xiaomi/venus/fstab.qcom

# Kernel
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x06000000
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 0x06000000
BOARD_DTBOIMG_PARTITION_SIZE := 0x0800000

BOARD_BOOT_HEADER_VERSION := 3
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 androidboot.usbcontroller=a600000.dwc3 swiotlb=0 loop.max_part=7 cgroup.memory=nokmem,nosocket pcie_ports=compat loop.max_part=7 iptable_raw.raw_before_defrag=1 ip6table_raw.raw_before_defrag=1 buildvariant=user
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
KERNEL_LD := LD=ld.lld
TARGET_KERNEL_ADDITIONAL_FLAGS := DTC_EXT=$(shell pwd)/prebuilts/misc/linux-x86/dtc/dtc
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/xiaomi/sm8350
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CONFIG := vendor/venus_QGKI.config
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

BOOT_KERNEL_MODULES := \
    clk-dummy.ko \
    clk-qcom.ko \
    clk-rpmh.ko \
    cmd-db.ko \
    crypto-qti-common.ko \
    crypto-qti-hwkm.ko \
    gcc-lahaina.ko \
    gcc-shima.ko \
    hwkm.ko \
    icc-bcm-voter.ko \
    icc-rpmh.ko \
    iommu-logger.ko \
    memory_dump_v2.ko \
    modules.alias \
    modules.dep \
    modules.load \
    modules.softdep \
    msm-poweroff.ko \
    phy-qcom-ufs.ko \
    phy-qcom-ufs-qmp-v4-lahaina.ko \
    phy-qcom-ufs-qrbtc-sdm845.ko \
    pinctrl-lahaina.ko \
    pinctrl-msm.ko \
    pinctrl-shima.ko \
    proxy-consumer.ko \
    qbt_handler.ko \
    qcom-arm-smmu-mod.ko \
    qcom-pdc.ko \
    qcom_rpmh.ko \
    _qcom_scm.ko \
    qnoc-lahaina.ko \
    qnoc-qos.ko \
    qnoc-shima.ko \
    qpnp-power-on.ko \
    refgen.ko \
    rpmhpd.ko \
    rpmh-regulator.ko \
    secure_buffer.ko \
    stub-regulator.ko \
    ufshcd-crypto-qti.ko \
    ufs-qcom.ko \

KERNEL_MODULES_LOAD := $(strip $(shell cat device/xiaomi/venus/modules.load))
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(filter-out $(BOOT_KERNEL_MODULES), $(KERNEL_MODULES_LOAD))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(filter $(BOOT_KERNEL_MODULES), $(KERNEL_MODULES_LOAD))

# Partitions
BOARD_SUPER_PARTITION_SIZE := 6442450944
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := odm product system system_ext vendor
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor

# Treble
BOARD_VNDK_VERSION := current

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    odm \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor
