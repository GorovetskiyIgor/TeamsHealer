Stop-Process -Name 'Teams' -Force -ErrorAction SilentlyContinue

#Clear teams tmp
$teamsDir = $env:APPDATA + '\Microsoft\Teams'
if (Test-Path $teamsDir){
    Remove-Item "$teamsDir\Application Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item "$teamsDir\blob_storage\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item "$teamsDir\Cache\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item "$teamsDir\databases\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item "$teamsDir\GPUCache\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item "$teamsDir\IndexedDb\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item "$teamsDir\Local Storage\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item "$teamsDir\tmp\*" -Recurse -Force -ErrorAction SilentlyContinue
}

#Download latest Teams
$Installdir = "c:\Apps\Install_Teams_TMP"   
if(-Not (Test-Path $Installdir)){
    New-Item -Path $Installdir -ItemType directory 
}

$source = "https://go.microsoft.com/fwlink/p/?linkid=869426&clcid=0x409&culture=en-us&country=us&lm=deeplink&lmsrc=groupchatmarketingpageweb&cmpid=directdownloadwin64"  
$destination = "$Installdir\Teams_windows_x64.exe"  
Invoke-WebRequest $source -OutFile $destination  

Start-Process -FilePath "$Installdir\Teams_windows_x64.exe"