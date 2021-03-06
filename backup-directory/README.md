# backup-directory.ps1
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
