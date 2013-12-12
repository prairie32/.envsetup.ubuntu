#!/bin/bash

export WORK_MOUNTED=~/work

case $OSTYPE in
	darwin*) OS=macosx;;
	linux*)  OS=ubuntu;;
esac

ENVSETUP=~/.envsetup.$OS

export TOOL_MOUNTED=$WORK_MOUNTED/tool

export COLOR_PY=$ENVSETUP/coloredlogcat.py
export ENVSETUP_SH=$ENVSETUP/envsetup.sh
export SETPATH_SH=$ENVSETUP/setpath.sh
export REPEAT_SH=$ENVSETUP/repeat.sh
export ADBCON_SH=$ENVSETUP/adbcon.sh
export GDBATTACH_SH=$ENVSETUP/gdbattach.sh
export JDBATTACH_SH=$ENVSETUP/jdbattach.sh
export FINDLIB_SH=$ENVSETUP/findlib.sh
export FINDPKG_SH=$ENVSETUP/findpkg.sh
export WHICHPKG_SH=$ENVSETUP/whichpkg.sh
export FINDTEST_SH=$ENVSETUP/findtest.sh
export PUSHAPK_SH=$ENVSETUP/pushapk.sh
export PUSHJAR_SH=$ENVSETUP/pushjar.sh
export WHEREAMINOW_SH=$ENVSETUP/whereaminow.sh
export WHATAMIDOINGNOW_SH=$ENVSETUP/whatamidoingnow.sh
export GOTOWITHTHESAMEDEPTH_SH=$ENVSETUP/gotowiththesamedepth.sh
export KILLPROCESS_SH=$ENVSETUP/killprocess.sh
export MAKEWITHLOG_SH=$ENVSETUP/makewithlog.sh
export MAKEOTAWITHLOG_SH=$ENVSETUP/makeotawithlog.sh
export GTV_REINSTALL_SH=$ENVSETUP/gtv_reinstall.sh
export DO_ALL_AT_ONCE_SH=$ENVSETUP/do_all_at_once.sh

export JAVA_HOME=~/tool/jdk1.6.0_45
export ANDROID_JAVA_HOME=$JAVA_HOME
export USE_CCACHE=1
export CCACHE_DIR=~/tool/ccache

# set the number of open files to be 1024 for android
ulimit -S -n 1024

alias whereaminow='$WHEREAMINOW_SH'
alias whatamidoingnow='$WHATAMIDOINGNOW_SH'
alias gotowiththesamedepth='$GOTOWITHTHESAMEDEPTH_SH'

alias activitiesOnce='$ADBCON_SH && adb -s $ADBHOSTPORT shell dumpsys activity activities | grep Run'
alias activities='$ADBCON_SH && $REPEAT_SH 1 adb -s $ADBHOSTPORT shell dumpsys activity activities | grep Run'
alias activities4emul='$REPEAT_SH 1 adb shell dumpsys activity activities | grep Run'
alias logcatcolor='$ADBCON_SH && adb -s $ADBHOSTPORT logcat | $COLOR_PY'
alias logcatcolor4emul='adb logcat | $COLOR_PY'
alias logcattime='$ADBCON_SH && adb -s $ADBHOSTPORT logcat -v time'
alias logcattime4emul='adb logcat -v time'

alias adbcon='$ADBCON_SH'
alias adbrecon='adb disconnect; $ADBCON_SH'
alias adbremount='$ADBCON_SH && adb -s $ADBHOSTPORT remount'
alias adbsync='$ADBCON_SH && adb -s $ADBHOSTPORT sync'
alias adbpush='$ADBCON_SH && adb -s $ADBHOSTPORT push'
alias adbpull='$ADBCON_SH && adb -s $ADBHOSTPORT pull'
alias adbinstall.help='echo "adb -s $ADBHOSTPORT install [-r] bin/*.apk"'
alias adbinstall='$ADBCON_SH && adb -s $ADBHOSTPORT install'
alias adbkillemu='$ADBCON_SH && adb -s emulator-5554 device kill'

#alias adb='adb -s $ADBHOSTPORT'

alias howtomediatest='
echo "godir libstagefright/test";
echo "mm";
echo "adbcon";
echo "adbremount";
echo "adbshell android stop";
echo "adbsync";
echo "adbreboot";
echo "adbcon";
echo "adbshell /data/nativetest/MediaExtractor_test/MediaExtractor_test";
echo "adbshell /data/nativetest/MediaMetadata_test/MediaMetadata_test";
echo "adbshell /data/nativetest/MediaPlayback_test/MediaPlayback_test";
echo "adbshell /data/nativetest/MediaPlayer_test/MediaPlayer_test";
echo "or";
echo "runtest mediacoverage";
'
alias prepare.runtest='adbcon && adbremount && adbshell android stop && adbsync && adbreboot'
alias runtest.cts.MediaCoverageTest='$ADBCON_SH && runtest cts-tv -c com.google.android.tv.media.cts.MediaCoverageTest'
alias runtest.mediacoverage='$ADBCON_SH && runtest mediacoverage'

alias prepare.cts='adbinstall -r $DEVADMIN_APK_FOR_CTS2dot3R4 && adbinstall -r $DELEGATEACCESSSERVICE_APK_FOR_CTS2dot1R2'
alias prepare.gcts='adbinstall -r $GDEVADMIN_APK_FOR_CTS2dot3R4 && adbinstall -r $GDELEGATEACCESSSERVICE_APK_FOR_CTS2dot1R2'

alias adbshell='$ADBCON_SH && adb -s $ADBHOSTPORT shell'
alias adbreboot='adbshell "reboot"'
alias adbrmdata='adbshell "rm -rf /data; reboot"'
alias adblist='adbshell ps'
alias amstart.help='echo "Usage:   am start [-a ACTION] [-c CATEGORY] [-d DATA] [-t TYPE] [-n COMPONENT]"; echo "Example: am start -a android.intent.action.VIEW -d file:///mnt/sdcard/DCIM/Camera/video-2010-08-20-08-49-48.mp4 -t video/mp4 -n com.sec.android.app.videoplayer/.activity.MoviePlayer"'
alias amstart='adbshell am start'
alias adbsql='adbshell "sqlite3"'
alias adbsqldump='adbsql /data/data/com.android.providers.media/databases/external.db .dump'
alias adbsqlvolumes='adbsql /data/data/com.android.providers.media/databases/external.db "select * from volumes"'
alias adbsqlshortcut='adbsql /data/data/com.google.tv.launcher/databases/launcher.db "select * from shortcuts"'
alias useomx='adbshell setprop media.moo.others true'
alias useavapi='adbshell setprop media.moo.others false'
alias getomx='adbshell getprop media.moo.others'
alias activities='$ADBCON_SH && $REPEAT_SH 1 adb -s $ADBHOSTPORT shell dumpsys activity activities | grep Run'
alias killprocess='$KILLPROCESS_SH'
alias killqemu='$KILLPROCESS_SH qemu'

alias make.ctags='$ENVSETUP/makectags.sh'
alias make.cscope='$ENVSETUP/makecscope.sh'
alias make.filelist='rm filelist'
alias make.allDBs='make.ctags; make.cscope; make.filelist'

alias findlib='$FINDLIB_SH'
alias findpkg='$FINDPKG_SH'
alias whichpkg='$WHICHPKG_SH'
alias findtest='$FINDTEST_SH'
alias listtest='runtest -l'

alias chrome='google-chrome'

echo "    ~/.envsetup.$OS/devsetup.sh sourced!!!"
