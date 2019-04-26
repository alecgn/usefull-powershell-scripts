# iis-config-backup.ps1
### A Windows Powershell script to backup IIS configuration.

**Usage example:**
>**PS C:\scripts\> .\iis-config-backup.ps1 -DestinationDirectory D:\backups -CreateDateMaskDirectory -Zip**  

**Parameters:**

**-DestinationDirectory**: Mandatory. The destination directory where the IIS configuration files will be backedup.  
**-CreateDateMaskDirectory**: Optional. In the destination directory, creates a folder with the current date mask (yyyy-DD-mm -> eg "2019-04-23") then place the IIS configuration files there; if not supplied, just copy configuration files to the destination.  
**-Zip**: Optional. Compress the IIS configuration files to a .zip file in the destination directory; if not supplied, just copy configuration files without compress them.  

Before running the script, set the execution police to **RemoteSigned** or **Unrestricted** to allow scripts execution:  
>**PS C:\scripts\> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine**
