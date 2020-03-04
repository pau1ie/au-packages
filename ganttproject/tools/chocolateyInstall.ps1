$ErrorActionPreference = 'Stop'

$progfiles = "${Env:ProgramFiles(x86)}"

$packageArgs = @{
  packageName    = 'ganttproject'
  fileType       = 'exe'
  softwareName   = 'GanttProject'

  checksum       = 'd6a3e69166763c911acb717e7329463239742ff41e1cf262ec0c719044b09785'
  checksumType   = 'sha256'
  url            = 'https://github.com/bardsoftware/ganttproject/releases/download/ganttproject-2.8.10/ganttproject-2.8.10-r2363.exe'
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
