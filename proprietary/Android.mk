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
# PRODUCT_COPY_FILES 安装，要么由 widevine/Android.mk 安装，这里不再定义
# APK 模块。
#
# 【2026-11-23】OpenCamera 与 KernelSU 管理器不做系统预置，开机后手动安装
# （APK 保留在本目录 app/ 下，供 adb install / pm install）。预置踩坑记录：
# platform 重签名 → KSU 内核认不出管理器；PRESIGNED → align-package 剥掉
# v2 签名 pm 拒装；加 LOCAL_SDK_VERSION=current 触发 do_not_alter_apk 后
# 又卡 check-jni-dex-compression（原始 APK 的 dex/JNI 是压缩的，构建要求
# 非压缩）—— 原始签名 APK 与构建系统的预置管线天然冲突，放弃预置。

LOCAL_PATH := $(call my-dir)
