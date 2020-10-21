 sudo apt-get install git-core
 git clone https://github.com/akhilnarang/scripts
 cd scripts
 git config --global user.name "Foxtrot47"
 git config --global user.email "jjneutron@outlook.com"
 bash setup/android_build_env.sh
 
 
 cd /home/foxtrot47/rr
 
 export TARGET_FACE_UNLOCK_SUPPORTED=true
 export USE_CCACHE=1
 export CCACHE_EXEC=/usr/bin/ccache
 export KBUILD_BUILD_USER=Foxtrot47
 export KBUILD_BUILD_HOST=arch_labs
 export SELINUX_IGNORE_NEVERALLOW=true
 source build/envsetup.sh
 
 lunch rr_rolex-user
 mka bacon -j8
 
 cd $OUT
 
 rclone copy RR*.md* drive:Rolex/ResurrectionRemix
 
 
 
 
