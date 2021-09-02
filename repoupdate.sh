#!/bin/bash
# LICENSE: https://github.com/RahifM/repo_update/blob/staging/proton-rvc/LICENSE

# exit script immediately if a command fails or a variable is unset
set -eu

# Some people require insecure proxies
HTTP=https
if [ "${INSECURE_PROXY:-}" = "TRUE" ]; then
    HTTP=http
fi

ANDROOT=$PWD

pushd() {
    command pushd "$@" > /dev/null
}

popd() {
    command popd > /dev/null
}

enter_aosp_dir() {
    [ -z "$1" ] && (echo "ERROR: enter_aosp_dir must be called with at least a path! (and optionally an alternative fetch path)"; exit 1)

    [ "$ANDROOT" != "$PWD" ] && echo "WARNING: enter_aosp_dir was not called from $ANDROOT. Please fix the script to call popd after every block of patches!"

    LINK="$HTTP://android.googlesource.com/platform/${2:-$1}"
    echo "Entering $1"
    pushd "$ANDROOT/$1"
}

#if [ "${SKIP_SYNC:-}" != "TRUE" ]; then
  #  pushd "$ANDROOT/.repo/local_manifests"
 #   git pull
  #  popd
#
 #   repo sync -j8 --current-branch --no-tags
#fi

enter_aosp_dir art
git fetch https://github.com/AOSP-whatever/platform_art proton-rvc --depth=2 -j16
git cherry-pick 53ace4c570a2bc71f0f6d6a8e07c6ecf9126174b
popd

enter_aosp_dir bionic
git fetch https://github.com/AOSP-whatever/platform_bionic proton-rvc --depth=3 -j16
git cherry-pick 9897152fd25698acef8808dda7d58e66e535039f^..b1b82e56259a254cf0bbbd4321fc75590b881f77
popd

enter_aosp_dir bootable/recovery
git fetch https://github.com/AOSP-whatever/platform_bootable_recovery android-11.0.0 #--depth=3 -j16
git cherry-pick 4e5a1dc677e603d644ed4a644f9794979ed3b9a4
popd

enter_aosp_dir build/make
git fetch https://github.com/AOSP-whatever/platform_build_make proton-rvc --depth=18 -j16
git cherry-pick 1c5675e2575729177e10a65a134aef2474878b08^..af9658a2652edac5cca568711367dbd05719cadc
popd

enter_aosp_dir build/soong
git fetch https://github.com/AOSP-whatever/platform_build_soong proton-rvc --depth=7 -j16
git cherry-pick 41d2510c8283ab3222d56a21e3a69ba664e69e8c^..46c9227396782044a2d1386ff4e686cc77c53c8c
popd

enter_aosp_dir external/perfetto
git fetch https://github.com/AOSP-whatever/platform_external_perfetto android-11.0.0 #--depth=14 -j16
git cherry-pick cd79f717a675c0d23bf089a0f1dee6b1e8f25edd
popd

enter_aosp_dir external/tinycompress
git fetch https://github.com/AOSP-whatever/platform_external_tinycompress android-11.0.0 #--depth=14 -j16
git cherry-pick 0b4ee126c6b28e613d79761d16a87f2536fd51f6
popd

enter_aosp_dir frameworks/av
git fetch https://github.com/AOSP-whatever/platform_frameworks_av proton-rvc --depth=14 -j16
git cherry-pick 9471be5dae5be537640e60b6ce8b36415e491a8d^..444c4b427c1a0eca6215ed2114d0b36583eb3807
popd

enter_aosp_dir frameworks/base
git fetch https://github.com/AOSP-whatever/platform_frameworks_base proton-rvc --depth=14 -j16
git cherry-pick 3fefbf1d856af2b44de02ffd559e9737755c1946^..052c1117cffa1bad2a223ebf2ab735326d571452
popd

enter_aosp_dir frameworks/native
git fetch https://github.com/AOSP-whatever/platform_frameworks_native proton-rvc --depth=3 -j16
git cherry-pick a16873a4aeadb59ec88d125a11678ed5f34b5997^..21c70a52218add9b9392eff0195ba673bbb66557
popd

enter_aosp_dir frameworks/opt/net/wifi
git fetch https://github.com/AOSP-whatever/platform_frameworks_opt_net_wifi android-11.0.0 #--depth=3 -j16
git cherry-pick 0394a575899a9224fb7718b5aaa07092b0f54d3e^..866d67c680e71919d6e7dd2beec869e0ca696cad
popd

enter_aosp_dir hardware/interfaces
git fetch https://github.com/AOSP-whatever/platform_hardware_interfaces android-11.0.0 #--depth=3 -j16
git cherry-pick b49270a8347134826a50baddc699b0b02849782e
popd

enter_aosp_dir hardware/libhardware
git fetch https://github.com/AOSP-whatever/platform_hardware_libhardware android-11.0.0 #--depth=3 -j16
git cherry-pick 8d0b681485e7fcf8ac108c0e679924f903c9a165^..2688132d1eeaab53ed097b6c0fee9f9a853a0073
popd

enter_aosp_dir packages/apps/Launcher3
git fetch https://github.com/AOSP-whatever/platform_packages_apps_Launcher3 proton-rvc --depth=2 -j16
git cherry-pick a399d3054c96692741568f0cd4d2138fca849993
popd

enter_aosp_dir packages/apps/Settings
git fetch https://github.com/AOSP-whatever/platform_packages_apps_Settings proton-rvc --depth=3 -j16
git cherry-pick 79f276966cf19ab246a8f6ee2383706a4643e766^..de52f78b3205ce9055867d2a3de59126e9b252e2
popd

enter_aosp_dir platform_testing
git fetch https://github.com/AOSP-whatever/platform_platform_testing android-11.0.0 #--depth=3 -j16
git cherry-pick a3449c9d39b9f0fc9fe608b816b4471dabf83d39
popd

enter_aosp_dir system/core
git fetch https://github.com/AOSP-whatever/platform_system_core proton-rvc --depth=5 -j16
git cherry-pick dab503d5d9361e945f204e037c181a540be54ae7^..91073d7a9142c22b36cd9f3d4bedb60d546f615f
popd

enter_aosp_dir system/sepolicy
git fetch https://github.com/AOSP-whatever/platform_system_sepolicy proton-rvc --depth=2 -j16
git cherry-pick dbc351c8024120b6422933c70125056316d38503
popd

enter_aosp_dir system/vold
git fetch https://github.com/AOSP-whatever/platform_system_vold android-11.0.0 #--depth=3 -j16
git cherry-pick 3336dc31f95b694a8b450bb8ed776b4b1c3eeb13^..ef1ce966df652e4373661e38ce9a172d2c4e3a62
popd

enter_aosp_dir vendor/proton
git fetch https://github.com/AOSP-whatever/android_vendor_proton proton-rvc --depth=4 -j16
git cherry-pick 0e93790881454c243d16110b5f2ec4f4a47debda^..12380db12ac72cb8bfaef06a252ff874c9467858
popd

# because "set -e" is used above, when we get to this point, we know
# all patches were applied successfully.
echo "+++ all patches applied successfully! +++"

set +eu
