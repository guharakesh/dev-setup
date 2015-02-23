#!/usr/bin/env bash

ANDROID_SDK_FILENAME=android-sdk_r23.0.2-linux.tgz
ANDROID_SDK=http://dl.google.com/android/$ANDROID_SDK_FILENAME

echo "add i386 architecture..."
dpkg --add-architecture i386

echo "Update repos..."
apt-get update

echo "install node..."
apt-get install -y nodejs nodejs-legacy npm git openjdk-7-jdk ant expect

apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386

echo "getting android skd..."
curl -O $ANDROID_SDK 2>/dev/null
tar -xzvf $ANDROID_SDK_FILENAME2 2>/dev/null
sudo chown -R vagrant android-sdk-linux/

echo "ANDROID_HOME=~/android-sdk-linux" >> /home/vagrant/.bashrc
echo "PATH=\$PATH:~/android-sdk-linux/tools:~/android-sdk-linux/platform-tools" >> /home/vagrant/.bashrc

echo "installing gulp..."
npm install -g gulp 2>/dev/null

echo "installing cordova..."
npm install -g cordova 2>/dev/null

echo "installin ionic..."
npm install -g ionic 2>/dev/null
expect -c '
set timeout -1   ;
spawn /home/vagrant/android-sdk-linux/tools/android update sdk -u --all --filter platform-tool,android-19,build-tools-19.1.0
expect { 
    "Do you accept the license" { exp_send "y\r" ; exp_continue }
    eof
}
'

sudo /home/vagrant/android-sdk-linux/platform-tools/adb kill-server
sudo /home/vagrant/android-sdk-linux/platform-tools/adb start-server
sudo /home/vagrant/android-sdk-linux/platform-tools/adb devices
