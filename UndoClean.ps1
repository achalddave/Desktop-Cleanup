$origLoc = Get-Location
cd ${env:USERPROFILE}\Desktop\
if (!(Test-Path AutoOrganized)) { exit }
cd AutoOrganized
foreach ($subfolder in Get-ChildItem) {
	cd $subfolder
	foreach ($file in Get-ChildItem) {
		mv $file ${env:USERPROFILE}\Desktop
	}
	cd ..
}
cd ${env:USERPROFILE}\Desktop\
rm -r AutoOrganized
cd $origLoc