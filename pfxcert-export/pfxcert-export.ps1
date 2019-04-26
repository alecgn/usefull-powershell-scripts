param(
    [Parameter(Mandatory)][string]$CertPath, 
    [Parameter(Mandatory)][string]$DestinationDirectory, 
    [Parameter(Mandatory)][string]$PfxFileName, 
    [Parameter(Mandatory)][string]$Password, 
    [switch]$CreateDateMaskDirectory
)

if (-not (Test-Path $CertPath)) {
    $certpath_not_found_error = New-Object System.ArgumentException "Certificate or store `"$($CertPath)`" doesn't exists."
    Throw $certpath_not_found_error
}
else {
    if ($CreateDateMaskDirectory) {
        $datemask = Get-Date -Format yyyy-MM-dd
        $DestinationDirectory = "$($DestinationDirectory)\$($datemask)"
    }

    if (-not (Test-Path $DestinationDirectory -PathType Container)) {
        New-Item -Type Directory -Path $DestinationDirectory -Force | Out-Null
    }

    if (-not ($PfxFileName.ToLower().EndsWith('.pfx'))) { $PfxFileName = "$($PfxFileName).pfx" }

    Import-Module PKI
    $certpwd = ConvertTo-SecureString -String $Password -Force -AsPlainText
    $null = Get-ChildItem -Path $CertPath | Export-PfxCertificate -FilePath "$($DestinationDirectory)\$($PfxFileName)" -Password $certpwd
    "`"$($CertPath)`" succesfully exported to `"$($DestinationDirectory)\$($PfxFileName)`""
}
