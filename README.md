# usefull-powershell-scripts
A collection of usefull Windows Powershell scripts for Windows Server administrative tasks.

--------------------------------------------------

## backup-directory.ps1
### A Windows Powershell script to backup an entire folder to another, with compression support (no need for third-party compression programs).

**Usage examples:**
>**PS C:\scripts\> .\backup-directory.ps1 -Source C:\inetpub\wwwroot -Destination D:\backups -CreateDateMaskDirectory -Zip**  

>**PS C:\scripts\> .\backup-directory.ps1 -Source C:\inetpub\wwwroot -Destination \\\\server\backups -CreateDateMaskDirectory -Zip**

**Parameters:**

**-Source**: Mandatory. The source directory to backup.  
**-Destination**: Mandatory. The destination directory where the source or compressed source directory will be backedup.  
**-CreateDateMaskDirectory**: Optional. In the destination directory, creates a folder with the current date mask (yyyy-DD-mm -> eg "2019-04-23") then place the source or compressed source directory there; if not supplied, just copy the source directory to the destination.  
**-Zip**: Optional. Compress the source directory to a .zip file in the destination directory, named with the same name of the source directory; if not supplied, just copy the source directory without compress it.

Before running the script, set the execution police to **RemoteSigned** or **Unrestricted** to allow scripts execution:  
>**PS C:\scripts\> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine**

--------------------------------------------------

## iis-config-backup.ps1
### A Windows Powershell script to backup IIS configuration.

**Usage example:**
>**PS C:\scripts\> .\iis-config-backup.ps1 -DestinationDirectory D:\backups -CreateDateMaskDirectory -Zip**  

**Parameters:**

**-DestinationDirectory**: Mandatory. The destination directory where the IIS configuration files will be backedup.  
**-CreateDateMaskDirectory**: Optional. In the destination directory, creates a folder with the current date mask (yyyy-DD-mm -> eg "2019-04-23") then place the IIS configuration files there; if not supplied, just copy configuration files to the destination.  
**-Zip**: Optional. Compress the IIS configuration files to a .zip file in the destination directory; if not supplied, just copy configuration files without compress them.  

Before running the script, set the execution police to **RemoteSigned** or **Unrestricted** to allow scripts execution:  
>**PS C:\scripts\> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine**

--------------------------------------------------

## pfxcert-export.ps1
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

--------------------------------------------------

## sql-backup.ps1
### A Windows Powershell script to backup all databases from a SQL Server instance.

**Usage examples:**
>**PS C:\scripts\> .\sql-backup.ps1 -SQLInstance $env:computername\Default -DestinationDirectory C:\backups -CreateDateMaskDirectory**  

>**PS C:\scripts\> .\sql-backup.ps1 -SQLInstance SRV-SQL\MSSQLSERVER -DestinationDirectory \\\\REMOTE-SHARE\backup-sql -CreateDateMaskDirectory**

**Parameters:**

**-SQLInstance**: Mandatory. Instance connection in the format "COMPUTER_NAME\INSTANCE_NAME"; "$env:computername\Default" does the trick for backingup a single default instance in the same machine.  
**-DestinationDirectory**: Mandatory. The destination directory where the .bak backup files will be backedup.  
**-CreateDateMaskDirectory**: Optional. In the destination directory, creates a folder with the current date mask (yyyy-DD-mm -> eg "2019-04-23") then place the .bak backup files there; if not supplied, just create the .bak backup files in the destination.  

Before running the script, set the execution police to **RemoteSigned** or **Unrestricted** to allow scripts execution:  
>**PS C:\scripts\> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine**
