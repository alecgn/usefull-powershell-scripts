# sql-backup.ps1
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
