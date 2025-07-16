# backup-cron
Generates automatic backups for specific folders in linux.

# How to use?
Copy the script and change the folder and file variables according to the folder structure of your linux machine. We have assumed the folowing structure-

`/home/user/backup_code.sh`

`/home/user/backup-logs`

Make the script executable by running-

```console
user@linux:~$ chmod +x /home/user/backup-script.sh
````

Run the script to check whether it  is working fine by checking the backup destination and also the logs for the same at `/home/user/backup-logs`. You can use the cat ommand for reading the log file-

```console
user@linux:~$  cat /home/user/backup-logs/backup.log
```

If the script is working fine then we can schedule the backup using cron job. For this install and use the command crontab -e

```console
user@linux:~$  crontab -e
```

Put the following line in the file and save the file-

`0 2 * * * /home/user/backup-script.sh`

This will set the script to run everyday at 2:00 AM.
