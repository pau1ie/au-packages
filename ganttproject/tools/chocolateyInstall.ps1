$ErrorActionPreference = 'Stop'

$progfiles = "${Env:ProgramFiles(x86)}"

$packageArgs = @{
  packageName    = 'ganttproject'
  fileType       = 'exe'
  softwareName   = 'GanttProject'

  checksum       = '50d325732bbaafde312ae27e99bca50a1a82a1afe19e5765640c59800e6a2ce2'
  checksumType   = 'sha256'
  url            = 'https://github.com/bardsoftware/ganttproject/releases/download/ganttproject-2.8.11/ganttproject-2.8.11-r2396.exe'
  silentArgs     = ("/S /D={0}\GanttProject" -f $progfiles )
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs

# Update install so it can be run with openjdk.

$appdata = $Env:ALLUSERSPROFILE
$shell = New-Object -COM WScript.Shell
$shortcut = $shell.CreateShortcut("{0}\Microsoft\Windows\Start Menu\Programs\GanttProject\GanttProject.lnk" -f $appdata)
$shortcut.TargetPath = $shortcut.TargetPath -replace ".exe$",".bat"
$shortcut.Save()

cmd /c assoc .gan=GanttProject File
cmd /c ftype "GanttProject File"=("{0}\GanttProject\ganttproject.bat" -f $progfiles) "%1"
