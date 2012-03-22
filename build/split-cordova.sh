#!/bin/sh

#---------------------------------------------
# the only purpose of this script is to convert
# a lib/ -based cordova-js tree to the new
# lib-*/ -based one.  should not be in the
# final commit, just transient till the
# new framework is committed.
#---------------------------------------------


rm -rf lib

#---------------------------------------------
mkdir lib
mkdir lib/common

cp -R lib0/* lib/common
mv lib/common/cordova.js lib/cordova.js

echo "throw new Error('should have been replaced at build time with platform implementation')" > lib/common/exec.js
echo "throw new Error('should have been replaced at build time with platform implementation')" > lib/common/platform.js

#---------------------------------------------
mkdir -p lib/android/plugin/android
mkdir -p lib/blackberry/plugin/blackberry
mkdir -p lib/errgen/plugin/errgen
mkdir -p lib/ios/plugin/ios
mkdir -p lib/playbook/plugin/playbook
mkdir -p lib/test/plugin/test
mkdir -p lib/webworks/plugin/webworks
mkdir -p lib/wp7/plugin/wp7

#---------------------------------------------
mv lib/common/exec/android.js    lib/android/exec.js
mv lib/common/exec/blackberry.js lib/blackberry/exec.js
mv lib/common/exec/errgen.js     lib/errgen/exec.js
mv lib/common/exec/ios.js        lib/ios/exec.js
mv lib/common/exec/playbook.js   lib/playbook/exec.js
mv lib/common/exec/test.js       lib/test/exec.js
mv lib/common/exec/wp7.js        lib/wp7/exec.js

rmdir lib/common/exec

#---------------------------------------------
mv lib/common/platform/android.js    lib/android/platform.js
mv lib/common/platform/blackberry.js lib/blackberry/platform.js
mv lib/common/platform/errgen.js     lib/errgen/platform.js
mv lib/common/platform/ios.js        lib/ios/platform.js
mv lib/common/platform/playbook.js   lib/playbook/platform.js
mv lib/common/platform/wp7.js        lib/wp7/platform.js
mv lib/common/platform/common.js     lib/common/common.js

rmdir lib/common/platform

#---------------------------------------------
mv lib/common/plugin/android/*.js       lib/android/plugin/android
mv lib/common/plugin/blackberry/*.js    lib/blackberry/plugin/blackberry
mv lib/common/plugin/errgen/*.js        lib/errgen/plugin/errgen
mv lib/common/plugin/ios/*.js           lib/ios/plugin/ios
mv lib/common/plugin/playbook/*.js      lib/playbook/plugin/playbook
mv lib/common/plugin/webworks/*.js      lib/webworks/plugin/webworks
mv lib/common/plugin/wp7/*.js           lib/wp7/plugin/wp7

rmdir lib/common/plugin/android
rmdir lib/common/plugin/blackberry
rmdir lib/common/plugin/errgen
rmdir lib/common/plugin/ios
rmdir lib/common/plugin/playbook
rmdir lib/common/plugin/webworks
rmdir lib/common/plugin/wp7

#---------------------------------------------
mkdir lib/scripts
mv lib/common/bootstrap.js lib/scripts
mv lib/common/require.js   lib/scripts

mv lib/common/bootstrap/errgen.js   lib/scripts/bootstrap-errgen.js
mv lib/common/bootstrap/playbook.js lib/scripts/bootstrap-playbook.js

rm -rf lib/common/bootstrap
