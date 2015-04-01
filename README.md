# How to use

Using the software is quite simple. Since it is at such an early stage of development, some things are hardcoded and not quite as extensible as they should be.

Currently the only support is for FirefoxOS Flame devices. You'll need a copy of the latest image from the vendor. Getting these is an exercise left to the reader. You'll want to unarchive it to 'pflash/v18D_nightly_v2'. The pflash script will expect to find it there.


~~~
 $ git clone https://github.com/bkero/pflash
 $ mv $HOME/v18D_nightly_v2 pflash/
 $ cd pflash
 $ ./pflash.sh
~~~
 
 The script will attempt to find phones and prompt you to rescan or accept the list and proceed.
 
# Cautions
 
 On Flame devices the screen will timeout and turn off rather quickly. When this happens ADB will be unavailable, hence the script will not flash these devices. To correct this it is recommended to set the screen timeout to 10 minutes, or off completely.
 
 You will need ADB enabled on the devices to flash them. This can be done by enabling the Developer menu through *More Information -> Developer*. Once enabled you will need to go into the *Developer* menu (top of settings), then enable ADB.
