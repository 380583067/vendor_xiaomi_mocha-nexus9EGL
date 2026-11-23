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
# 【2026-11-23】OpenCamera 与 KernelSU 管理器预置为 BUILD_PREBUILT，两条
# 铁律（都是实测踩出来的坑）：
#   1. 必须 PRESIGNED —— platform 重签名会让 KSU 内核认不出管理器；
#   2. 必须 LOCAL_DEX_PREOPT := false —— dexpreopt 重打包会剥掉 v2 签名，
#      PackageManager 报 "No APK Signature Scheme v2 signature" 直接拒装。
# 另外 COPY_FILES 不能装 APK（构建系统显式禁止），所以只能走模块。

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := OpenCamera
LOCAL_MODULE_OWNER := xiaomi
LOCAL_SRC_FILES := app/net.sourceforge.opencamera/net.sourceforge.opencamera.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_DEX_PREOPT := false
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_PRODUCT_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := KernelSU
LOCAL_MODULE_OWNER := xiaomi
LOCAL_SRC_FILES := app/kernelsu/KernelSU.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_DEX_PREOPT := false
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_PRODUCT_MODULE := true
include $(BUILD_PREBUILT)
