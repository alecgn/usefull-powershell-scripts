param([Parameter(Mandatory)][string]$Source, [Parameter(Mandatory)][string]$Destination, [switch]$CreateDateMaskDirectory, [switch]$Zip)

if (-not (Test-Path $Source -PathType Container)) {
    $directory_not_found_error = New-Object System.IO.DirectoryNotFoundException "Directory `"$($Source)`" doesn't exists."
    Throw $directory_not_found_error
}
else {
    if ($CreateDateMaskDirectory) {
        $datemask = Get-Date -Format yyyy-MM-dd
        $Destination = "$($Destination)\$($datemask)"
    }

    if (-not (Test-Path $Destination -PathType Container)) {
        New-Item -Type Directory -Path $Destination -Force | Out-Null
    }

	"Backingup, please wait..."

    if ($Zip) {
        Add-Type -Assembly "System.IO.Compression.FileSystem"
        $zipfilename = $Source.Substring($Source.LastIndexOf('\')+1) + ".zip"
        [IO.Compression.ZipFile]::CreateFromDirectory($Source, "$($Destination)\$($zipfilename)", 0, $true)
        "Directory `"$($Source)`" successfully compressed to `"$($Destination)\$($zipfilename)`" file."
    }
    else {
        Copy-Item $Source -Destination $Destination -Recurse  | Out-Null # copy entire root folder
        # Get-ChildItem $source | Copy -Destination $dest -Recurse  | Out-Null # copy only the root folder content
        "Directory `"$($Source)`" successfully copied to `"$($Destination)`"."
    }
}
