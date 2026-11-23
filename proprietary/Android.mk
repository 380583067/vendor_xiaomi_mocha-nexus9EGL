# Copyright (C) 2017 The Android Open Source Project
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

# proprietary/ 下的所有预编译文件，要么由 mocha-vendor-blobs.mk 通过
# PRODUCT_COPY_FILES 安装，要么由 widevine/Android.mk 安装，要么由下面
# 的模块定义安装。
#
# OpenCamera 于 2026-11-23 重新预置：发出去给别人测试的 ROM 必须自带能跑
# 的相机，Aperture 仍有 fd 泄漏导致的长时间预览后死亡问题，OpenCamera 是
# 目前验证过的主力测试相机。模块名 OpenCamera，mocha.mk 里 PRODUCT_PACKAGES。
# 注意 PRODUCT_PACKAGES 用模块名，不能写成包名 net.sourceforge.opencamera。

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := OpenCamera
LOCAL_MODULE_OWNER := xiaomi
LOCAL_SRC_FILES := app/net.sourceforge.opencamera/net.sourceforge.opencamera.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_PRODUCT_MODULE := true
include $(BUILD_PREBUILT)

# 【2026-11-23】KernelSU 管理器预置：内核已带 KSU v3.3.1
# （kernel 分支 lineageos-21-KernelSU，CONFIG_KSU=y），系统里必须有管理器
# 才能授权。APK 从测试设备拉取（me.weishu.kernelsu）。
include $(CLEAR_VARS)
LOCAL_MODULE := KernelSU
LOCAL_MODULE_OWNER := xiaomi
LOCAL_SRC_FILES := app/kernelsu/KernelSU.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_PRODUCT_MODULE := true
include $(BUILD_PREBUILT)
