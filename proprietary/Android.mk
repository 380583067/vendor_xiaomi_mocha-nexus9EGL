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
# PRODUCT_COPY_FILES 安装，要么由 widevine/Android.mk 安装，这里不再定义模块。
#
# 原先这里还定义过两个预编译 APK 模块：SimpleKeyboard
# （app/keyboard/keyboard.apk）和 OpenCamera
# （app/net.sourceforge.opencamera/net.sourceforge.opencamera.apk）。
# 但这两个模块从来没有进过 PRODUCT_PACKAGES，也就是说它们永远不会被装进
# 系统镜像，纯粹是仓库里 47MB 的死重量。现在 APK 和模块定义一起删掉了，
# 键盘用 AOSP 自带的，相机用 LineageOS 自带的。
#
# 这个文件即使不定义任何模块也保留：vendor/xiaomi/mocha/Android.mk 用
# all-makefiles-under 递归包含所有子目录，删掉它不会构建失败，但留着可以说明
# 其余 blob 的安装方式。

LOCAL_PATH := $(call my-dir)
