$ErrorActionPreference = 'Stop'

$progfiles = "${Env:ProgramFiles(x86)}"

$packageArgs = @{
  packageName    = 'ganttproject'
  fileType       = 'exe'
  softwareName   = 'GanttProject'

  checksum       = '48961a97894e827b2e5a36893d144293653852f8bf64efb35aa733aa8721dcf2'
  checksumType   = 'sha256'
  url            = 'https://github.com/bardsoftware/ganttproject/releases/download/ganttproject-3.1.3100/ganttproject-3.1.3100.exe'
  silentArgs     = ("/S /D={0}\GanttProject" -f $progfiles )
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
