$ErrorActionPreference = 'SilentlyContinue'
Set-Location ${env:USERPROFILE}\Desktop

$arr_types = @('Folders','Docs','Images','Code','Executables','Audio','Video')

$Folders = ls | where {$_.psIsContainer -eq 1} | where {$_.name -ne 'AutoOrganized'}
$Docs = ls | where {
$_.name -match '.pdf$' -or
$_.name -match '.doc[x]?$' -or
$_.name -match '.ppt[x]?$' -or
$_.name -match '.pps[x]?$' -or
$_.name -match '.xls[x]?$' -or
$_.name -match '.rtf$'     -or 
$_.name -match '.wpd$'     -or
$_.name -match '..wps$'    -or
$_.name -match '.[f]?odt$' -or # open document word processing
$_.name -match '.[f]?ods'  -or # open document excel
$_.name -match '.txt'
}

$Images = ls | where {
$_.name -match '.jp[e]?g$' -or
$_.name -match '.png$' -or
$_.name -match '.gif$' -or
$_.name -match '.tif[f]?$' -or
$_.name -match '.tif[f]?$'
}

$Code = ls | where {
$_.name -match '.asp$' -or
$_.name -match '.bat$' -or
$_.name -match '.c$' -or
$_.name -match '.cer$' -or
$_.name -match '.class$' -or
$_.name -match '.cpp$' -or
$_.name -match '.cs[r,s]?$' -or
$_.name -match '.[x]?htm[l]?$' -or
$_.name -match '.dtd$' -or
$_.name -match '.fla$' -or
$_.name -match '.java$' -or
$_.name -match '.js[p]?' -or
$_.name -match '.m$' -or
$_.name -match '.php$' -or
$_.name -match '.pl$' -or
$_.name -match '.ps1$' -or
$_.name -match '.py$'
}

$Executables = ls | where {
$_.name -match '.msi$' -or
$_.name -match '.exe$'
}

$Audio = ls | where {
$_.name -match '.[a,i]if$' -or
$_.name -match '.m3u$' -or
$_.name -match '.m4a$' -or
$_.name -match '.mid$' -or
$_.name -match '.mp[a,3]$' -or
$_.name -match '.ra$' -or
$_.name -match '.wav$' -or
$_.name -match '.wma$'
}

$Video = ls | where { 
$_.name -match '.3g[2,p]$' -or
$_.name -match '.as[f,x]$' -or
$_.name -match '.avi$' -or
$_.name -match '.flv$' -or
$_.name -match '.mov$' -or
$_.name -match '.mp[4,g]$' -or
$_.name -match '.rm$' -or
$_.name -match '.swf$' -or
$_.name -match '.vob$' -or
$_.name -match '.wmv$'
}

if (!(@(ls)[0] -eq $null) -and !(Test-Path AutoOrganized)) {
	echo yay
	mkdir AutoOrganized
}

foreach ($type in $arr_types) { 
	Write-Host '----------------'
	Write-Host "  $type      "
	Write-Host '----------------'
	$currtype = get-variable $type
	$isNotEmpty = !(@(($currtype).value)[0] -eq $null)
	if ($isNotEmpty) {
		if (!(Test-Path "AutoOrganized\$type")) { mkdir "AutoOrganized\$type" }
		foreach ($file in ($currtype).value) {
			mv $file "AutoOrganized\$type"
		}
	}
}

# now pick up any files left

$etc = ls | where {
$_.name -ne 'AutoOrganized'
}
if (!(@($etc)[0] -eq $null)) {
	if(!(Test-Path "AutoOrganized\Etc")) { mkdir "AutoOrganized\Etc" }
	Write-Host '----------------'
	Write-Host "  Etc      "
	Write-Host '----------------'
	foreach ($file in $etc) {
		mv $file "AutoOrganized\Etc"
	}
}

# move the Folders
#Get-ChildItem | where {$_.psIsContainer -eq 1} | ForEach-Object {mv $_.name Folders}

# move documents
# this includes pdf, word, excel, powerpoint and text files
#Get-ChildItem | where {$_.name -match '*.pdf'} | ForEach-Object {mv $_.name Docs}
#Get-ChildItem | where {$_.name -match '*.doc*'} | ForEach-Object {mv $_.name Docs}
#Get-ChildItem | where {$_.name -match '*.xls*'} | ForEach-Object {mv $_.name Docs}
#Get-ChildItem | where {$_.name -match '*.ppt*'} | ForEach-Object {mv $_.name Docs}
#Get-ChildItem | where {$_.name -match '*.txt*'} | ForEach-Object {mv $_.name Docs}

# move Images
# includes jpg, jpeg, png, gif
#Get-ChildItem | where {$_.name -match '*.jp*g'} | ForEach-Object {mv $_.name Folders}

Set-Location ${env:USERPROFILE}\Desktop