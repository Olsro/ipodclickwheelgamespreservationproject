
# iPod Clickwheel Games Preservation Project
2/54 clickwheel games preserved for the moment and playable right now on your own pod !

## Introduction and context
The virtual machine is based on a community-trusted very lite version of Windows 10 LTSC 2019, so it can boot as fast as possible and be generally reasonably fast even without hardware virtualization enabled (ARM64 macs has to emulate x64 code). That version of Windows 10 is still modern enough about SSL and other components to use the required iTunes version and to connect to Apple servers without unreliable workarounds so I can auth the games on it.

This virtual machine is a fully offline distribution center setup that you can setup at home on your own PC to distribute authed games yourself on your iPod ! This Virtual Machine can also be useful towards any security+archeologist researcher who want to understand how the DRM worked.

## Games Compatibility
- iPod Classic 5G, 5.5G, 6G, 6.5G, and 7G. All iPod Classics that it at least a 5G is basically compatible with this. **You do NOT need to flash any kind of cracked firmware to use this !**
- iPod Nano 3G or 4G
- iPod Nano 5G (with black borders because the screen is too large)

## FAQ
### Can I sync music/videos/etc with another computer after injecting the games ?
Yes. As long as you don't try to sync the clickwheel games using another iTunes library, those will remain on the iPod.

### Can I still use the 20 cracked games on my iPod Video that has the cracked firmware ?
Yes, but this will be an useless thing to do when all games will be preserved on the virtual machine.

### The Virtual Machine is so slow and I am too lazy to keep it around
After doing the whole procedure, you may backup completely the hidden folder "iPod_Control" on your iPod so you will be able to restore your games on that specific pod only by copying the same folder again if you need to erase/restore your iPod in the future. Be aware that copying the iPod_Control folder to other iPods devices will not work because of the DRM tied directly with the serial number of your specific iPod.

## Changelog
### Version 1 (2024-10-11)
- Added game: Phase
- Added game: Texas Hold'Em

## How to use
### Requirements
- (Recommended) A Mac computer that can run UTM (https://mac.getutm.app/). Don't download the Mac App Store version because it has limitations. An Intel Mac is preferrable for speed but all of this was developed and tested on an Apple Silicon Mac where it run slowly but just fine.
- (Recommended) A Linux Intel x64 computer. Ubuntu 24.04 is recommended. If you can't install Linux, it should also work in a LiveCD directly. You can get Ubuntu from here: https://www.ubuntu-fr.org/ and burn the ISO into an USB stick easily using Rufus (https://rufus.ie/, Windows Only !) or Balena Etcher (https://etcher.balena.io/, Multiplatform !). This setup works very well and seems to be very reliable. I tested that setup on one of my Intel PC and it worked wonderfully and was a very fast way to boot easily the Virtual Machine and get a very high level performance with it.
- (Not Recommended) Windows Intel x64. I could not make this run under Hyper-V so it was running very slowly on my tests. Also, I could not make USB passthrough to work on Windows (the iPod was recognized as a generic "iPod" device and was not appearing in iTunes). But maybe in the future someone else will figure out how to make all of this working correctly on Windows, feel free to open a pull request with updated documentation.

Please be aware that it is probably possible to run this in a much more exotic setup as long as it is Qemu + USB passthrough compatible, but you will need to build yourself the exact command to make this boot and work for you.

**Don't forget also** if you are a Linux user to download this repo as a zip: https://github.com/Olsro/ipodclickwheelgamespreservationproject/archive/refs/heads/main.zip or to clone it locally. It will be your workspace. **On MacOS, you can go ahead** and just download directly the .utm virtual machine file on the step just below.

### 1) Download the Virtual Machine
Unfortunately, the Virtual Machine is too heavy (around 10GB) to be hosted directly on GitHub. When the Virtual Machine will be completed, it will be shared as a torrent so it will avoid getting lost over time.

You can download the latest version (version 1) from here: 
#### Workupload
https://workupload.com/archive/DJxtLjH7u6

Re-uploads appreciated !

#### SHA signatures
So you can check the authenticity of the files if you download them elsewhere.

**Version 1**
iPod Clickwheel Games Preservation Project.utm.7z.001
```9019f51c6021f365fc750d20fe6cb7402bb8df44fa25ac9b13be3424736cb786```

iPod Clickwheel Games Preservation Project.utm.7z.002
```db87ed486e89a864df8dba64486f015ab8cb92f3f838f26070f91d01f0ecf8db```

iPod Clickwheel Games Preservation Project.utm.7z.003
```ca2d0cf570bdcd69910e64d77d37f2d25bc30c7cc76e129d25802d4ba090be7b```

iPod Clickwheel Games Preservation Project.utm.7z.004
```67c5a5b8e91312feac00a8fbfbc60feb58d5c973b28febd0cfc2723bcdd50eaf```

### 2) Unzip the Virtual Machine
Due to its large size, I had to split the VM into multiple compressed 7zips files.
- On MacOS, "The Unarchiver" is recommended to unpack 7zip archives: https://theunarchiver.com/
- On Linux, open a Terminal in the folder and enter this: ```sudo apt update && sudo apt install -y p7zip-full && 7za x "iPod Clickwheel Games Preservation Project.utm.7z.001"```

You need to extract "iPod Clickwheel Games Preservation Project.utm.7z.001" which will automatically find other parts (2, 3, 4, etc) to extract the full ".utm" Virtual Machine.

### 3) Booting up the Virtual Machine
- On MacOS
	- 1) Download and install UTM: https://mac.getutm.app/ (avoid the Mac App Store version, because it has some limitations)
	- 2) Just import the .utm virtual machine file into UTM
	- 3) You should be able to launch it straight. Check the capture just below to know where to click to connect your iPod in the Virtual Machine.
	![Alt text](images/mac/utm-usb-passthrough.png?raw=true "USB Passthrough on Mac with UTM")
- On Linux:
	- 1) Copy the .utm file on this folder, because it will be needed by the script "start_qemu.sh".
	- 2) Open a Terminal on the folder of this cloned repo where start_qemu.sh is located.
	- 3) Install Qemu and dependencies: ```chmod a+x ./install_qemu.sh && ./install_qemu.sh``` (Ubuntu-only script, if not using Ubuntu 24.04 you will need to adapt it to your needs)
	- 4) Run Qemu: ```chmod a+x ./start_qemu.sh && ./start_qemu.sh``` or if your arch is ARM64 (for example if you are using an Apple Silicon Mac on Asahi Linux) you can emulate the x64 arch (which will be much slower) with this script ```chmod a+x ./start_qemu.sh && ./slow_start_qemu.sh```.
	- 5) Now you can start Remmina to control it
	- 6) Setup a new SPICE connection with the following address: 127.0.0.1:17474 and connect to it
	![Alt text](images/linux/remmina.png?raw=true "Remmina")
	- 7) You should now see the Virtual Machine booting and be able to interact with it
	- 8) You can USB passthrough your iPod to the Virtual Machine by clicking on the "Adjustable wrench" icon that is located near the bottom of the left panel to redirect your iPod to the Virtual Machine.
	![Alt text](images/linux/virtualmachineusbredir.png?raw=true "Virtual Machine USB Passthrough")

### 4) Syncing using iTunes
To use this, connect your iPod to the virtual machine using USB passthrough then open iTunes and sync the games.
When doing the USB passthrough, it is recommended that you connect your iPod directly to your computer or to the port number 1 of your USB Hub. If USB passthrough does not work for you, try to use another port and retry.

On your real computer, never try to sync the games or those will be all erased. If you are bothered by the popup which asks you to transfer your purchases at each sync, you may import all of the .ipg also on your real library (without authorizing the games, it's not needed just to avoid the annoying popup). You can find all of the ipg files in a folder called "ipg" in this GitHub repo.

It is recommended to keep this virtual machine permanently disconnected from the Internet since the lite Windows 10 LTSC 2019 on it is not fully updated and also because iTunes may do probably some random checks with Internet that can potentially de-auth the games over time or for unknown reasons.

### Extra Step: Playing Phase with custom music
Phase is a guitar hero equivalent for the iPod that is better when played with your own music. But if you use any kind of modern iTunes version, it will not work out of the box.

On your real computer with the iTunes Library, import Phase.ipg to create the "Phase Music" playlist automatically (the playlist may be named differently depending on your language but it will work the same). You do not need to try to authorize the game on your real computer, just import it and it will be enough.

Any version of iTunes starting iTunes 11 had a regression that Apple never bothered fixing which caused iTunes to not create that very special playlist.
So you need to sync your music using a version under 11. 10.7 or 9.2.1 are my recommended versions to use.

Don't ever attempt to create manually that playlist. It will not work, you will just lose your precious time. It should be created automatically (it looks like the auto-generated playlist has some kind of special attribute that will make it recognized by the game even if it visually look like any other normal playlist).

To download iTunes versions on old Mac versions (like Snow Leopard), use Pacifist and install with Pacifist the pkg inside the dmg. Pacifist is downloadable from here: https://www.charlessoft.com/ or here: https://www.charlessoft.com/pacifist_olderversions.html . Doing it like this is much easier compared to a manual install.

Old iTunes versions are downloadable from here: https://theapplewiki.com/wiki/ITunes

On recent MacOS versions, you can use Retroactive to use iTunes 10.7 alongside the "Music" app: https://github.com/cormiertyshawn895/Retroactive/releases/tag/2.1 but it's a bit more risky since those old versions of iTunes are not tested to run on modern MacOS versions.

## Credits
Project started, documented and maintained by OlsroFR

https://github.com/Olsro/ipodclickwheelgamespreservationproject

https://old.reddit.com/r/ipod/comments/1fydso6/preservation_of_ipod_clickwheel_games_read_this/

This project could not be possible without all of the contributors who authed their owned games on this virtual machine !

## Contact
https://www.patreon.com/Olsro

https://www.reddit.com/user/OlsroFR/

Mail: olsroparadise@proton.me

Discord: Inurayama

Contact me especially if you own any clickwheel game so we can preserve it together for everyone ! It takes no more than around 15 minutes of your time to auth your .ipg files to this communitarian virtual machine together.
