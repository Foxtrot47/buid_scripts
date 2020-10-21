 sudo apt-get install git-core
 git clone https://github.com/akhilnarang/scripts
 cd scripts
 git config --global user.name "Foxtrot47"
 git config --global user.email "jjneutron@outlook.com"
 bash setup/android_build_env.sh
  
 export TARGET_FACE_UNLOCK_SUPPORTED=true
 export USE_CCACHE=1
 export CCACHE_EXEC=/usr/bin/ccache
 export KBUILD_BUILD_USER=Foxtrot47
 export KBUILD_BUILD_HOST=arch_labs


mkdir twrp

repo init -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-9.0 --depth=1 
repo sync -c -f --force-sync --no-tag --no-clone-bundle -j$(nproc --all) --optimized-fetch --prune

git clone https://github.com/Nick89786/twrp_device_xiaomi_rolex.git -b android-9.0_4.9 --depth=1 device/xiaomi/rolex

export ALLOW_MISSING_DEPENDENCIES=true;
. build/envsetup.sh;
lunch omni_rolex-eng
mka recoveryimage

cd $OUT
 
rclone copy *zip drive:Rolex/TWRP
 
