#!/bin/bash
#Install
curl https://rclone.org/install.sh | sudo bash
#Configure
rclone config
#N - S3 - 4 - 1 - 1 - <<ACCESSKEY>> - <<SECRETKEY>> - 11 - eu-central-1 - eu-central-1 -  2 - 1 - 1 - N
#If they change numbers - please check!

#For usage
rclone copy /usr/lib/unifi/data/backup/autobackup S3:<<BUCKETNAME>>/<<FOLDER>>/

#Cron - every night at 4am
crontab -e
0 4 * * * rclone copy /usr/lib/unifi/data/backup/autobackup S3:<<BUCKETNAME>>/<<FOLDER>>/ >/dev/null 2>&1


#Should look like 
#[S3]
#type = s3
#provider = AWS
#env_auth = false
#access_key_id = <<FILLME>>
#secret_access_key = <<FILLME>>
#region = eu-central-1
#location_constraint = eu-central-1
#acl = private
#server_side_encryption = AES256