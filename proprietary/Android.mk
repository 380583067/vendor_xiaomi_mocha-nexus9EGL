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

# Every prebuilt under proprietary/ is installed either by mocha-vendor-blobs.mk
# through PRODUCT_COPY_FILES or by widevine/Android.mk; no APK modules are defined
# here.
#
# [2026-11-23] OpenCamera and the KernelSU manager are not preset; install them by
# hand after boot (the APKs stay in app/ for adb install / pm install). What went
# wrong when presetting them:
# platform re-sign -> the KSU kernel no longer recognises the manager; PRESIGNED ->
# align-package strips the v2 signature and pm refuses the package; adding
# LOCAL_SDK_VERSION=current triggers do_not_alter_apk and then fails
# check-jni-dex-compression (the original APK has compressed dex/JNI, the build
# wants them uncompressed) - an original-signature APK fundamentally conflicts with
# the build's preset pipeline, so presetting was dropped.

LOCAL_PATH := $(call my-dir)
