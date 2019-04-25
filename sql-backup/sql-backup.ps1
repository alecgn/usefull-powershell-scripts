param([Parameter(Mandatory)][string]$SQLInstance, [Parameter(Mandatory)][string]$DestinationDirectory, [switch]$CreateDateMaskDirectory)

if ($CreateDateMaskDirectory) {
	$datemask = Get-Date -Format yyyy-MM-dd
	$DestinationDirectory = "$($DestinationDirectory)\$($datemask)"
}

if (-not (Test-Path $DestinationDirectory -PathType Container)) {
	New-Item -Type Directory -Path $DestinationDirectory -Force | Out-Null
}

Get-ChildItem "SQLSERVER:\SQL\$($SQLInstance)\Databases" | Backup-SqlDatabase -BackupContainer $DestinationDirectory -CopyOnly