param([Parameter(Mandatory)][string]$DestinationDirectory, [switch]$CreateDateMaskDirectory, [switch]$Zip)

if ($CreateDateMaskDirectory) {
    $dateMask = Get-Date -Format yyyy-MM-dd
    $DestinationDirectory = "$($DestinationDirectory)\$($dateMask)"
}

$datetimeMask = Get-Date -Format yyyy-MM-dd_HH-mm-ss
$backupName = "IIS_config_backup_$($datetimeMask)"
$iisDefaultBackupDir = "$($env:Windir)\System32\inetsrv\backup"
$backupDir = "$($iisDefaultBackupDir)\$($backupName)"

Backup-WebConfiguration -Name $backupName | Out-Null

if (-not (Test-Path $backupDir)) {
    $iis_backup_dir_not_found_error = New-Object System.IO.DirectoryNotFoundException "IIS backup directory `"$($backupdir)`" not found."
    Throw $iis_backup_dir_not_found_error
}
else {
    if (-not (Test-Path $DestinationDirectory -PathType Container)) {
        New-Item -Type Directory -Path $DestinationDirectory -Force | Out-Null
    }

    if ($Zip) {
        Add-Type -Assembly "System.IO.Compression.FileSystem"
        $zipFileName = "$($backupName).zip"
        [IO.Compression.ZipFile]::CreateFromDirectory($backupDir, "$($DestinationDirectory)\$($zipFileName)", 0, $true)
        "IIS configuration files successfully backuped and compressed to `"$($DestinationDirectory)\$($zipFileName)`" file."
    }
    else {
        Copy-Item $backupDir -Destination $DestinationDirectory -Recurse  | Out-Null
        "IIS configuration files successfully backuped and copied to `"$($DestinationDirectory)`"."
    }
	
	Remove-Item -Path $backupDir -Recurse | Out-Null
}