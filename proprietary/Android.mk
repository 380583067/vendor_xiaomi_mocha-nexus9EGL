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

# Every prebuilt under proprietary/ is installed either through
# mocha-vendor-blobs.mk (PRODUCT_COPY_FILES) or through widevine/Android.mk.
#
# Two prebuilt APKs used to be defined here: SimpleKeyboard
# (app/keyboard/keyboard.apk) and OpenCamera
# (app/net.sourceforge.opencamera/net.sourceforge.opencamera.apk). Neither
# module was ever listed in PRODUCT_PACKAGES, so neither APK ever reached the
# image - they were 47 MB of dead weight in the repository. Both APKs and their
# module definitions have been removed; the stock AOSP keyboard and the LineageOS
# camera app are used instead.
#
# Keep this file (even though it defines no modules): vendor/xiaomi/mocha/
# Android.mk includes every subdirectory with all-makefiles-under, so removing
# the file would not break the build, but keeping it documents where the blobs
# come from.

LOCAL_PATH := $(call my-dir)
