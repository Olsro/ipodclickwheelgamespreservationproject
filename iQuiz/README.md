# iQuiz custom content

With this small special guide, you will learn how to install the programs to generate your own quizzes and how to install community-created content.

## Archived content
### iQuizr.com content
Thanks to the archive.org Wayback machine, all quizzes from this platform have been archived so I downloaded every available files to archive them.

### Aspyr content
Aspyr provided a few quizzes from their iquizmaker.com site (that is now defunct). As of today (2025-08-02), these files are still available from Aspyr's files server so I archived everything to reupload the content on this Git repository.

## Using the iQuiz Maker
The Mac version has been archived from the Aspyr website. This is an universal Intel 32 bits/PowerPC binary that was designed to run on Mac OS X 10.4 and newer. I tested both programs on Snow Leopard 10.6.8 and they worked just fine there.

It is available as a .dmg file (iQuizMaker.dmg) on the ```iQuiz/Maker``` folder from this repository.

### About the iQuiz Installer
This program exists to import ```.quizPack``` files into the iQuiz Maker and your iTunes Library in bulk

It is available as a .dmg file (QuizInstaller.dmg) on the ```iQuiz/Maker``` folder from this repository.

### About the iQuiz Maker
Creating/importing a Quiz with this tool creates the files (and any necessary folders) there: ```~/Music/iTunes/iPod Games/iQuiz 1.0/<quiz name>/trivia.txt``` (Mac) or ```~\My Documents\My Music\iTunes\iPod Games\iQuiz 1.0\<quiz name>\trivia.txt``` (Windows).

You should install the ```<quiz name>``` folder by copying it into your iPod. To learn how to do that, just check the next section: ```How to install Quiz files on your iPod```

## How to install Quiz files on your iPod
1) Copy the Quiz files that matters to you from the ```iQuiz/QuizFiles``` folder on this repository. From my tests, the iPod seems to load only **58 additional quiz files and ignored anything else** that was in my ```Packs``` folder. **You must choose the quizzes that matters the most to you** to not exceed that limitation.

2) Copy the desired Quiz folders into the correct **hidden** destination folder in your iPod:

For iPod Video (5G/5.5G) only: ```iPod_Control/Games_RO/11002/UserTrivia/Packs/``` (if this folder does not exist, it means that you should install the game before !! The iQuiz game for the iPod Video wasn't bundled)

For all the other iPods (Classic 6G/7G and Nanos): ```iPod_Control/Games_RO/11004/UserTrivia/Packs/``` (if some folders does not exist, you can recreate manually the tree though the ```iPod_Control``` hidden folder must always be there or you are doing something wrong)

3) Done !

![Alt text](images/iquiz.jpeg?raw=true "I bet you can hear the jazzy catchy tune just by seeing this image !")

### Why not use iTunes to sync the quizzes ?
- Any iTunes version more recent than 12.6.5 dropped support for games syncing.
- Using the games sync will remove all your installed games from the preservation project because iTunes will see that you won't own them on your own computer

That's why you must copy the folders manually into your iPod to avoid conflicts

### Windows QuizMaker/QuizInstaller is lost media
Unfortunately, I could not find any way to get access to the Windows version of the programs. If you have any of those, please contact me.