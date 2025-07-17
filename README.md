# Backup Cron
Generates automatic backups for specific folders in linux.

## How to use?
Copy the script and change the folder and file variables according to the folder structure of your linux machine. We have assumed the folowing structure-

`/home/user/backup_code.sh`

`/home/user/backup-logs`

Note here that if you are using an external storage device, you will have to mount the external device to a specific location using mount command. If the device is identified as `/dev/sdb1` the process to mount it to `/mnt/device_name` will be-

```console
user@linux:~$ mkdir /mnt/backup-media
user@linux:~$ sudo mount /dev/sdb1 /mnt/backup-media
```
For more information on mounting, check [this](https://www.fosslinux.com/104962/how-to-mount-and-manage-external-storage-devices-on-ubuntu.htm) resource.

Now, make the `backup_code.sh` script executable by running-

```console
user@linux:~$ chmod +x /home/user/backup-script.sh
````

Run the script to check whether it  is working fine by checking the backup destination and also the logs for the same at `/home/user/backup-logs`. You can use the cat command for reading the log file-

```console
user@linux:~$  cat /home/user/backup-logs/backup.log
```

If the script is working fine then we can schedule the backup using cron job. For this install and use the crontab command

```console
user@linux:~$  crontab -e
```

Put the following line in the file and save the file-

`0 2 * * * /home/user/backup-script.sh`

This will set the script to run everyday at 2:00 AM.
For more information on how crontabs work and how to set them up, check [this](https://www.uptimia.com/questions/how-to-install-crontab-in-ubuntu) resource.

## Areas of improvement
* Transferring data to remote server (Checksum validation for integrity)
* Adding encryption
* Old log deletion
* Updates via email.
