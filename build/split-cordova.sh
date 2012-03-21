#!/bin/sh

#---------------------------------------------
# the only purpose of this script is to convert
# a lib/ -based cordova-js tree to the new
# lib-*/ -based one.  should not be in the
# final commit, just transient till the
# new framework is committed.
#---------------------------------------------


rm -rf lib-common lib-platforms lib-scripts

#---------------------------------------------
mkdir lib-common
mkdir lib-common/cordova
cp -R lib/* lib-common/cordova
mv lib-common/cordova/cordova.js lib-common/cordova.js

echo "throw new Error('should have been replaced at build time with platform implementation')" > lib-common/cordova/exec.js
echo "throw new Error('should have been replaced at build time with platform implementation')" > lib-common/cordova/platform.js

#---------------------------------------------
mkdir -p lib-platforms/android/cordova/plugin/android
mkdir -p lib-platforms/blackberry/cordova/plugin/blackberry
mkdir -p lib-platforms/errgen/cordova/plugin/errgen
mkdir -p lib-platforms/ios/cordova/plugin/ios
mkdir -p lib-platforms/playbook/cordova/plugin/playbook
mkdir -p lib-platforms/test/cordova/plugin/test
mkdir -p lib-platforms/webworks/cordova/plugin/webworks
mkdir -p lib-platforms/wp7/cordova/plugin/wp7

#---------------------------------------------
mv lib-common/cordova/exec/android.js    lib-platforms/android/cordova/exec.js
mv lib-common/cordova/exec/blackberry.js lib-platforms/blackberry/cordova/exec.js
mv lib-common/cordova/exec/errgen.js     lib-platforms/errgen/cordova/exec.js
mv lib-common/cordova/exec/ios.js        lib-platforms/ios/cordova/exec.js
mv lib-common/cordova/exec/playbook.js   lib-platforms/playbook/cordova/exec.js
mv lib-common/cordova/exec/test.js       lib-platforms/test/cordova/exec.js
mv lib-common/cordova/exec/wp7.js        lib-platforms/wp7/cordova/exec.js

rmdir lib-common/cordova/exec

#---------------------------------------------
mv lib-common/cordova/platform/android.js    lib-platforms/android/cordova/platform.js
mv lib-common/cordova/platform/blackberry.js lib-platforms/blackberry/cordova/platform.js
mv lib-common/cordova/platform/errgen.js     lib-platforms/errgen/cordova/platform.js
mv lib-common/cordova/platform/ios.js        lib-platforms/ios/cordova/platform.js
mv lib-common/cordova/platform/playbook.js   lib-platforms/playbook/cordova/platform.js
mv lib-common/cordova/platform/wp7.js        lib-platforms/wp7/cordova/platform.js
mv lib-common/cordova/platform/common.js     lib-common/cordova/common.js

rmdir lib-common/cordova/platform

#---------------------------------------------
mv lib-common/cordova/plugin/android/*.js       lib-platforms/android/cordova/plugin/android
mv lib-common/cordova/plugin/blackberry/*.js    lib-platforms/blackberry/cordova/plugin/blackberry
mv lib-common/cordova/plugin/errgen/*.js        lib-platforms/errgen/cordova/plugin/errgen
mv lib-common/cordova/plugin/ios/*.js           lib-platforms/ios/cordova/plugin/ios
mv lib-common/cordova/plugin/playbook/*.js      lib-platforms/playbook/cordova/plugin/playbook
mv lib-common/cordova/plugin/webworks/*.js      lib-platforms/webworks/cordova/plugin/webworks
mv lib-common/cordova/plugin/wp7/*.js           lib-platforms/wp7/cordova/plugin/wp7

rmdir lib-common/cordova/plugin/android
rmdir lib-common/cordova/plugin/blackberry
rmdir lib-common/cordova/plugin/errgen
rmdir lib-common/cordova/plugin/ios
rmdir lib-common/cordova/plugin/playbook
rmdir lib-common/cordova/plugin/webworks
rmdir lib-common/cordova/plugin/wp7

#---------------------------------------------
mkdir lib-scripts
mv lib-common/cordova/bootstrap.js lib-scripts
mv lib-common/cordova/require.js   lib-scripts

mv lib-common/cordova/bootstrap/errgen.js   lib-scripts/bootstrap-errgen.js
mv lib-common/cordova/bootstrap/playbook.js lib-scripts/bootstrap-playbook.js

rm -rf lib-common/cordova/bootstrap
