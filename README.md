## METHOD OF BUILDING PROTON AOSP FOR MIDO BY RAHIFM@GITHUB
```
repo init -u https://github.com/ProtonAOSP/android_manifest -b rvc
git clone https://github.com/RahifM/local_manifests/ -b staging/proton-rvc .repo/local_manifests
repo sync -j8 --force-sync --no-clone-bundle --no-tags
./repo_update.sh
./build.sh
```
