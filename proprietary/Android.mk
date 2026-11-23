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
# PRODUCT_COPY_FILES 安装，要么由 widevine/Android.mk 安装，要么由
# mocha.mk 的 PRODUCT_COPY_FILES 安装。
#
# 【2026-11-23】OpenCamera 与 KernelSU 管理器改走 mocha.mk 的
# PRODUCT_COPY_FILES 逐字节复制：预置模块无论 platform 还是 PRESIGNED 都会
# 触发重打包 —— platform 重签名破坏 KSU 内核对管理器签名的校验，PRESIGNED
# 丢掉 v2 签名导致 PackageManager 扫描失败。原始 APK 的签名必须原样保留。

LOCAL_PATH := $(call my-dir)
