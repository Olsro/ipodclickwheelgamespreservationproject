@echo off
cd /d %~dp0
echo Let's convert the Qemu Virtual HDD (.qcow2) into a VMWare Virtual HDD (.vmdk)
if exist "iPod.Clickwheel.Games.Preservation.Project.utm/iPod Clickwheel Games Preservation Project.utm/Data/A973B7BF-F17A-44C5-A6D7-B6D819938FDC.qcow2" (
	echo Using path: iPod.Clickwheel.Games.Preservation.Project.utm/iPod Clickwheel Games Preservation Project.utm/Data/A973B7BF-F17A-44C5-A6D7-B6D819938FDC.qcow2
	echo =================================================================================================
	echo In progress... don't close this console window until it's finished. This step can take a while...
	"win64-qemuimg/qemu-img.exe" convert -p -f qcow2 -O vmdk "iPod.Clickwheel.Games.Preservation.Project.utm/iPod Clickwheel Games Preservation Project.utm/Data/A973B7BF-F17A-44C5-A6D7-B6D819938FDC.qcow2" "win64-vmware/iPod Clickwheel Games Preservation Project.vmdk"
) else (
	if exist "iPod Clickwheel Games Preservation Project.utm/Data/A973B7BF-F17A-44C5-A6D7-B6D819938FDC.qcow2" (
		echo Using path: iPod Clickwheel Games Preservation Project.utm/Data/A973B7BF-F17A-44C5-A6D7-B6D819938FDC.qcow2
		echo =================================================================================================
		echo In progress... don't close this console window until it's finished. This step can take a while...
		"win64-qemuimg/qemu-img.exe" convert -p -f qcow2 -O vmdk "iPod Clickwheel Games Preservation Project.utm/Data/A973B7BF-F17A-44C5-A6D7-B6D819938FDC.qcow2" "win64-vmware/iPod Clickwheel Games Preservation Project.vmdk"
	) else (
		echo ERROR: Can't find "iPod Clickwheel Games Preservation Project.utm" in your current folder
		PAUSE
	)
)