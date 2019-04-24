# pfxcert-export.ps1
### A Windows Powershell script to backup a single certificate or an entire certificate store.

**Usage examples:**
>**PS C:\scripts\> .\pfxcert-export.ps1 -CertPath Cert:\LocalMachine\My\ACB239B3689E4EF8CBAF65FA7A91BE8EDAFA7D35 -DestinationDirectory D:\backups -PfxFileName mysinglecert.pfx -Password cert123 -CreateDateMaskDirectory**  

>**PS C:\scripts\> .\pfxcert-export.ps1 -CertPath Cert:\LocalMachine\My -DestinationDirectory D:\backups -PfxFileName myallcerts.pfx -Password cert123 -CreateDateMaskDirectory**

**Parameters:**

**-CertPath**: Mandatory. The source certificate/store path to backup.  
**-DestinationDirectory**: Mandatory. The destination directory where the .pfx file of certificate/store will be backedup.  
**-PfxFileName**: Mandatory. The .pfx output file name.  
**-Password**: Mandatory. The .pfx file password.  
**-CreateDateMaskDirectory**: Optional. In the destination directory, creates a folder with the current date mask (yyyy-DD-mm -> eg "2019-04-23") then place the .pfx file there; if not supplied, just create the .pfx file in the destination directory.  

Before running the script, set the execution police to **RemoteSigned** or **Unrestricted** to allow scripts execution:  
>**PS C:\scripts\> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine**  

To get the fingerprints of all certificates from a store, run a command like the following, passing the store path:  
>**PS C:\scripts\> Get-ChildItem -Path Cert:\LocalMachine\WebHosting**  

***Note that the certificate(s) key(s) must be exportable for this script to work.**
