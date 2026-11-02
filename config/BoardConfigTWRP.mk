# SPDX-FileCopyrightText: 2017-2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0

ifeq ($(BOARD_USES_RECOVERY_AS_BOOT),true)
    ifneq ($(TW_NO_FASTBOOT_BOOT),true)
        ifeq (true,$(BUILDING_VENDOR_BOOT_IMAGE))
            GENERIC_KERNEL_CMDLINE += twrpfastboot=1
        else
            INTERNAL_KERNEL_CMDLINE += twrpfastboot=1
        endif
    endif
endif

# Recovery
BOARD_USES_FULL_RECOVERY_IMAGE ?= true

include vendor/twrp/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
    include hardware/qcom-caf/common/BoardConfigQcom.mk
endif

include vendor/twrp/config/BoardConfigSoong.mk
