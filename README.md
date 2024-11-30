# iPod Clickwheel Games Preservation Project
54/56 clickwheel games preserved for the moment and playable right now on your own pod !

## Introduction and context
The virtual machine is based on a community-trusted very lite version of Windows 10 LTSC 2019, so it can boot as fast as possible and be generally reasonably fast even without hardware virtualization enabled (ARM64 macs have to emulate x64 code). That version of Windows 10 is still modern enough about SSL and other components to use the required iTunes version and to connect to Apple servers without unreliable workarounds so I can auth the games on it.

This virtual machine is a fully offline distribution center setup that you can setup at home on your own PC to distribute authed games yourself on your iPod ! This Virtual Machine can also be useful towards any security+archeologist researcher who want to understand how the DRM worked.

## Games Compatibility
- iPod Classic 5G, 5.5G, 6G, 6.5G, and 7G. Any iPod Classic that it at least a 5G is basically compatible with this. **You do NOT need to flash any kind of cracked firmware to use this !**
- iPod Nano 3G or 4G
- iPod Nano 5G (with black borders because the screen is too large)

## FAQ
### Can I sync music/videos/etc with another computer after injecting the games ?
Yes. As long as you don't try to sync the clickwheel games using another iTunes library, those will remain on the iPod.

### Can I still use the 20 cracked games on my iPod Video that has the cracked firmware ?
It is now completely useless, because now the same games are available and authed here and when possible with a more recent version of the same game (all games from the cracked 20 games archive are v1.0). I have noticed that Zuma v1.1 feels smoother on my iPod Video compared to the historical v1.0 cracked one.

### The Virtual Machine is so slow and I am too lazy to keep it around
After doing the whole procedure, you may backup completely the hidden folder "iPod_Control" on your iPod so you will be able to restore your games on that specific pod only by copying the same folder again if you need to erase/restore your iPod in the future. Be aware that copying the iPod_Control folder to other iPods devices will not work because of the DRM tied directly with the serial number of your specific iPod.

### Can I add the games on a Mac formatted iPod ?
Your iPod need to be Windows formatted because the Virtual Machine is a Windows one, thus cannot sync any Mac pod.

It is possible to convert (re-format) your Mac-formatted iPod into a Windows-formatted iPod directly from your Mac by using the app ```Disk Utility```. Be aware though that you will **lose all data on the iPod**, so be prepared about that.

#### If you are using a modern version of Disk Utility (for example in MacOS Sonoma):
If you hit ```Show All Devices``` in the ```View menu```, you will be able to format the entire iPod, not just the volume within it. Hit ```Erase``` and select on the whole iPod with format: ```MS-DOS (FAT32)``` and scheme: ```Master Boot Record (MBR)```.

#### If you are using an old version of Disk Utility (like the one from Snow Leopard):
1) Click on the device of the iPod (**not** the volume, the device containing the volume)
2) Click on the tab ```Partition```
3) On the drop-down ```Partition Layout```, select ```1 partition```
4) Then you can now click on the ```Options``` button to select ```Master Boot Record (MBR)```
5) Now you can click on the ```Apply``` button, then wait a bit until the end of the formatting process.

#### After formatting with Disk Utility
Just disconnect your iPod and let it rebuild its caches. After a few minutes, it will be functional and boot successfully as a Windows-formatted iPod, so now you can connect it to your mac again in order to set it up normally through iTunes.

Once you've done the initial configuration, you can now connect your iPod to the virtual machine to transfer the games, congratulations !

### Can I transfer all games at once ?
Yes ! "vibvian" from the iPod Community found that he could play all games by swapping some files. I then did more investigation and documented properly the exploit here so anyone can understand it easily. It appears that iTunes is adding all the keys from one account when only one game of the account is transfered, but is too dumb to remove the keys of removed games so the exploit is just to sync one game from each account (in multiple syncs if necessary, 5 accounts per 5 accounts maximum) then transfer all the games manually, and all games are playable this way.

### For some reason, all the games de-authed on my iPod over time or after a synchronization. What can I do to prevent this ?
You should backup and try to lock the file ```IC-Info.sidb``` located inside the hidden folder ```iPod_Control/iTunes```. This unique file contains the auth data for the games that you've synced. If you remove or alter this file (or if it alters over time for example because of an hard drive corruption), the games won't launch anymore. Also, restoring your iPod changes its unique ID which require you to sync again the games using the virtual machine. The ```IC-Info.sidb``` file is unique to your iPod and its current installation. You can't copy it to another iPod to auth the games, it will not work.

It looks like the ```IC-Info.sidb``` also contains the keys related to protected videos (and maybe musics too ?) so it is **crucial to sync all the protected content you own** before syncing the games so the keys from your account will be added to your iPod before adding the keys of accounts who authed the games on the Virtual Machine.

iTunes 10.7 is known to try to remove the ```IC-Info.sidb``` file each time you sync your iPod.

### My Mac is too old to run UTM
The simplest option for you if to create a Linux live CD/USB then boot on it to be able to use the simple Linux instructions that I provide in this documentation. You can get Ubuntu from here https://ubuntu.com/download/desktop and burn it into a USB stick by using Balena Etcher https://etcher.balena.io/, good luck !

### Can I still sync my content on a Mac after using this Windows Virtual Machine to add games ?
A Mac is totally able to sync a Windows formatted iPod to add music and manage stuff. A Windows formatted (restored) iPod is compatible everywhere, compared to a Mac formatted iPod which cannot be synced on Windows until it is formatted. Formatting your iPod on Windows also allow you to install cool things like Rockbox in the future if you ever want to.

### How to update the Virtual Machine to a newer version ?
Remove the .utm file (which appears as a folder on Linux/Windows) and all the compressed .7z parts which were used to extract it. All .7z files must be downloaded again. Make sure your computer doesn't rename the downloaded files to something like "filename(1)" since the files were already downloaded before. Rename the downloaded files accordingly if necessary.

I also recommend to remove all of the games and re-sync everything back to avoid strange authing bugs with games.

Don't forget to backup the save files of your games on your iPod if those matters to you: https://github.com/Olsro/ipodclickwheelgamespreservationproject?tab=readme-ov-file#how-can-i-backup-the-save-files-

### How can I make the UTM virtual machine run faster on my Mac ?
If your Mac is powerful enough, you can increase the RAM and the amount of emulated cores and tick the box "Force multicore".

![Alt text](images/mac/utm-multicore.png?raw=true "UTM Multicore")

### How can I backup the save files ?
You should backups those 2 hidden folders: ```iPod_Control/GameData_RW``` and ```iPod_Control/GameStats_WO```. I really advise you to backup those folders sometimes, and especially after you've done progress and scores that you don't want to lose. When (and if) iTunes ever gets mad and decides to erase your games while syncing, it also remove all the related save files.

I don't know if save files are unique to your device or if you can transfer your saves to any other iPod. But if it is on the same iPod, restoring those folders after re-installing the games should work to get your save data back.

### [Linux] The script "start_qemu.sh" does not start on my machine, what can I do ?
It looks like your computer is an ARM64 one or a very old Intel/AMD computer, so you should use ```slow_start_qemu.sh``` instead to start the virtual machine.

### Some games are rebooting/crashing my iPod at launch, what can I do ?
This happens when you have too much content (music) on your iPod. The music is eating too much of your precious RAM, so the game can't launch thus crashing completely your iPod at launch. This happens on my iPod Video with 30000 tracks when I launch Phase just after syncing on iTunes. But after a reboot, the game is booting successfully, until the next time I will sync the iPod again.

On my iPod Classic 7th gen that also have 30000 tracks, the game "Lode Runner" completely reboot the iPod each time I launch it. It seems like this game in particular is more RAM heavy than any others. There's no solution, excepted removing music from your iPod to free up some precious bytes of RAM. For some reason, my iPod Video can launch Lode Runner just fine with the same amount of track, but the iPod Videos always uses liter games binaries to accomodate to its less horse-power.

### Some games can't run with error "This game cannot be played"
You've not synced all games at least once with iTunes on the virtual machine, which lead to missing account decryption keys. Try again.

### A popup window asks me to transfer the purchases at each sync on my normal computer, how to avoid it ?
You can import all the .ipg games from the archive ```iTunes Games Files.7z``` into iTunes to avoid this popup each time you sync your iPod. You can download this archive from here: https://github.com/Olsro/ipodclickwheelgamespreservationproject/releases

Importing the games into your regular iTunes version will not all you to transfer the games from your computer to your iPod. Doing this allows only to avoid the annoying popup.

### Why some games shows empty/corrupted texts ?
It can be because of a missing translation for the current language of your iPod, try to change the language to english then retry.

### Will this remove any of my pre-installed games ? (Klondike, Vortex, Maze...)
No, there's no risk.

### I am getting IO errors on UTM while trying to connect my iPod on the Virtual Machine, what happenned ?
This issue is very rare and hardware dependent (from my findings and testing). Try to reboot completely your Mac, then retry. You may also try to use another cable. Also, I noticed this problem on one of my iPod Classic modded with a CF Card that does not supports well IDE/ATA specs, so you may try to mod your iPod using another type of flash storage then retry until you get a stable connection. My CF card could not maintain a stable connection with the PC unfortunately, then I changed it to put an iFlash CF/SD Adapter and it worked just fine after that.

## How to use
### Requirements
#### Macs
A Mac computer that can run UTM (https://mac.getutm.app/). Don't download the Mac App Store version because it has limitations. An Intel Mac is preferable for speed but all of this was developed and tested on an Apple Silicon Mac where it run slowly but just fine.

#### Linux
A Linux computer. Ubuntu 24.04 is recommended. If you can't install Linux, it should also work in a LiveCD directly. You can get Ubuntu from here: https://www.ubuntu-fr.org/ and burn the ISO into an USB stick easily using Rufus (https://rufus.ie/, Windows Only !) or Balena Etcher (https://etcher.balena.io/, Multiplatform !). This setup works very well and seems to be very reliable. I tested that setup on one of my Intel PC and it worked wonderfully and was a very fast way to boot easily the Virtual Machine and get a very high level performance with it.

#### Windows (Intel/AMD 64 bits)
It run very well on Windows through VMWare. VMWare Player 17 requires Windows 10 or more.

#### Windows (ARM 64 bits)
Use an ARM64 Linux distro

**Don't forget also** if you are a **Linux or Windows** user to download this repo as a zip: https://github.com/Olsro/ipodclickwheelgamespreservationproject/archive/refs/heads/main.zip or to clone it locally. It will be your workspace. **On MacOS, you can go ahead** and just download directly the .utm virtual machine file on the step just below.

### 1) Enable hidden folders
This is important for all file operations related to the hidden folder ```iPod_Control```.

MacOS: https://www.graphpad.com/support/faq/how-to-view-files-on-your-mac-that-are-normally-invisible/

Linux (Ubuntu): You can just use the shortcut "CTRL + H" in the file browser to show all hidden files

Windows: https://support.microsoft.com/en-us/windows/view-hidden-files-and-folders-in-windows-97fbc472-c603-9d90-91d0-1166d1d9f4b5

### 2) Download the Virtual Machine (.utm file) and all of the games files
When we will reach the full set, it will be shared as a torrent so it will avoid getting lost over time.

You can download the latest version from the following locations: 
#### GitHub Releases
https://github.com/Olsro/ipodclickwheelgamespreservationproject/releases

Be aware that you need around **10 GB** of free space on your hard drive to extract the .utm file from the splitted archive !

Don't forget also to download the ```iPod Games Files.7z``` archive, we will need it later.

### 3) Unzip the Virtual Machine
Due to its large size, I had to split the VM into multiple compressed 7zips files.
- On MacOS, "The Unarchiver" is recommended to unpack 7zip archives: https://theunarchiver.com/
- On Linux, open a Terminal in the folder and enter this: ```sudo apt update && sudo apt install -y p7zip-full && 7za x "iPod*Clickwheel*Games*Preservation*Project.utm.7z.001"```
- On Windows, 7zip is recommended to unpack 7zip archives: https://www.7-zip.org/download.html

You need to extract "iPod Clickwheel Games Preservation Project.utm.7z.001" which will automatically find other parts (2, 3, 4, etc) to extract the full ".utm" Virtual Machine.

### 4) Booting up the Virtual Machine
#### On MacOS
1) Download and install UTM: https://mac.getutm.app/ (avoid the Mac App Store version, because it has some limitations)
2) Just import the .utm virtual machine file into UTM
	![Alt text](images/mac/utm-file-open.png?raw=true "Import the VM in UTM")
3) You should be able to launch it straight. Check the capture just below to know where to click to connect your iPod in the Virtual Machine.
	![Alt text](images/mac/utm-usb-passthrough.png?raw=true "USB Passthrough on Mac with UTM")
#### On Linux:
1) Copy the .utm file on your workplace folder, because it will be needed by the script "start_qemu.sh".
2) Open a Terminal on the folder of this cloned repo where start_qemu.sh is located.
3) Install Qemu and dependencies: ```chmod a+x ./install_qemu.sh && ./install_qemu.sh``` (Ubuntu-only script, if not using Ubuntu 24.04 you will need to adapt it to your needs)
4) Run Qemu: ```chmod a+x ./start_qemu.sh && ./start_qemu.sh``` or if your arch is ARM64 (for example if you are using an Apple Silicon Mac on Asahi Linux) you can emulate the x64 arch (which will be much slower) with this script ```chmod a+x ./slow_start_qemu.sh && ./slow_start_qemu.sh```.
5) Now you can start Remmina to control it
6) Setup a new SPICE connection with the following address: 127.0.0.1:17474 and connect to it
![Alt text](images/linux/remmina.png?raw=true "Remmina")
7) You should now see the Virtual Machine booting and be able to interact with it
8) You can USB passthrough your iPod to the Virtual Machine by clicking on the "Adjustable wrench" icon that is located near the bottom of the left panel to redirect your iPod to the Virtual Machine.
	![Alt text](images/linux/virtualmachineusbredir.png?raw=true "Virtual Machine USB Passthrough")
#### On Windows
1) Copy the .utm folder on your workplace folder, because it will be needed by the script ```win64-convert-hdd-to-vmware.bat```.
2) Run the script "win64-convert-hdd-to-vmware.bat" to convert the Qemu virtual hard drive into a VMWare compatible virtual hard drive. This script should take a while. If the popup window closes instantly, double check that the ```iPod Clickwheel Games Preservation Project.utm/Data/A973B7BF-F17A-44C5-A6D7-B6D819938FDC.qcow2``` path is valid from your workspace folder (the workspace folder is the cloned GitHub repo). This command will need **10GB more disk space** to run correctly, make sure you have enough disk space left.
3) Install a recent version of VMWare Player: https://softwareupdate.vmware.com/cds/vmw-desktop/player/17.6.1/24319023/windows/core/VMware-player-17.6.1-24319023.exe.tar , un-compress the .tar file using 7zip then install VMWare Player on your computer. This software is required to launch the Virtual Machine.
4) Double-click on the file ```iPod Clickwheel Games Preservation Project.vmx``` located inside the folder ```win64-vmware``` related to your workspace folder. VMWare Player should now launch. Wait until iTunes appear (iTunes should launch itself automatically on the virtual Windows 10 environment once booted up).
5) Connect your iPod. A popup should appear to connect it to the host or into the virtual machine. Select the virtual machine. Now wait a couple of seconds, and your iPod should appear on iTunes inside the virtual machine which are the authed games.

### 5) Syncing using iTunes
The option "Disk use" (enabled by default) **must** be enabled. If it isn't enabled, you can enable it by connecting your iPod on your host machine through iTunes (or through the Finder syncing window for the most recent versions of MacOS).

I recommend letting the iPod connect to the host then eject it on the Finder before doing the passthrough to the Virtual Machine, it is more reliable this way.

Then, it's time to connect your iPod to the virtual machine using USB passthrough then open iTunes to sync some games in order to authorize the accounts.

You need to transfer the games **5 per 5 at each sync** on iTunes (sync the first 5 games from the list during the first sync. Wait that this syncing has finished. Then untick all selected games, to tick the 5 next games followings on the list until you've reached the end of it). **Don't worry if the amount of available games in the Virtual Machine is very small compared to the total amount of preserved games**. We're just forcing iTunes to inject all the keys of the authed accounts for the next step, by transfering one single game from each account which is enough for iTunes to transfer all the keys from the related account.

All games in iTunes represents one Apple ID so it's crucial that you transfer using iTunes each game at least once (even if you don't want to play this specific listed game later, it's important to transfer it anyway using iTunes so all related authed games bought by the same person can be played later when you will transfer manually the games files during the next step). Removing (unticking) the games on iTunes does not remove the decryption keys on the iPod so don't worry to untick some games to fit the 5 Apple IDs allowed limit for each sync (each time you click the ```Apply``` button on iTunes, it triggers a new sync and you have to wait a bit that iTunes integrates the decryption keys into your iPod).

When you will have transfered each game at least once using iTunes, you can now go to the next step because your iPod is now weaponized to decrypt all the preserved games binaries :)

### 6) Transfering all the games files manually
Now we are going to add all the game files from the archive ```iPod Games Files.7z```.
Extract it and enter into it with your file browser. Now, you can disconnect your iPod from the Virtual Machine and let it reconnect to your host because we will need to copy the games files into it.

- Some games are compatible only with the iPod Videos (5G/5.5G). If you have an iPod Video, you can copy the folder ```iPod_Control``` from the folder ```5G and 5.5G only``` to get more games. If your iPod is a Nano or a Classic, don't do it !

- Most games are compatible with all iPods covered by this guide. Copy the folder ```iPod_Control``` from the folder ```All iPods``` to get the games.

On MacOS, it is very **important** to maintain the key "OPTION" on your keyboard while drag & dropping the folders ```iPod_Control``` into your iPod, then choose the option ```Merge```. **Don't** do "Replace". If the option ```Merge``` does not appear beside the ```Replace``` button in the copy window, stop it then retry to do the copy while maintaining the "OPTION" key again until it does.

On Windows or Linux, the logic is the same. You need to merge/replace files in their destination. You should not replace the whole ```iPod_Control``` folder on your iPod or you will remove a lot of important/system files from your iPod which will force you to re-sync everything or restore your iPod (it will never brick it, but you will lose a lot of time).

This process may be tedious but it allows to bypass the Apple DRM which limited the amount of games that you could store on a single device. Apple did not want you to put games from more than 5 different accounts !

On your real computer, never try to sync the games or those will be all erased. If you are bothered by the popup which asks you to transfer your purchases at each sync, you may import all of the .ipg also on your real library (without authorizing the games, it's not needed just to avoid the annoying popup).

It is recommended to keep this virtual machine permanently disconnected from the Internet since the lite Windows 10 LTSC 2019 on it is not fully updated and also because iTunes may do probably some random checks with Internet that can potentially de-auth the games over time or for unknown reasons.

### 7) Backuping the keys file
It is strongly recommended that you copy the file ```IC-Info.sidb``` located inside the hidden folder ```iPod_Control/iTunes``` to a place that you will remember, so if iTunes will ever remove it during a synchronization, you will be able to restore it to keep access to all the games in the future.

iTunes 10.7 is known to try to remove the ```IC-Info.sidb``` file each time you sync your iPod. It appears that locking the ```IC-Info.sidb``` prevents iTunes to delete it on each sync, so **lock** this file to sync your iPod without fearing losing the decryption keys of the games.

### 8) Disconnect your iPod and enjoy the games
Games should now all launch just fine. Congratulations, you did it !

### Extra Step: Playing Phase with custom music
Phase is a guitar hero equivalent for the iPod that is better when played with your own music. But if you use any kind of modern iTunes version, it will not work out of the box.

On your real computer with the iTunes Library, import Phase.ipg to create the "Phase Music" playlist automatically (the playlist may be named differently depending on your language but it will work the same). You do not need to try to authorize the game on your real computer, just import it and it will be enough.

Any version of iTunes starting iTunes 11 had a regression that Apple never bothered fixing which caused iTunes to not create that very special playlist.
So you need to sync your music using a version under 11. 10.7 or 9.2.1 are my recommended versions to use.

Don't ever attempt to create manually that playlist. It will not work, you will just lose your precious time. It should be created automatically (it looks like the auto-generated playlist has some kind of special attribute that will make it recognized by the game even if it visually look like any other normal playlist).

If you need to sync your music manually (rather than automatically) and want to sync correctly a Phase playlist by drag and dropping individual songs, your need to **use an even older iTunes** version (< 9) for this to work correctly. For this case only, iTunes 8.2.1.6 is my recommended. Be aware that iTunes 8.2.1.6 does **NOT** support syncing the iPod Classic 7th gen and the iPod Nano 5th gen.

To download iTunes versions on old Mac versions (like Snow Leopard), use Pacifist and install with Pacifist the pkg inside the dmg. Pacifist is downloadable from here: https://www.charlessoft.com/ or here: https://www.charlessoft.com/pacifist_olderversions.html . Doing it like this is much easier compared to a manual install.

Old iTunes versions are downloadable from here: https://theapplewiki.com/wiki/ITunes

On recent MacOS versions, you can use Retroactive to use iTunes 10.7 alongside the "Music" app: https://github.com/cormiertyshawn895/Retroactive/releases/tag/2.1 but it's a bit more risky since those old versions of iTunes are not tested to run on modern MacOS versions.

![Alt text](images/phaseplaylist.png?raw=true "Phase auto-generated playlist to put your music tracks in")

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

# Preservation status for each game

| Game Name | Preservation Status | Internal Code* | Developer | Genre | Release Date |
| :--- | :---: | :---: | :---: | :---: | :---: |
| Asphalt 4: Elite Racing                | ✅ | 22020 | Gameloft | Sports | 2008-08-28 |
| Bejeweled                              | ✅ | 55555 (v1.1 is 12100) | PopCap Games | Puzzle & Trivia | 2008-04-15 |
| Block Breaker Deluxe                   | ✅ | 21004 | Gameloft | Action | 2008-01-15 |
| Bomberman                              | ✅ | 20000 | Hudson Software Company, Limited | Action | 2007-12-18 |
| Brain Challenge                        | ✅ | 21000 | Gameloft S.A. | Puzzle & Trivia | 2007-09-05 |
| Bubble Bash                            | ✅ | 21008 | Gameloft | Puzzle & Trivia | 2008-02-25 |
| Cake Mania 3                           | ✅ | 25002 | Sandlot Games | Action | 2009-02-04 |
| Chalkboard Sports Baseball             | ✅ | 23000 | D2C Games | Sports | 2008-08 |
| Chess & Backgammon Classics            | ✅ | 21002 | Gameloft | Cards, Casino, & Board | 2008-02-04 |
| Chinese Checkers                       | ✅ | 11802 | Apple Inc. | Cards, Casino, & Board | 2008-12 |
| CRYSTAL DEFENDERS                      | ✅ | 24002 | Square Enix | Strategy | 2008-12 |
| CSI Miami                              | ✅ | 22014 | Gameloft | Simulation | 2008-09 |
| Cubis 2                                | ✅ (v1.1) | 99999 (v1.1 is 13100) | FreshGames | Puzzle & Trivia | 2006-09-12 |
| iQuiz (NOT THE PRE-INSTALLED VERSION)  | ✅ 📹 | 11002 | Apple Inc. | Puzzle & Trivia | 2007-04 |
| Lode Runner                            | ✅ | 20002 | Hudson Software Company, Limited | Action | 2008-12 |
| LOST                                   | ✅ 📹 | 1B200 | Gameloft | Role-Playing | 2007-05 |
| Mahjong                                | ✅ (v1.0 📹 + v1.1) | 77777 (v1.1 is 77770) | Electronic Arts | Cards, Casino, & Board | 2008-04-22 |
| Mini Golf                              | ✅ (v1.1) | 88888 (v1.1 is 88908) | Electronic Arts | Sports | 2006-09-12 |
| Monopoly                               | ✅ | 15040 | Electronic Arts | Cards, Casino & Board | 2008-06-03 |
| Ms. PAC-MAN                            | ✅ (v1.0 📹 + v1.1) | 14004 (v1.1 is 14024) | Namco | Action | 2007-02-27 |
| Ms. PAC-MAN Demo                       | ✅ 📹 | 14005 | Namco | Action | 2007-02-27 |
| musika                                 | ✅ 📹 | 1C300 | NanaOn-Sha / Sony BMG | Rythm | 2007-08-07 |
| Mystery Mansion Pinball                | ✅ | 22010 | Gameloft | Action | 2008-08 |
| Naval Battle                           | ✅ | 21006 | Gameloft | Strategy | 2008-02-04 |
| PAC-MAN                                | ✅ (v1.0 📹 + v1.1) | AAAAA (v1.1 is 14020) | Namco Networks America | Action | 2006-09-12 |
| Peggle                                 | ✅ (v1.0 + v1.1) | 12104 | PopCap Games | Action | 2007-12-18 |
| Phase                                  | ✅ | 1D000 | MTV Games - Harmonix | Rythm | 2007-11-06 |
| Pirates of the Caribbean: Aegir's Fire | ✅ | 22000 | Disney Online Studios | Action | 2008-02-20 |
| Pole Position Remix                    | ✅ | 14003 | Namco Networks America | Sports | 2008-01-21 |
| Real Soccer 2009                       | ❌ | 22018 | Gameloft | Sports | 2008-12 |
| Reversi                                | ✅ | 11800 | Apple Inc. | Cards, Casino, & Board | 2008-12 |
| Royal Solitaire                        | ✅ 📹 | 50514 | Electronic Arts | Cards, Casino, & Board | 2006-12 |
| SAT Prep Mathematics - 2008            | ✅ (v1.1) | 11052 (v1.1 is 11072) | Kaplan | Education | 2007-06-22 |
| SAT Prep Reading - 2008                | ✅ (v1.1) | 11050 (v1.1 is 11070) | Kaplan | Education | 2007-06-22 |
| SAT Prep Writing - 2008                | ✅ (v1.1) | 11051 (v1.1 is 11071) | Kaplan | Education | 2007-06-22 |
| Scrabble                               | ✅ | 15012 | Electronic Arts | Cards, Casino & Board Games | 2008-03-03 |
| Slyder Adventures                      | ✅ | 25000 | Sandlot Games | Action | 2008-12 |
| Song Summoner: The Unsung Heroes       | ✅ | 24000 | Square Enix | Role-Playing | 2008-07-08 |
| Sonic the Hedgehog                     | ✅ | 18000 | Sega of America | Action | 2007-12-18 |
| Spore Origins                          | ✅ | 15010 | Electronic Arts | Simulation | 2008-08-25 |
| Star Trigon                            | ✅ | 14006 | Namco Networks America | Action | 2008-09 |
| Sudoku                                 | 🟨 (v1.0 📹 + v1.1) | 50513 (v1.2 is 50533) | Electronic Arts | Puzzle & Trivia | 2006-12-19 |
| Tamagotchi 'Round the World            | ✅ | 14008 | NAMCO BANDAI Games America | Kids & Learning | 2008-11 |
| Tetris                                 | ✅ (v1.0 📹 + v1.1 + v1.2) | 66666 (v1.2 is 66686) | Electronic Arts | Puzzle & Trivia | 2006-09-12 |
| Texas Hold'em                          | ✅ (v1.0 📹 + v1.1) | 33333 (v1.1 is 33353) | Apple Inc. | Cards, Casino, & Board | 2006-09-12 |
| The Sims Bowling                       | ✅ (v1.1) | 1500C (v1.1 is 15032) | Electronic Arts | Sports | 2007-07-17 |
| The Sims DJ                            | ✅ | 15036 | Electronic Arts | Simulation | 2008-06-09 |
| The Sims Pool                          | ✅ (v1.1) | 1500E (v1.1 is 15035) | Electronic Arts | Sports | 2007-07-31 |
| Tiger Woods PGA TOUR                   | ❌ | 15038 | Electronic Arts | Sports | 2008-12 |
| Trivial Pursuit                        | ✅ | 15042 | Electronic Arts | Cards, Casino, & Board | 2008-12 |
| UNO                                    | ✅ | 22012 | Gameloft | Cards, Casino, & Board | 2008-07 |
| Vortex (NOT THE PRE-INSTALLED VERSION) | ✅ 📹 | 12345 | Apple Inc. | Action | 2006-09-12 |
| Vortex Demo                            | ✅ 📹 | 12346 | Apple Inc. | Action | 2006-09-12 |
| Wonder Blocks                          | ✅ | 22022 | Gameloft | Puzzle | 2008-12 |
| Yahtzee                                | ✅ | 15014 | Electronic Arts | Cards, Casino, & Board Games | 2008-02-11 |
| Zuma                                   | ✅ (v1.0 📹 + v1.1) | 44444 (v1.1 is 12102) | PopCap Games | Action | 2006-09-12 |

* This is the name of the folder when you try to retrieve the games after you've synced those on the iPod, in the hidden folder called ```iPod_Control/Games_RO```.

## Table legend
✅ = The most recent version of the game is preserved forever in the virtual machine

🟨 = An obsolete version of the game is preserved forever on the virtual machine. Better than nothing, but this means often that the game will install and work only on the iPod Videos.

❌ = The game is not (yet ?) available

📹 = This game (or this version of the game) is playable only on the iPod Video (5G or 5.5G)

# The experience on the iPod Videos 📹 (5G/5.5G)
On the iPod Video, you can theorically install and play all games that Apple made available since 2006. But in my opinion, this is the less ideal way to get a good experience with clickwheel games. The iPod Video has a very old-gen hardware compared to any other iPod that can run the clickwheel games, which leads to from my observations:
- Much longer loading times
- Some games are not exactly the same
	- For example, the radar photos in Asphalt 4 are generic on the iPod Video while those are generated dynamically on other iPods
- Games will be much more laggy. Expect heavy frameskipping on some, or even random annoying freezes.
	- On my iPod Video, Phase is sometimes freezing slightly which causes unfair gameplay errors when playing it. It is very frustrating for a rythm game to make errors that are outside of your control.
	- Peggle on the iPod Video feels sluggish while it is very smooth on other iPods
	- Bejeweled feels almost unplayable on my iPod Video because it is so laggy, even in menus
	- Crystal Defenders starts to lag heavily when there is a few animated sprites on screen
	- Asphalt 4 on the iPod Video has a very low framerate. It seems constant and controls are responsive, but framerate is very low.
	- Mystery Mansion Pinball feels very sluggish
	- Bomberman controls feels less responsive and the game has some little lags here and there

Some games also run very well/good enough. Like Vortex, iQuiz or Monopoly, and others.

EDIT 2024-11-12: I had 30000 music tracks synced with iTunes on that iPod Video 5.5G (64MB of RAM). I tried again to play games and the games launch now much faster and are overall smoother now that my iPod only has 1000 tracks and some videos. Bejeweled is now very smooth. So, consider that the amount of content/metadata can have a terrible impact on some games using these old iPods.

# Buy the games and support games developers
Unfortunately, all of those iPod Clickwheel Games were all delisted from the iTunes Store in October 2011 and there's no other way to buy any new copy of those games which is why this project even exists publicly as the only mean to play any of them for the future generations of gamers and also for purchasers of those games who lost their original .ipg file linked to their account. It is impossible to purchase any of those anymore; all that games are considered abandonware and some of them even belongs to defunct companies listed below.

Feel free to support the game companies who've made iPod Clickwheel Games by buying their merch or their current games:
- Square Enix: https://www.square-enix-games.com
- Harmonix: https://www.harmonixmusic.com/
- Gameloft: https://www.gameloft.com
- PopCap Games: https://www.ea.com/ea-studios/popcap
- Hudson Soft (which is now Konami): https://www.konami.com/
- Electronic Arts: https://www.ea.com/
- Namco: https://bandainamcoent.eu
- Disney Online Studios: https://www.disney.fr/
- Sega: https://www.sega.com/homepage
- Kaplan: https://kaplan.com/
- NanaOn-Sha: out of business
- Sandlot Games: out of business
- D2C Games: out of business
- FreshGames: out of business

# Support my preservation efforts
You can tip me some dollars on Patreon, thank you very much: https://www.patreon.com/Olsro

# They talk about this preservation project
https://arstechnica.com/gaming/2024/11/ipod-fans-evade-apples-drm-to-preserve-54-lost-clickwheel-era-games/

https://www.nightwater.email/ipod-games/

https://www.youtube.com/watch?v=LHHHeyaIQf4

https://www.igen.fr/ipod/2024/11/les-jeux-ipod-molettes-preserves-mais-pas-encore-emules-comment-jouer-sonic-tetris-ou-les-sims-146803

https://www.macstories.net/linked/ipod-fans-are-trying-to-preserve-lost-click-wheel-games/

https://www.techradar.com/audio/remember-ipod-clickwheel-games-this-new-project-is-racing-to-save-them-from-extinction

https://hackaday.com/2024/11/04/ipod-clickwheel-games-preservation-project/

https://boingboing.net/2024/11/04/fans-save-ipod-clickwheel-games-for-posterity.html

https://appleinsider.com/articles/24/11/02/a-new-project-is-trying-to-preserve-click-wheel-ipod-games (there is a fact error on this article: Quix did not co-founded this project)


# Video guides
RazorStoJ made awesome video guides to help you installing the games if you don't like textual guides :)

Windows: https://www.youtube.com/watch?v=e_2IGH7jjpM

Linux: https://www.youtube.com/watch?v=Xnnf3neznIQ