#!/bin/bash

export ADB="${ADB:-/home/bkero/bin/adb}"
export FASTBOOT="${FASTBOOT:-/home/bkero/bin/fastboot}"

$ADB kill-server

get_devices() {
        DEVICES=$(sudo "${ADB}" devices|grep device$| awk '{ print $1 }')
        echo "DEVICES"
        echo "========"
        echo "$DEVICES"
        echo
}

echo "To prepare for the flash, you'll want to plug in all your devices, turn Remote
Debugging on, and set the Screen Timeout to 0."
echo
echo "Keys:
    (s) Scan for devices. Print the list of found devices.
    (y) Proceed to flash
    (q) Quit"

echo
get_devices

while read -e -n 1 -s answer; do
    if [[ $answer = [Yy] ]]; then
        break
    elif [[ $answer = [Ss] ]]; then
        get_devices
    elif [[ $answer = [Qq] ]]; then
        exit 1
    fi
done

echo "Flashing devices: $DEVICES"
pushd v18D_nightly_v2

# Modify flash.sh script to work for us
sed -i '/kill-server/d' flash.sh
sed -i 's/adb/$ADB -s $DEVICE/g;s/fastboot/$FASTBOOT -s $DEVICE/g' flash.sh

for DEVICE in $DEVICES; do
    export DEVICE=$DEVICE
    ./flash.sh &
done

popd
